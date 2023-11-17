import 'package:flutter/material.dart';

import '../../constants/text.dart';
import 'checkOut.dart';

class checkout_order2 extends StatefulWidget {
  const checkout_order2({super.key});

  @override
  State<checkout_order2> createState() => _checkout_order2State();
}

class _checkout_order2State extends State<checkout_order2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_downward,
              color: Colors.black,
              size: 18,
            ),
          ),
          centerTitle: true,
          title: customtext(
              name: "Checkout order", size: 17, fw: FontWeight.bold, lspace: 0),
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 20,
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customtext(
                      name: "Total order:",
                      size: 16,
                      fw: FontWeight.bold,
                      lspace: 0,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: customtext(
                              name: "Free delivery",
                              size: 13,
                              fw: FontWeight.bold,
                              lspace: 0,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        customtext(
                            name: "₹17.66",
                            size: 17,
                            fw: FontWeight.bold,
                            lspace: 0)
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        primary: Colors.green),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return Checkout_order();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideTransition(
                                position: animation.drive(Tween(
                                        begin: Offset(1, 0), end: Offset(0, 0))
                                    .chain(
                                        CurveTween(curve: Curves.easeInOut))),
                                child: child,
                              );
                            },
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customtext(
                          name: "Pay now",
                          size: 14,
                          fw: FontWeight.bold,
                          lspace: 0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: customtext(
                              name: "4",
                              size: 13,
                              fw: FontWeight.bold,
                              lspace: 0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return customorderlist();
          },
        ));
  }
}

class customorderlist extends StatelessWidget {
  const customorderlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Container(
        color: Colors.white,
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: MediaQuery.of(context).size.width * 0.24,
              width: MediaQuery.of(context).size.width * 0.24,
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset("assets/images/brocali.png"),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 200,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: customtext(
                            name: "2   x   Fresh Tamagoyaki",
                            size: 14,
                            fw: FontWeight.bold,
                            lspace: 1),
                      ),
                      customtext(
                          name: "₹12.00",
                          size: 14,
                          fw: FontWeight.bold,
                          lspace: 1),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.verified,
                        size: 16,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      customtext(
                        name: "Assured By store",
                        size: 12,
                        fw: FontWeight.bold,
                        lspace: 0,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.policy_rounded,
                        size: 16,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      customtext(
                        name: "2 Days return policy",
                        size: 12,
                        fw: FontWeight.bold,
                        lspace: 0,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_circle_outline_outlined,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      customtext(
                          name: "2", size: 14, fw: FontWeight.bold, lspace: 0),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.add_circle,
                        size: 20,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.delete,
                        size: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
