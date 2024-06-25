import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/constants/global_variables.dart';

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
      httpErorHandle(response: res, context: context, onSuccess: (){
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
}