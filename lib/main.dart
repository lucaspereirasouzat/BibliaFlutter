import 'package:flutter/material.dart';
import 'package:bibleFlutter/versiculos.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Biblia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List bibliaLista = [];

  loadJson() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("json/biblejson.json");
    final List jsonResult = json.decode(data);

    // final bible = new Bible({jsonResult});
    print(jsonResult);

    setState(() {
      bibliaLista = jsonResult;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: bibliaLista.length,
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text(
              bibliaLista[index]['abbrev'],
              style: TextStyle(fontSize: 20, fontFamily: "Rock Salt"),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Versiculos(list: bibliaLista[index]['chapters']),
                  ));
            },
          );
        },
      )),
    );
  }
}
