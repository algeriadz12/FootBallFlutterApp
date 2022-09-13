import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_app/presentation/bottom_bar_screen/live_score_screen.dart';
import 'package:football_app/presentation/bottom_bar_screen/match_screen.dart';
import 'package:football_app/presentation/bottom_bar_screen/standing_screen.dart';
import 'package:football_app/storage/storage_manager.dart';
import 'package:football_app/theme/theme_notifier.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentTheme  = "";
  /////
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  bool _isAvailable = false;
  SharedPreferences? _sharedPreferences;
  // Query products from google play store
  late  List<ProductDetails> _products   = [];
  // Query past purchases of the user
  List<PurchaseDetails> _purchases = [];
  late StreamSubscription _streamSubscription;
  late BannerAd _bannerAd;
  final String testId = "com.taki.dz.app";
  var _currentIndex = 0;
  var isOn = false;
  Icon icon = const Icon(Icons.toggle_off,color: Colors.black54,);
  final _screens = [
    const StandingsScreen(),
    const LiveScoreScreen(),
    const NewsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    loadAd();
    _initialize();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<BlackThemeNotifier>(
        builder: (context , provider , _){
          return MaterialApp(
            theme: provider.getTheme(),
            debugShowCheckedModeBanner: false,
            home: SafeArea(
              child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  selectedItemColor: currentTheme == "light" ? Colors.black : Colors.black12,
                  unselectedItemColor: currentTheme == "light" ? Colors.black12 : Colors.black12,
                  items:  [
                    BottomNavigationBarItem(icon: Image.asset("assets/images/list.png",
                      height: 20,width: 20,color: currentTheme == "light" ? Colors.black : Colors.white,),label: 'Rank'),
                    BottomNavigationBarItem(icon: Image.asset("assets/images/score.png",
                      height: 20,width: 20,color: currentTheme == "light" ? Colors.black : Colors.white,),label: 'Score'),
                    BottomNavigationBarItem(icon: Image.asset("assets/images/news.png",
                      height: 20,width: 20,color: currentTheme == "light" ? Colors.black : Colors.white,),label: 'News'),
                  ],
                  onTap: (index){
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                drawer : Drawer(
                    child: Column(
                      children:  [
                        DrawerHeader(
                          child: Center(
                            child: Image.asset("assets/images/laliga.png",height: 100,width: 100,),
                          ),
                        ),
                        Column(
                          children:  [
                            StatefulBuilder(
                              builder: (context,_){
                                return ListTile(leading: const Icon(Icons.star_rate_outlined),
                                  title:  const Text('Rate Us'),onTap: (){
                                    Navigator.pop(context);
                                    showDialog(context: context, barrierDismissible: true, builder: (context) => showRatingDialog(),);
                                  },);
                              },
                            ),
                            const Divider(),
                            StatefulBuilder(
                              builder: (context,_){
                                return ListTile(leading: const Icon(Icons.apps),
                                  title: const Text('More Apps'),onTap: (){
                                    Scaffold.of(context).closeDrawer();
                                  },);
                              },
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child:  Row(
                                children: [
                                  const Icon(Icons.dark_mode_outlined,size: 30,),
                                  Expanded(child: SwitchListTile(
                                      value: isOn,
                                      title: const Text('App Theme'),
                                      onChanged: (value){
                                        isOn = !isOn;
                                        if(isOn){
                                          Fluttertoast.showToast(msg: "Theme is dark");
                                          icon = const Icon(Icons.toggle_on,color: Colors.deepOrange);
                                          StorageManager.saveData("dark");
                                          provider.setDarkMode();
                                        }
                                        else {
                                          Fluttertoast.showToast(msg: "Theme is light");
                                          icon  = const Icon(Icons.toggle_off,color: Colors.black54,);
                                          StorageManager.saveData("light");
                                          provider.setLightMode();
                                        }
                                      }))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 16,top: 16,bottom: 16),
                      child: Row(
                        children:  [
                          StatefulBuilder(
                            builder: (context,_){
                              return IconButton(onPressed: (){
                                Scaffold.of(context).openDrawer();
                              }, icon: Image.asset("assets/images/drawer_icon.png",color: currentTheme == "light" ? Colors.black : Colors.white,height: 20,width: 20));
                            },
                          ),
                          const Expanded(child: Text('La Liga',style: TextStyle(fontSize: 20,fontFamily: 'mont_bold'),)),
                          GestureDetector(
                            onTap: (){
                              _buyProduct();
                            },
                            child: Image.asset("assets/images/remove_ad.png",color: currentTheme == "light" ? Colors.blueAccent : Colors.blueAccent,height: 25,width: 25,),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: _screens[_currentIndex],
                    ),
                    AdWidget(ad: _bannerAd)
                  ],
                ),
              ),
            )
          );
        }
    );
  }



  void initPrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if(_sharedPreferences?.getString("theme") == "light"){
      setState(() {
        isOn = false;
        icon  = const Icon(Icons.toggle_off,color: Colors.black54);
        currentTheme = "light";
      });
    }
    else if (_sharedPreferences?.getString("theme") == "dark"){
      isOn = true;
      icon = const Icon(Icons.toggle_on,color: Colors.deepOrange);
      currentTheme = "dark";
    }
  }

  void loadAd(){
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: Utils.BANNER_ID,
        listener: listener,
        request: const AdRequest());
    _bannerAd.load();
  }

  var listener = BannerAdListener(
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      ad.dispose();
    },
    onAdOpened: (Ad ad) => print('Ad opened.'),
    onAdClosed: (Ad ad) => print('Ad closed.'),);

  // ADS
  Future<void> _initialize() async {

    _isAvailable = await _inAppPurchase.isAvailable();
    if(!_isAvailable){
      Fluttertoast.showToast(msg: "Service is not available on your device");
      return;
    }

    await _getUserProducts();
    //await  _getPastPurchases();
    _verifyPurchase();
    _streamSubscription = _inAppPurchase.purchaseStream.listen((event) {
      _purchases.addAll(event);
      _verifyPurchase();
    });

  }

  Future<void> _getUserProducts() async {
    Set<String> set = {testId};
    ProductDetailsResponse response = await _inAppPurchase.queryProductDetails(set);
    setState(() {
      _products  = response.productDetails;
    });

  }

  // Future<void> _getPastPurchases() async {
  //   var  response = await _inAppPurchase.queryPastPurchases(applicationUserName: testId);
  //   for(PurchaseDetails purchase in response.pastPurchases){
  //     if(Platform.isMacOS){
  //       _inAppPurchase.completePurchase(purchase);
  //     }
  //   }
  //   setState(() {
  //     _purchases = response.pastPurchases;
  //   });
  // }

  PurchaseDetails? _hasUserPurchased(String productID){
    return _purchases.firstWhereOrNull((purchase) => purchase.productID == productID);
  }

  void _verifyPurchase() async{
    PurchaseDetails? purchase = _hasUserPurchased(testId);
    if(purchase != null && purchase.status == PurchaseStatus.purchased){
      // hide ads after purchase

    }
  }

  void _buyProduct(){
    final PurchaseParam param = PurchaseParam(productDetails: _products[0]);
    _inAppPurchase.buyNonConsumable(purchaseParam: param);
  }

}

Widget showRatingDialog(){
  return RatingDialog(
    initialRating: 1.0,
    title: const Text('Give Us A Rating', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),),
    message: const Text('Tap a star to set your rating ..', textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
    image: const FlutterLogo(size: 100),
    submitButtonText: 'Submit',
    commentHint: 'What do you think about our app!',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) async {
        var url = "https://play.google.com/store/apps/details?id=com.kitkagames.fallbuddies&hl=en&gl=US";
        if(await canLaunchUrl(Uri.parse(url))){
          await launchUrl(Uri.parse(url));
        } else {
          // could not submit review
        }
    },
  );

}
