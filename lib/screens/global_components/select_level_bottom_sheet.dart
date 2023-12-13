import 'package:champions/screens/global_components/level_button.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class SelectLevelBottomSheet extends StatefulWidget {
  const SelectLevelBottomSheet({
    super.key,
    required this.widgetPush,
  });
  final String widgetPush;

  @override
  State<SelectLevelBottomSheet> createState() => _SelectLevelBottomSheetState();
}

class _SelectLevelBottomSheetState extends State<SelectLevelBottomSheet> {

  List<ButtonModel> items = [
    ButtonModel(text: AppStrings.easyLevelBtn, id: AppStrings.easyId),
    ButtonModel(text: AppStrings.midLevelBtn, id: AppStrings.midId),
    ButtonModel(text: AppStrings.hardLevelBtn, id: AppStrings.hardId),
  ];
  String? selectedItem = '';
  bool _enabled = false;
  String? idLevel;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 32,
            bottom: 48,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.levelTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 32,
                ),
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return LevelButton(
                      id: items[index].id!,
                      isSelected: selectedItem == items[index].id,
                      text: items[index].text!,
                      onPressed: () {
                        setState(() {
                          selectedItem = items[index].id!;
                          _enabled = true;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                PrimaryButton(
                  text: AppStrings.confirmLevelBtn,
                  isDisabled: !_enabled,
                  itemCallBack: () {
                    Navigator.pushReplacementNamed(
                      context,
                      widget.widgetPush,
                      arguments: selectedItem,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ButtonModel {
  final String? text;
  final String? id;

  ButtonModel({this.text, this.id});
}
