import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BluController extends GetxController {
  FlutterBlue blu = FlutterBlue.instance;

  Future scanDevices() async {
    if (await Permission.bluetoothScan.request().isGranted) {
      if (await Permission.bluetoothConnect.request().isGranted) {
        blu.startScan(timeout: Duration(seconds: 15));

        blu.stopScan();
      }
    }
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    print(device);
    await device.connect(timeout: Duration(seconds: 15));

    device.state.listen((isConnected) {
      if (isConnected == BluetoothDeviceState.connecting) {
        print("Device connecting to :${device.name}");
      } else if (isConnected == BluetoothDeviceState.connected) {
        print("Device connected: ${device.name}");
      } else {
        print("Divice Disconnected");
      }
    });
  }

  Stream<List<ScanResult>> get scanResults => blu.scanResults;
}
