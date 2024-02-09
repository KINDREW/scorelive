import 'package:flutter/material.dart';
import 'package:scorelive/screens/Favorites.dart';
import 'package:scorelive/screens/Region.dart';
import 'package:scorelive/screens/TopLeagues.dart';

class Competition extends StatefulWidget {
  const Competition({super.key});

  @override
  State<Competition> createState() => _CompetitionState();
}

int currentTab = 0;
List screens = [
  TopLeagues(),
  Region(),
  Favorites()
];
class _CompetitionState extends State<Competition> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Browse Competition",
                  style: TextStyle(
                      color: Colors.white, fontSize: 19, fontFamily: "Mulish"),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Color(0xFF3A3A3A),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFB6B6B6),
                      ),
                      hintStyle: TextStyle(
                          color: Color(0xFFB6B6B6),
                          fontFamily: "Mulish",
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                      hintText: "Search for competition, club...",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
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
                              child: Text(
                                "Top",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: currentTab == 0
                                        ? Colors.white
                                        : Color(0xFF5D5C64)),
                              ),
                            ))),
                      ),
                    ),
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
                                  child: Text("Region",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: currentTab == 1
                                            ? Colors.white
                                            : Color(0xFF5D5C64),
                                      )),
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
                                  child: Text("Favorites",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: currentTab == 2
                                              ? Colors.white
                                              : Color(0xFF5D5C64))),
                                )))))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: screens[currentTab],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
