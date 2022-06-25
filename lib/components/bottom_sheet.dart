import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetComponent extends StatelessWidget {
  BottomSheetComponent({Key? key}) : super(key: key);

  final dummy = [
    {"paramCode": "1", "paramName": "Ritel"},
    {"paramCode": "2", "paramName": "F&B"},
    {"paramCode": "3", "paramName": "Laundry"},
    {"paramCode": "4", "paramName": "Mekanik & Jasa"},
    {"paramCode": "5", "paramName": "Jasa"},
    {"paramCode": "6", "paramName": "Agrikultur"},
    {"paramCode": "7", "paramName": "Beauty Care"},
    {"paramCode": "8", "paramName": "Pendidikan"},
    {"paramCode": "9", "paramName": "Teknologi"}
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var spacing = size.height / 25;
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
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: dummy.length,
                              itemBuilder: (BuildContext context, int index) {
                                return IntrinsicHeight(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(dummy[index]["paramName"].toString()),
                                    IconButton(
                                        onPressed: () => {},
                                        icon: const Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.blue,
                                        ))
                                  ],
                                ));
                              }))
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
