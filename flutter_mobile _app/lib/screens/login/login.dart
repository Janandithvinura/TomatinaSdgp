import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';

import 'LanguageScreen.dart';
import 'forgot.dart';

//code for designing the UI of our text field where the user writes his email id or password

const kTextFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ));

class SigninScreen extends StatefulWidget {
  static const routeName = '/signin-screen';

  SigninScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<SigninScreen> {
  late String email;
  late String password;
  bool passwordVisible = true;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/tomatina.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 35),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/logo3.png'),
                            fit: BoxFit.fill,
                          )),
                    ),
                    const Text(
                      'Tomatina',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    const Text(
                      '   By Kil-A-Bytes',
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Padding(padding: EdgeInsets.only(top: 50.0)),
                    ],
                  ),

                  // ignore: unnecessary_new
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 200, right: 40, left: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            email = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            hintText: 'Enter your email',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5)),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5)),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          obscureText: passwordVisible,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            password = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            hintText: 'Enter your password.',
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(
                                  () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5)),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5)),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        SizedBox(
                          height: 50,
                          child: RaisedButton(
                            elevation: 0,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            color: Colors.transparent.withOpacity(0.5),
                            // ignore: prefer_const_constructors
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                int num = email.length;
                              } catch (e) {
                                showSpinner = false;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please enter a Email')),
                                );
                                return;
                              }

                              try {
                                int num = password.length;
                              } catch (e) {
                                showSpinner = false;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please enter a password')),
                                );
                                return;
                              }

                              final bool emailValid = RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(email);
                              if (!emailValid) {
                                showSpinner = false;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Please enter a valid email')),
                                );
                                return;
                              }
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);
                                log('useruseruseruser: $user');

                                if (user != null) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context)
                                      .pushNamed(LanguageScreen.routeName);
                                }
                              } catch (error) {
                                log('userloginerror: $error');
                                final validErrorMessage =
                                    error.toString().split(']');

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(validErrorMessage[1])),
                                );
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            },
                            child: const Text(
                              'Sign in',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: const Text('Forgot Password?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              textAlign: TextAlign.center),
                          onTap: () {
                            Navigator.pushNamed(
                                context, ForgotScreen.routeName);
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 50,
                          ),
                          alignment: Alignment.bottomCenter,
                          child: FloatingActionButton(
                            heroTag: 'btn2',
                            onPressed: () => Navigator.of(context).pop(),
                            backgroundColor: Colors.red,
                            child: const Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
