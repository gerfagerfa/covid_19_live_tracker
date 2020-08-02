import 'package:flutter/material.dart';

import '../models/summary.dart';

class Statistics extends StatelessWidget {

  final Summary summary;

  Statistics({@required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        buildCard(
          "CONFIRMED", 
          summary.totalConfirmed,
          summary.newConfirmed,
          Color(0xFFFF1242)
        ),

        buildCard(
          "ACTIVE", 
          summary.totalConfirmed - summary.totalRecovered - summary.totalDeaths,
          summary.newConfirmed - summary.newRecovered - summary.newDeaths,
          Color(0xFF017BFF)
        ),

        buildCard(
          "RECOVERED", 
          summary.totalRecovered,
          summary.newRecovered,
          Color(0xFF29A746)
        ),

        buildCard(
          "DEATH", 
          summary.totalDeaths,
          summary.newDeaths,
          Color(0xFF6D757D)
        ),

        /*Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            "Statistics updated at" + summary.date.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),*/

      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color){
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
                      totalCount.toString(),
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
                      todayCount.toString(),
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