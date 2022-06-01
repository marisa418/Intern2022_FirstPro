import 'package:firstproject/page/page_create.dart';
import 'package:firstproject/page/page_show.dart';
import 'package:firstproject/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) {
            return TransactionProvider();
          }),
        ],
        child: MaterialApp(
          routes: {
            '/': (context) => const MyHomePage(),
            '/createform': (context) => CreateForm(),
          },
          initialRoute: "/",
        ));
  }
}
