import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/bloc_event.dart';
import 'package:football_app/bloc/bloc_state.dart';
import 'package:football_app/bloc/main_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StandingsScreen extends StatefulWidget {
  const StandingsScreen({Key? key}) : super(key: key);

  @override
  State<StandingsScreen> createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  SharedPreferences? _sharedPreferences;
  var currentTheme  = "";
  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if(_sharedPreferences?.getString("theme") == "light"){
      setState(() {
        currentTheme = "light";
      });
    }
    else if (_sharedPreferences?.getString("theme") == "dark"){
      currentTheme = "dark";
    }
  }


  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MainBloc>(context).add(AppEvents.standings);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text('#',style: TextStyle(fontFamily: 'mont_bold'),),
                        const SizedBox(width: 15,),
                        Image.asset("assets/images/team.png",height: 20,width: 20,color: currentTheme == "light" ? Colors.black: Colors.white,),
                        const SizedBox(width: 15,),
                        const Text('Team', style: TextStyle(fontFamily: 'mont_bold'),)
                      ],
                    ),
                  )),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text('P',style: TextStyle(fontFamily: 'mont_bold'),),
                      const Text('W',style: TextStyle(fontFamily: 'mont_bold'),),
                      const Text('D',style: TextStyle(fontFamily: 'mont_bold'),),
                      const Text('L',style: TextStyle(fontFamily: 'mont_bold'),),
                      Text('PT',style: TextStyle(fontFamily: 'mont_bold',color: currentTheme == 'light' ? Colors.deepOrange : Colors.deepOrange),),
                    ],
                  ))
            ],
          ),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<MainBloc, AppState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }
                if (state is StandingSuccess) {
                  var data = state.values!.response![0]!.league!.standings![0];
                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      var isFirst = data[index]!.rank! <= 3;
                      var isMiddle = data[index]!.rank! > 3 && data[index]!.rank! <= 19;
                      var isLast = data[index]!.rank! > 19 && data[index]!.rank! <= 22;
                      return Padding(
                        padding:  const EdgeInsets.only(top: 8,bottom: 8,left: 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        isFirst ? const Icon(Icons.arrow_upward_outlined,size: 10) :
                                        isLast ? const Icon(Icons.arrow_downward_outlined,size: 10) :
                                        const Icon(Icons.minimize,size: 10),
                                        Text(data[index]!.rank.toString(), style:  TextStyle(
                                            color: isFirst ? Colors.green
                                                : isLast ? Colors.red
                                                : currentTheme == 'light' ? Colors.black : Colors.white,fontFamily: 'mont_bold'),),
                                        const SizedBox(width: 10,),
                                        data[index]!.team!.logo != null ? Image.network(data[index]!.team!.logo!,height: 25, width: 25,) :
                                          Image.asset("assets/images/team.png",height: 25, width: 25,),
                                        const SizedBox(width: 10,),
                                        Flexible(child: Text(
                                          data[index]!.team!.name!,
                                          style: const TextStyle(fontFamily: 'mont_bold'),
                                        ))
                                      ],
                                    )),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data[index]!.all!.played.toString(),style: const TextStyle(fontFamily: 'mont_medium'),),
                                        Text(data[index]!.all!.win.toString(),style: const TextStyle(fontFamily: 'mont_medium'),),
                                        Text(data[index]!.all!.draw.toString(),style: const TextStyle(fontFamily: 'mont_medium'),),
                                        Text(data[index]!.all!.lose.toString(),style: const TextStyle(fontFamily: 'mont_medium'),),
                                        Text(data[index]!.points.toString(),style: TextStyle(fontFamily: 'mont_medium',color: currentTheme == 'light' ? Colors.blueAccent : Colors.deepOrange),),
                                      ],
                                    )),
                              ],
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    },
                  );
                }
                if (state is Error) {
                  return  Center(
                    child: Image.asset("assets/images/no_data.png", color: currentTheme == 'light' ? Colors.black : Colors.white,height: 60,width: 60,),
                  );
                }
                return  Center(
                  child: Image.asset("assets/images/no_data.png",color: currentTheme == 'light' ? Colors.black : Colors.white,height: 60,width: 60,),
                );
              }),
        ))
      ],
    );
  }
}

