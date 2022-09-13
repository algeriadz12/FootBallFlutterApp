

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/bloc_event.dart';
import 'package:football_app/bloc/bloc_state.dart';
import 'package:football_app/domain/models/news/NewsModel.dart';
import '../domain/models/live/LiveGames.dart';
import '../domain/models/testing/TestingModel.dart';
import '../domain/repository/app_repo.dart';
import 'bloc_event.dart';
import 'bloc_event.dart';

class MainBloc extends Bloc<AppEvents,AppState> {
  final AppRepository appRepository;
  late final int leagueId;
  late final int seasonId;
  late List<LiveGames>? list = [];
  TestingModel? _standings;
  LiveGames? _fixtures;
  NewsModel? _newsModel;
  MainBloc({required this.appRepository,required this.leagueId,required this.seasonId}) : super(Loading()){
    on<AppEvents>((event, emit) async{
      switch(event){
        case AppEvents.standings:
          try {
            emit(Loading());
            _standings = await appRepository.getLiveStandings(leagueId, seasonId);
            if(_standings?.response![0]!.league != null){
              emit(StandingSuccess(values: _standings));
            } else {
              emit(Error(error: "Error"));
            }
          } catch (e){
            emit(Error(error: e.toString()));
          }
          break;
        case AppEvents.live:
          try {
            emit(Loading());
            _fixtures = await appRepository.getLiveGames(leagueId);
            if(_fixtures!.response!.isNotEmpty){
              emit(LiveGamesSuccess(values: _fixtures));
            } else {
              emit(Error(error: "Error.."));
            }
          } catch (e){
            emit(Error(error: e.toString()));
          }
          break;
        case AppEvents.news:
          try {
            emit(Loading());
            _newsModel = await appRepository.getEverything();
            if(_newsModel!.articles != null){
              emit(NewsFromApi(_newsModel));
            } else {
              emit(Error(error: 'Error...'));
            }
          } catch (e){
             emit(Error(error: 'Error...'));
          }
          break;
      }
    });
  }
  
}