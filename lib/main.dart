// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _last = 0;
  int _current = 1;

  void _incrementCounter() {
    setState(() {
      int next = _last + _current;
      _last = _current;
      _current = next;
      _counter++;
    });
  }

  void _reset() {
    setState(() {
      _last = 0;
      _current = 1;
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Clicks and Fibonacci:',
            ),
            Text(
              'Clicks: $_counter\nFibonacci: $_current',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            LinearProgressIndicator(
              value: _counter / 100,
              minHeight: 20,
              color: Colors.grey,
            ),
            FloatingActionButton(
              onPressed: _reset,
              tooltip: 'Rest',
              child: const Icon(Icons.delete_forever_sharp),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
