import 'package:flutter/material.dart';
import 'package:sample_app/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int _counter = 0;
  List<String> titleList = ['Amazon','楽天','Yahoo!',];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter sample app'),
      ),
      // ListViewは内容を縦に並べる。ウィジェット自体をスクロールできる。
      body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.key),
                  title:Text(titleList[index]),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => NextPage(titleList[index])));
                  },
                ),
                const Divider(height: 0,),
              ],
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleList.add('Google');
          setState(() {

          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
