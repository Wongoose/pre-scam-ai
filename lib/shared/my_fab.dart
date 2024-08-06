import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MyFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        onPressed: () {},
        // onPressed: () => Get.to(() => ChatPage()),
        backgroundColor: Theme.of(context).primaryColor,
        shape: CircleBorder(),
        child: Icon(
          CupertinoIcons.chat_bubble_2,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
