import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/constants/text.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sk Super Mart ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  height: 20,
                  width: 60,
                  color: Colors.green.withOpacity(0.2),
                  child: Center(
                    child: customtext(
                      name: "OPENED",
                      size: 11,
                      fw: FontWeight.bold,
                      lspace: 0,
                      color: Colors.green,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 60,
                  child: TimeLeft(),
                ),
                Image.asset(
                  "assets/images/messenger.png",
                  scale: 25,
                  color: Colors.green,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF868686),
                ),
                child: Row(
                  children: const [Text("Grocery, Deshi food")],
                ),
              ),
            ),
            Row(
              children: [
                const Text("4.3"),
                const SizedBox(width: 8),
                Row(
                    children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 14,
                  ),
                )),
                const SizedBox(width: 4),
                const Text("200+ Ratings"),
                const SizedBox(width: 10),
                customtext(
                    name: "|  code : bxff".toUpperCase(),
                    size: 14,
                    fw: FontWeight.bold,
                    lspace: 0),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const InfoCard(
                  iconData: Icons.delivery_dining,
                  title: "Free",
                  subtitle: "Delivery",
                ),
                const SizedBox(width: 16),
                const InfoCard(
                  iconData: Icons.lock_clock,
                  title: "25",
                  subtitle: "Minutes",
                ),
                const SizedBox(width: 24),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        content: Text("Following added"),
                        behavior: SnackBarBehavior.floating,
                      ));
                  },
                  style: OutlinedButton.styleFrom(
                    primary: const Color(0xFF22A45D),
                    fixedSize: const Size(120, 40),
                    side: const BorderSide(color: Color(0xFF22A45D)),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text(
                    "Follow".toUpperCase(),
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.iconData,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title, subtitle;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          iconData,
          color: Colors.green,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }
}

class time extends StatefulWidget {
  const time({super.key});

  @override
  State<time> createState() => _timeState();
}

class _timeState extends State<time> {
  double? indicatorValue;
  Timer? timer;

  String time() {
    return "${DateTime.now().hour < 10 ? "0${DateTime.now().hour}" : DateTime.now().hour} : ${DateTime.now().minute < 10 ? "0${DateTime.now().minute}" : DateTime.now().minute} : ${DateTime.now().second < 10 ? "0${DateTime.now().second}" : DateTime.now().second} ";
  }

  updateSeconds() {
    timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => setState(() {
              indicatorValue = DateTime.now().second / 60;
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indicatorValue = DateTime.now().second / 60;
    updateSeconds();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      time(),
      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
    );
  }
}

class TimeLeft extends StatefulWidget {
  @override
  _TimeLeftState createState() => _TimeLeftState();
}

class _TimeLeftState extends State<TimeLeft> {
  Duration _duration = Duration(hours: 2, minutes: 30);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _duration = _duration - Duration(seconds: 1);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_duration.inHours}:${(_duration.inMinutes.remainder(60)).toString().padLeft(2, '0')}:${(_duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
      style: TextStyle(fontSize: 12.0),
    );
  }
}
