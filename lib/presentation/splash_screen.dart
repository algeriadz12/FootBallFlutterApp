import 'package:flutter/material.dart';
import 'package:football_app/presentation/home_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8),(){
      Get.off(() => const HomeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16213E),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Image.asset("assets/gifs/splash_bg.gif",height: 350,width: 350,),
        ),
      ),
    );
  }
}
