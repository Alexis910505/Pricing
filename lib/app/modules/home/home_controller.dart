import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pricing/app/modules/home/home_screen.dart';
import 'package:pricing/app/theme/color.dart';

class HomeControler extends GetxController {
  final RxBool _payType = false.obs;
  bool get payType => _payType.value;

  final RxBool _unitType = false.obs;
  bool get unitType => _unitType.value;

  final RxBool _selectAll = false.obs;
  bool get selectAll => _selectAll.value;

  final RxBool _selectType2 = false.obs;
  bool get selectType2 => _selectType2.value;

  final RxBool _selectCCS = false.obs;
  bool get selectCCS => _selectCCS.value;

  final RxBool _selectCHAdeMO = false.obs;
  bool get selectCHAdeMO => _selectCHAdeMO.value;

  final RxString _openingDate = "Opening".obs;
  String get openingDate => _openingDate.value;

  final RxString _closingDate = "Closing".obs;
  String get closingDate => _closingDate.value;

  DateTime? dateTime;

  void onChangeSeletionPayType(bool value) {
    _payType.value = value;
  }

  void onChangeSeletionUnitType(bool value) {
    _unitType.value = value;
  }

  void onChangeSelectType2() {
    _selectType2.value = !_selectType2.value;
  }

  void onChangeSelectCCS() {
    _selectCCS.value = !_selectCCS.value;
  }

  void onChangeSelectCHAdeMO() {
    _selectCHAdeMO.value = !_selectCHAdeMO.value;
  }

  void onChangeSelectAll() {
    _selectCHAdeMO.value = true;
    _selectType2.value = true;
    _selectCCS.value = true;
    update();
  }

  void showDatePicker(BuildContext context, int value) {
    Get.bottomSheet(Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            padding: const EdgeInsets.only(
              top: 22,
              bottom: 19,
              left: 22,
              right: 22,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (value == 0) {
                      _openingDate.value = "Opening";
                    } else {
                      _closingDate.value = "Closing";
                    }
                    Get.back();
                  },
                  child: const Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 15.6,
                      color: Color(0xff007aff),
                    ),
                  ),
                ),
                Text(
                  value == 0 ? "Opening" : "Closing",
                  style: const TextStyle(
                    fontSize: 15.5,
                    color: Color(0xff8f8f8f),
                  ),
                ),
                const SizedBox()
              ],
            ),
          ),
          divider,
          Flexible(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (date) {
                dateTime = date;
                if (value == 0) {
                  _openingDate.value = DateFormat.jm().format(date);
                } else {
                  _closingDate.value = DateFormat.jm().format(date);
                }
              },
              initialDateTime: DateTime.now(),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                if (dateTime != null) {
                  if (value == 0) {
                    _openingDate.value = DateFormat.jm().format(dateTime!);
                  } else {
                    _closingDate.value = DateFormat.jm().format(dateTime!);
                  }
                } else {
                  if (value == 0) {
                    _openingDate.value = "Opening";
                  } else {
                    _closingDate.value = "Closing";
                  }
                }
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                  primary: blueBlueTwo,
                  padding: const EdgeInsets.only(top: 20, bottom: 21),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(37)),
                  minimumSize: Size(MediaQuery.of(context).size.width,
                      50) // put the width and height you want
                  ),
              child: const Text(
                'CONFIRM',
                style: TextStyle(color: Colors.white, letterSpacing: 0.33),
              ),
            ),
          )
        ],
      ),
    ),
    isDismissible: false,);
  }
}
