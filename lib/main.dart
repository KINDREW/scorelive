import 'package:flutter/material.dart';
import 'package:scorelive/screens/CompetitionDetails.dart';
import 'package:scorelive/screens/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(
      ),

      routes: {
        "/competiondetails" : (contex)=> CompetitionDetails(leagueName: '', leagueCode: '', country: '', leagueFlag: '',)
      },
    );
  }
}
