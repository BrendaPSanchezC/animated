import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//clase del form de la ventana de sign in 
class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //nombre del fiels
          const Text("Email", style: TextStyle(
            color: Colors.black54
          ),),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              //pone el icono del email dentro del field
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset("assets/icons/email.svg"),
                ),
              ),
            ),
          ),
          //fiel de contraseña
          const Text("Password", style: TextStyle(
            color: Colors.black54
          ),),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              obscureText: true,
              //pone el icono del email dentro del field
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset("assets/icons/password.svg"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 24),
            child: ElevatedButton.icon(onPressed: () {
            
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF77D8E),//color del botón
              minimumSize: const Size(double.infinity, 56),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)
                )
              )
            ),
            icon: const Icon(CupertinoIcons.arrow_right, color: Color(0xFFFE0037),),
            label: const Text("Sign In", style: TextStyle(color: Colors.white),)),
          )
        ],
      )
    );
  }
}