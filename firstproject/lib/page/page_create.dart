import 'dart:io';

import 'package:firstproject/Model/StdData.dart';
import 'package:firstproject/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateForm extends StatefulWidget {
  @override
  State<CreateForm> createState() => InputForm();
}

class InputForm extends State<CreateForm> {
  final formKey = GlobalKey<FormState>();

  final schoolController = TextEditingController();
  final std_idController = TextEditingController();
  final sgradeController = TextEditingController();
  final teacherController = TextEditingController();
  final sf_nameController = TextEditingController();
  final sl_nameController = TextEditingController();
  final sn_nameController = TextEditingController();
  final sageController = TextEditingController();
  final pf_nameController = TextEditingController();
  final pl_nameController = TextEditingController();
  final prelationController = TextEditingController();
  final ptelController = TextEditingController();
  final _picker = ImagePicker();
  File? _image;
  late String stimage =
      '/data/user/0/com.example.firstproject/cache/image_picker9054554499036750680.jpg';
  // XFile? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              color: Color.fromARGB(255, 38, 24, 241).withOpacity(0.8),
              child: Text(
                "เพิ่มข้อมูลนักเรียน",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "ข้อมูลนักเรียน",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              height: 200,
                              width: 150,
                              color: Color.fromARGB(255, 223, 219, 219),
                              child: _image != null
                                  ? Image.file(_image!, fit: BoxFit.cover)
                                  : const Text(
                                      'Select  image',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                            ),
                            onTap: _openImagePicker),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 10)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: schoolController,
                              decoration:
                                  const InputDecoration(hintText: "โรงเรียน"),
                              validator: (String? str) {
                                if (str != null && str.isEmpty) {
                                  return "กรุณาป้อนข้อมูล";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: std_idController,
                              decoration: const InputDecoration(
                                  hintText: "รหัสนักเรียน"),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              validator: (String? str) {
                                if (str != null && str.isEmpty) {
                                  return "กรุณาป้อนข้อมูล";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: sgradeController,
                              decoration: const InputDecoration(
                                  hintText: "ระดับการศึกษา"),
                              validator: (String? str) {
                                if (str != null && str.isEmpty) {
                                  return "กรุณาป้อนข้อมูล";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: teacherController,
                              decoration: const InputDecoration(
                                  hintText: "ครูที่ปรึกษา"),
                              validator: (String? str) {
                                if (str != null && str.isEmpty) {
                                  return "กรุณาป้อนข้อมูล";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: sf_nameController,
                            decoration: const InputDecoration(hintText: "ชื่อ"),
                            validator: (String? str) {
                              if (str != null && str.isEmpty) {
                                return "กรุณาป้อนข้อมูล";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: sn_nameController,
                            decoration:
                                const InputDecoration(hintText: "ชื่อเล่น"),
                            validator: (String? str) {
                              if (str != null && str.isEmpty) {
                                return "กรุณาป้อนข้อมูล";
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                      const Padding(padding: EdgeInsets.only(left: 10)),
                      Expanded(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: sl_nameController,
                            decoration:
                                const InputDecoration(hintText: "นามสกุล"),
                            validator: (String? str) {
                              if (str != null && str.isEmpty) {
                                return "กรุณาป้อนข้อมูล";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: sageController,
                            decoration: const InputDecoration(hintText: "อายุ"),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            validator: (String? str) {
                              if (str != null && str.isEmpty) {
                                return "กรุณาป้อนข้อมูล";
                              }
                              return null;
                            },
                          ),
                        ],
                      ))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "ข้อมูลผู้ปกครอง",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: pf_nameController,
                            decoration: const InputDecoration(hintText: "ชื่อ"),
                            validator: (String? str) {
                              if (str != null && str.isEmpty) {
                                return "กรุณาป้อนข้อมูล";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: prelationController,
                            decoration:
                                const InputDecoration(hintText: "ความสัมพันธ์"),
                            validator: (String? str) {
                              if (str != null && str.isEmpty) {
                                return "กรุณาป้อนข้อมูล";
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                      const Padding(padding: EdgeInsets.only(left: 10)),
                      Expanded(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: pl_nameController,
                            decoration:
                                const InputDecoration(hintText: "นามสกุล"),
                            validator: (String? str) {
                              if (str != null && str.isEmpty) {
                                return "กรุณาป้อนข้อมูล";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: ptelController,
                            decoration:
                                const InputDecoration(hintText: "เบอร์โทร"),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            validator: (String? str) {
                              if (str != null && str.isEmpty) {
                                return "กรุณาป้อนข้อมูล";
                              }
                              return null;
                            },
                          ),
                        ],
                      ))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  SizedBox(
                    width: 400,
                    height: 60,
                    child: FlatButton(
                        child: const Text(
                          "เพิ่มข้อมูล",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        color:
                            Color.fromARGB(255, 38, 24, 241).withOpacity(0.7),
                        textColor: Colors.white,
                        onPressed: () {
                          print(stimage);
                          if (formKey.currentState!.validate()) {
                            StdData statement = StdData(
                                simage: stimage,
                                school: schoolController.text,
                                std_id: std_idController.text,
                                sgrade: sgradeController.text,
                                teacher: teacherController.text,
                                sf_name: sf_nameController.text,
                                sl_name: sl_nameController.text,
                                sn_name: sn_nameController.text,
                                sage: int.parse(sageController.text),
                                pf_name: pf_nameController.text,
                                pl_name: pl_nameController.text,
                                prelation: prelationController.text,
                                ptel: ptelController.text,
                                point: 0);
                            //call provider
                            var provider = Provider.of<TransactionProvider>(
                                context,
                                listen: false);
                            provider.addTransaction(statement);

                            Navigator.of(context, rootNavigator: true)
                                .pop(true);
                          }
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 140,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 15, 11, 231),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.arrow_left, color: Colors.white),
                          Text(
                            'ย้อนกลับ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        stimage = pickedImage.path;
        //  _pickedImage = pickedImage;
      });
    }
  }
}
