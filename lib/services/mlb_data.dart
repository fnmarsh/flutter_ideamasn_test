import 'dart:convert';
import 'package:http/http.dart' as http;

const mlbAPIURL = 'http://gd2.mlb.com/components/game/mlb';

class MlbData {
  var game ;
  List <String> awayLineScore = [] ;
  List <String> homeLineScore = [] ;
  List <String> status = [] ;
  List <String> awayTeamName = [] ;
  List <String> homeTeamName = [] ;

  Future getHomeTeamName(String year, String month, String day) async {
    //List <String> homeTeamName = [];
    int noOfGames = 0;
    String requestURL =
        '$mlbAPIURL/year_$year/month_$month/day_$day/master_scoreboard.json';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      game = decodedData['data']['games']['game'];
      for(var games in game) {
        noOfGames++;
      }
      for(int i = 0; i < noOfGames; i++){
        homeTeamName.add(game[i]['home_team_name']) ;
      }
    //  print(homeTeamName);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return homeTeamName;
  }

  Future getAwayTeamName(String year, String month, String day) async{
   // List <String> awayTeamName = [] ;
    int noOfGames = 0;
    String requestURL =
        '$mlbAPIURL/year_$year/month_$month/day_$day/master_scoreboard.json';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      game = decodedData['data']['games']['game'];
      for(var games in game) {
        noOfGames++;
      }
      for(int i = 0; i < noOfGames; i++){
        awayTeamName.add(game[i]['away_team_name']) ;
      }
    //  print(awayTeamName);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return awayTeamName;
  }

  Future getStatus(String year, String month, String day) async{
   // List <String> status = [];
    int noOfGames = 0;
    String requestURL =
        '$mlbAPIURL/year_$year/month_$month/day_$day/master_scoreboard.json';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      game = decodedData['data']['games']['game'];
      for(var games in game) {
        noOfGames++;
      }
      for(int i = 0; i < noOfGames; i++){
        status.add( game[i]['status']['status']);
      }
     // print(status);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return status;
  }

  Future getHomeLineScore(String year, String month, String day) async{
   // List <String> homeLineScore = [];
    int noOfGames = 0;
    String requestURL =
        '$mlbAPIURL/year_$year/month_$month/day_$day/master_scoreboard.json';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      game = decodedData['data']['games']['game'];
      for(var games in game) {
        noOfGames++;
      }
      for(int i = 0; i < noOfGames; i++){
        homeLineScore.add(game[i]['linescore']['r']['home']);
      }
    //  print(homeLineScore);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return homeLineScore;
  }

  Future getAwayLineScore(String year, String month, String day) async{
  //  List <String> awayLineScore = [];
    int noOfGames = 0;
    String requestURL =
        '$mlbAPIURL/year_$year/month_$month/day_$day/master_scoreboard.json';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      game = decodedData['data']['games']['game'];
      for(var games in game) {
        noOfGames++;
      }
      for(int i = 0; i < noOfGames; i++){
        awayLineScore.add(game[i]['linescore']['r']['away']) ;
      }
     // print(awayLineScore);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return awayLineScore;
  }

  // Future<Map<int, String>> getAwayLineScore(String year, String month, String day) async{
  //   Map<int, String> awayLineScore = {};
  //   int noOfGames = 0;
  //   String requestURL =
  //       '$mlbAPIURL/year_$year/month_$month/day_$day/master_scoreboard.json';
  //   http.Response response = await http.get(requestURL);
  //   if (response.statusCode == 200) {
  //     var decodedData = jsonDecode(response.body);
  //     game = decodedData['data']['games']['game'];
  //     for(var games in game) {
  //       noOfGames++;
  //     }
  //     for(int i = 0; i < noOfGames; i++){
  //       awayLineScore[i] = (game[i]['linescore']['r']['away']) ;
  //       print(awayLineScore);
  //     }
  //   } else {
  //     print(response.statusCode);
  //     throw 'Problem with the get request';
  //   }
  //   return awayLineScore;
  // }
}

