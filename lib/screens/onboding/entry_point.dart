import 'package:animated/components/animated_bar.dart';
import 'package:animated/models/rive_asset.dart';
import 'package:animated/screens/home/home_screen.dart';
import 'package:animated/screens/onboding/constants.dart';
import 'package:animated/screens/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAsset selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(bottomNavs.length, (index) => 
              GestureDetector(
                //para que al momento de darle tap se inicie la animación 
                onTap: () {
                  bottomNavs[index].input!.change(true);
                  //para que al momento de que se selccione algun boton se quede seleccinado 
                  if (bottomNavs[index] != selectedBottomNav) {
                    setState(() {
                      selectedBottomNav = bottomNavs[index];
                    });
                  }
                  Future.delayed(const Duration(seconds: 1), () {
                    bottomNavs[index].input!.change(false);
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //animación para lo que sale arriba de los iconos 
                    AnimatedBar(isActive: bottomNavs[index] == selectedBottomNav,),
                    SizedBox(
                      height: 36,
                      width: 36,
                      //va llamar a la clase en donde estan los iconos
                      child: Opacity(
                        opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          bottomNavs.first.src,
                        artboard: bottomNavs[index].artboard,
                        onInit: (artboard) {
                          StateMachineController controller =
                            RiveUtils.getRiveController(
                              artboard,
                              stateMachineName: bottomNavs[index].stateMachineName
                            );
                            bottomNavs[index].input = controller.findSMI("active") as SMIBool;
                        },),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

