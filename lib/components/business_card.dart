import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:study_case_flutter/models/business.dart';

class BusinessCard extends StatelessWidget {
  final Business business;

  const BusinessCard({Key? key, required this.business}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: business.logoUrl.toString(),
                        imageBuilder: (context, imageProvider) => Card(
                            child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.scaleDown,),
                          ),
                        )),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              business.businessName.toString(),
                              textScaleFactor: 1.0,
                            ),
                            Text(
                              business.businessCategoryName.toString(),
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
  }
}
