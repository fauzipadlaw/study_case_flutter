import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_case_flutter/components/app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(title: "Daftar Bisnis", height: 50.0,));
  }
}
