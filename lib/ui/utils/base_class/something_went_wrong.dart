import 'package:flutter/material.dart';
import 'package:mvc_flutter/ui/themes/colors.dart';
import 'package:mvc_flutter/ui/themes/typography.dart';
import 'package:mvc_flutter/ui/utils/widgets/custom_image.dart';

class SomethingWrong extends StatelessWidget {
  static const String route = "/SomethingWrong";

  const SomethingWrong({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * 0.6;
    VoidCallback? onRefresh =
        ModalRoute.of(context)?.settings.arguments as VoidCallback?;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const CustomImage(
                source: 'assets/error_png/something_wrong.png',
                height: 150,
              ),
              const SizedBox(height: 30),
              Text(
                'Something went wrong',
                style: Poppins.medium(AppColors.redError).s18,
              ),
              const SizedBox(height: 5),
              Text(
                'Try refreshing the page, or try again later.',
                style: Poppins.regular(AppColors.redError).s12,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {
                  if (onRefresh != null) {
                    onRefresh.call();
                  } else {
                    Navigator.pop(context);
                  }
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.appColor),
                  fixedSize: MaterialStateProperty.all(
                    Size(width, 45),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  "Refresh Page",
                  style: Poppins.semiBold(Colors.white).s16,
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
