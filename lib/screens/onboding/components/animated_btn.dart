import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Animatedbtn extends StatelessWidget {
  const Animatedbtn({
    super.key,
    required RiveAnimationController btnAnimationController, required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset("assets/RiveAssets/button.riv",
            controllers: [_btnAnimationController],//llama a la animación 
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,//centrar el texto del boton 
                children: [
                  const Icon(CupertinoIcons.arrow_right),//pone la flecha
                  SizedBox(
                    width: 8,
                  ),
                  Text("Start the course",
                  style: TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
            )
          ],
        )
        ),
    );
  }
}