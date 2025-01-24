import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide Image;//hide image para que reconozca la imagen 

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
           // height: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
           RiveAnimation.asset("assets/RiveAssets/shapes.riv"),//video del fondo
          //para que se vea borroso lo del fondo, se le pone un filtro
          Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 30,
            sigmaY: 30,
          ),
          child: SizedBox(),
          ),
          ),
        ],
