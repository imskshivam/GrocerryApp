import 'package:flutter/material.dart';

import '../constants/text.dart';

class description extends StatefulWidget {
  final String title;
  final String desp;
  final Widget trailing;
  description({
    super.key,
    this.title = "",
    this.desp = "",
    this.trailing = const SizedBox(
      height: 0,
      width: 0,
    ),
  });

  @override
  State<description> createState() => _descriptionState();
}

class _descriptionState extends State<description>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customtext(
                  name: widget.title, size: 14, fw: FontWeight.bold, lspace: 0),
              Spacer(),
              if (widget.trailing != null) widget.trailing,
              InkWell(
                  onTap: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  child: RotatedBox(
                      quarterTurns: _expanded ? 3 : 0,
                      child: Icon(Icons.chevron_right)))
            ],
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            child: ConstrainedBox(
              constraints:
                  _expanded ? BoxConstraints() : BoxConstraints(maxHeight: 0),
              child: Text(
                widget.desp,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
