import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.homeTeam, this.awayTeam,  this.status, this.homeTeamLineScore,
    this.awayTeamLineScore,});

  final String homeTeam ;
  final String awayTeam;
  final String status;
  final String homeTeamLineScore;
  final String awayTeamLineScore;
 // final Function onPress;
 // <List<String>>

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Text(homeTeam),
          Text(awayTeam),
          Text(status),
          Text(homeTeamLineScore),
          Text(awayTeamLineScore),
        ],
      ),
    );
  }
}


