import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_idea_sorter/application/area_selection/area_selection_bloc.dart';
import 'package:flutter_idea_sorter/domain/usecases/area_usecases.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';
import 'package:flutter_idea_sorter/logger.util.dart';
import 'package:get_it/get_it.dart';

class CreateIdeaDialog extends StatefulWidget {
  const CreateIdeaDialog({Key? key}) : super(key: key);

  @override
  State<CreateIdeaDialog> createState() => _CreateIdeaDialogState();
}

class _CreateIdeaDialogState extends State<CreateIdeaDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late IdeaUseCases _ideaUseCases;
  late AreaUseCases _areaUseCases;

  _CreateIdeaDialogState() {
    _ideaUseCases = GetIt.instance.get<IdeaUseCases>();
    _areaUseCases = GetIt.instance.get<AreaUseCases>();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: 400,
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
                AppLocalizations.of(context)!.create_idea_title,
                style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
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
                        Text(AppLocalizations.of(context)!
                                .create_idea_dialog_title_text +
                            ":"),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: const TextStyle(
                              color: Colors.blue, decorationColor: Colors.blue),
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .create_idea_dialog_title_text,
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(AppLocalizations.of(context)!
                                .create_idea_dialog_description_text +
                            ":"),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          minLines: 2,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .create_idea_dialog_description_text,
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    /// create new idea
                    final currentAreaID =
                        await _areaUseCases.getSelectedAreaID();
                    _ideaUseCases.addIdea(currentAreaID!, _titleController.text,
                        _descriptionController.text);

                    getLogger().d(
                        "ideas after creation: ${await _ideaUseCases.countIdeas()}");

                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text(
                      AppLocalizations.of(context)!.create_idea_save_button)),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
