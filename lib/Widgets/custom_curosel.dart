import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class custom_curosel extends StatelessWidget {
  const custom_curosel({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 13 / 9,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                initialPage: 0,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlay: true,
                height: 160.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/boon-b226c.appspot.com/o/3466531_16284.jpg?alt=media&token=74f4653e-5d06-4ee5-b386-b81dc3997293",
                        fit: BoxFit.cover,
                      ));
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
