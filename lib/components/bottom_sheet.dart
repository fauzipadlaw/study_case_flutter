import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/home_controller.dart';

class BottomSheetComponent extends GetView<HomeController> {
  const BottomSheetComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var spacing = size.height / 25;
    var checked = [];
    return BottomSheet(
      onClosing: () => {},
      builder: (BuildContext context) {
        return Column(
          children: [
            SizedBox(
              width: size.width / 4,
              child: const Divider(
                thickness: 5,
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: size.height / 2,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Filter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      const Text(
                        "Kategori Bisnis",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.grey),
                      ),
                      Expanded(
                          child: Obx(() => ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.categories.length,
                              itemBuilder: (BuildContext context, int index) {
                                return IntrinsicHeight(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(controller.categories[index].name),
                                    IconButton(
                                        onPressed: () {
                                          String code =
                                              controller.categories[index].code;
                                          if (controller.listCategory
                                              .contains(code)) {
                                            controller.listCategory
                                                .remove(code);
                                          } else {
                                            controller.listCategory.add(code);
                                          }
                                        },
                                        icon: Obx(() => Icon(
                                              Icons.check_circle_rounded,
                                              color:
                                                  controller.isCheckedCategory(
                                                          controller
                                                              .categories[index]
                                                              .code)
                                                      ? Colors.blue
                                                      : Colors.grey,
                                            )))
                                  ],
                                ));
                              }))),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          minimumSize: const Size.fromHeight(
                              40), // fromHeight use double.infinity as width and 40 is the height
                        ),
                        onPressed: () {
                          controller.fetchBusiness();
                          Get.back();
                        },
                        child: Text('Terapkan'),
                      )
                    ],
                  ),
                )),
          ],
        );
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      enableDrag: true,
    );
  }
}
