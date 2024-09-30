import 'package:flutter/material.dart';
import 'package:ripple_container/container_decoration.dart';
import 'package:ripple_container/ripple_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RippleContainer(
              width: 200,
              height: 100,
              backgroundColor: Colors.blueAccent,
              margin: const EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(30),
              splashColor: Colors.amber,
              // gradient: LinearGradient(colors: [Colors.red, Colors.yellow]),
              border:
                  const Border.fromBorderSide(BorderSide(color: Colors.grey)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0, 2),
                  blurRadius: 10,
                )
              ],
              onTap: () => tapTest('Button OnTap'),
              onLongPress: () => tapTest('Button OnLongPress'),
              child: const Text('Hi'),
            ),
            Container(
              width: 200,
              height: 100,
              decoration: const BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Colors.red))),
              child: const Text('Hi'),
            )
          ],
        ),
      ),
    );
  }

  void tapTest(String testMessage) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            testMessage,
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 1),
          showCloseIcon: true,
        ),
      );
}
