// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
import 'package:tomatina/helpers/multilanguages.dart';
import 'package:tomatina/screens/login/welcomeScreen.dart';
import 'package:tomatina/screens/outputs/notFound.dart';
import 'package:tomatina/screens/tutorials/tutorial.dart';
import 'package:tflite/tflite.dart';
import '../diseases/earlyBlight.dart';
import '../diseases/lateblight.dart';
import '../diseases/list.dart';
import '../diseases/septorialLeafSpot.dart';
import '../diseases/targetspot.dart';
import '../diseases/yellowleaf.dart';
import '../login/LanguageScreen.dart';
import '../outputs/healthy.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/frontPage';

  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void onInit() {
  //   initTensorFlow();
  // }
  var nextScreen;
  @override
  void initState() {
    super.initState();
    initTensorFlow();
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  // @override
  // Future<void> onDispose() async {
  //   await Tflite.close();
  // }

  Future<void> initTensorFlow() async {
    // String? res = await Tflite.loadModel(
    //     model: "assets/mobilenet_v1_1.0_224_quant.tflite",
    //     labels: "assets/labels_mobilenet_quant_v1_224.txt");

    await Tflite.loadModel(
        model: "assets/model/model.tflite",
        labels: "assets/model/label.txt",
        isAsset: true,
        numThreads: 1,
        useGpuDelegate: false);
  }

  Future<void> objectRecognition(File filePath) async {
    log('file path: $filePath.path');

    var recognitions = await Tflite.runModelOnImage(
        path: filePath.path, // required
        imageMean: 127.5, // defaults to 117.0
        imageStd: 127.5, // defaults to 1.0
        numResults: 5, // defaults to 5
        threshold: 0.5, // defaults to 0.1
        asynch: true // defaults to true
        );

    log('resultresultresult: $recognitions');
    // ignore: duplicate_ignore
    try {
      if (recognitions![0]['label'] == 'Early Blight') {
        Navigator.pushNamed(context, Disease1Screen.routeName);
      } else if (recognitions[0]['label'] == 'Healthy') {
        Navigator.pushNamed(context, HealthyScreen.routeName);
      } else if (recognitions[0]['label'] == 'Late Blight') {
        Navigator.pushNamed(context, LateBlightScreen.routeName);
      } else if (recognitions[0]['label'] == 'Septoria') {
        Navigator.pushNamed(context, SeptorialLeafSpotScreen.routeName);
      } else if (recognitions[0]['label'] == 'Target Spot') {
        Navigator.pushNamed(context, TargetSpotScreen.routeName);
      } else if (recognitions[0]['label'] == 'Yellow Leaf') {
        Navigator.pushNamed(context, YellowLeafScreen.routeName);
      }
    } catch (e) {
      Navigator.pushNamed(context, NotFoundScreen.routeName);
    }
  }

  void captureImage(BuildContext context) {
    showDialog<ImageSource>(
      context: context,
      builder: (context) =>
          AlertDialog(content: const Text("Choose image source"), actions: [
        TextButton(
            child: const Text("Camera"),
            onPressed: () async {
              Navigator.pop(context);
              final pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              objectRecognition(File(pickedFile!.path));
            }),
        TextButton(
            child: const Text("Gallery"),
            onPressed: () async {
              Navigator.pop(context);
              final pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);

              objectRecognition(File(pickedFile!.path));
            }),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
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
                  Container(
                    padding: const EdgeInsets.only(top: 0, right: 20),
                    alignment: Alignment.topRight,
                    child: FloatingActionButton(
                      heroTag: 'btn1',
                      onPressed: () {
                        auth.signOut();
                        Navigator.of(context)
                            .pushNamed(WelcomeScreen.routeName);
                      },
                      backgroundColor: Colors.red,
                      child: const Icon(Icons.logout_rounded),
                    ),
                  ),

                  // ignore: unnecessary_new
                  Padding(
                    padding: const EdgeInsets.only(top: 150, left: 25),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              top: 25, left: 24, right: 24),
                          child: RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            color: Colors.transparent.withOpacity(0.5),
                            // ignore: prefer_const_constructors
                            onPressed: () {
                              captureImage(context);
                              // final ImagePicker _picker = ImagePicker();
                              // final pickedFile = await _picker.getImage(
                              //     source: ImageSource.camera);
                            },
                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('capture_image'),
                              // 'Capture Image',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              top: 25, left: 24, right: 24),
                          child: RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            color: Colors.transparent.withOpacity(0.5),

                            // ignore: prefer_const_constructors
                            onPressed: () => Navigator.of(context)
                                .pushNamed(ListScreen.routeName),
                            // ignore: prefer_const_constructors
                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('view_diseases'),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              top: 25, left: 24, right: 24),
                          child: RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            color: Colors.transparent.withOpacity(0.5),

                            // ignore: prefer_const_constructors
                            onPressed: () => Navigator.of(context)
                                .pushNamed(TutorialScreen.routeName),
                            // ignore: prefer_const_constructors
                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('planting-tutorials'),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
          ),
        ],
      ),
    );
  }
}
