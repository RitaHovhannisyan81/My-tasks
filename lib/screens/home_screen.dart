import 'package:flutter/material.dart';
import 'package:tasks/screens/add_tasks.dart';
import 'package:tasks/screens/all_tasks.dart';
import 'package:tasks/screens/connected_devices_screen.dart';
import 'package:tasks/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Hello",
                style: TextStyle(
                  color: const Color.fromARGB(255, 16, 25, 41),
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text: "\nStart your beautiful day",
                      style: TextStyle(
                          color: Color.fromARGB(255, 34, 62, 109),
                          fontSize: 14,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => ConnectedDevices (),
                transition: Transition.zoom,duration: Duration(seconds: 1));
              },
              child: ButtonWidget(
                text: "Connected Devices",
                Backgroundcolor: Color.fromARGB(255, 34, 62, 109),
                textColor: Color.fromARGB(255, 231, 234, 238),
              ),
            ),


            SizedBox(
            height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AddTasks(),
                transition: Transition.zoom,duration: Duration(seconds: 1));
              },
              child: ButtonWidget(
                text: "Add Task",
                Backgroundcolor: Color.fromARGB(255, 34, 62, 109),
                textColor: Color.fromARGB(255, 231, 234, 238),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AllTasks(),
                transition: Transition.zoom,duration: Duration(seconds: 1));
              },
              child: ButtonWidget(
                text: "View All",
                Backgroundcolor: Color.fromARGB(255, 229, 231, 235),
                textColor: Color.fromARGB(255, 84, 121, 185),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/bglight.jpg"))),
      ),
    );
  }
}
