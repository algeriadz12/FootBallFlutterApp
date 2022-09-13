import 'dart:convert';
import 'package:football_app/domain/models/live/LiveGames.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import '../../utils.dart';
import '../models/STModel.dart';
import 'package:http/http.dart' as http;

import '../models/news/NewsModel.dart';
import '../models/testing/TestingModel.dart';


class AuthService {

  Future<TestingModel?> getStandings(int leagueId , int season) async {
    // HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);

    var fullUrl  = "${Utils.BASE_URL}standings?league=$leagueId&season=$season";
    var response = await http.get(Uri.parse(fullUrl),headers: {
      'x-rapidapi-host' : Utils.HOST,
      'x-rapidapi-key' :  Utils.KEY,
    });

    if(response.statusCode == 200){
      var json  = jsonDecode(response.body);
      return TestingModel.fromJson(json);
    } else {
      return null;
    }
  }


  // GET Live Games
  Future<LiveGames?> getFixtures(int leagueId) async {

    var fullUrl  = "${Utils.BASE_URL}fixtures?live=all&league=$leagueId";
    var response = await http.get(Uri.parse(fullUrl),headers: {
      'x-rapidapi-host' : Utils.HOST,
      'x-rapidapi-key' :  Utils.KEY,
    });

    if(response.statusCode == 200){
      var json  = jsonDecode(response.body);
      return LiveGames.fromJson(json);
    } else {
      return null;
    }
  }

  // GET NEWS
  Future<NewsModel?> getNews() async{
    HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);
    var response = await httpClient.get(Uri.parse(Utils.LALIGA));
    if(response.statusCode == 200){
      var decodedJson = jsonDecode(response.body);
      return NewsModel.fromJson(decodedJson);
    } else {
      return null;
    }
  }
}