import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:terez/APIs.dart';






class FollowButton extends StatefulWidget {
  final int targetUserId;

  const FollowButton({Key? key, required this.targetUserId}) : super(key: key);

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
   // _loadFollowStatus();
  }

  // Future<void> _loadFollowStatus() async {
  //   try {
  //     isFollowing = await FollowController().getFollowStatus(widget.targetUserId);
  //     setState(() {});
  //   } catch (e) {
  //     // Handle error
  //   }
  // }

  // Future<void> toggleFollow() async {
  //   if (isFollowing) {
  //     await FollowController().unfollowUser(widget.targetUserId);
  //   } else {
  //     await FollowController().followUser(widget.targetUserId);
  //   }
  //   _loadFollowStatus(); // Refresh the follow status after toggling
  // }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      child: Text(isFollowing ? 'Unfollow' : 'Follow'),
    );
  }
}
