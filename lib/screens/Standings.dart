import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scorelive/models/Teams.dart';

class Standings extends StatefulWidget {
  final String leagueCode;

  Standings({required this.leagueCode});

  @override
  State<Standings> createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  Future<List<StandingData>> getStanding(String leagueCode) async {
    List<StandingData> standingDataList = [];

    var response = await http.get(
      Uri.https("api.football-data.org", "/v4/competitions/$leagueCode/standings"),
      headers: {'X-Auth-Token': 'a974575eb458469aaedfb22e103f1931'},
    );
    var jsonData = jsonDecode(response.body);


    var standings = jsonData["standings"];

    for (var standing in standings) {
      var table = standing["table"];
      for (var item in table) {
        var position = item["position"];
        var teamName = item["team"]["shortName"];
        var playedGames = item["playedGames"];
        var won = item["won"];
        var drawn = item["draw"];
        var lost = item["lost"];
        var points = item["points"];
        var goalDifference = item["goalDifference"];

        var standingData = StandingData(
          position: position,
          teamName: teamName,
          playedGames: playedGames,
          won: won,
          drawn: drawn,
          lost: lost,
          points: points,
          goalDifference: goalDifference,
        );

        standingDataList.add(standingData);
      }
    }

    return standingDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 15,
                  child: Text("#")),
              Container(
                  width: 100,
                  child: Text("Club")),
              Text("P"),
              Text("W"),
              Text("D"),
              Text("L"),
              Text("GD"),
              Text("PTS")
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: getStanding(widget.leagueCode),
            builder: (context, AsyncSnapshot<List<StandingData>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                print(snapshot.data); // This will print the fetched data
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var standingData = snapshot.data![index]; // Accessing the StandingData instance at the current index
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFF3A3A3A),
                            width: 2,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 15.0, // Set the desired width
                          child: Text(standingData.position.toString(),), // Display position or any other data you want
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                standingData.teamName,
                                style: TextStyle(color: Color(0xFF5D5C64), fontSize: 13),
                              ),
                            ),
                            Text(
                              standingData.playedGames.toString(),
                              style: TextStyle(color: Color(0xFF5D5C64), fontSize: 13),
                            ),
                            Text(
                              standingData.won.toString(),
                              style: TextStyle(color: Color(0xFF5D5C64), fontSize: 13),
                            ),
                            Text(
                              standingData.drawn.toString(),
                              style: TextStyle(color: Color(0xFF5D5C64), fontSize: 13),
                            ),
                            Text(
                              standingData.lost.toString(),
                              style: TextStyle(color: Color(0xFF5D5C64), fontSize: 13),
                            ),
                            Text(
                              standingData.goalDifference.toString(),
                              style: TextStyle(color: Color(0xFF5D5C64), fontSize: 13),
                            ),
                            Text(
                              standingData.points.toString(),
                              style: TextStyle(color: Color(0xFF5D5C64), fontSize: 13),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                );

              }
            },
          ),
        ),
      ],
    );
  }
}
