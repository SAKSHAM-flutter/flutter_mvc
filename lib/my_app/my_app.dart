import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_flutter/data/utils/connectivity_status.dart';
import 'package:mvc_flutter/my_app/route_helper.dart';
import 'package:mvc_flutter/my_app/splash.dart';
import 'package:mvc_flutter/ui/themes/theme.dart';
import 'package:mvc_flutter/ui/utils/base_class/view_model.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getViewModel<ThemeNotifier>(context, (viewModel) {
      viewModel.getTheme();
    });
    super.initState();
  }

  @override
  void dispose() {
    NetworkConnection.streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Selector<ThemeNotifier, ThemeMode>(
          selector: (ctx, provider) => provider.themeMode,
          builder: (ctx, themeMode, child) => MaterialApp(
            title: "MVC-Flutter",
            navigatorKey: navigatorKey,
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,
            themeMode: themeMode,
            initialRoute: SplashScreen.route,
            debugShowCheckedModeBanner: false,
            routes: RouteHelper.createRoutes(),
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            scrollBehavior: const ScrollBehaviorModified(),
            builder: (context, widget) {
              return MediaQuery.withNoTextScaling(
                child: Overlay(
                  initialEntries: [OverlayEntry(builder: (ctx) => widget!)],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
