import 'package:flutter/material.dart';
import 'package:shop_flutter_app/routes/routes.dart';

class CustomPageTransitionsBuilderIOS extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // without custom transition
    if (route.settings.name == Routes.productDetail) {
      return child;
    }

    // add fade transition for any child
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
