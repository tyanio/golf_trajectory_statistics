import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final isSelectedTrajectory = <bool>[false, false, false];
  String dropdownValue = 'SW';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton<String>(
            value: dropdownValue,
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>[
              '1W',
              '3W',
              '5W',
              '3U',
              '4U',
              '3I',
              '4I',
              '5I',
              '6I',
              '7I',
              '8I',
              '9I',
              'PW',
              'SW',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text('左へのミス'),
                  ToggleButtons(
                    constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                    isSelected: isSelectedTrajectory,
                    onPressed: (index) {
                      setState(() {
                        isSelectedTrajectory[index] = !isSelectedTrajectory[index];
                      });
                    },
                    children: [
                      const Icon(Icons.undo),
                      const Icon(Icons.north_west),
                      Transform.rotate(angle: 45 * pi / 180, child: const Icon(Icons.undo)),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('中央'),
                  ToggleButtons(
                    constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                    isSelected: isSelectedTrajectory,
                    onPressed: (index) {
                      setState(() {
                        isSelectedTrajectory[index] = !isSelectedTrajectory[index];
                      });
                    },
                    children: [
                      Transform.rotate(angle: 270 * pi / 180, child: const Icon(Icons.redo)),
                      const Icon(Icons.north),
                      Transform.rotate(angle: 90 * pi / 180, child: const Icon(Icons.undo)),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('右へのミス'),
                  ToggleButtons(
                    constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                    isSelected: isSelectedTrajectory,
                    onPressed: (index) {
                      setState(() {
                        isSelectedTrajectory[index] = !isSelectedTrajectory[index];
                      });
                    },
                    children: [
                      Transform.rotate(angle: 315 * pi / 180, child: const Icon(Icons.redo)),
                      const Icon(Icons.north_east),
                      const Icon(Icons.redo),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
