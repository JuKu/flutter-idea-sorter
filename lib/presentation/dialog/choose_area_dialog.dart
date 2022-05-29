import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_idea_sorter/application/area_selection/area_selection_bloc.dart';
import 'package:flutter_idea_sorter/domain/models/area_model.dart';
import 'package:flutter_idea_sorter/domain/usecases/area_usecases.dart';
import 'package:get_it/get_it.dart';

class ChooseAreaDialog extends StatefulWidget {
  const ChooseAreaDialog({Key? key}) : super(key: key);

  @override
  State<ChooseAreaDialog> createState() => _ChooseAreaDialogState();
}

class _ChooseAreaDialogState extends State<ChooseAreaDialog> {
  late int? dropdownValue;
  late AreaUseCases _areaUseCases;
  late AreaSelectionBloc _areaSelectionBloc;
  late List<DropdownMenuItem<int>>? items;

  late Future<List<AreaModel>> _areaModelListFuture;

  _ChooseAreaDialogState() {
    _areaUseCases = GetIt.instance.get<AreaUseCases>();
    _areaSelectionBloc = GetIt.instance.get<AreaSelectionBloc>();
  }

  @override
  Widget build(BuildContext context) {
    //dropdownValue = _areaUseCases.getSelectedAreaID();
    _areaModelListFuture = _areaUseCases.listAllAreas();

    /// <List<AreaModel>>
    return FutureBuilder(
        future: Future.wait(
            [_areaModelListFuture, _areaUseCases.getSelectedAreaID()]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            items = snapshot.data[0]!
                .map<DropdownMenuItem<int>>(
                    (areaModel) => DropdownMenuItem<int>(
                          value: areaModel.areaID,
                          child: Text(areaModel.title),
                        ))
                .toList();

            dropdownValue = snapshot.data[1];

            return Dialog(
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                height: 300,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 5),
                      /* FlutterLogo(
                size: 150,
              ), */
                      Text(
                        AppLocalizations.of(context)!.choose_area_title,
                        style: const TextStyle(
                            fontSize: 20, color: Colors.blueAccent),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 0,
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),

                                /// TODO: add title here
                                const SizedBox(
                                  height: 5,
                                ),
                                DropdownButton<int>(
                                  value: dropdownValue,
                                  hint: Text('Select an area'),
                                  icon: const Icon(Icons.arrow_drop_down),
                                  dropdownColor: Colors.lightBlueAccent,
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      print("select area: $newValue");
                                      dropdownValue = newValue!;

                                      // fire event to select the area
                                      _areaSelectionBloc
                                          .add(SelectAreaEvent(newValue!));

                                      _areaUseCases.saveSelectedArea(newValue!);
                                    });
                                  },
                                  items:
                                      items/*<String>['Red', 'Green', 'Blue']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()*/
                                  ,
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(AppLocalizations.of(context)!
                              .select_area_button)),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
