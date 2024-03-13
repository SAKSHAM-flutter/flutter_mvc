import 'package:flutter/material.dart';
import 'package:mvc_flutter/ui/screens/home/home_viewmodel.dart';
import 'package:mvc_flutter/ui/screens/home/widgets/counter_bottom.dart';
import 'package:mvc_flutter/ui/screens/home/widgets/counter_view.dart';
import 'package:mvc_flutter/ui/screens/home/widgets/product_view.dart';
import 'package:mvc_flutter/ui/utils/base_class/base_screen.dart';
import 'package:mvc_flutter/ui/utils/widgets/common_app_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget with AppBarMixin {
  static const String route = "/HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, bool>(
      selector: (ctx, provider) => provider.apiView,
      builder: (context, apiView, child) {
        return ScreenBaseScaffold<HomeViewModel>(
          appBar: appBar(
            context,
            title: "Counter Example",
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Switch(
                  value: apiView,
                  onChanged: (value) {
                    context.model<HomeViewModel>().apiView = value;
                  },
                ),
              )
            ],
          ),
          navigation: apiView ? null : const CounterBottom(),
          child: SizedBox(
            width: context.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                apiView ? const ProductView() : const CounterView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
