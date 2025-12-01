// pages/widgets/success_body.dart
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
           gradient: LinearGradient(
         colors: [
           weatherData!.getThemeColor(),
           weatherData!.getThemeColor()[300]!,
           weatherData!.getThemeColor()[100]!,
         ],
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter,
       )),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           const Spacer(
             flex: 3,
           ),
           Text('',
            // Provider.of<WeatherProvider>(context).cityName!,
             style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
             ),
           ),
           Text(
             'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
             style: TextStyle(
               fontSize: 22,
             ),
           ),
           Spacer(),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Image.asset(weatherData!.getImage()),
               Text(
                 weatherData!.temp.toInt().toString(),
                 style: TextStyle(
                   fontSize: 32,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               Column(
                 children: [
                   Text('maxTemp :${weatherData!.maxTemp.toInt()}'),
                   Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                 ],
               ),
             ],
           ),
           Spacer(),
           Text(
             weatherData!.weatherStateName,
             style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
             ),
           ),
           Spacer(
             flex: 5,
           ),
         ],
       ),
     );
  }
}
    