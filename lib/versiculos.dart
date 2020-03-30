import 'package:flutter/material.dart';

class Versiculos extends StatefulWidget {
  final String title = "Versiculos";

  List list = [];

  Versiculos({Key key, this.list}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Versiculos> {
// Render do flutter
  ScrollController _scrollController = new ScrollController();
  //print(widget.list);
  int maxItem = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        maxItem = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //  print(widget.list[0][0].toString());
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: ListView.builder(
          itemCount: widget.list[maxItem].length,
          controller: _scrollController,
          itemBuilder: (context, int index) {
            // print(index);
            // print(widget.list[0].length == index + 1);
            if (widget.list[maxItem].length == index + 1 &&
                widget.list.length != maxItem + 1) {
              // print('enrteu');
              return ListTile(
                title: Text(
                  widget.list[maxItem][index],
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: RaisedButton(
                  onPressed: () {
                    setState(() {
                      maxItem = maxItem + 1;
                    });
                    _scrollController.jumpTo(-2);
                  },
                  child: Text('Proximo'),
                ),
              );
            }
            return ListTile(
                title: Text(
              "${index + 1}: ${widget.list[0][maxItem]}",
              style: TextStyle(fontSize: 20),
            ));
          },
        )));
  }
}
