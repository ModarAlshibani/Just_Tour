class User {
  String? id;
  String? FirstName;
  String? LastName;
  String? Number;
  String? Email;
  String? Password;
  String? Wallet;
  int? Age;
  String? Token;
  DateTime? createdAt; // New field for created_at
  DateTime? updatedAt; // New field for updated_at

  User(
      {this.id,
      this.FirstName,
      this.LastName,
      this.Number,
      this.Email,
      this.Password,
      this.Wallet,
      this.Age,
      this.Token,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    FirstName = json['FirstName'];
    LastName = json['LastName'];
    Number = json['Number'];
    Email = json['Email'];
    Password = json['Password'];
    Wallet = json['Wallet'];
    Age = json['Age'];
    Token = json['Token'];
    // Assuming the dates are in ISO format, convert them to DateTime objects
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['FirstName'] = this.FirstName;
    data['LastName'] = this.LastName;
    data['Number'] = this.Number;
    data['Email'] = this.Email;
    data['Password'] = this.Password;
    data['Wallet'] = this.Wallet;
    data['Age'] = this.Age;
    data['Token'] = this.Token;
    data['createdAt'] = this.createdAt?.toIso8601String();
    data['updatedAt'] = this.updatedAt?.toIso8601String();
    return data;
  }
}
