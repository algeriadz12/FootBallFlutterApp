import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/main_bloc.dart';
import 'package:football_app/domain/authentication/auth_service.dart';
import 'package:football_app/domain/models/STModel.dart';
import 'package:football_app/presentation/home_screen.dart';
import 'package:football_app/presentation/splash_screen.dart';
import 'package:football_app/theme/theme_notifier.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/repository/app_repo.dart';

String language = "";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  language = prefs.getString("language") ?? "EN";
  runApp(MultiProvider(
    providers: [
      BlocProvider<MainBloc>(
        create: (context) => MainBloc(appRepository: AppRepository(authService: AuthService()), leagueId: 141,seasonId: 2022) ,
      ),
      ChangeNotifierProvider<AppNotifier>(
        create: (context) =>  AppNotifier(),
        child: const MyApp(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (context , provider ,_){
        return GetMaterialApp(
          home: const HomeScreen(),
          theme: provider.getTheme(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
