import 'dart:developer';

import 'package:assignment/helper/constant.dart';
import 'package:assignment/helper/heroroute.dart';
import 'package:assignment/model/model.dart';
import 'package:assignment/view/widgets/itemwidget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var username;
  MyHomePage({
    Key? key,
    this.username,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    try {
      final catalogjson =
          await rootBundle.loadString("assets/files/jsonfile.json");
      log("!!" + catalogjson);
      var decodedata = jsonDecode(catalogjson);

      CatelogModel.items = List.from(decodedata['products'])
          .map<Items>((item) => Items.fromMap(item))
          .toList();

      setState(() {});
    } catch (e) {
      log("Error loading data: $e");
      // Handle the error here
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(
          context,
          HeroDialogRoute(builder: (context) => const ExitWarning()),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                context,
                HeroDialogRoute(builder: (context) => const ExitWarning()),
              );
            },
          ),
          title: Text(
            "Home page",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
          ),
          flexibleSpace: Container(
            height: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: Image.asset(
              "assets/appbar.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: CatelogModel.items.length,
              itemBuilder: (context, index) {
                final item = CatelogModel.items[index];

                return ItemWidget(
                  image: item.image!,
                  name: item.name!,
                  description: item.description != null
                      ? item.description!
                      : "No Description",
                  price: item.price!,
                );
              }),
        ),
      ),
    );
  }
}

class ExitWarning extends StatelessWidget {
  const ExitWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 100,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Column(children: [
            const Expanded(
              child: Text("Do you really want to exit from the app",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                      style: TextStyle(
                        fontSize: 18,
                        color: colorblue,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        fontSize: 18,
                        color: colorblue,
                      ),
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
