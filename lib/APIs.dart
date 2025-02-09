class API {
  static const String server = "http://192.168.1.105:8000/api";

  //===================Auth=====================//
  static const String signup = "$server/userRegister";
  static const String login = "$server/login";

  //==========Team: Add Trip ===================//
  static const String addTrip = "$server/team/addTrip";

  //=========User profile and Edit=========================//
  static const String userProfile = "$server/user/profile";
   static const String editUserProfile = "$server/user/editProfile";

  //=========Show Trips=========================//
  static const String userShowAllTrips = "$server/showTrips/all";
  static const String teamShowAllTrips = "$server/team/showTrips";
  static const String userGetTrip = "$server/user/getTrip/";
  static const String teamGetTrip = "$server/team/getTrip/";
  static const String showTrips = "$server/showTrips/";
  static const String teamsMyTrips = "$server/team/myTrips";

   //=========Edit team profile=========================//
   static const String editTeamProfile = "$server/team/editProfile/";
   static const String profile = "$server/team/profile";

   //======== Show teams ===============//
  static const String showTeamsUser = "$server/user/showTeams";
  static const String userGetTeam = "$server/user/getTeam/";

   //======== Show Sites =========//
   static const String showSitesUser = "$server/user/all";
   static const String userGetSite = "$server/user/getSite/";

   static const String showSitesTeam = "$server/team/all";
   static const String teamGetSite = "$server/team/getSite/";

   //========= Follow =========================//
  static const String follow = "$server/user/follow/";

  //======== Trip Reservation =========//
  static const String reserveTrip = "$server/user/reserveTrip";
  static const String cancelReservation = "$server/user/cancelReservationInfo";
  static const String confirmCancelReservation = "$server/user/confirmCancelReservationInfo";
}