import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/routes/route_generator.dart';
import 'package:task_management/common/routes/route_name.dart';
import 'package:task_management/common/styles/app_colors.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.bkDark,
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.onboarding,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
