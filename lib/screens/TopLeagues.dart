import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scorelive/models/Competitions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scorelive/screens/CompetitionDetails.dart';

class TopLeagues extends StatefulWidget {
  const TopLeagues({super.key});

  @override
  State<TopLeagues> createState() => _TopLeaguesState();
}

List leagues = [];

Future getLeagues() async {
  var response = await http.get(
    Uri.https("api.football-data.org", "/v4/competitions/"),
    headers: {'X-Auth-Token': 'a974575eb458469aaedfb22e103f1931'},
  );
  var jsonData = jsonDecode(response.body);
  leagues = [];
  for (var eachLeague in jsonData["competitions"]) {
    var league = Leagues(
        leagueName: eachLeague["name"],
        leagueCode: eachLeague["code"],
        leagueFlag: eachLeague["emblem"],
        countryFlag: eachLeague["area"]["flag"],
        country: eachLeague["area"]["name"]);

    leagues.add(league);
  }
}

class _TopLeaguesState extends State<TopLeagues> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "TOP COMPETITIONS",
          style: TextStyle(
              color: Color(0xFF5D5C64), fontFamily: "Mulish", fontSize: 15),
        ),
        Expanded(
          child: FutureBuilder(
            future: getLeagues(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: leagues.length,
                    itemBuilder: (context, int index) {
                      Widget loadImage(String url) {
                        if (url.endsWith('.svg')) {
                          return SvgPicture.network(url);
                        } else {
                          return Image.network(url);
                        }
                      }

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
                          leading: Container(
                            width: 40.0, // Set the desired width
                            child: loadImage(leagues[index].leagueFlag ??
                                leagues[index].countryFlag),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  leagues[index].country,
                                  style: TextStyle(
                                      color: Color(0xFF5D5C64), fontSize: 13),
                                ),
                                Text(
                                  leagues[index].leagueName,
                                  style: TextStyle(
                                      color: Color(0xFFB6B6B6), fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CompetitionDetails(
                                  leagueName: leagues[index].leagueName,
                                  leagueCode: leagues[index].leagueCode,
                                  country: leagues[index].country,
                                  leagueFlag: leagues[index].leagueFlag,
                                ),
                              ),
                            );
                            },
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator(color: Color(0xFF3A3A3A),));
              }
            },
          ),
        ),
      ],
    );
  }
}
