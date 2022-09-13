import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/bloc_event.dart';
import 'package:football_app/bloc/bloc_state.dart';
import 'package:football_app/bloc/main_bloc.dart';

class StandingScreen extends StatefulWidget {
  const StandingScreen({Key? key}) : super(key: key);

  @override
  State<StandingScreen> createState() => _StandingScreenState();
}

class _StandingScreenState extends State<StandingScreen> {
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
                        const Text('#',style: TextStyle(color: Colors.white,fontFamily: 'mont_bold'),),
                        const SizedBox(width: 15,),
                        Image.asset("assets/images/team.png",height: 20,width: 20,color: Colors.white,),
                        const SizedBox(width: 15,),
                        const Text('Team', style: TextStyle(color: Colors.white,fontFamily: 'mont_bold'),)
                      ],
                    ),
                  )),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('P',style: TextStyle(color: Colors.white,fontFamily: 'mont_bold'),),
                      Text('W',style: TextStyle(color: Colors.white,fontFamily: 'mont_bold'),),
                      Text('D',style: TextStyle(color: Colors.white,fontFamily: 'mont_bold'),),
                      Text('L',style: TextStyle(color: Colors.white,fontFamily: 'mont_bold'),),
                      Text('PT',style: TextStyle(color: Colors.deepOrange,fontFamily: 'mont_bold'),),
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
                                        isFirst ? const Icon(Icons.arrow_upward_outlined,size: 10,color: Colors.green,) :
                                        isLast ? const Icon(Icons.arrow_downward_outlined,size: 10,color: Colors.red,) :
                                        const Icon(Icons.minimize,size: 10,color: Colors.white,),
                                        Text(data[index]!.rank.toString(), style:  TextStyle(
                                            color: isFirst ? Colors.green : isLast ? Colors.red : Colors.white,fontFamily: 'mont_bold'),),
                                        const SizedBox(width: 10,),
                                        Image.network(
                                          data[index]!.team!.logo!,
                                          height: 25,
                                          width: 25,
                                        ),
                                        const SizedBox(width: 10,),
                                        Flexible(child: Text(
                                          data[index]!.team!.name!,
                                          style: const TextStyle(color: Colors.white,fontFamily: 'mont_bold'),
                                        ))
                                      ],
                                    )),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data[index]!.all!.played.toString(),style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium'),),
                                        Text(data[index]!.all!.win.toString(),style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium'),),
                                        Text(data[index]!.all!.draw.toString(),style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium'),),
                                        Text(data[index]!.all!.lose.toString(),style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium'),),
                                        Text(data[index]!.points.toString(),style: const TextStyle(color: Colors.deepOrange,fontFamily: 'mont_medium'),),
                                      ],
                                    )),

                              ],
                            ),
                            const Divider(color: Colors.white24,)
                          ],
                        ),
                      );
                    },
                  );
                }
                if (state is Error) {
                  return  Center(
                    child: Image.asset("assets/images/no_data.png",color: Colors.blueAccent,height: 60,width: 60,),
                  );
                }
                return  Center(
                  child: Image.asset("assets/images/no_data.png",color: Colors.blueAccent,height: 60,width: 60,),
                );
              }),
        ))
      ],
    );
  }
}
