import "package:flutter/material.dart";
import "package:prescamai/screens/home/widgets/home_appbar.dart";
import "package:prescamai/screens/home/widgets/home_leaderboards_card.dart";
import "package:prescamai/screens/home/widgets/home_scam_list.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: HomeAppBar()),
          SizedBox(height: 20),
          HomeLeaderboardsCard(),
          SizedBox(height: 30),
          Expanded(child: HomeScamList()),
        ],
      ),
    );
  }
}
