import 'package:flutter/material.dart';

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Widget> _banners = List.generate(
      6,
      (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset(
              "assets/images/top-view-vegetables-fruits-bag.jpg",
              fit: BoxFit.fill,
            ),
          ));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _banners.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          TabBarView(
            children: _banners,
            controller: _tabController,
          ),
        ],
      ),
    );
  }
}
