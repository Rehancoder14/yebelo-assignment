import "package:assignment/helper/constant.dart";
import "package:flutter/material.dart";

class ItemWidget extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final int price;

  const ItemWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

int total = 0;
int value = 1;
bool isOn = false;
TextEditingController quantityController = TextEditingController();

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 100,
    //   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
    //   child: Card(
    //     shape: const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(20))),
    //     elevation: 5,
    //     child: ListTile(
    //       leading: SizedBox(
    //         height: 90,
    //         width: 90,
    //         child: Image.asset("$image"),
    //       ),
    //       title: Text(name),
    //       subtitle: Text(description),
    //       trailing: Column(
    //         children: [
    //           Text(
    //             "Rs $price",
    //             style: TextStyle(
    //                 color: colorblue,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 18),
    //           ),
    //           GestureDetector(
    //             onTap: () {},
    //             child: Container(
    //               height: 30,
    //               width: 50,
    //               decoration: BoxDecoration(
    //                   color: colorblue,
    //                   borderRadius:
    //                       const BorderRadius.all(Radius.circular(20))),
    //               child: Center(
    //                 child: Text(
    //                   "BUY",
    //                   style: buttontextstyle,
    //                 ),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 5,
        child: ListTile(
          leading: SizedBox(
            height: 90,
            width: 90,
            child: Image.asset(widget.image),
          ),
          title: Text(widget.name),
          subtitle: Text(widget.description),
          trailing: Column(
            children: [
              Text(
                "Rs ${widget.price}",
                style: TextStyle(
                    color: colorblue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    total = widget.price;
                  });
                  showBuyDialog(context, widget.price, widget.name,
                      widget.image, widget.description);
                },
                child: Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                      color: colorblue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      "BUY",
                      style: buttontextstyle,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showBuyDialog(BuildContext context, int cost, String name, String image,
      String description) {
    return showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.zero,
          content: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 50,
                      child: Image.asset(image),
                    ),
                    Text(name),
                    SizedBox(
                      height: 5,
                    ),
                    Text(description),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Rs " + cost.toString()),
                    const Text(
                      "Buy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isOn = !isOn;
                          });
                        },
                        child: Text(isOn ? "Enter Manually" : "use button")),
                    isOn
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    value++;
                                    total = cost * value;
                                  });
                                },
                                child: Card(
                                  elevation: 1,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(Icons.add),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('$value'),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (value <= 0) {
                                    setState(() {
                                      value = 0;
                                      total = cost * value;
                                    });
                                  } else {
                                    setState(() {
                                      value--;
                                      total = cost * value;
                                    });
                                  }
                                },
                                child: Card(
                                  elevation: 1,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(Icons.remove),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : TextFormField(
                            minLines: 1,
                            keyboardType: TextInputType.number,
                            controller: quantityController,
                            // autofillHints: [AutofillHints.postalCode],

                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  fontFamily: "productSansReg",
                                  color: colorblue,
                                  backgroundColor: colorwhite),
                              label: Text(
                                "Enter quantity",
                              ),
                              floatingLabelStyle: TextStyle(
                                color: colorblue,
                                fontSize: 22,
                              ),
                              alignLabelWithHint: true,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              contentPadding: EdgeInsets.only(
                                  left: 15, top: 15, bottom: 15),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                  borderSide: BorderSide(color: colorblue)),
                              filled: true,
                              fillColor: colorwhite,
                            ),
                            style: TextStyle(fontFamily: "googlesansreg"),
                            cursorColor: colorblue,
                            cursorHeight: 24,
                            onChanged: (value) {
                              int num = int.parse(value);
                              setState(() {
                                total = cost * num;
                              });
                            },
                          ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Buy Rs $total",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "productSansReg"),
                      ),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor:
                              MaterialStateProperty.all(colorgreen),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(horizontal: 25.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ))),
                    )
                  ],
                ),
              ),
              PositionedDirectional(
                top: 0.0,
                end: 0.0,
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.13,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(36)),
                      color: Color.fromRGBO(40, 172, 227, 5)),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
