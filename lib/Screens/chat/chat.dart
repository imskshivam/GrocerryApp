import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/brocali.png"),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customtext(
                  name: "Krisna waston",
                  size: 16,
                  fw: FontWeight.bold,
                  lspace: 0,
                  color: Colors.white,
                ),
                customtext(
                  name: "Active 3m ago",
                  size: 12,
                  fw: FontWeight.normal,
                  lspace: 0,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.local_phone)),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
