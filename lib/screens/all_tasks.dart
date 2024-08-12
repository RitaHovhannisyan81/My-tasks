import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/widgets/button_widget.dart';
import 'package:tasks/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = ["Try harder", "Try smarter"];

    final leftEditIcon = Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Color(0xff2e3253),
      child: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );

    final rightEditIcon = Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
            height: MediaQuery.of(context).size.height / 3.2,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/bgimg.jpg"))),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.calendar_month,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "2",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                )
              ],
            ),
          ),
          Flexible(
              child: ListView.builder(
            itemCount: myData.length,
            itemBuilder: (context, index) {
              return Dismissible(
                  background: leftEditIcon,
                  secondaryBackground: rightEditIcon,
                  onDismissed: (DismissDirection directon) {
                    print("after dismiss");
                  },
                  confirmDismiss: (DismissDirection directon) async {
                    if (directon == DismissDirection.startToEnd) {
                      showModalBottomSheet(
                        backgroundColor:Colors.transparent,
                        barrierColor: Colors.transparent,
                          context: context,
                          builder: (_) {
                            return Container(
                              height: 550,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                                color: Color(0xFF2e3253).withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  ButtonWidget(
                                    Backgroundcolor:Color.fromARGB(255, 34, 62, 109),
                                    text: "View",textColor:Colors.white ,),
                                   SizedBox(height: 20,),
                                   ButtonWidget(
                                    Backgroundcolor:Color.fromARGB(255, 34, 62, 109),
                                    text: "Edit",textColor:Colors.white ,)
                                ],),
                              ),
                            );
                          });
                      return false;
                    } else {
                      return Future.delayed(Duration(seconds: 1),
                          () => directon == DismissDirection.endToStart);
                    }
                  },
                  key: ObjectKey(index),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: TaskWidget(
                      text: myData[index],
                      color: Colors.blueGrey,
                    ),
                  ));
            },
          ))
        ],
      ),
    );
  }
}
