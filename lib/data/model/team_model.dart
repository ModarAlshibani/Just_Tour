 import 'dart:convert';

class TeamModel {
  int? team_id;
  String? TeamName;
  String? ProfilePhoto;
  String? Description;
  String? Email;
  int? Rate;
  String? ContactInfo;
  int? Wallet;


  TeamModel(
      {this.team_id,
      this.TeamName,
      this.ProfilePhoto,
      this.Description,
      this.Email,
      this.Rate,
      this.ContactInfo,
      this.Wallet
      });

  Map<String, dynamic> toJson() => {
        'team_id': team_id,
        'Description': Description,
        'Email': Email,
        'ProfilePhoto': ProfilePhoto,
        'ContactInfo': ContactInfo,
        'TeamName': TeamName,
        'Rate': Rate,
        'Wallet': Wallet 
      };

  TeamModel.fromJson(Map<String, dynamic> json)
      : team_id = json['team_id'],
        TeamName = json['TeamName'],
        ProfilePhoto = json['ProfilePhoto'],
        Description = json['Description'],
        Email = json['Email'],
        Rate = json['Rate'],
        ContactInfo = json['ContactInfo'],
        Wallet = json['Wallet'];
}

List<TeamModel> TeamsListFromJson(String str) {
  final jsonResponse = jsonDecode(str);
  final List<dynamic> dataList = jsonResponse['data'];
  return dataList.map((item) => TeamModel.fromJson(item)).toList();
}
