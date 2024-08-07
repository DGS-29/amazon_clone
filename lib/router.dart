import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/admin/screens/add_product.dart';
import 'package:amazon_clone/features/admin/screens/edit_products.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/cart/screens/cart_screen.dart';
import 'package:amazon_clone/features/home/screens/category_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName: //routeName
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case HomeScreen.routeName: //routeName
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
    case BottomBar.routeName: //routeName
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BottomBar());
    case AddProductScreen.routeName: //routeName
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProductScreen());
    
    case CategoryScreen.routeName: 
    var category= routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => CategoryScreen(
            category: category,
          )
      );

    case SearchScreen.routeName: 
    var searchQuery= routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SearchScreen(
            searchQuery: searchQuery,
          )
      );
      
    case ProductDetailsScreen.routeName: 
    var product= routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => ProductDetailsScreen(
            product: product,
          )
      );
      
    case OrderDetailsScreen.routeName:
    var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=> OrderDetailsScreen(
          order: order
        )
      );

    case AddressScreen.routeName: 
    var totalAmount= routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AddressScreen(
            totalAmount: totalAmount,
          )
      );
      
    case CartScreen.routeName: 
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const CartScreen()
      );
      
    case EditProductScreen.routeName:
    var product= routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => EditProductScreen(
            product: product,
          ));

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(child: Text("Screen does not exist")),
              ));
  }
}