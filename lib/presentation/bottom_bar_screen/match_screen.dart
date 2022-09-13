import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/bloc_event.dart';
import 'package:football_app/bloc/bloc_state.dart';
import 'package:football_app/bloc/main_bloc.dart';
import 'package:football_app/presentation/events/news_details.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MainBloc>(context).add(AppEvents.news);
    return BlocBuilder<MainBloc,AppState>(
        builder: (context , state){
          if(state is Loading){
            return const Center(child: CircularProgressIndicator(color: Colors.orange,),);
          }
          if(state is NewsFromApi){
            var data = state.newsModel!.articles;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: data!.length,
                itemBuilder: (context , index ){
                    return GestureDetector(
                      onTap: (){
                        Get.to(() =>  NewsDetailsScreen(
                          articles: data[index],
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: const Color(0xFF0F3460),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                child: Image.network(data[index].urlToImage!,height: 120,fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data[index].title!, maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(
                                    color: Colors.white,fontFamily: 'mont_bold',fontSize: 13
                                ),),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                });
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
}
