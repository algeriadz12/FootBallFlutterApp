import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/main_bloc.dart';
import 'package:football_app/domain/authentication/auth_service.dart';
import 'package:football_app/presentation/home_screen.dart';
import 'package:football_app/presentation/splash_screen.dart';
import 'package:get/get.dart';

import 'domain/repository/app_repo.dart';

void main() {
  runApp( GetMaterialApp(
    home: const MyApp(),
    theme: ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF16213E)
      )
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(appRepository: AppRepository(authService: AuthService()),
      leagueId: 141,seasonId: 2022) ,
      child: const HomeScreen(),
    );
  }
}
