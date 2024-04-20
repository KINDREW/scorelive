import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scorelive/screens/Fixtures.dart';
import 'package:scorelive/screens/Results.dart';
import 'package:scorelive/screens/Standings.dart';
import 'package:scorelive/screens/Stats.dart';

class CompetitionDetails extends StatefulWidget {
  String leagueName;
  String leagueCode;
  String country;
  String leagueFlag;

  CompetitionDetails(
      {required this.leagueName,
      required this.leagueCode,
      required this.country,
      required this.leagueFlag});
  @override
  State<CompetitionDetails> createState() => _CompetitionDetailsState();
}


int currentTab = 0;




class _CompetitionDetailsState extends State<CompetitionDetails> {
  @override
  Widget build(BuildContext context) {
    String code = widget.leagueCode;
    List screens = [
      Results(leagueCode:code),
      Fixtures(),
      Standings(leagueCode: code),
      Stats(leagueCode: code,)
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.white,
                    )),
                Text("Competition",
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Mulish", fontSize: 18)),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_rounded,
                          color: Colors.white,
                        ))
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  widget.leagueFlag,
                  // You can specify width and height constraints if needed
                  width: 50,
                  height: 50,
                  // You can also add other properties like fit, alignment, etc.
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.country,
                    style: TextStyle(
                        color: Color(0xFFB6B6B6),
                        fontFamily: "Mulish",
                        fontSize: 14)),
                Text(
                  widget.leagueName,
                  style: TextStyle(
                      color: Color(0xFFB6B6B6),
                      fontFamily: "Mulish",
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentTab = 0;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: currentTab == 0
                                          ? Color(0xFFF63D68)
                                          : Colors.black,
                                      width: 2 // Border// color
                                      ),
                                ),
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Results",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Mulish",
                                        color: currentTab == 0
                                            ? Colors.white
                                            : Color(0xFF5D5C64))),
                              ))))),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentTab = 1;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: currentTab == 1
                                          ? Color(0xFFF63D68)
                                          : Colors.black,
                                      width: 2 // Border// color
                                      ),
                                ),
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Fixtures",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Mulish",
                                        color: currentTab == 1
                                            ? Colors.white
                                            : Color(0xFF5D5C64))),
                              ))))),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentTab = 2;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: currentTab == 2
                                          ? Color(0xFFF63D68)
                                          : Colors.black,
                                      width: 2 // Border// color
                                      ),
                                ),
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Standings",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Mulish",
                                        color: currentTab == 2
                                            ? Colors.white
                                            : Color(0xFF5D5C64))),
                              ))))),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentTab = 3;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: currentTab == 3
                                          ? Color(0xFFF63D68)
                                          : Colors.black,
                                      width: 2 // Border// color
                                      ),
                                ),
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Stats",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Mulish",
                                        color: currentTab == 3
                                            ? Colors.white
                                            : Color(0xFF5D5C64))),
                              )))))
                ],
              ),
            ),
            Expanded(child: screens[currentTab])

            ],
        )),
      ),
    );
  }
}
