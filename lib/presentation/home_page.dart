import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_idea_sorter/generated/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_idea_sorter/domain/models/idea_overview_model.dart';
import 'package:flutter_idea_sorter/domain/usecases/area_usecases.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';
import 'package:flutter_idea_sorter/logger.util.dart';
import 'package:flutter_idea_sorter/presentation/details/idea_details_view.dart';
import 'package:flutter_idea_sorter/presentation/dialog/choose_area_dialog.dart';
import 'package:flutter_idea_sorter/presentation/dialog/create_idea_dialog.dart';
import 'package:flutter_idea_sorter/presentation/shared/icon_mapper.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../injection.dart' as di;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AreaUseCases areaUseCases = di.sl();
  final IdeaUseCases ideaUseCases = di.sl();

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    final screenSize = MediaQuery.of(context).size;
    final deviceOrientation = MediaQuery.of(context).orientation;

    /// check, if minimum one area exists or create the default area
    areaUseCases.createDefaultAreaIfAbsent();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(AppLocalizations.of(context)!.app_title),
        centerTitle: true,
        leading: const Icon(Icons.home),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ChooseAreaDialog();
                    });
              },
              icon: const Icon(
                Icons.business_center_sharp,
                color: Colors.white,
              )),
        ],
      ),
      body: FutureBuilder<List<IdeaOverviewModel>>(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<IdeaOverviewModel> list = snapshot.data;
              getLogger().d("ideas found: ${list.length}");

              return ResponsiveGridList(
                  desiredItemWidth: 150,
                  minSpacing: 10,
                  children: list.map((IdeaOverviewModel ideaOverview) {
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 150,
                          // see also: https://codesinsider.com/flutter-card-example-tutorial/
                          child: Card(
                            elevation: 8,
                            shadowColor: Colors.blue,
                            /* shape: BeveledRectangleBorder(
                      //borderRadius: BorderRadius.circular(15)
                        borderRadius: BorderRadius.circular(5)
                    ), */
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IdeaDetailsPage(
                                            ideaID: ideaOverview.ideaID,
                                            ideaOverview: ideaOverview)));
                              },
                              child: ListTile(
                                leading: Icon(
                                    IconMapper.getIcon(ideaOverview.iconName)),
                                title: Text(
                                  "#${ideaOverview.ideaID} ${ideaOverview.title}",
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
                          ),
                        )
                      ],
                    );
                  }).toList());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CreateIdeaDialog();
              }).then(onGoBack)
        },
        backgroundColor: Colors.red,
        tooltip: 'Add',
        child: const Icon(
          Icons.add,
          // color: Colors.red,
        ),
      ),
    );
  }

  FutureOr onGoBack(dynamic value) {
    /// TODO: add code here
    setState(() {});
  }

  /// load current ideas from database
  Future<List<IdeaOverviewModel>> fetchData() async {
    final int areaID = (await areaUseCases.getSelectedAreaID())!;

    final List<IdeaOverviewModel> list =
        await ideaUseCases.listIdeaOverviewsByArea(areaID);
    getLogger().d(
        "ideas found: ${list.length} for areaID: $areaID, all ideas: ${await ideaUseCases.countIdeas()}");

    return list;
  }
}
