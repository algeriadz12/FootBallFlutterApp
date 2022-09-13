import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/bloc_event.dart';
import 'package:football_app/bloc/bloc_state.dart';
import 'package:football_app/bloc/main_bloc.dart';
import 'package:intl/intl.dart';

class LiveScoreScreen extends StatelessWidget {
  const LiveScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MainBloc>(context).add(AppEvents.live);
    return BlocBuilder<MainBloc,AppState>(
        builder: (context , state){
          if(state is Loading){
            return const Center(child: CircularProgressIndicator(color: Colors.orange,),);
          }
          if(state is LiveGamesSuccess){
            var data = state.values!.response!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: const Color(0xFF0F3460),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(data[index].teams!.home!.logo!,height: 35,width: 35,),
                              data[index].score!.halftime != null ?
                              Text(data[index].score!.halftime!.home.toString(),style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium'),) :
                              Text(data[index].score!.fulltime!.home.toString(),style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium')),
                              Text(data[index].fixture!.status!.elapsed.toString(),style: const TextStyle(
                                  color: Colors.white,fontSize: 25,fontFamily: 'mont_bold'
                              ),),
                              data[index].score!.halftime != null ?
                              Text(data[index].score!.halftime!.away.toString(),style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium')) :
                              Text(data[index].score!.fulltime!.away.toString(),style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium')),
                              Image.network(data[index].teams!.away!.logo!,height: 35,width: 35,)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                  width : 100,
                                  child: Text(data[index].teams!.home!.name!,textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white,fontFamily: 'mont_bold'),)),
                              SizedBox(
                                  width : 100,
                                  child: Text(data[index].teams!.away!.name!,textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white,fontFamily: 'mont_bold'),))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(data[index].fixture!.venue!.name == null ? ' N/A ' : data[index].fixture!.venue!.name!,style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(data[index].fixture!.referee == null ? ' N/A ' : data[index].fixture!.referee!,style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium'),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 10),
                          child: Text(convertTimeStamp(data[index].fixture!.timestamp!.toInt()),style: const TextStyle(color: Colors.white,fontFamily: 'mont_medium'),),
                        ),

                      ],
                    ),
                  ),
                );
              },
            );
          }
          if(state is Error){
            return  Center(
              child: Image.asset("assets/images/no_data.png",color: Colors.blueAccent,height: 60,width: 60,),
            );
          }
          return  Center(
            child: Image.asset("assets/images/no_data.png",color: Colors.blueAccent,height: 60,width: 60,),
          );
        }
    );
  }

  String convertTimeStamp(int timeStamp){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd , HH:mm");
    var dt = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return dateFormat.format(dt);
  }
}
