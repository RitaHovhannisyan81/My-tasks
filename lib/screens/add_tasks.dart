import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/widgets/button_widget.dart';
import 'package:tasks/widgets/textfield_widget.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 10, right: 10),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/bgimg.jpg"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              SizedBox(
                height: 40,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                ),
              )
            ]),
            Column(
              children: [
                TextfieldWidget(
                  hintText: "Task name",
                  textController: nameController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextfieldWidget(
                  borderRadius: 15,
                  hintText: "Task detail",
                  textController: detailController,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  text: 'Add',
                  Backgroundcolor: Color.fromARGB(255, 34, 62, 109),
                  textColor: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
          ],
        ),
      ),
    );
  }
}
