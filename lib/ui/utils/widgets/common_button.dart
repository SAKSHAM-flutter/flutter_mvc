import 'package:flutter/material.dart';
import 'package:mvc_flutter/ui/themes/typography.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CommonButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap.call(),
      child: Text(
        title,
        style: Poppins.regular().s14,
      ),
    );
  }
}
