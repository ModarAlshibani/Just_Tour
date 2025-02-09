 import 'dart:convert';

class TeamModel {
  int? team_id;
  String? TeamName;
  String? ProfilePhoto;
  String? Description;
  String? Email;
  int? Rate;
  String? ContactInfo;


  TeamModel(
      {this.team_id,
      this.TeamName,
      this.ProfilePhoto,
      this.Description,
      this.Email,
      this.Rate,
      this.ContactInfo
      });

  Map<String, dynamic> toJson() => {
        'team_id': team_id,
        'Description': Description,
        'Email': Email,
        'ProfilePhoto': ProfilePhoto,
        'ContactInfo': ContactInfo,
        'TeamName': TeamName,
        'Rate': Rate
      };

  TeamModel.fromJson(Map<String, dynamic> json)
      : team_id = json['team_id'],
        TeamName = json['TeamName'],
        ProfilePhoto = json['ProfilePhoto'],
        Description = json['Description'],
        Email = json['Email'],
        Rate = json['Rate'],
        ContactInfo = json['ContactInfo'];
}

List<TeamModel> TeamsListFromJson(String str) {
  final jsonResponse = jsonDecode(str);
  final List<dynamic> dataList = jsonResponse['data'];
  return dataList.map((item) => TeamModel.fromJson(item)).toList();
}
