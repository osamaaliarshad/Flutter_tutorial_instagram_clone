import 'package:flutter/material.dart';
import 'package:flutter_instagram/screens/edit_profile/edit_profile_screen.dart';

class ProfileButton extends StatelessWidget {
  final bool isCurrentUser;
  final bool isFollowing;

  const ProfileButton({
    Key key,
    @required this.isCurrentUser,
    @required this.isFollowing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCurrentUser
        ? TextButton(
            onPressed: () => Navigator.of(context).pushNamed(
              EditProfileScreen.routeName,
              arguments: EditProfileScreenArgs(context: context),
            ),
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Edit Profile',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          )
        : TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: isFollowing
                  ? Colors.grey[300]
                  : Theme.of(context).primaryColor,
            ),
            child: Text(
              isFollowing ? 'Unfollow' : 'Follow',
              style: TextStyle(
                  fontSize: 16,
                  color: isFollowing ? Colors.black : Colors.white),
            ),
          );
  }
}
