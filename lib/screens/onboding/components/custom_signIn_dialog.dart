import 'package:animated/screens/onboding/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<Object?> customSigninDialog(BuildContext context, { required ValueChanged onClosed}) {
    return showGeneralDialog(
                      barrierDismissible: true,//Para que se cierre al momento de apretar fuera de la ventana 
                      barrierLabel: "Sign In",
                      context: context,
                      //trancision de la animación de la ventana
                      transitionDuration: const Duration(milliseconds: 400), 
                      transitionBuilder: (_, animation, __, child) {
                        Tween<Offset> tween;
                        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);//para que sea desde arriba
                        return SlideTransition(
                          position: tween.animate(
                            CurvedAnimation(
                              parent: animation, curve: Curves.easeInOut,
                            ),
                          ),
                          child: child,
                        );
                      },
                      pageBuilder: (context, _, __) => Center(
                      child: Container(
                        height: 620,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.94),
                          borderRadius: const BorderRadius.all(Radius.circular(40))
                        ),
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          body: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                children: [
                                  const Text("Sign In", style: TextStyle(
                                    fontSize: 34,
                                    fontFamily: "Poppins"
                                  ),),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Text(
                                      "Access to 240+ hours od content, Learn design and code, by building real apps with Flutter and Swift.",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SignInForm(),//form
                                  //division en donde dice OR
                                  const Row(
                                    children: [
                                      Expanded(child: Divider(
                              
                                      )
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        child: Text(
                                          "OR",
                                          style: TextStyle(color: Colors.black26),
                                        ),
                                      ),
                                      Expanded(child: Divider(
                              
                                      )
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 24,
                                    ),
                                    child: Text(
                                      "Sign up with Email, Apple or Google",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {},
                                       icon:  SvgPicture.asset(
                                        "assets/icons/email_box.svg",
                                        height: 54,
                                        width: 54,
                                       )
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {},
                                       icon:  SvgPicture.asset(
                                        "assets/icons/apple_box.svg",
                                        height: 54,
                                        width: 54,
                                       )
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {},
                                       icon:  SvgPicture.asset(
                                        "assets/icons/google_box.svg",
                                        height: 54,
                                        width: 54,
                                       )
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Positioned(
                                left: 0,
                                right: 0,
                                bottom: -48,//para que este al final
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.close, color: Colors.black,),//icono de la X
                                                            ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ).then(onClosed);
  }