import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_transita_test/services/mlb_data.dart';
import 'package:flutter_transita_test/components/reusable_card.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('MLB'),
      ),
      body: Container(
        child: MlbGames(),
      ),
    );
  }
}

class MlbGames extends StatefulWidget {

  List <String> awayLineScore = [] ;
  List <String> homeLineScore = [] ;
  List <String> status = [] ;
  List <String> awayTeamName = [] ;
  List <String> homeTeamName = [] ;

  @override
  _MlbGamesState createState() => _MlbGamesState();
}

class _MlbGamesState extends State<MlbGames> {

  MlbData mlbData = MlbData();

  void getMlData() async {
    await getHomeTeams();
    await getAwayTeams();
    await getHomeScore();
    await getAwayScore();
    await getStatus();
  }

  Future getAwayTeams() async {
  for(String awayGames in await mlbData.getAwayTeamName('2015', '07', '28')){
    widget.awayTeamName.add(awayGames);
  }
 // print(awayTeamName);
  return widget.awayTeamName;
  }

  Future getStatus() async {
    for(String gameStatus in await mlbData.getStatus('2015', '07', '28')){
      widget.status.add(gameStatus);
    }
   // print(status);
    return widget.status;
  }

  Future getHomeScore() async {
    for(String homeScore in await mlbData.getHomeLineScore('2015', '07', '28')){
      widget.homeLineScore.add(homeScore);
    }
   // print(homeLineScore);
    return widget.homeLineScore;
  }

  Future getAwayScore() async {
    for(String awayScore in await mlbData.getAwayLineScore('2015', '07', '28')){
      widget.awayLineScore.add(awayScore);
    }
    //print(awayLineScore);
    return widget.awayLineScore;
  }

  Future getHomeTeams() async {
    for(String homeGames in await mlbData.getHomeTeamName('2015', '07', '28')){
      widget.homeTeamName.add(homeGames);
    }
    print(widget.homeTeamName);
    return widget.homeTeamName;
  }

  @override
  Widget build(BuildContext context) {
    getMlData();
    return ListView.builder(itemBuilder: (context, index){
      return ReusableCard(homeTeam: widget.homeTeamName[index], awayTeam: widget.awayTeamName[index],
        status: widget.status[index], homeTeamLineScore: widget.homeLineScore[index], awayTeamLineScore: widget.awayLineScore[index],);
    },
      itemCount: widget.homeTeamName.length,
    );

  }
}







