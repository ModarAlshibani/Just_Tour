import 'dart:convert';

class PlaceModel {
  int? id;
  String? SiteName;
  String? Location;
  String? Details;
  int? Rate;

  PlaceModel(
      {this.id,
      this.SiteName,
      this.Location,
      this.Details,
      this.Rate,});

   Map<String, dynamic> toJson() => {
        'id': id,
        'SiteName': SiteName,
        'Location': Location,
        'Details': Details,
        'Rate': Rate,
      }; 

   PlaceModel.fromJson(Map<String, dynamic> json)
   : id = json['id'],
     SiteName = json['SiteName'],
     Location = json['Location'],
     Details = json['Details'],
     Rate = json['Rate'];     
}
List<PlaceModel> SitesListFromJson(String str) {
  final jsonResponse = jsonDecode(str);
  final List<dynamic> dataList = jsonResponse['data'];
  return dataList.map((item) => PlaceModel.fromJson(item)).toList();
}