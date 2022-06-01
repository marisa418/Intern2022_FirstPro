import 'dart:io';

import 'package:firstproject/Model/StdData.dart';
import 'package:firstproject/provider/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/consumer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 38, 24, 241).withOpacity(0.8),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                "ข้อมูลนักเรียน",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, TransactionProvider provider, Widget? child) {
                var count = provider.transactions.length;
                return Container(
                    color: Colors.white,
                    child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(count, (index) {
                          StdData data = provider.transactions[index];
                          return InkWell(
                            child: Card(
                              elevation: 1,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Column(
                                children: [
                                  Container(
                                      height: 150,
                                      width: 120,
                                      color: Colors.green,
                                      child: Image.file(
                                          File(data.simage.toString()),
                                          fit: BoxFit.cover)),
                                  Text(
                                    data.std_id +
                                        "  " +
                                        data.sf_name +
                                        "  " +
                                        data.sl_name,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                isScrollControlled: true,
                                useRootNavigator: false,
                                builder: (_) => ShowDetail(index),
                              );
                            },
                          );
                        })));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 100.0,
        width: 100.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/createform');
            },
            child: SizedBox(child: const Icon(Icons.add)),
            backgroundColor: Color.fromARGB(255, 15, 11, 231),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ShowDetail extends StatefulWidget {
  const ShowDetail(this.index, {Key? key}) : super(key: key);
  final int index;
  @override
  State<ShowDetail> createState() => Detail();
}

class Detail extends State<ShowDetail> {
  late double point;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 250, 187, 187),
      child: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 38, 24, 241).withOpacity(0.8),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                "ข้อมูลนักเรียน",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
          Consumer(
              builder: (context, TransactionProvider provider, Widget? child) {
            StdData data = provider.transactions[widget.index];
            var point = data.point;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        height: 200,
                        width: 150,
                        color: Colors.green,
                        child: data.simage != null
                            ? Image.file(File(data.simage.toString()),
                                fit: BoxFit.cover)
                            : const Text(''),
                      ),
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              point.toStringAsFixed(0),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.orange),
                            ),
                            Text(
                              "ให้คะแนน",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            InkWell(
                              child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: FittedBox(
                                      child: const Icon(
                                    Icons.star,
                                    color: Colors.red,
                                  ))),
                              onTap: () {
                                data.point = data.point + 1;
                                setState(() {
                                  point = data.point;
                                });
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data.sf_name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Padding(padding: EdgeInsets.only(left: 20)),
                                Text(
                                  data.sl_name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "ข้อมูลนักเรียน",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                        "โรงเรียน: " + data.school,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "รหัสนักเรียน: " + data.std_id,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "ระดับการศึกษา: " + data.sgrade,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "ครูที่ปรึกษา: " + data.teacher,
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          Text(
                            "ชื่อ: " + data.sf_name,
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(
                            data.sl_name,
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      Text(
                        "ชื่อเล่น: " + data.sn_name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "อายุ: " + data.sage.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ข้อมูลผู้ปกครอง",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Row(
                        children: [
                          Text(
                            "ชื่อ: " + data.pf_name,
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(
                            data.pl_name,
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      Text(
                        "ความสัมพันธ์: " + data.prelation,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "เบอร์โทร: " + data.ptel,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    width: 140,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 15, 11, 231),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.arrow_left, color: Colors.white),
                        Text(
                          'ย้อนกลับ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
