import 'package:flutter/material.dart';

import '../../constants/text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              itemCount: demo_data.length,
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              controller: _pageController,
              itemBuilder: (context, index) => onboarding(
                images: demo_data[index].image,
                title: demo_data[index].title,
                description: demo_data[index].description,
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ...List.generate(
                      demo_data.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == pageIndex,
                            ),
                          )),
                  Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: CircleBorder()),
                        child: Icon(Icons.arrow_forward_ios_rounded)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard(this.image, this.title, this.description);
}

final List<OnBoard> demo_data = [
  OnBoard("assets/images/brocali.png", "Shopping \nfor your vegetables needs",
      "Vegetables Are Important Sources Of Many Nutrients,Including Potassium Dietary Fiber,Folate (Folic Acid),Vitamin A And Vitamin C."),
  OnBoard("assets/images/mix_veg.png", "Eat food \nthis is healthy \nfor you",
      "Vitamin K is Essential For A Healthy Body And Essential So For Strong Bones .It Improves How Well The Body Absorbs Calcium"),
  OnBoard("assets/images/pulses.png", "Shopping \nfor your vegetables needs",
      "Vegetables Are Important Sources Of Many Nutrients,Including Potassium Dietary Fiber,Folate (Folic Acid),Vitamin A And Vitamin C."),
  OnBoard("assets/images/brocali.png", "Shopping \nfor your vegetables needs",
      "Vegetables Are Important Sources Of Many Nutrients,Including Potassium Dietary Fiber,Folate (Folic Acid),Vitamin A And Vitamin C."),
  OnBoard("assets/images/brocali.png", "Shopping \nfor your vegetables needs",
      "Vegetables Are Important Sources Of Many Nutrients,Including Potassium Dietary Fiber,Folate (Folic Acid),Vitamin A And Vitamin C."),
  OnBoard("assets/images/brocali.png", "Shopping \nfor your vegetables needs",
      "Vegetables Are Important Sources Of Many Nutrients,Including Potassium Dietary Fiber,Folate (Folic Acid),Vitamin A And Vitamin C."),
];

class onboarding extends StatelessWidget {
  final String title;
  final String description;
  final String images;

  const onboarding({
    super.key,
    required this.title,
    required this.description,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
          image: images,
        ),
        SizedBox(
          height: 15,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: 250,
          child:
              customtext(name: title, size: 30, fw: FontWeight.bold, lspace: 0),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: customtext(
              name: description, size: 14, fw: FontWeight.w500, lspace: 0),
        )
      ],
    );
  }
}

class Header extends StatelessWidget {
  final String image;
  const Header({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 20, top: 20, bottom: 20),
            decoration: BoxDecoration(color: Colors.green.withOpacity(0.1)),
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Hero(
                    tag: "onion",
                    child: Container(
                        height: 300,
                        child: Image.asset(
                          image,
                        )));
              },
            )),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
