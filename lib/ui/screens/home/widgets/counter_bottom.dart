import 'package:flutter/material.dart';
import 'package:mvc_flutter/ui/screens/home/home_viewmodel.dart';
import 'package:mvc_flutter/ui/themes/typography.dart';
import 'package:mvc_flutter/ui/utils/base_class/base_screen.dart';

class CounterBottom extends StatelessWidget {
  const CounterBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => context.model<HomeViewModel>().decrement(),
              child: Text("-", style: Poppins.medium().s18),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              onPressed: () => context.model<HomeViewModel>().increment(),
              child: Text("+", style: Poppins.medium().s18),
            ),
          )
        ],
      ),
    );
  }
}
