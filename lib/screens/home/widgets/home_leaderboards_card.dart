import "package:flutter/material.dart";
// import "package:the_hill_residence/services/firebase/auth.dart";

class HomeLeaderboardsCard extends StatelessWidget {
  const HomeLeaderboardsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final AuthService authService = Get.find();
    return Card(
      // color: authService.appUser.visitorSummaryCardColor ?? Theme.of(context).primaryColor,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
        width: MediaQuery.of(context).size.width,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white38
                    // color: authService.appUser.visitorSummaryImageColor ?? Colors.white38,
                    ),
                child: Image(image: AssetImage("assets/images/trophy.png")),
              ),
              SizedBox(width: 20),
              Flexible(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Top 10",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "89030 points",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ]),
              ),
            ]),
      ),
    );
  }
}
