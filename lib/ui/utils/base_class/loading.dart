import 'package:flutter/cupertino.dart';
import 'package:mvc_flutter/ui/themes/colors.dart';
import 'package:mvc_flutter/ui/utils/base_class/view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.loadingIndicator,
        borderRadius: BorderRadius.circular(8),
      ), // Dialog background
      child: const CupertinoActivityIndicator(
        color: AppColors.loadingBG,
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

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
);

class ShimmerIndicator extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Duration duration;

  const ShimmerIndicator(
      {super.key,
      required this.isLoading,
      required this.child,
      this.duration = const Duration(milliseconds: 400)});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }

    return Shimmer(
      gradient: shimmerGradient,
      enabled: isLoading,
      period: duration,
      child: child,
    );
  }
}
