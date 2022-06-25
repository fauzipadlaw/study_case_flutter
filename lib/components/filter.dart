import 'package:flutter/material.dart';

class FilterComponent extends StatelessWidget {
  const FilterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
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
        TextButton(
          onPressed: () {  },
          child: Text("Kategori"),
        )
      ],
    );
  }
}
