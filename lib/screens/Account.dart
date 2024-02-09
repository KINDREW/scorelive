import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

bool _switchNotifications = true;
bool _switchTheme = true;

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "My Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: "Mulish"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFB6B6B6),
                          radius: 28,
                          child: Icon(Icons.person_4_outlined,
                              size: 30, color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "John Doe",
                          style: TextStyle(
                              color: Color(0xFFB6B6B6),
                              fontSize: 18,
                              fontFamily: "Mulish"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Favorites",
                    style: TextStyle(
                        color: Color(0xFFB6B6B6),
                        fontSize: 16,
                        fontFamily: "Mulish"),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Competitions",
                                style: TextStyle(
                                    color: Color(0xFF5D5C64),
                                    fontSize: 15,
                                    fontFamily: "Mulish"),
                              ),
                              Text(
                                "-",
                                style: TextStyle(
                                    color: Color(0xFFDADADA),
                                    fontSize: 15,
                                    fontFamily: "Mulish"),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("Competitions",
                                  style: TextStyle(
                                      color: Color(0xFF5D5C64),
                                      fontSize: 15,
                                      fontFamily: "Mulish")),
                              Text("-",
                                  style: TextStyle(
                                      color: Color(0xFFDADADA),
                                      fontSize: 15,
                                      fontFamily: "Mulish"))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("Players",
                                  style: TextStyle(
                                      color: Color(0xFF5D5C64),
                                      fontSize: 15,
                                      fontFamily: "Mulish")),
                              Text("-",
                                  style: TextStyle(
                                      color: Color(0xFFDADADA),
                                      fontSize: 15,
                                      fontFamily: "Mulish"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  backgroundColor: Color(0xFF1E1E1E),
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.zero,
                  ),
                  title: Text(
                    "General",
                    style: TextStyle(
                        color: Color(0xFFB6B6B6),
                        fontSize: 18,
                        fontFamily: "Mulish"),
                  ),
                  iconColor: Color(0xFFB6B6B6),
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: Color(0xFF3A3A3A),
                              width: 2 // Border// color
                              ),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("App Notifications",
                                style: TextStyle(
                                    color: Color(0xFFB6B6B6),
                                    fontSize: 16,
                                    fontFamily: "Mulish")),
                            CupertinoSwitch(
                              value: _switchNotifications,
                              onChanged: (bool value) {
                                setState(() {
                                  _switchNotifications = value;
                                });
                              },
                              activeColor: Color(0xFFF63D68),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: Color(0xFF3A3A3A),
                              width: 2 // Border// color
                              ),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Dark Theme",
                                style: TextStyle(
                                    color: Color(0xFFB6B6B6),
                                    fontSize: 16,
                                    fontFamily: "Mulish")),
                            CupertinoSwitch(
                              value: _switchTheme,
                              onChanged: (bool value) {
                                setState(() {
                                  _switchTheme = value;
                                });
                              },
                              activeColor: Color(0xFFF63D68),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: Color(0xFF3A3A3A),
                              width: 2 // Border// color
                              ),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Filter Matches By",
                                style: TextStyle(
                                    color: Color(0xFFB6B6B6),
                                    fontSize: 16,
                                    fontFamily: "Mulish")),
                            Row(
                              children: [
                                Text(
                                  "League",
                                  style: TextStyle(
                                      color: Color(0xFFB6B6B6), fontSize: 14),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFFB6B6B6),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Language",
                              style: TextStyle(
                                  color: Color(0xFFB6B6B6),
                                  fontSize: 16,
                                  fontFamily: "Mulish")),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      child: Container(
                                        color: Color(0xFF1E1E1E),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Text(
                                                    "English",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFB6B6B6),
                                                        fontSize: 15),
                                                  )),
                                            ),
                                            Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black)),
                                                child: Text("French",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFB6B6B6),
                                                        fontSize: 15))),
                                            Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black)),
                                                child: Text("Twi",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFB6B6B6),
                                                        fontSize: 15))),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Row(
                              children: [
                                Text(
                                  "English",
                                  style: TextStyle(
                                      color: Color(0xFFB6B6B6), fontSize: 14),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFFB6B6B6),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.zero,
                  ),
                    title: Text("Others",    style: TextStyle(
                        color: Color(0xFFB6B6B6),
                        fontSize: 18,
                        fontFamily: "Mulish"),
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton( onPressed: (){}, child: Text("Log Out", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Mulish"),),style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB42318), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Border radius
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
