import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/icons/google-icon.webp"),
        ),
        SizedBox(width: 5),
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/icons/facebook_icon.png"),
        ),
        SizedBox(width: 5),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          backgroundImage: AssetImage("assets/icons/linkdin.png"),
        ),
      ],
    );
  }
}
