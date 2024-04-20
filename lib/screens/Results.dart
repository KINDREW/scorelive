import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Results extends StatefulWidget {


  final String leagueCode;

  Results({required this.leagueCode});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

  Future getResults(String leagueCode) async {
    List ResultsDataList = [];

    var response = await http.get(
      Uri.https(
          "api.football-data.org",
          "/v4/competitions/$leagueCode/matches",
          {
            "dateFrom": "2024-04-08", // Replace with your desired start date
            "dateTo": "2024-04-08" // Replace with your desired end date
          }
      ),
      headers: {'X-Auth-Token': 'a974575eb458469aaedfb22e103f1931'},
    );

print(response.statusCode);

    var jsonData = jsonDecode(response.body);


print(jsonData);

  }


  @override
  Widget build(BuildContext context) {
    getResults(widget.leagueCode);
    return Scaffold();
  }
}
