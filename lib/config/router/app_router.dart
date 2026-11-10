import 'package:flutter/material.dart';
import 'package:hollycoffee/src/features/category/models/order_model.dart';
import 'package:hollycoffee/src/features/category/screens/cartscreen.dart';
import 'package:hollycoffee/src/features/category/screens/checkout_page.dart';
import 'package:hollycoffee/src/features/category/screens/delivery_orderscreen.dart';
import 'package:hollycoffee/src/features/category/screens/order_detailscreen.dart';
import 'package:hollycoffee/src/features/home/models/product_model.dart';
import 'package:hollycoffee/src/features/profile/screens/edit_profilescreen.dart';
import 'package:hollycoffee/src/features/home/screens/home_routes.dart';
import 'package:hollycoffee/src/features/home/screens/menuscreen.dart';
import 'package:hollycoffee/src/features/home/screens/product_detailscreen.dart';
import 'package:hollycoffee/src/features/profile/screens/to_reviewscreen.dart';
import 'package:hollycoffee/src/features/profile/screens/walletscreen.dart';

mixin AppRouter {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Homeroutes(),
        );
      case Menu.route:
        return MaterialPageRoute(settings: settings, builder: (_) => Menu());
      case Editprofile.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Editprofile(),
        );
      case Productdetail.route:
        final product = settings.arguments as Productmodel;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Productdetail(product: product),
        );
      case Wallet.route:
        return MaterialPageRoute(settings: settings, builder: (_) => Wallet());
      case Toreview.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Toreview(),
        );
      case Cart.route:
        return MaterialPageRoute(settings: settings, builder: (_) => Cart());
      case Checkoutpage.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Checkoutpage(),
        );
      case DeliveryOrderscreen.route:
        final type = settings.arguments as Ordertype;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DeliveryOrderscreen(type: type),
        );
        case OrderDetailscreen.route:
      final order = settings.arguments as OrderModel;
      return MaterialPageRoute(
        builder: (_) => OrderDetailscreen(order: order),
        settings: settings,
      );
      default:
        return null;
    }
  }
}
