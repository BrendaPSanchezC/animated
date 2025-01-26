import 'package:animated/screens/onboding/entry_point.dart';
import 'package:animated/screens/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

//clase del form de la ventana de sign in 
class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowingLoading = false;
  bool isShowingConfetti = false;
//variables para las animaciones
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger coffeti;



                 void sigIn(BuildContext context) {
                    setState(() {
                    isShowingLoading = true;
                    isShowingConfetti= true;
                  });
                Future.delayed(Duration(seconds: 1),
                  () {
                    if (_formKey.currentState!.validate()){
                      //si todo esta bien se mostrara la animación de success
                      check.fire(

                      );
                      Future.delayed(
                        Duration(seconds: 2),
                        () {
                          setState(() {
                            isShowingLoading = false;
                          });
                          coffeti.fire();

                          Future.delayed(Duration(seconds: 1),
                          //despues de la animación nos mande a la otra ventana de entrypoint
                          () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: 
                            (context) => EntryPoint(),
                            ));
                          }
                          );
                        },
                      );
                    } else{
                      //si no todo esta bien se mostrara la animacion de error
                      error.fire(

                      );
                      Future.delayed(
                        Duration(seconds: 2),
                        () {
                          setState(() {
                            isShowingLoading = false;
                          });
                        }
                      );
                    }
                  }
                  );
                  }
                  

  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
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
                  validator: (value) {
                    //validar si esta vacio 
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email) {
                    
                  },
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
                  validator: (value) {
                    //validar si esta vacio 
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (password) {
                    
                  },
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
                //al momento de que se apreta el boton de sigIn sale la animacion de carga
                  sigIn(context);
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
        ),
        isShowingLoading
         ?  CustomPositioned(child: RiveAnimation.asset("assets/RiveAssets/check.riv",
                //aqui se van a dividir, para que cada uno tenga su función 
                onInit: (artboard){
                  StateMachineController controller = RiveUtils.getRiveController(artboard);
                  check = controller.findSMI("Check") as SMITrigger;
                  error = controller.findSMI("Error") as SMITrigger;
                  reset = controller.findSMI("Reset") as SMITrigger;
                },
                ),
              )
         : const SizedBox(),
          //animación del confetti
        isShowingConfetti ? CustomPositioned(
          child: Transform.scale(
            scale: 7,//se vea mas grande la animación 
            child: RiveAnimation.asset("assets/RiveAssets/confetti.riv",
            onInit: (artboard) {
              StateMachineController controller = RiveUtils.getRiveController(artboard);
            
              coffeti = controller.findSMI("Trigger explosion") as SMITrigger;
            },
            ),
          )
         ): SizedBox(

         ),
      ] ,
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
          child: Column(
            children: [
              Spacer(

              ),
              SizedBox(
                height: size,
                width: size,
                child: child,
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        );
  }
}