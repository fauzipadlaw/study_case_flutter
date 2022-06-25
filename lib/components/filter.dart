import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:study_case_flutter/components/bottom_sheet.dart';
import 'package:study_case_flutter/controllers/home_controller.dart';

class FilterComponent extends StatelessWidget {
  const FilterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 55,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
                child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Cari nama bisnis",
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            )),
            const SizedBox(
              width: 20,
            ),
            GetBuilder<HomeController>(builder: (controller) {
              return ElevatedButton.icon(
                onPressed: () {
                  if (controller.categories.isEmpty) {
                    controller.fetchCategories();
                  }
                  Get.bottomSheet(const BottomSheetComponent());
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            side: BorderSide(color: Colors.black)))),
                label: const Text(
                  "Kategori",
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(
                  Icons.folder_open,
                  color: Colors.black,
                ),
              );
            }),
          ],
        ));
  }
}
