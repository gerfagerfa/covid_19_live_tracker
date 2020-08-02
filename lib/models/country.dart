class CountryModel{
  final String country;
  final String slug;
  final String iso2;

  CountryModel(this.country, this.slug, this.iso2);

  factory CountryModel.fromJson(Map<String, dynamic> json){
    return CountryModel(
      json["Country"],
      json["Slug"],
      json["ISO2"],
    );
  }
}