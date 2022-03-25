import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateIdeaDialog extends StatelessWidget {
  const CreateIdeaDialog({Key? key}) : super(key: key);

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
                        TextField(
                          style: const TextStyle(
                              color: Colors.blue, decorationColor: Colors.blue),
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
                  onPressed: () {
                    Navigator.of(context).pop();
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
