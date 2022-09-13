

import 'package:football_app/domain/models/news/NewsModel.dart';

import '../domain/models/STModel.dart';
import '../domain/models/live/LiveGames.dart';
import '../domain/models/testing/TestingModel.dart';

class AppState {}

class Loading extends AppState {}

class Error extends AppState {
  String? error;
  Error({required this.error});
}

class StandingSuccess extends AppState {
  TestingModel? values;
  StandingSuccess({required this.values});
}

class LiveGamesSuccess extends AppState {
  LiveGames? values;
  LiveGamesSuccess({required this.values});
}

class NewsFromApi extends AppState {
  NewsModel? newsModel;
  NewsFromApi(this.newsModel);
}
