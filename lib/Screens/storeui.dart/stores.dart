import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/Widgets/categories.dart';
import 'package:flutter_application_1/Widgets/storeinfo.dart';

import '../checkout/checkout_oder2.dart';
import '../checkout/menu_category.dart';
import '../../model/menu.dart';

class Nearbuystores extends StatefulWidget {
  const Nearbuystores({super.key});

  @override
  State<Nearbuystores> createState() => _NearbuystoresState();
}

class _NearbuystoresState extends State<Nearbuystores> {
  final scrollControl = ScrollController();
  int selectedCategoryIndex = 0;

  double storeInfoheight = 200 + 170 - kToolbarHeight + 80;

  @override
  void initState() {
    createBreakPoints();
    scrollControl.addListener(() {
      updateCategoryIndexOnScroll(scrollControl.offset);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;
      for (var i = 0; i < index; i++) {
        totalItems += demoCategoryMenus[i].items.length;
      }

      scrollControl.animateTo(
          storeInfoheight + (110 * totalItems) + (50 * index),
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);

      setState(() {
        selectedCategoryIndex = index;
      });
    }
  }

  List<double> breakPoints = [];

  void createBreakPoints() {
    double firstBreakPointa =
        storeInfoheight + 50 + (116 * demoCategoryMenus[0].items.length);

    breakPoints.add(firstBreakPointa);
    for (var i = 1; i < demoCategoryMenus.length; i++) {
      double breakPoint =
          breakPoints.last + 50 + (116 * demoCategoryMenus[i].items.length);
      breakPoints.add(breakPoint);
    }
  }

  void updateCategoryIndexOnScroll(double offset) {
    for (var i = 0; i < demoCategoryMenus.length; i++) {
      if (i == 0) {
        if ((offset < breakPoints.first) & (selectedCategoryIndex != 0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        }
      } else if ((breakPoints[i - 1] <= offset) & (offset < breakPoints[i])) {
        if (selectedCategoryIndex != i) {
          setState(() {
            selectedCategoryIndex = i;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return checkout_order2();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: animation.drive(
                        Tween(begin: Offset(0, 1), end: Offset(0, 0))
                            .chain(CurveTween(curve: Curves.easeInOut))),
                    child: child,
                  );
                },
              ));
        },
        backgroundColor: Colors.green,
        elevation: 10,
        child: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: CustomScrollView(
        controller: scrollControl,
        slivers: [
          StoreAppBar(),
          SliverToBoxAdapter(
            child: RestaurantInfo(),
          ),
          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(autoPlay: true, height: 80.0),
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration:
                            BoxDecoration(color: Colors.blue.withOpacity(0.2)),
                        child: Image.asset(
                          "assets/images/variety-organic-vegetables-supermarket.jpg",
                          fit: BoxFit.cover,
                        ));
                  },
                );
              }).toList(),
            ),
          ),
          SliverPersistentHeader(
            delegate: storesCategories(
                onChanged: scrollToCategory,
                selectedIndex: selectedCategoryIndex),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              List<Menu> items = demoCategoryMenus[index].items;
              return MenuCategoryItem(
                title: demoCategoryMenus[index].category,
                items: List.generate(
                    items.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: MenuCard(
                              image: items[index].image,
                              title: items[index].title,
                              price: items[index].price),
                        )),
              );
            }, childCount: demoCategoryMenus.length)),
          ),
        ],
      ),
    );
  }
}

class StoreAppBar extends StatelessWidget {
  const StoreAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 200,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assets/images/store1.jpg",
          fit: BoxFit.cover,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
            size: 17,
          ),
        ),
      ),
      actions: [
        CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              "assets/images/search.png",
              scale: 28,
              width: 50,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/images/share.png",
                scale: 28,
                width: 50,
              )),
        ),
      ],
    );
  }
}
