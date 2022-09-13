import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_app/presentation/bottom_bar_screen/live_score_screen.dart';
import 'package:football_app/presentation/bottom_bar_screen/match_screen.dart';
import 'package:football_app/presentation/bottom_bar_screen/standing_screen.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  bool _isAvailable = false;
  // Query products from google play store
  late  List<ProductDetails> _products   = [];
  // Query past purchases of the user
  List<PurchaseDetails> _purchases = [];
  late StreamSubscription _streamSubscription;
  late BannerAd _bannerAd;
  final String testId = "com.taki.dz.app";
  var _currentIndex = 0;
  final _screens = [
    const StandingScreen(),
    const LiveScoreScreen(),
    const NewsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    loadAd();
    _initialize();
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items:  [
          BottomNavigationBarItem(icon: Image.asset("assets/images/list.png",
          height: 20,width: 20,color: Colors.white,),label: 'Rank'),
          BottomNavigationBarItem(icon: Image.asset("assets/images/score.png",
            height: 20,width: 20,color: Colors.white,),label: 'Score'),
          BottomNavigationBarItem(icon: Image.asset("assets/images/news.png",
          height: 20,width: 20,color: Colors.white,),label: 'News'),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer : createDrawer(context),
      backgroundColor: const Color(0xFF16213E),
      body: SafeArea(
        child: Column(
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
                      }, icon: Image.asset("assets/images/drawer_icon.png",height: 20,width: 20,color: Colors.white,));
                    },
                  ),
                  const Expanded(child: Text('La Liga',style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'mont_bold'),)),
                  GestureDetector(
                    onTap: (){
                      _buyProduct();
                    },
                    child: Image.asset("assets/images/remove_ad.png",height: 25,width: 25,color: Colors.blueAccent,),
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
    );
  }
}

Widget createDrawer(BuildContext context){
  return Drawer(
    backgroundColor: const Color(0xFF16213E),
    child: Column(
      children:  [
         DrawerHeader(
          child: Center(
            child: Image.asset("assets/images/laliga.png",height: 60,width: 60,),
          ),
        ),
        Column(
          children:  [
            const Divider(color: Colors.white,),
            StatefulBuilder(
              builder: (context,_){
                return ListTile(leading: const Icon(Icons.star_rate_outlined,color: Colors.white,),
                  title: const Text('Rate Us',style: TextStyle(color: Colors.white),),onTap: (){
                    Navigator.pop(context);
                    showDialog(context: context, barrierDismissible: true, builder: (context) => showRatingDialog(),);
                  },);
              },
            ),
            const Divider(color: Colors.white,),
            StatefulBuilder(
              builder: (context,_){
                return ListTile(leading: const Icon(Icons.apps,color: Colors.white,),
                  title: const Text('More Apps',style: TextStyle(color: Colors.white),),onTap: (){
                     Scaffold.of(context).closeDrawer();
                  },);
              },
            ),
            const Divider(color: Colors.white,),
          ],
        )
      ],
    )
  );
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
