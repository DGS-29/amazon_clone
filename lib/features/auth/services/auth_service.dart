import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{

  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  })async{
    try{ 
      User user = User(
        id: '', 
        name: name,
        password: password, 
        address: '', 
        type: '', 
        token: '', email: email,
        );

      http.Response res = await http.post(Uri.parse('$uri/api/signup'), 
      body: user.toJson(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
       );
      // ignore: use_build_context_synchronously
      httpErrorHandle(response: res, context: context, onSuccess: (){
        showSnackBar(context, 'Accont created! Login with the same credentials!',
        );
      },
      );
    // ignore: empty_catches
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }
  //sign In user
   void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  })async{
    try{ 
      http.Response res = await http.post(Uri.parse('$uri/api/signin'), 
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
       );

      // ignore: avoid_print
      print(res.body);

      // ignore: use_build_context_synchronously
      httpErrorHandle(response: res, context: context, onSuccess: () async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // ignore: use_build_context_synchronously
        Provider.of<UserProvider>(context, listen: false).setUser(res.body);
        await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(context, HomeScreen.routeName as Route<Object?>, (route) => false,);
      },
      );
    // ignore: empty_catches
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }
}