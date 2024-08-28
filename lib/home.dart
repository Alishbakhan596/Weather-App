import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theme_provider.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Switch(
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  thumbColor: const MaterialStatePropertyAll(Colors.orange),
                  inactiveTrackColor: Colors.transparent,
                  thumbIcon: MaterialStatePropertyAll(themeProvider.isSelectd
                      ? Icon(Icons.nights_stay)
                      : Icon(Icons.sunny)),
                  value: themeProvider.isSelectd,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                );
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Paris",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Icon(
                        themeProvider.isSelectd
                            ? Icons.nights_stay
                            : Icons.sunny,
                        size: 250,
                        color: themeProvider.isSelectd
                            ? Colors.white
                            : Colors.orange);
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  "20° C",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "Good Morning",
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
                ),
                Text(
                  "NOIDA",
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 50),
                const SizedBox(
                  width: 50,
                  child: Divider(
                    thickness: 3,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.wb_twighlight),
                        Text("SUNRISE"),
                        Text("7:00")
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Column(
                      children: [Icon(Icons.air), Text("Wind"), Text("4m/s")],
                    ),
                    SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Column(
                      children: [
                        Icon(Icons.thermostat),
                        Text("Temperature"),
                        Text("23")
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
