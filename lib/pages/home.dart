import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_case_flutter/components/app_bar.dart';
import 'package:study_case_flutter/components/filter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dummy = [
      {
        "id": 2,
        "logo": "040f3df1b4da4a638045d5c93186bbb4.jpeg",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/040f3df1b4da4a638045d5c93186bbb4.jpeg",
        "businessName": "Dawet Kemayu",
        "businessCategoryName": "F&B",
        "businessCategoryId": "2",
        "businessCore": "Restoran"
      },
      {
        "id": 3,
        "logo": "adb3681f3a7d41de8e5981c9081fdf77.jpeg",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/adb3681f3a7d41de8e5981c9081fdf77.jpeg",
        "businessName": "Bakso Rusuk Sunangiri",
        "businessCategoryName": "F&B",
        "businessCategoryId": "2",
        "businessCore": "Restoran"
      },
      {
        "id": 4,
        "logo": "d84c7ae231544b89824bffd450c2df8a.jpeg",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/d84c7ae231544b89824bffd450c2df8a.jpeg",
        "businessName": "Zenbu",
        "businessCategoryName": "F&B",
        "businessCategoryId": "2",
        "businessCore": "Restoran"
      },
      {
        "id": 5,
        "logo": "14f99568cf4543ddbd5e6000c146f404.jpeg",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/14f99568cf4543ddbd5e6000c146f404.jpeg",
        "businessName": "Hasanah Pancawangi Agro Indonesia",
        "businessCategoryName": "Agrikultur",
        "businessCategoryId": "6",
        "businessCore": "Perikanan"
      },
      {
        "id": 6,
        "logo": "d20c9bbec686431fb25b8546a5f79cc3.jpeg",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/d20c9bbec686431fb25b8546a5f79cc3.jpeg",
        "businessName": "Alba Prima Industri Tambang Batubara",
        "businessCategoryName": "Jasa",
        "businessCategoryId": "5",
        "businessCore": "Tambang Batubara"
      },
      {
        "id": 7,
        "logo": "2b44bff510184ca5af5f20a760acb1ee.jpeg",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/2b44bff510184ca5af5f20a760acb1ee.jpeg",
        "businessName": "SPBU Pertamina",
        "businessCategoryName": "Jasa",
        "businessCategoryId": "5",
        "businessCore": "SPBU"
      },
      {
        "id": 8,
        "logo": "51fbded956994a90a11d9c0a7668f857.jpeg",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/51fbded956994a90a11d9c0a7668f857.jpeg",
        "businessName": "Balaraja Distributor Bahan Bangunan Baja Ringan",
        "businessCategoryName": "Mekanik & Jasa",
        "businessCategoryId": "4",
        "businessCore": "Bahan Bangunan"
      },
      {
        "id": 9,
        "logo": "f35e4875da9d49cfa2d4151f8db33137.jpeg",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/f35e4875da9d49cfa2d4151f8db33137.jpeg",
        "businessName": "Galura",
        "businessCategoryName": "Teknologi",
        "businessCategoryId": "9",
        "businessCore": "Teknologi Informasi"
      },
      {
        "id": 10,
        "logo": "f9486e74cecd48678a00602af41ebf1e.jpeg",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/f9486e74cecd48678a00602af41ebf1e.jpeg",
        "businessName": "Megacon Precast",
        "businessCategoryName": "Jasa",
        "businessCategoryId": "5",
        "businessCore": "Infrastruktur"
      },
      {
        "id": 11,
        "logo": "46cf2044f35a4e3080664afffcc2cd0b.png",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/46cf2044f35a4e3080664afffcc2cd0b.png",
        "businessName": "Mazhak",
        "businessCategoryName": "Jasa",
        "businessCategoryId": "5",
        "businessCore": "Mekanik"
      },
      {
        "id": 12,
        "logo": "2be0e06cd07e4254952d8cfdacc94ae4.png",
        "logoUrl":
            "https://storage.googleapis.com/bizhare-file/2be0e06cd07e4254952d8cfdacc94ae4.png",
        "businessName": "Qomunitas Petani Satu",
        "businessCategoryName": "Agrikultur",
        "businessCategoryId": "6",
        "businessCore": "Pertanian"
      }
    ];
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
              const SizedBox(height: 20,),
              Expanded(
                  child: ListView.builder(
                      itemCount: dummy.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 2.0,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: dummy[index]["logoUrl"]
                                                .toString(),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Card(
                                                        child: Container(
                                              width: 80.0,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            Colors.red,
                                                            BlendMode
                                                                .colorBurn)),
                                              ),
                                            )),
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  dummy[index]["businessName"]
                                                      .toString(),
                                                  textScaleFactor: 1.0,
                                                ),
                                                Text(
                                                  dummy[index][
                                                          "businessCategoryName"]
                                                      .toString(),
                                                  textScaleFactor: 1.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
            ],
          )),
    );
  }
}
