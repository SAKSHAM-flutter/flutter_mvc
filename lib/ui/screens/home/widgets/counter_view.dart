import 'package:flutter/material.dart';
import 'package:mvc_flutter/ui/screens/home/home_viewmodel.dart';
import 'package:mvc_flutter/ui/themes/typography.dart';
import 'package:mvc_flutter/ui/utils/custom_extension.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, int>(
      selector: (ctx, provider) => provider.counter,
      builder: (ctx, counter, child) => Text(
        counter.string(),
        style: Poppins.semiBold().s30,
      ),
    );
  }
}
