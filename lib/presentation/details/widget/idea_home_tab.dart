import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_idea_sorter/domain/models/idea_overview_model.dart';

class IdeaHomeTabWidget extends StatelessWidget {
  final IdeaOverviewModel ideaOverviewModel;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  IdeaHomeTabWidget({Key? key, required this.ideaOverviewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _titleController.text = ideaOverviewModel.title;
    _descriptionController.text = ideaOverviewModel.description;

    return Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "${AppLocalizations.of(context)!.create_idea_dialog_title_text}:",
                style: TextStyle(fontSize: 20),
              ),
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
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${AppLocalizations.of(context)!.create_idea_dialog_description_text}:",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                minLines: 8,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!
                      .create_idea_dialog_description_text,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
