class CityModel {
  CityModel({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmid,
    required this.lat,
    required this.lon,
    required this.type,
    required this.placeRank,
    required this.importance,
    required this.addresstype,
    required this.name,
    required this.displayName,
  });

  final placeId;
  final String licence;
  final String osmType;
  final int osmid;
  final String lat;
  final String lon;
  final String type;
  final int placeRank;
  final double importance;
  final String addresstype;
  final String name;
  final String displayName;

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      placeId: json['place_id'],
      licence: json['licence'],
      osmType: json['osm_type'],
      osmid: json['osm_id'],
      lat: json['lat'],
      lon: json['lon'],
      type: json['type'],
      placeRank: json['place_rank'],
      importance: json['importance'],
      addresstype: json['addresstype'],
      name: json['name'],
      displayName: json['display_name']??'',
    );
  }
}
