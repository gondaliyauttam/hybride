// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

class Titlebar extends StatelessWidget {
  const Titlebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 100,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(0.0),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(5),  
                  width: MediaQuery.of(context).size.width * 100,
                  child: Text(
                    " The Currencies Prices",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: const Color(0xffBD8A3C),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 100,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 30,
                        child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(0.0),
                              color: const Color(0xff293462),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'TYPE',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                      ),
                      Expanded(
                        flex: 25,
                        child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(0.0),
                              color: const Color(0xff293462),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'BID',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                      ),
                      Expanded(
                        flex: 25,
                        child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(0.0),
                              color: const Color(0xff293462),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'ASK',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                      ),
                      Expanded(
                        flex: 20,
                        child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(0.0),
                              color: const Color(0xff293462),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'H/L',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                      ),
                      Expanded(
                        flex: 20,
                        child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(0.0),
                              color: const Color(0xff293462),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Time',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                      ),
                    ],
                  )),
            ])),
          )
        ],
      ),
    );
  }
}
