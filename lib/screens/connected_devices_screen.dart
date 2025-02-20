
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:tasks/controller/blue_controller.dart';
// void main() {
//   runApp(const ConnectedDevices());
// }
// class ConnectedDevices extends StatefulWidget {
//   const ConnectedDevices({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Connected Devices',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//     );
//   }
// }
class ConnectedDevices extends StatefulWidget {
  const ConnectedDevices({super.key});
  @override
  State<ConnectedDevices> createState() => _ConnectedDevices();
}
class _ConnectedDevices extends State<ConnectedDevices> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
        appBar: AppBar(title: Text("Connected Devices"),),
        body: GetBuilder<BluController>(
          init: BluController(),
          builder: (BluController controller)
          {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<List<ScanResult>>(
                      stream: controller.scanResults,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final data = snapshot.data![index];
                                  return Card(
                                    elevation: 2,
                                    child: ListTile(
                                      title: Text(data.device.name),
                                      subtitle: Text(data.device.id.id),
                                      trailing: Text(data.rssi.toString()),
                                      onTap: ()=> controller.connectToDevice(data.device),
                                    ),
                                  );
                                }),
                          );
                        }else{
                          return Center(child: Text("No Device Found"),);
                        }
                      }),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: ()  async {
                    controller.scanDevices();
                  }, child: Text("SCAN")),
                ],
              ),
            );
          },
        )
    );
  }
}
