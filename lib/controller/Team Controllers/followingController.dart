import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:terez/APIs.dart';

class FollowController extends GetxController{ 
  
  static const String url = API.follow;

  // Fetch the current follow status for a given team ID
  Future<bool> fetchFollowStatus(int? team_id) async {
    late bool IsFollowed ;
    final response = await http.get(Uri.parse('$url/follow/status/$team_id'));

    if (response.statusCode == 200) {
      // Assuming the response contains the isFollowed status
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      IsFollowed = jsonResponse['isFollowed'];
      return IsFollowed;
    } else {
      throw Exception('Failed to fetch follow status');
    }
  }

  // Toggle the follow status for a given team ID
  Future<void> toggleFollowStatus(int teamId) async {
    final response = await http.post(
      Uri.parse('$url/follow/toggle/$teamId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to toggle follow status');
    }
  }
}




// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:terez/APIs.dart';
// import 'package:terez/controller/auth/Token.dart';

// class FollowController {
//   static const String apiUrl = API.follow;
  
//   Future<void> followUser(int userId) async {
//   try {   
//     final response = await http.post(Uri.parse('$apiUrl/api/follow-user'), body: {'target_user_id': '$userId'});
    
//     if (response.statusCode != 200) {
//       print("Response Status Code: ${response.statusCode}");
//       print("Response Body: ${response.body}");
//       throw Exception('Failed to follow user');
//     }
//   } catch (e) {
//     print("Exception: $e");
//     throw e; // Re-throw the exception if you want to handle it further up the call stack
//   }
// }

//   Future<void> unfollowUser(int userId) async {
//     final response = await http.delete(
//       Uri.parse('$apiUrl/unfollow/$userId'),
//       headers: {'Authorization': 'Bearer ${Get.find<GlobalStateController>().getToken()}'},
//     );

//     if (response.statusCode != 200) {
//       throw Exception('Failed to unfollow user');
//     }
//   }

//   Future<bool> getFollowStatus(int userId) async {
//     final response = await http.get(
//       Uri.parse('$apiUrl/follow-status/$userId'),
//       headers: {'Authorization': 'Bearer ${Get.find<GlobalStateController>().getToken()}'},
//     );

//     if (response.statusCode != 200) {
//       throw Exception('Failed to check follow status');
//     }

//     return json.decode(response.body)['isFollowing'];
//   }
// }
