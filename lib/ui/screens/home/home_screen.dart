import 'package:flutter/material.dart';
import 'package:interview_task/ui/screens/home/home_viewmodel.dart';
import 'package:interview_task/ui/utils/base_class/base_screen.dart';
import 'package:interview_task/ui/utils/base_class/view_model.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "homeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    withViewModel<HomeViewModel>(context, (viewModel) {
      viewModel.getPrices();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ScreenBase<HomeViewModel>(
      child: Scaffold(),
    );
  }
}
