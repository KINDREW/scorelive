import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scorelive/models/Teams.dart';

class Standings extends StatefulWidget {

  String leagueCode;


  Standings({ required this.leagueCode});

  @override
  State<Standings> createState() => _StandingsState();
}



class _StandingsState extends State<Standings> {
  @override
  Widget build(BuildContext context) {
    String code = widget.leagueCode;
    List table = [];

    Future getStanding() async {
      var response = await http.get(
        Uri.https("api.football-data.org", "/v4/competitions/${code}/standings"),
        headers: {'X-Auth-Token': 'a974575eb458469aaedfb22e103f1931'},
      );
      var jsonData = jsonDecode(response.body);
      table = [];
      for (var eachTeam in jsonData["standings"]) {
        var teams = Teams(position: eachTeam["table"]["position"], teamName: eachTeam["table"]["team"]["name"], gamesPlayed: eachTeam["table"]["playedGames"], gamesWon: eachTeam["table"]["won"], gamesDrawn: eachTeam["table"]["draw"], gamesLost: eachTeam["table"]["lost"], goalDifference: eachTeam["table"]["goalDifference"], points: eachTeam["table"]["points"]);

        table.add(teams);
      }
    }
    print(table);
    return  Expanded(
      child: FutureBuilder(
        future: getStanding(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: table.length,
                itemBuilder: (context, int index) {


                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Color(0xFF3A3A3A),
                            width: 2 // Border// color
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              table[index].gamesWon,
                              style: TextStyle(
                                  color: Color(0xFF5D5C64), fontSize: 13),
                            ),
                            Text(
                              table[index].teamName,
                              style: TextStyle(
                                  color: Color(0xFFB6B6B6), fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator(color: Color(0xFF3A3A3A),));
          }
        },
      ),
    );
  }
}
