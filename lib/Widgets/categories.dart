import 'package:flutter/material.dart';

import '../model/menu.dart';
import '../constants/text.dart';

class storesCategories extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  storesCategories({required this.onChanged, required this.selectedIndex});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        height: 52,
        child: Categories(onChanged: onChanged, selectedIndex: selectedIndex));
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 52;

  @override
  // TODO: implement minExtent
  double get minExtent => 52;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required this.onChanged,
    required this.selectedIndex,
  }) : super(key: key);

  final ValueChanged<int> onChanged;
  final int selectedIndex;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // int selectedIndex = 0;
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Categories oldWidget) {
    _controller.animateTo(
      80.0 * widget.selectedIndex,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          demoCategoryMenus.length,
          (index) => SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  widget.onChanged(index);
                  _controller.animateTo(
                    80.0 * index,
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 200),
                  );
                },
                child: Container(
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: widget.selectedIndex == index
                          ? Colors.green
                          : Colors.white,
                      border: Border.all(color: Colors.grey.shade100)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Center(
                          child: Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: widget.selectedIndex == index
                                    ? Colors.white
                                    : Colors.grey.shade100),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                          child: Container(
                        width: 100,
                        child: customtext(
                            name: demoCategoryMenus[index].category,
                            size: 15,
                            fw: FontWeight.bold,
                            color: widget.selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            lspace: 1),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
