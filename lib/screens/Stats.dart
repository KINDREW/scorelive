import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scorelive/models/TopScorers.dart';

class Stats extends StatefulWidget {
  final String leagueCode;

  Stats({required this.leagueCode});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  List<TopScorersData> topScorer = [];

  Future<List<TopScorersData>> getTopScorer(String leagueCode) async {
    var response = await http.get(
      Uri.https(
          "api.football-data.org", "/v4/competitions/$leagueCode/scorers"),
      headers: {'X-Auth-Token': 'a974575eb458469aaedfb22e103f1931'},
    );

    var jsonData = jsonDecode(response.body);

    var scorers = jsonData["scorers"];

    for (var player in scorers) {
    print(player);
      var playerName = player["player"]["name"];
      var goals = player["goals"];
      var club = (player["team"]["name"]);
    var clubCrest = (player["team"]["crest"]);


      topScorer.add(TopScorersData(playerName: playerName, goals: goals, club:club, clubCrest: clubCrest));
    }

    return topScorer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Goals",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: "Mulish"),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Player"),
                Text("Goals")
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: FutureBuilder<List<TopScorersData>>(
                future: getTopScorer(widget.leagueCode),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var topscorer = snapshot.data![index];
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
                              leading: Image.network(
                                snapshot.data![index].clubCrest,
                                width: 30,
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {

                                  return Text("CLub");
                                },
                              ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data![index].playerName.toString(),
                                  style: TextStyle(
                                      color: Color(0xFF5D5C64), fontSize: 15),
                                ),
                                Text(
                                  snapshot.data![index].goals.toString(),
                                  style: TextStyle(
                                      color: Color(0xFF5D5C64), fontSize: 13),
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
          )
        ],
      ),
    );
  }
}
