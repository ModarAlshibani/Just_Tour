// ignore: constant_identifier_names
// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

class TripModel {
  int? id;
  String? team_id;
  String? TeamName;
  String? Title;
  DateTime? StartDate;
  DateTime? EndDate;
  DateTime? StartBooking;
  DateTime? EndBooking;
  String? Location;
  String? Type;
  String? Level;
  int? SubLimit;
  int? Cost;
  String? Description;
  String? Retrieve;
  String? Requirements;
  int? Rate;
  String? TripPhoto;
  DateTime? RetrieveEndDate;
  int? Percent;

  TripModel({
    this.id,
    this.team_id,
    this.TeamName,
    this.Title,
    this.StartDate,
    this.EndDate,
    this.StartBooking,
    this.EndBooking,
    this.Location,
    this.Type,
    this.Level,
    this.SubLimit,
    this.Cost,
    this.Description,
    this.Retrieve,
    this.Requirements,
    this.Rate,
    this.TripPhoto,
    this.RetrieveEndDate,
    this.Percent,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'team_id': team_id,
        'TeamName': TeamName,
        'Title': Title,
        'StartDate': StartDate?.toIso8601String(),
        'EndDate': EndDate?.toIso8601String(),
        'StartBooking': StartBooking?.toIso8601String(),
        'EndBooking': EndBooking?.toIso8601String(),
        'Location': Location,
        'Type': Type,
        'Level': Level,
        'SubLimit': SubLimit,
        'Cost': Cost,
        'Description': Description,
        'Retrieve': Retrieve,
        'Requirements': Requirements,
        'Rate': Rate,
        'TripPhoto': TripPhoto,
        'RetrieveEndDate': RetrieveEndDate?.toIso8601String(),
        'Percent': Percent,
      };

  TripModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        team_id = json['team_id'],
        TeamName = json['TeamName'],
        Title = json['Title'],
        StartDate = DateTime.parse(json['StartDate']),
        EndDate = DateTime.parse(json['EndDate']),
        StartBooking = DateTime.parse(json['StartBooking']),
        EndBooking = DateTime.parse(json['EndBooking']),
        Location = json['Location'],
        Type = json['Type'],
        Level = json['Level'],
        SubLimit = json['SubLimit'],
        Cost = json['Cost'],
        Description = json['Description'],
        Retrieve = json['Retrieve'],
        Requirements = json['Requirements'],
        Rate = json['Rate'],
        TripPhoto = json['TripPhoto'],
        RetrieveEndDate = DateTime.parse(json['RetrieveEndDate']),
        Percent = json['Percent'];
}

List<TripModel> TripListFromJson(String str) {
  final jsonResponse = jsonDecode(str);
  final List<dynamic> dataList = jsonResponse['data'];
  return dataList.map((item) => TripModel.fromJson(item)).toList();
}
