import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter_app/routes/custom_route_android.dart';
import 'package:shop_flutter_app/routes/custom_route_ios.dart';
import 'package:shop_flutter_app/providers.dart';
import 'package:shop_flutter_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.getProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'shop app flutter',
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Lato',
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.iOS: CustomPageTransitionsBuilderIOS(),
              TargetPlatform.android: CustomPageTransitionsBuilderAndroid(),
            })),
        routes: Routes.getRoutes(),
      ),
    );
  }
}
