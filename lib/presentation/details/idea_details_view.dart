import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_idea_sorter/domain/models/idea_overview_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart';

class IdeaDetailsPage extends StatelessWidget {
  /// the ID of the idea which is shown in this detail widget page
  final int ideaID;
  final IdeaOverviewModel ideaOverview;

  const IdeaDetailsPage(
      {Key? key, required this.ideaID, required this.ideaOverview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
            "${AppLocalizations.of(context)!.idea_details_title} #${ideaID}"),
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
      body: FutureBuilder<Idea?>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container();
        },
      ),
    );
  }

  Future<Idea?> fetchData() async {
    return null;
  }
}
