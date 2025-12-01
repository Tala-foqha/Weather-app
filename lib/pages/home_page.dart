// pages/home_page.dart




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/cubit_state.dart';
import 'package:weather_app/cubits/weather_cubit/weathe_cubit.dart';
import 'package:weather_app/pages/widgets/success_body.dart';

import '../model/weather_model.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
 
  

  WeatherModel ?weatherData;
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                 
                );
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatheCubit,CubitState>(
        
        

         builder: (context,  state) {  
          if(state is weatherLodaingState){
         return  Center(child: CircularProgressIndicator(),);
        }
        else if(state is weatherSuccessState){
          weatherData=BlocProvider.of<WeatheCubit>(context).weatherModel;
           return SuccessBody(weatherData: weatherData);
        }
        else if(state is weatherFaluiergState){
          return Center(
            child: Text('Something went wrong please try again'),
          );
        }
        else {
        return  Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            );
        }
      
        }
      ),
  
    );
  }}

