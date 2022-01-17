import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pricing/app/modules/home/home_controller.dart';
import 'package:pricing/app/modules/home/local_widget/select_plugs_widget.dart';
import 'package:pricing/app/modules/home/local_widget/select_widget.dart';
import 'package:pricing/app/theme/color.dart';

Widget divider = Divider(
  color: backgroundColor,
  height: 1,
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, w );
    final Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeControler>(
      builder: (_) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/back_black.svg',
                  color: blueBlueTwo,
                  height: 14,
                  width: 14,
                  placeholderBuilder: (BuildContext context) =>
                      const CircularProgressIndicator(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text('Update prices',
                  style: TextStyle(
                      color: blueBlueTwo, fontSize: 17, letterSpacing: -0.41)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Container(
                width: size.width,
                height: 96,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Copec Voltex’s Ultra-Fast',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Los Angeles Sur',
                        style: TextStyle(fontSize: 28),
                      ),
                      Text(
                        'Ruta 5 Sur KM 518.5, Los Ángeles, Chile',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => SelectWidget(
                          flatStyle: _.payType,
                          onPressed: _.onChangeSeletionPayType,
                          optionTitle1: "Paid",
                          optionTitle2: "Free",
                          title: 'Type',
                        ),
                      ),
                      divider,
                      const SelectWidget(
                        title: 'Currency',
                        value: 'CLP',
                      ),
                      divider,
                      const SelectWidget(
                        title: 'Price',
                        value: '\$0',
                      ),
                      divider,
                      Obx(
                        () => SelectWidget(
                          flatStyle: _.unitType,
                          onPressed: _.onChangeSeletionUnitType,
                          optionTitle1: "kWh",
                          optionTitle2: "Minute",
                          title: 'Unit',
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 60,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'PLUGS',
                        style: TextStyle(fontSize: 12),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: _.onChangeSelectAll,
                        child: Text(
                          'Select All',
                          style: TextStyle(
                            fontSize: 12,
                            color: blueBlueTwo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: Obx(
                  () => Column(
                    children: [
                      SelectPlugsWidget(
                        imageSVG: 'assets/ac_mennekes_type_2_eu.svg',
                        selectPlugs:
                            _.selectAll || _.selectType2 ? true : false,
                        title: 'Type 2',
                        value: '43 kw',
                        onTap: _.onChangeSelectType2,
                      ),
                      divider,
                      SelectPlugsWidget(
                        imageSVG: 'assets/ac_ccs_2_eu.svg',
                        selectPlugs: _.selectAll || _.selectCCS ? true : false,
                        title: 'CCS',
                        value: '50 kw',
                        onTap: _.onChangeSelectCCS,
                      ),
                      divider,
                      SelectPlugsWidget(
                        imageSVG: 'assets/dc_ch_ade_mo_japan.svg',
                        selectPlugs:
                            _.selectAll || _.selectCHAdeMO ? true : false,
                        title: 'CHAdeMO',
                        value: '50 kw',
                        onTap: _.onChangeSelectCHAdeMO,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                height: 60,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: Text(
                  'HOURS',
                  style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xff000000).withOpacity(.6)),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Obx(
                  ()=> Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => _.showDatePicker(context, 0),
                        child: SelectWidget(
                          title: _.openingDate,
                          value: 'Any time',
                        ),
                      ),
                      divider,
                      InkWell(
                        onTap: () => _.showDatePicker(context,1),
                        child: SelectWidget(
                          title: _.closingDate,
                          value: 'Any time',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                child: Obx(
                  ()=> ElevatedButton(
                    onPressed: _.selectType2 || _.selectCCS || _.selectCHAdeMO? (){} : null,
                    style: ElevatedButton.styleFrom(
                        primary: bloodOrange,
                        padding: const EdgeInsets.only(top: 28, bottom: 26),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(37)),
                        minimumSize: Size(MediaQuery.of(context).size.width,
                            50) // put the width and height you want
                        ),
                    child: const Text(
                      'Add pricing',
                      style: TextStyle(
                        fontSize: 16.8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
