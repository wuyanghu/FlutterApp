import 'package:flutter/material.dart';
import 'package:flutterapp/examples/Model/WPChapterModel.dart';

class WPChaters extends StatefulWidget {
  @override
  _WPChatersState createState() => _WPChatersState();
}

class _WPChatersState extends State<WPChaters> {
  List<WPChapterModel> homeList = WPChapterModel.homeList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: homeList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            child: Padding(
              padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
              child: Container(
                // decoration:
                //     BoxDecoration(borderRadius: BorderRadius.all(10)),
                color: Colors.black12,
                child: Text(
                  homeList[index].title,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) =>
                        homeList[index].navigateScreen,
                  ));
            });
      },
    );
  }
}
