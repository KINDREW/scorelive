import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scorelive/models/Regions.dart';

class Region extends StatefulWidget {
  const Region({super.key});

  @override
  State<Region> createState() => _RegionState();
}

class _RegionState extends State<Region> {

  List areas = [];

  Future getRegions() async {
    var response = await http.get(
      Uri.https("api.football-data.org", "/v4/areas/"),
      headers: {'X-Auth-Token': 'a974575eb458469aaedfb22e103f1931'},
    );
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    areas = [];
    for (var eachArea in jsonData["areas"]) {
      var area = Area(areaName: eachArea["name"], areaCountry: eachArea["parentArea"], countryFlag: eachArea["flag"],areaId:eachArea["id"]);

      areas.add(area);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "COUNTRIES",
          style: TextStyle(
              color: Color(0xFF5D5C64),
              fontFamily: "Mulish",
              fontSize: 15),
        ),
        Expanded(
          child: FutureBuilder(
            future: getRegions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: areas.length,
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
                                color: Color(0xFF3A3A3A), width: 2 // Border// color
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
                                  areas[index].areaCountry,
                                  style: TextStyle(
                                      color: Color(0xFF5D5C64), fontSize: 13),
                                ),
                                Text(
                                  areas[index].areaName,
                                  style: TextStyle(
                                      color: Color(0xFFB6B6B6), fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "",
                                arguments: areas[index].areaId);
                          },
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator(color:Color(0xFF3A3A3A) ,));
              }
            },
          ),
        ),
      ],
    );
  }
}
