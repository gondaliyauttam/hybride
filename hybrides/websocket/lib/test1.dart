// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:websocket/widget/tittlebar.dart';

import 'comex_module.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreen> {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
  List<DataModel> datas = [];
  @override
  void initState() {
    super.initState();
    // sliptedFun();
    print(formattedDate);
  }

  WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('ws://207.154.227.183:8888/ws?account_id=3&group=*&pair=*'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDAE1E7),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color(0xff293462),
        title: Text(
          "Web Socket",
          style: TextStyle(
              color: Color(0xFFD4BFA3),
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Titlebar(),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Processing.....'),
                  ));
                } else if (snapshot.hasData) {
                  String s = snapshot.data.toString();

                  List replacedList =
                      s.replaceAll(' ', ",").split(",").toList();

                      // replace Data

                  DataModel m = DataModel(
                    id: int.parse(replacedList[0]),
                    name: replacedList[1],
                    typeName:
                        replacedList[2].toString().replaceAll('type=', ''),
                    bidPrice: double.parse(
                        replacedList[3].toString().replaceAll('bid=', '')),
                    askPrice: double.parse(
                        replacedList[4].toString().replaceAll('ask=', '')),
                    highPrice: double.parse(
                        replacedList[5].toString().replaceAll('high=', '')),
                    lowPrice: double.parse(
                        replacedList[6].toString().replaceAll('low=', '')),
                    sourceTime: replacedList[12].replaceAll('sourceTime=', ''),
                    sourceTime2: replacedList[13].toString(),
                  );

                  if (datas.isEmpty) {
                    datas.add(m);
                  } else {
                    if (datas
                        .where((element) => element.typeName == m.typeName)
                        .toList()
                        .isEmpty) {
                      datas.add(m);
                    } else {
                      int ind = datas.indexOf(datas
                          .where((element) => element.typeName == m.typeName)
                          .first);
                      datas[ind] = m;
                    }
                  }

                  return Container(
                    height: MediaQuery.of(context).size.height - 20,

                    // List View
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: datas.length,
                      itemBuilder: (context, index) {
                        int timestamp =
                            int.parse(datas[index].sourceTime2.toString());
                        DateTime date = DateTime.fromMicrosecondsSinceEpoch(
                          timestamp * 1000,
                        );
                        // Date Formate change

                        String finalDate = DateFormat().format(date);
                        // print(date);
                        return Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          padding: EdgeInsets.fromLTRB(0.5, 0, 0.5, 0.5),
                          constraints:
                              const BoxConstraints(minWidth: double.infinity),
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(0.0),
                            color: Colors.black,
                          ),
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.white,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 35,
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 10, 5, 10),
                                              child: Text(
                                                datas[index].typeName!,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 25,
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              margin: EdgeInsets.all(1),
                                              decoration: new BoxDecoration(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                              ),
                                              child: Text(
                                                ' ${datas[index].askPrice}',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 25,
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              margin: EdgeInsets.all(1),
                                              decoration: new BoxDecoration(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                              ),
                                              child: Text(
                                                ' ${datas[index].bidPrice}',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 20,
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'H:${datas[index].highPrice}',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 2,
                                                  color: Color(0xFF030303),
                                                ),
                                                Container(
                                                  child: Text(
                                                    'L:${datas[index].lowPrice}',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 20,
                                            child: Container(
                                              child: Text(
                                                finalDate,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : 'erro'),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
