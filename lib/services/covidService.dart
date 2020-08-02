import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/summary.dart';

class CovidService{

  Future<Summary> getSummary() async{
    final data = await http.Client().get("https://api.covid19api.com/summary");
    
    if(data.statusCode != 200)
      throw Exception();
      
    Summary summary = new Summary.fromJson(json.decode(data.body));
    
    return summary;
  }

}