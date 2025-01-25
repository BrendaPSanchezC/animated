import 'dart:ui';

import 'package:animated/screens/onboding/components/animated_btn.dart';
import 'package:animated/screens/onboding/components/custom_signIn_dialog.dart';
import 'package:animated/screens/onboding/components/sign_in_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart' hide Image;//hide image para que reconozca la imagen 

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",//el estado de la animacioón
      autoplay: false,//ya no se muestra la animación al momento de que se reinicia la pagina 
    );
    super.initState();
  }
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
          Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 10,
          ),
          ),
          ),
           const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),//video del fondo
          //para que se vea borroso lo del fondo, se le pone un filtro
          Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 30,
            sigmaY: 30,
          ),
          child: const SizedBox(),
          ),
          ),
          //texto del titulo
          AnimatedPositioned(
            //animacion de la parte de abajo al momento de salir la ventana
            top: isSignInDialogShown ? -50 : 0,//para que se vaya para arriba
            duration: Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),//pading
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: 260,//tamño del sizedbox
                      child: Column(
                        children: [
                          Text("Learn \ndesign & code", style: TextStyle(fontSize: 60, fontFamily: "Poppins", height: 1.2),),
                          SizedBox(height: 16,),
                          Text("Don´t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses aboute the best tools.")
                        ],
                      ),
                    ),
                    const Spacer(flex: 2,),
                    //animacion del boton 
                    Animatedbtn(//llama a la funcion de la animación 
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        Future.delayed(const Duration(milliseconds: 800), () {
                          setState(() {
                            isSignInDialogShown = true;//para que se active la animación 
                          });
                        //para que salga arriba otro texto o alguna información 
                        customSigninDialog(context, onClosed: (_) {
                          setState(() {
                            isSignInDialogShown = false;//para que se desactive la animación
                          });
                        });
                        });
                      },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, souce files and certificates."),
                      )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}


//
