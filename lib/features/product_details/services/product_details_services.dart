import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailsServices{
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating
  }) async {
    final token = Provider.of<UserProvider>(context, listen: false).user.token;

    try {
      http.Response res= await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
        body:jsonEncode({
          'productId':product.id!,
          'rating': rating
        })
      );

      httpErrorHandler(
        response: res, 
        context: context, 
        onSuccess: (){}
      );
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  void addToCart({
    required BuildContext context,
    required Product product
  }) async {
    User user= Provider.of<UserProvider>(context, listen: false).user;

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': user.token
        },
        body:jsonEncode({
          'id':product.id!
        })
      );

      httpErrorHandler(
        response: res, 
        context: context, 
        onSuccess: (){
          user= user.copyWith(
            cart: jsonDecode(res.body)['cart']
          );
          Provider.of<UserProvider>(context, listen: false).setUserFromModel(user);
        });
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }
}