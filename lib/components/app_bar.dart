import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final double height;
  const MyAppBar({Key? key, this.title, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: title!.isNotEmpty
          ? Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            )
          : Container(),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.chat,
            size: 30.0,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.chevron_left,
          size: 30.0,
        ),
        color: Colors.black,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
