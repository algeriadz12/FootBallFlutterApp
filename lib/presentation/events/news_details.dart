import 'package:flutter/material.dart';
import 'package:football_app/domain/models/news/NewsModel.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';

import '../../utils.dart';



class NewsDetailsScreen extends StatefulWidget {
  final Articles? articles;
  const NewsDetailsScreen({Key? key,this.articles}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  late BannerAd _bannerAd;

  @override
  void initState() {
    super.initState();
    loadAd();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F3460),
      body: SafeArea(
        child: widget.articles == null ?
        const Center(child: CircularProgressIndicator(color: Colors.deepOrange,),) :
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.articles!.urlToImage!,width: double.infinity,height: 250,fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                child: Text(widget.articles!.title!,maxLines : 3 ,style: const TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'mont_bold'),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 15),
                child:  Container(
                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(widget.articles!.author != null ? 'Author : ' +  widget.articles!.author : 'Author : N/A ' ,style: const TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'mont_medium'),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 15),
                child: Container(
                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text('Published : ${formatDate(widget.articles!.publishedAt!)}',style: const TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'mont_medium'),)),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 15),
                  child: widget.articles!.source!.name == null ?
                  Container(
                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Text("Source : N/A ",style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'mont_medium'),)) :
                  Container(
                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text('Source : ${widget.articles!.source!.name!}',style: const TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'mont_medium'),))
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 15),
                child: Text(widget.articles!.description!,style: const TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'mont_medium'),),
              ),
              const SizedBox(height: 20,),
              AdWidget(ad: _bannerAd)
            ],
          ),
        ),
      ),
    );
  }

  String formatDate(String date){
    DateFormat dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    DateTime dt = dateFormat.parse(date);
    DateFormat dateFormat2 = DateFormat('yyyy-MM-dd HH:mm');
    return dateFormat2.format(dt);
  }
}


