// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:persist_theme/persist_theme.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final resetPasswordController = TextEditingController();
  final resetPasswordConfirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late FocusNode userNameFocusNode;
  late FocusNode passwordFocusNode;

  late FocusNode resetPasswordNode;
  late FocusNode resetPasswordConfirmNode;

  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    userNameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        key: const Key('login_screen_widget'),
        child: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // ignore: prefer_const_constructors
                  child: Text('Login',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange)),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 15),
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: const Divider(thickness: 2),
                            ),
                            const Text('OR',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange)),
                            Container(
                                padding: const EdgeInsets.only(right: 15),
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: const Divider(thickness: 2)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _formWidget(),
                      ],
                    ))
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            _authenticate();
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          color: Colors.deepOrange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text('Login',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange))
            ],
          ),
        ),
      ),
    );
  }

  Widget _formWidget() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: _basicLogin())
          ],
        ));
  }

  Widget _basicLogin() {
    ThemeModel themeModel = Provider.of<ThemeModel>(context, listen: false);
    return Column(
      children: [
        _usernameField(),
        const SizedBox(
          height: 20,
        ),
        _passwordField(),
      ],
    );
  }

  Widget _usernameField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: usernameController,
        focusNode: userNameFocusNode,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (username) {
          if (_formKey.currentState!.validate()) {
            userNameFocusNode.unfocus();
            FocusScope.of(context).requestFocus(passwordFocusNode);
          }
        },
        decoration: const InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          hintText: 'Login',
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
          ),
        ),
        //validator: UserNameFieldValidator.validate,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          textAlign: TextAlign.start,
          controller: passwordController,
          focusNode: passwordFocusNode,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (term) {
            if (_formKey.currentState!.validate()) {
              _authenticate();
            }
          },
          obscureText: obscureText,
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.grey),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.red),
            ),
            // suffixIcon: InkWell(
            //   onTap: () {},
            //   child: Icon(Icons.remove_red_eye, color: Colors.black),
            // )
          ),
          //validator: PasswordFieldValidator.validate,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: Colors.grey),
        ));
  }

  _authenticate() async {}
}
