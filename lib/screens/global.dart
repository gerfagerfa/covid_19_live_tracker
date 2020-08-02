import 'package:flutter/material.dart';

import '../screens/statistics.dart';
import '../screens/loading.dart';
import '../services/covidService.dart';
import '../models/summary.dart';

CovidService covidService = CovidService();

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {

  Future<Summary> summary;

  @override
  void initState() {
    super.initState();
    summary = covidService.getSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Text(
                "Global Corona Virus Cases",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    summary = covidService.getSummary();
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),

        FutureBuilder(
          future: summary,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(child: Text("Error"),);
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: 
                return Loading();
              default:
                return !snapshot.hasData 
                  ? Center(child: Text("Empty"),)
                  : Statistics(
                    summary: snapshot.data,
                  );
            }
          },
        ),
        
      ],
    );
  }
}