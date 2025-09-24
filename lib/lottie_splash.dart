import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieSplash extends StatefulWidget {
  final String lottieFile;
  final Widget nextScreen;

  LottieSplash({required this.lottieFile, required this.nextScreen});

  @override
  _LottieSplashState createState() => _LottieSplashState();
}

class _LottieSplashState extends State<LottieSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => widget.nextScreen),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(widget.lottieFile, width: 200, height: 200),
      ),
    );
  }
}
