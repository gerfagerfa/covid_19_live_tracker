class GlobalSummaryModel{
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final DateTime date;

  GlobalSummaryModel(this.newConfirmed, this.totalConfirmed, this.newDeaths, this.totalDeaths, this.newRecovered, this.totalRecovered, this.date);

  factory GlobalSummaryModel.fromJson(Map<String, dynamic> json){
    return GlobalSummaryModel(
      json["Global"]["NewConfirmed"],
      json["Global"]["TotalConfirmed"],
      json["Global"]["NewDeaths"],
      json["Global"]["TotalDeaths"],
      json["Global"]["NewRecovered"],
      json["Global"]["TotalRecovered"],
      DateTime.parse(json["Date"]),
    );
  }
}