class CityParamsModel {
  CityParamsModel({required this.searchText, required this.format});
  final String searchText;
  final String format;

Map<String,dynamic> toJson()=>{'q':searchText, 'format':format};
}