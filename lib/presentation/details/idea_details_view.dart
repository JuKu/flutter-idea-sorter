import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_idea_sorter/domain/models/idea_overview_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart';

import 'package:flutter_idea_sorter/presentation/details/tabs/tab_factory.dart';
import 'package:flutter_idea_sorter/presentation/details/tabs/tab_info.dart';

class IdeaDetailsPage extends StatefulWidget {
  /// the ID of the idea which is shown in this detail widget page
  final int ideaID;
  final IdeaOverviewModel ideaOverview;

  const IdeaDetailsPage(
      {Key? key, required this.ideaID, required this.ideaOverview})
      : super(key: key);

  @override
  State<IdeaDetailsPage> createState() => _IdeaDetailsPageState();
}

class _IdeaDetailsPageState extends State<IdeaDetailsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Idea?>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          /// TODO: set correct _currentIndex

          return Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(
                  "${AppLocalizations.of(context)!.idea_details_title} #${widget.ideaID}"),
              centerTitle: true,
              //leading: const Icon(Icons.insert_drive_file),
              actions: [
                IconButton(
                    onPressed: () {
                      debugPrint("click save idea");
                    },
                    icon: const Icon(
                      Icons.save,
                      color: Colors.lightGreenAccent,
                    )),
              ],
            ),
            bottomNavigationBar:
                TabFactory.buildBottomNavigationBar(context, 0, (int index) {
              setState(() {
                _currentIndex = index;
              });
            }),
            body: IndexedStack(
              index: _currentIndex,
              children: [
                Center(
                    child:
                        /*CircularProgressIndicator()*/
                        Text("$_currentIndex")),
                Center(
                    child:
                        /*CircularProgressIndicator()*/
                        Text("$_currentIndex")),
                //TODO: add pages here
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
              appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text(
                    "${AppLocalizations.of(context)!.idea_details_title} #${widget.ideaID}"),
                centerTitle: true,
              ),
              body: const Text("An error occured"));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<Idea?> fetchData() async {
    /// TODO: replace this
    return Idea(1, "", "", "", 1);
  }
}
