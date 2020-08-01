import 'package:flutter/material.dart';
import 'package:covid_19_live_tracker/utils/constants.dart';
import 'package:covid_19_live_tracker/ui/navigation_option.dart';
import 'package:covid_19_live_tracker/ui/worldwide.dart';
import 'package:covid_19_live_tracker/ui/country.dart';

enum NavigationStatus {
  WORLDWIDE,
  COUNTRY,
}

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.WORLDWIDE;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "COVID-19 Tracker Live Data"
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Container(
            height: size.height * 0.9,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              )
            ),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              child: navigationStatus == NavigationStatus.WORLDWIDE ? Worldwide() : Country(),
            ),
          ),

          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                NavigationOption(
                  title: "Worldwide",
                  selected: navigationStatus == NavigationStatus.WORLDWIDE,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.WORLDWIDE;

                    });
                  },
                ),

                NavigationOption(
                  title: "Country",
                  selected: navigationStatus == NavigationStatus.COUNTRY,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.COUNTRY;
                    });
                  },
                )

              ],
            ),
          ),
          
        ],
      ),
    );
  }
}