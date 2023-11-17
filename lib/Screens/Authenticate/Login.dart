import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Authenticate/otp.dart';
import 'package:flutter_application_1/constants/text.dart';

class Authlogin extends StatefulWidget {
  const Authlogin({super.key});

  @override
  State<Authlogin> createState() => _AuthloginState();
}

class _AuthloginState extends State<Authlogin> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: customtext(
                    name: "Sign up to",
                    size: 20,
                    fw: FontWeight.bold,
                    lspace: 0),
              ),
              Center(
                child: customtext(
                    name: "keep ordering amazing",
                    size: 20,
                    fw: FontWeight.bold,
                    lspace: 0),
              ),
              Center(
                child: customtext(
                    name: "Fresh-Grocery😁😍",
                    size: 20,
                    fw: FontWeight.bold,
                    lspace: 0),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: customtext(
                  name:
                      "Add your phone number.We'll send you a\nverification code so we know you're real.",
                  size: 15,
                  fw: FontWeight.bold,
                  lspace: 0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  maxLength: 10,
                  controller: textEditingController,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      prefixText: "+91  ",
                      suffixIcon: Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(222, 231, 240, .57),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'Enter phone number',
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0.8,
                          color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return otp(
                              phn: textEditingController.text,
                            );
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: animation.drive(Tween(
                                      begin: Offset(1, 0), end: Offset(0, 0))
                                  .chain(CurveTween(curve: Curves.easeInOut))),
                              child: child,
                            );
                          },
                        ));
                  },
                  child: customtext(
                    name: "SEND OTP",
                    size: 14,
                    fw: FontWeight.bold,
                    lspace: 0,
                    color: Colors.white,
                  )),
              SizedBox(
                height: 15,
              ),
              Center(
                child: customtext(
                  name: "By providing my phone number,I hearby agree and",
                  size: 13,
                  fw: FontWeight.bold,
                  lspace: 0,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customtext(
                    name: "accept the",
                    size: 13,
                    fw: FontWeight.bold,
                    lspace: 0,
                    color: Colors.grey,
                  ),
                  customtext(
                    name: " Term of Service ",
                    size: 13,
                    fw: FontWeight.bold,
                    lspace: 0,
                    color: Colors.green,
                  ),
                  customtext(
                    name: "and",
                    size: 13,
                    fw: FontWeight.bold,
                    lspace: 0,
                    color: Colors.grey,
                  ),
                  customtext(
                    name: " Privacy Policy ",
                    size: 13,
                    fw: FontWeight.bold,
                    lspace: 0,
                    color: Colors.green,
                  ),
                  customtext(
                    name: "in use",
                    size: 13,
                    fw: FontWeight.bold,
                    lspace: 0,
                    color: Colors.grey,
                  ),
                ],
              ),
              customtext(
                name: "of the IRL app.",
                size: 13,
                fw: FontWeight.bold,
                lspace: 0,
                color: Colors.grey,
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset(
                  "assets/images/different-spices-food-ingredients-wooden-spoon-whitetable-background-removebg-preview.png")
            ],
          ),
        ),
      ),
    );
  }
}
