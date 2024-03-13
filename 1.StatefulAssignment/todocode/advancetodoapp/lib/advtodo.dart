import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:advancetodoapp/advtodo.dart';
import "package:advancetodoapp/main.dart";
import 'package:advancetodoapp/connect.dart';

class Advancetodo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Advancetodostate();
  }
}

class Info {
  int? taskid;
  String? title;
  String? description;
  String? date;
  Info({this.taskid, this.title, this.description, this.date});

  Map<String, dynamic> infoMap() {
    return {'title': title, 'description': description, 'date': date};
  }

  // String toString() {
  //   return '''{'taskid':$taskid,'title':$title,'description':$description,'date':$date}''';
  // }
}

class _Advancetodostate extends State {
  @override
  // initState() {
  //   createdatabase();
  //   // getdata();
  //   print(obj2);
  //   super.initState();
  // }

  @override
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // List todolist = [];
  int isclicked = 0;

  int onPressed = 0;
  bool editask = false;
  // List<Info> information = [];

  void edit(Info obj) {
    titlecontroller.text = obj.title.toString();
    descriptioncontroller.text = obj.description.toString();
    datecontroller.text = obj.date.toString();
    showModalBottomSheet1(true, obj);
  }

  void insertdata() async {
    await getdata();
    print(await getdata());

    setState(() {});
  }

  void submit(bool edittask, Info? index) {
    if (titlecontroller.text.isNotEmpty &&
        datecontroller.text.isNotEmpty &&
        descriptioncontroller.text.isNotEmpty) {
      if (edittask == false) {
        // information.add(Info(
        //     title: titlecontroller.text,
        //     description: descriptioncontroller.text,
        //     date: datecontroller.text));

        setState(() {
          Info obj = Info(
              title: titlecontroller.text,
              description: descriptioncontroller.text,
              date: datecontroller.text);
          insertOrderData(obj);
          insertdata();
        });
      } else {
        index!.title = titlecontroller.text;
        index.description = descriptioncontroller.text;
        index.date = datecontroller.text;

        updateOrderData(index);
        setState(() {});
      }
    } else {
      return;
    }
  }

  void deletedata() async {
    obj2.clear();
    await getdata();
    setState(() {});
  }

  void showModalBottomSheet1(bool edittask, [Info? index]) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(height: 200, width: 200, "assets/img.png"),
                  Text(
                    "CREATE CARD",
                    style: GoogleFonts.cambo(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Title", style: GoogleFonts.cambo()),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 40,
                decoration: const BoxDecoration(),
                child: Form(
                  key: _formkey,
                  child: TextFormField(
                    controller: titlecontroller,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      label: Text("Title", style: GoogleFonts.cambo()),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Description", style: GoogleFonts.cambo()),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 70,
                decoration: const BoxDecoration(),
                child: TextFormField(
                    controller: descriptioncontroller,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      label: Text("Description", style: GoogleFonts.cambo()),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Date", style: GoogleFonts.cambo()),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 50,
                decoration: const BoxDecoration(),
                child: TextFormField(
                    controller: datecontroller,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.date_range),
                        label: Text("Date", style: GoogleFonts.cambo()),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onTap: () async {
                      DateTime? pickdate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2025),
                      );

                      String formatedDate =
                          DateFormat.yMMMd().format(pickdate!);

                      setState(() {
                        datecontroller.text = formatedDate;
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  width: 300,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ElevatedButton(
                      onPressed: () {
                        submit(edittask, index);
                        Navigator.of(context).pop();
                      },
                      child: Text("Submit",
                          style: GoogleFonts.cambo(fontSize: 20)))),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
        body: Column(
          children: [
            Container(
              height: 250,
              width: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0,
                    child: GestureDetector(
                      onTap: () {},
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 28,
                        width: 147,
                        child: Text(
                          "Good Morning",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        child: Text(
                          "Core2web",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color.fromRGBO(217, 217, 217, 1)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text('CREATE TO DO LIST'),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Container(
                        height: 300,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: obj2.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Slidable(
                                    closeOnScroll: true,
                                    endActionPane: ActionPane(
                                        extentRatio: 0.2,
                                        motion: const DrawerMotion(),
                                        children: [
                                          Expanded(
                                              child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    edit(obj2[index]);
                                                  });
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child:
                                                      Icon(Icons.edit_outlined),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await deleteOrderData(
                                                      obj2[index].taskid!);

                                                  setState(() {
                                                    print(obj2[index].taskid!);
                                                    deletedata();
                                                  });
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Icon(
                                                      Icons.delete_outline),
                                                ),
                                              )
                                            ],
                                          ))
                                        ]),
                                    child: Container(
                                      width: double.infinity,
                                      height: 90,
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          boxShadow: []),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 52,
                                              height: 52,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromRGBO(
                                                      217, 217, 217, 1)),
                                              child: const Image(
                                                  image: AssetImage(
                                                      "assets/img.png"))),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 13,
                                                  width: 237,
                                                  child: Text(
                                                    "${obj2[index].title}",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  )),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                  height: 28,
                                                  width: 235,
                                                  child: Text(
                                                    obj2[index].description!,
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                  color: Colors.white,
                                                  child: Text(
                                                    obj2[index].date!,
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 24, 103, 239),
          onPressed: () {
            setState(() {
              getdata();
              showModalBottomSheet1(editask);
              print(obj2);

              datecontroller.clear();
              titlecontroller.clear();
              descriptioncontroller.clear();
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
