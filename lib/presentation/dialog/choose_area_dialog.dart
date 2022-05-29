import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseAreaDialog extends StatefulWidget {
  const ChooseAreaDialog({Key? key}) : super(key: key);

  @override
  State<ChooseAreaDialog> createState() => _ChooseAreaDialogState();
}

class _ChooseAreaDialogState extends State<ChooseAreaDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
                AppLocalizations.of(context)!.choose_area_title,
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

                        /// TODO: add title here
                        const SizedBox(
                          height: 5,
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
                  child:
                      Text(AppLocalizations.of(context)!.select_area_button)),
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
