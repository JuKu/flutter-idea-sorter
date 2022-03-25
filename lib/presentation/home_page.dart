import 'package:flutter/material.dart';
// import 'package:flutter_idea_sorter/generated/l10n.dart';
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
            return Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  // see also: https://codesinsider.com/flutter-card-example-tutorial/
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                      },
                      child: ListTile(
                        title: Text(
                          "My test title " + i.toString(),
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ), /* Container(
                      height: 150,
                      alignment: const Alignment(0, 0),
                      // color: Colors.cyan,
                      child: Text(i.toString()),
                    ), */
                      /* ListTile(
                      title: Text("Codesinsider.com", style: TextStyle(color: Colors.white),),
                    ), */
                    ),
                    elevation: 8,
                    shadowColor: Colors.blue,
                    /* shape: BeveledRectangleBorder(
                      //borderRadius: BorderRadius.circular(15)
                        borderRadius: BorderRadius.circular(5)
                    ), */
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red)),
                  ),
                )
              ],
            );
          }).toList()),
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
