import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textEditingController = TextEditingController();
  String _output = "";

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jizt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Input:'),
            TextField(controller: _textEditingController),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _output = _textEditingController.text.toUpperCase();
                });
              },
              child: const Text('Summarize', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 64),
            Text('Summary:'),
            Text(
              '$_output',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
