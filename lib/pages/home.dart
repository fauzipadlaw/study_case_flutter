import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_case_flutter/components/app_bar.dart';
import 'package:study_case_flutter/components/filter.dart';

class Home extends StatelessWidget {
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
            children: const [
              FilterComponent(),
            ],
          )),
    );
  }
}
