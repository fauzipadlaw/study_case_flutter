import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:study_case_flutter/components/app_bar.dart';
import 'package:study_case_flutter/components/business_card.dart';
import 'package:study_case_flutter/components/filter.dart';

import '../controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Daftar Bisnis",
        height: 50.0,
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const FilterComponent(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Obx(() => ListView.builder(
                      itemCount: controller.businessList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BusinessCard(
                            business: controller.businessList[index]);
                      }))),
            ],
          )),
    );
  }
}
