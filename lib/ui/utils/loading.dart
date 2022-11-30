import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/ui/themes/colors.dart';
import 'package:interview_task/ui/utils/base_class/view_model.dart';
import 'package:provider/provider.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.greenDark,
        borderRadius: BorderRadius.circular(8),
      ), // Dialog background
      child: const CupertinoActivityIndicator(
        color: AppColors.yellow,
      ),
    );
  }
}

class LoadingIndicatorConsumer<V extends ViewModel> extends StatelessWidget {
  const LoadingIndicatorConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Selector<V, bool>(
        selector: (_, V state) => state.isLoading,
        builder: (_, bool isLoading, __) => isLoading
            ? const Center(child: LoadingIndicator())
            : const SizedBox.shrink(),
      ),
    );
  }
}