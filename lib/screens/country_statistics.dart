import 'package:flutter/material.dart';

import '../models/country_summary.dart';

class CountryStatistics extends StatelessWidget {

  final List<CountrySummaryModel> summaryList;

  CountryStatistics({@required this.summaryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        buildCard(
          "CONFIRMED", 
          summaryList[summaryList.length - 1].confirmed,//summary.totalConfirmed,
          1,//summary.newConfirmed,
          Color(0xFFFF1242)
        ),

        buildCard(
          "ACTIVE", 
          summaryList[summaryList.length - 1].active,//summary.totalConfirmed - summary.totalRecovered - summary.totalDeaths,
          1,//summary.newConfirmed - summary.newRecovered - summary.newDeaths,
          Color(0xFF017BFF)
        ),

        buildCard(
          "RECOVERED", 
          summaryList[summaryList.length - 1].recovered,//summary.totalRecovered,
          1,//summary.newRecovered,
          Color(0xFF29A746)
        ),

        buildCard(
          "DEATH", 
          summaryList[summaryList.length - 1].deaths,//summary.totalDeaths,
          1,//summary.newDeaths,
          Color(0xFF6D757D)
        ),

      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color){

    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]}.';

    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[

            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "Total",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      totalCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),

                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    Text(
                      "Today",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      todayCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),

                  ],
                ),

                
              ],
            ),
          ],
        ),
      ),
    );
  }
}