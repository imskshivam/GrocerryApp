import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/storeui.dart/stores.dart';
import 'package:pinput/pinput.dart';

import '../../constants/text.dart';

class otp extends StatefulWidget {
  String phn;
  otp({super.key, required this.phn});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController otpcontroller = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    otpcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: customtext(
                  name: "Verify your",
                  size: 20,
                  fw: FontWeight.bold,
                  lspace: 0),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: customtext(
                  name: "+91-${widget.phn}",
                  size: 14,
                  fw: FontWeight.bold,
                  lspace: 1),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: customtext(
                name: "Enter your OTP code here.",
                size: 15,
                fw: FontWeight.bold,
                lspace: 0,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Pinput(
              controller: otpcontroller,
              length: 5,
              toolbarEnabled: true,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  isLoading
                      ? showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            );
                          })
                      : null;
                  await Future.delayed(const Duration(seconds: 4), () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Nearbuystores(),
                        ));
                    dispose();
                  });
                },
                child: customtext(
                  name: "VERIFY OTP",
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
                name: "Didn't you receive any code?",
                size: 13,
                fw: FontWeight.bold,
                lspace: 0,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            customtext(
              name: "RESEND NEW CODE",
              size: 13,
              fw: FontWeight.bold,
              lspace: 1,
              color: Colors.green,
            ),
            Center(
              child: Container(
                width: 300,
                height: 300,
                child: Image.asset(
                    "assets/images/beautiful-tasty-appetizing-ingredients-spices-grocery-cooking-healthy-kitchen-blue-old-wooden-background-top-view-removebg-preview.png"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
