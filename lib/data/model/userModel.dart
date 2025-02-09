import 'dart:convert';

class User {
  int? id;
  String? FirstName;
  String? LastName;
  String? Number;
  String? Email;
  String? Password;
  int? Wallet;
  int? Age;
  String? Token;

  User({
    this.id,
    this.FirstName,
    this.LastName,
    this.Number,
    this.Email,
    this.Password,
    this.Wallet,
    this.Age,
    this.Token,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'FirstName': FirstName,
        'LastName': LastName,
        'Number': Number,
        'Email': Email,
        'Password': Password,
        'Wallet': Wallet,
        'Age': Age
      };

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    FirstName = json['FirstName'];
    LastName = json['LastName'];
    Number = json['Number'];
    Email = json['Email'];
    Password = json['Password'];
    Wallet = json['Wallet'];
    Age = json['Age'];
    Token = json['Token'];
    // Assuming the dates are in ISO format, convert them to DateTime objects
  }
}

List<User> UserListFromJson(String str) {
  final jsonResponse = jsonDecode(str);
  final List<dynamic> dataList = jsonResponse['data'];
  return dataList.map((item) => User.fromJson(item)).toList();
}

List<User> CountListFromJson(String str) {
  final jsonResponse = jsonDecode(str);
  print("here is the error");
  final List<dynamic> dataList = jsonResponse['data']['Countestants'];
  print("pppppppppppppppppppppppppppppppppppppppppppppp");
  return dataList.map((item) => User.fromJson(item)).toList();
}

List<User> FollowersListFromJson(String str) {
  final jsonResponse = jsonDecode(str);
  print("here is the error");
  final List<dynamic> dataList = jsonResponse['data'];
  print("ffffffffffffffffffffffffffffffffffffffffffffffffffff");
  return dataList.map((item) => User.fromJson(item)).toList();
}