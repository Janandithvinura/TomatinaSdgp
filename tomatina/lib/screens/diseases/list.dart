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
                flex: 15,
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
                        padding:
                            const EdgeInsets.only(top: 25, left: 24, right: 24),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
