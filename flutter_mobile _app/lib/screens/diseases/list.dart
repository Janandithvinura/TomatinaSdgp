import 'package:flutter/material.dart';
import 'package:tomatina/screens/diseases/lateblight.dart';
import 'package:tomatina/screens/diseases/septorialLeafSpot.dart';
import 'package:tomatina/screens/diseases/targetspot.dart';
import 'package:tomatina/screens/diseases/yellowleaf.dart';

import '../../helpers/multilanguages.dart';
import 'earlyBlight.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/listPage';

  const ListScreen({Key? key}) : super(key: key);

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

                            onPressed: () => Navigator.of(context)
                                .pushNamed(Disease1Screen.routeName),

                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('early_blight'),
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

                            // ignore: prefer_const_constructors
                            onPressed: () => Navigator.of(context)
                                .pushNamed(LateBlightScreen.routeName),
                            // ignore: prefer_const_constructors
                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('late_blight'),
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
                                .pushNamed(SeptorialLeafSpotScreen.routeName),
                            // ignore: prefer_const_constructors
                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('septorial_leaf'),
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
                                .pushNamed(TargetSpotScreen.routeName),
                            // ignore: prefer_const_constructors
                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('target_Spot'),
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
                                .pushNamed(YellowLeafScreen.routeName),
                            // ignore: prefer_const_constructors
                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('yellow_leaf'),
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
                      top: 20,
                    ),
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton(
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
