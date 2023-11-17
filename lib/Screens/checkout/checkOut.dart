import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/myseprator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../constants/text.dart';

class Checkout_order extends StatefulWidget {
  const Checkout_order({super.key});

  @override
  State<Checkout_order> createState() => _Checkout_orderState();
}

class _Checkout_orderState extends State<Checkout_order> {
  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay?.clear();
  }

  void openChecF(int amt, String name, String cont, String email) async {
    var options = {
      'key': 'rzp_test_pqkjwTQGARAhiK',
      'amount': amt,
      'name': name,
      'description': 'Payment',
      'prefill': {'contact': cont, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS PAYMENT: ${response.paymentId}", timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR HERE: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET IS : ${response.walletName}",
        timeInSecForIosWeb: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
            size: 18,
          ),
        ),
        centerTitle: true,
        title: customtext(
            name: "Checkout order", size: 17, fw: FontWeight.bold, lspace: 0),
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customtext(
              name: "SELECT ADDRESS",
              size: 15,
              fw: FontWeight.bold,
              lspace: 0,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Select_address(),
            SizedBox(
              height: 15,
            ),
            coupnBanner(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.money_rounded,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    customtext(
                        name: "Pay Cash",
                        size: 15,
                        fw: FontWeight.bold,
                        lspace: 0)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customtext(
                      name: "Fee :",
                      size: 14,
                      fw: FontWeight.w500,
                      lspace: 0,
                      color: Colors.grey,
                    ),
                    customtext(
                      name: "₹0.00",
                      size: 15,
                      fw: FontWeight.bold,
                      lspace: 0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MySeparator(
              color: Colors.grey.withOpacity(
                0.3,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customtext(
                    name: "ORDER ID",
                    size: 15,
                    fw: FontWeight.bold,
                    lspace: 0,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customtext(
                          name: "Order Id",
                          size: 15,
                          fw: FontWeight.bold,
                          lspace: 0),
                      customtext(
                          name: "FD-7850-37676-CDXX",
                          size: 15,
                          fw: FontWeight.bold,
                          lspace: 0),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customtext(
                          name: "Order date",
                          size: 15,
                          fw: FontWeight.bold,
                          lspace: 0),
                      customtext(
                          name: "Today,08:00",
                          size: 15,
                          fw: FontWeight.bold,
                          lspace: 0),
                    ],
                  ),
                ],
              ),
            ),
            MySeparator(
              color: Colors.grey.withOpacity(
                0.3,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            customtext(
              name: "ORDER DETAILS",
              size: 15,
              fw: FontWeight.bold,
              lspace: 0,
              color: Colors.grey,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customtext(
                          name: "Okonomiyaki",
                          size: 15,
                          fw: FontWeight.bold,
                          lspace: 0),
                      customtext(
                          name: "x 2",
                          size: 15,
                          fw: FontWeight.bold,
                          lspace: 0),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      )),
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
                    openChecF(2000, "shivam", "9999999999",
                        "shivamkaroria995@gmail.com");
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
    );
  }
}

class coupnBanner extends StatelessWidget {
  const coupnBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customtext(
              name: "Cashback 50% Black Friday",
              size: 17,
              fw: FontWeight.bold,
              lspace: 0),
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: customtext(
                name: "2 Coupon",
                size: 15,
                fw: FontWeight.bold,
                lspace: 0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Select_address extends StatelessWidget {
  const Select_address({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customtext(
                              name: "Farhan Fauzan",
                              size: 17,
                              fw: FontWeight.bold,
                              lspace: 0),
                          customtext(
                              name: "456 Northwest Boulevard,NJ",
                              size: 15,
                              fw: FontWeight.w500,
                              lspace: 0)
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(3)),
                      child: Center(
                        child: customtext(
                          name: "Home",
                          size: 12,
                          fw: FontWeight.normal,
                          lspace: 0,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
