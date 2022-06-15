import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_idea_sorter/application/savestate/save_state_bloc.dart';
import 'package:flutter_idea_sorter/domain/models/idea_overview_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart';

import 'package:flutter_idea_sorter/presentation/details/tabs/tab_factory.dart';
import 'package:flutter_idea_sorter/presentation/details/widget/idea_home_tab.dart';
import 'package:flutter_idea_sorter/presentation/details/widget/wip_tab.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../injection.dart' as di;

class IdeaDetailsPage extends StatefulWidget with GetItStatefulWidgetMixin {
  /// the ID of the idea which is shown in this detail widget page
  final int ideaID;
  final IdeaOverviewModel ideaOverview;

  IdeaDetailsPage({Key? key, required this.ideaID, required this.ideaOverview})
      : super(key: key);

  @override
  State<IdeaDetailsPage> createState() => _IdeaDetailsPageState();
}

class _IdeaDetailsPageState extends State<IdeaDetailsPage>
    with GetItStateMixin {
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

                      // TODO: save idea

                      setState(() {
                        di.sl.get<SaveStateBloc>().add(SaveEvent());
                      });
                    },
                    icon: BlocBuilder<SaveStateBloc, SaveStateState>(
                        bloc: get<SaveStateBloc>(),
                        builder: (context, state) {
                          if (state is UnsavedChangesState) {
                            return const Icon(
                              Icons.save,
                              color: Colors.lightGreenAccent,
                            );
                          } else {
                            return const Icon(
                              Icons.save,
                              color: Colors.grey,
                            );
                          }
                        })),
              ],
            ),
            bottomNavigationBar:
                TabFactory.buildBottomNavigationBar(context, 0, (int index) {
              setState(() {
                /// TODO: first save changes

                _currentIndex = index;
              });
            }),
            body: IndexedStack(
              index: _currentIndex,
              children: [
                IdeaHomeTabWidget(ideaOverviewModel: widget.ideaOverview),
                const WIPTabWidget(),
                const WIPTabWidget(),
                const WIPTabWidget(),
                const WIPTabWidget(),
                /*Center(
                    child:
                        /*CircularProgressIndicator()*/
                        Text("$_currentIndex")),*/
                /*Center(
                    child:
                        /*CircularProgressIndicator()*/
                        Text("$_currentIndex")),*/
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
