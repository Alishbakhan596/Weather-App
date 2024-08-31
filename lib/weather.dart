import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/home.dart';
import 'package:weather_app/home_service.dart';

String city = "Lahore";
int font = 23;
//Color fontcolor = Colors.white;

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

List favourite = [];

TextEditingController citytxt = TextEditingController();

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getuser(city),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            } else {
              Icon weathericon = Icon(
                Icons.mode_night_outlined,
                color: Colors.white,
                size: MediaQuery.of(context).size.height * 0.15,
              );

              String a = snapshot.data[0].weather;

              if (a == 'Smoke') {
                // backgif = "assets/images/day.gif";
                weathericon = Icon(
                  Icons.mode_night_outlined,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.height * 0.15,
                );
              } else if (a == 'Clear') {
                // backgif = "assets/images/night.gif";
                weathericon = Icon(
                  Icons.mode_night_outlined,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.height * 0.15,
                );
              } else if (a == 'Clouds') {
                //backgif = "assets/images/dayg.gif";
                weathericon = Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.height * 0.15,
                );
              } else {
                // backgif = "assets/images/electric.gif";
                weathericon = Icon(
                  Icons.mode_night_outlined,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.height * 0.15,
                );
              }

              return Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: new BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      image: AssetImage("assets/images/night.jpg")),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Expanded(
                              child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Enter City Name",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                            onChanged: (value) {
                              city1 = value;
                              setState(() {});
                            },
                            onSubmitted: (value) {
                              city1 = value;
                              setState(() {
                                if (city1 != "") {
                                  city = city1;
                                }
                              });
                              txtcity.clear();
                            },
                            controller: txtcity,
                          )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (city1 != "") {
                                    city = city1;
                                  }
                                });
                                txtcity.clear();
                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (txtcity != "") {
                                  favourite.add(city1);
                                }
                              });
                              txtcity.clear();
                              print(favourite);
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.13,
                          bottom: MediaQuery.of(context).size.height * 0.01,
                        ),
                        child: weathericon,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "${snapshot.data[0].name}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${(snapshot.data[0].temp - 273).toStringAsFixed(0)}°",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${snapshot.data[0].weather}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${snapshot.data[0].pressure}",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Pressure",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${snapshot.data[0].humidity}",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Humidity",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${(snapshot.data[0].feels_like - 273).toStringAsFixed(0)}°",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Feels Like",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                        ),
                        alignment: Alignment.topLeft,
                        height: MediaQuery.of(context).size.height * 0.23,
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: favourite.length,
                            // itemCount: 39,
                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                  future: getuser(favourite[index]),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.data == null) {
                                      // return CircularProgressIndicator();
                                      return Container();
                                    } else {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04),
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                        decoration: BoxDecoration(
                                            color: Colors.black87,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ]),
                                        child: Column(
                                          children: [
                                            Text(
                                              "${snapshot.data[0].name}",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Icon(
                                              Icons.mode_night_rounded,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Text(
                                                "${(snapshot.data[0].temp - 273).toStringAsFixed(0)}°",
                                                style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.08,
                                                  color: Colors.white,
                                                )),
                                          ],
                                        ),
                                      );
                                    }
                                  });
                            }),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
