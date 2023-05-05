// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/src/api/signin_api.dart';
import 'package:task/src/components/button_component.dart';
import 'package:task/src/components/input_component.dart';
import 'package:task/src/components/snackbar.dart';
import 'package:task/src/model/user_model.dart';
import 'package:task/src/pages/home/home.dart';
import 'package:task/src/utils/index.dart';
import 'package:task/src/validator/validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool auto = false;
  List<dynamic> usersList = [];
  final SigninAPI _signinAPI = SigninAPI();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onSubmit() async {
    setState(() {
      auto = true;
    });
    String email = emailController.value.text;
    String password = passwordController.value.text;
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });
        final response = await _signinAPI.signIn();
        if (response != null) {
          setState(() {
            auto = false;
            usersList = response;
          });
          final data = response.firstWhere(
            (user) => user['email'] == email && user['username'] == password,
            orElse: () => null,
          );
          if (data != null) {
            addDataToStorage('id', data['id'].toString());
            Provider.of<UserDetailModal>(context, listen: false)
                .setDetail(data);
            setState(() {
              _isLoading = false;
            });
            addDataToStorage('token', 'in');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          } else {
            setState(() {
              _isLoading = false;
            });
            snackBarComponent(
              context,
              message: 'No User Found',
              color: Colors.red,
            );
          }
        }
      } on HttpException catch (e) {
        debugPrint(e.message);
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        bottom: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 100, 0, 10),
                              child: Image.asset('assets/splash.PNG'),
                            ),
                          ),
                          Column(
                            children: [
                              InputComponent(
                                controller: passwordController,
                                placeHolder: "Username",
                                isAutoValidate: auto,
                                validator: (string) => stringValidator(string!),
                              ),
                              InputComponent(
                                controller: emailController,
                                placeHolder: "Email",
                                validator: (email) => emailValidator(email!),
                                isAutoValidate: auto,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppButtonComponent(
                            title: 'Login',
                            onPress: onSubmit,
                            isLoading: _isLoading,
                            marginBottom: 0,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
