import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tomatina/helpers/multilanguages.dart';
import 'package:tomatina/screens/tutorials/tutorial.dart';

import '../diseases/list.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/frontPage';

  const HomeScreen({Key? key}) : super(key: key);

  /*
  Widget routeButton(Color buttonColor, String title, Color textColor, BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: buttonColor,
        onPressed: () => context,
        child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: textColor,),),
      ),
    );
  }
  */

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
            }),
        TextButton(
            child: const Text("Gallery"),
            onPressed: () async {
              Navigator.pop(context);
              final pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
            }),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/tomatina.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 25),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'TOMATINA',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        'by Kil-A-Bytes',
                        style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, left: 25),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: double.infinity,
                        padding:
                            const EdgeInsets.only(top: 25, left: 24, right: 24),
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
                        padding:
                            const EdgeInsets.only(top: 25, left: 24, right: 24),
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
                        padding:
                            const EdgeInsets.only(top: 25, left: 24, right: 24),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
