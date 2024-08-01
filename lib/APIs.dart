class API {
  static const String server = "http://10.0.2.2:8000/api";

  //===================Auth=====================//
  static const String signup = "$server/userRegister";
  static const String login = "$server/login";

  //==========Team: Add Trip ===================//
  static const String addTrip = "$server/addTrip";

  //=========Show Trips=========================//
  static const String userShowAllTrips = "$server/user/showTrips";
  static const String teamShowAllTrips = "$server/team/showTrips";
  static const String getTrip = "$server/getTrip";
}
