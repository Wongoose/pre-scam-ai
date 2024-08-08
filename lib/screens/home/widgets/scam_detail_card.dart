import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class ScamDetailCard extends StatelessWidget {
  const ScamDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final AuthService authService = Get.find();
    return Card(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.fromLTRB(40, 25, 40, 25),
        width: MediaQuery.of(context).size.width,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(CupertinoIcons.star, color: Colors.white),
                  SizedBox(height: 2),
                  Text(
                    "EARN POINTS",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "300",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(CupertinoIcons.bubble_right, color: Colors.white),
                  SizedBox(height: 2),
                  Text(
                    "QUESTIONS",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "3",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              // Flexible(
              //   child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "Top 10",
              //           style: TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white),
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           "89030 points",
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //           style: TextStyle(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w400,
              //               color: Colors.white),
              //         ),
              //       ]),
              // ),
            ]),
      ),
    );
  }
}