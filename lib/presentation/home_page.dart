import 'package:flutter/material.dart';
import 'package:flutter_idea_sorter/generated/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_grid/responsive_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(AppLocalizations.of(context)!.app_title),
      ),
      body: ResponsiveGridList(
          desiredItemWidth: 150,
          minSpacing: 10,
          children: [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16,
            17,
            18,
            19,
            20
          ].map((i) {
            return Container(
              height: 100,
              alignment: const Alignment(0, 0),
              color: Colors.cyan,
              child: Text(i.toString()),
            );
          }).toList()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.red,
        tooltip: 'Add',
        child: const Icon(
          Icons.add,
          // color: Colors.red,
        ),
      ),
    );
  }
}
