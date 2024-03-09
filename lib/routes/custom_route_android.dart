import 'package:flutter/material.dart';
import 'package:shop_flutter_app/routes/routes.dart';

class CustomPageTransitionsBuilderAndroid extends PageTransitionsBuilder {
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

    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end);
    final offsetAnimation = animation.drive(tween);

    // add fade transition for any child
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
