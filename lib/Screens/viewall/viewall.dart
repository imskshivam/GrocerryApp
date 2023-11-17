import 'package:flutter/material.dart';

import '../../constants/text.dart';

class viewall extends StatefulWidget {
  const viewall({super.key});

  @override
  State<viewall> createState() => _viewallState();
}

class _viewallState extends State<viewall> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(12.0),
          child: Stack(
            children: [
              GridView.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    mainAxisExtent: 200),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.2))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 80,
                          width: 80,
                          child: Image.asset("assets/images/brocali.png"),
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        customtext(
                            name: "Brocali",
                            size: 14,
                            fw: FontWeight.bold,
                            lspace: 0),
                        customtext(
                            name: "1kg",
                            size: 14,
                            fw: FontWeight.bold,
                            lspace: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customtext(
                              name: "₹ 200",
                              size: 14,
                              fw: FontWeight.bold,
                              lspace: 0,
                              color: Colors.green,
                            ),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    content: Text("Product added"),
                                    behavior: SnackBarBehavior.floating,
                                  ));
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                  top: 50,
                  child: Container(
                      height: 40,
                      width: 40,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios_new_rounded)))),
            ],
          )),
    );
  }
}
