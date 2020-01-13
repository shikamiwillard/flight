import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(new MyApp());

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: ScopedModel<CounterModel>(
        model: CounterModel(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Counter:',
            style: TextStyle(fontSize: 20.0),
          ),
          ScopedModelDescendant<CounterModel>(
            builder: (context, child, model) => Text(
              model.count.toString(),
            ),
          )
        ],
      ),
      floatingActionButton: ScopedModelDescendant<CounterModel>(
        builder: (context, child, model) => ButtonBar(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: model.increment,
            ),
            IconButton(
              icon: Icon(Icons.minimize),
              onPressed: model.decrement,
            )
          ],
        ),
      ),
    );
  }
}
