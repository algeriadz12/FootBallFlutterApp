
import 'package:football_app/domain/authentication/auth_service.dart';
import 'package:football_app/domain/models/STModel.dart';
import '../models/live/LiveGames.dart';
import '../models/news/NewsModel.dart';
import '../models/testing/TestingModel.dart';

class AppRepository {

  late AuthService authService;

  AppRepository({required this.authService});

  Future<TestingModel?> getLiveStandings(int leagueId , int season) async {
    return authService.getStandings(leagueId, season);
  }

  Future<LiveGames?> getLiveGames(int leagueId) async {
    return authService.getFixtures(leagueId);
  }

  Future<NewsModel?> getEverything() async {
    return authService.getNews();
  }
}