import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';


class DeviceInfo {
  static DeviceInfo? _instance;
  static DeviceInfo get getInstance => _instance ??= DeviceInfo();

Future<void> getDeviceInfo() async {
  final deviceInfoPlugin = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    print("Device Name: ${androidInfo.model}");
    print("Device ID: ${androidInfo.id}");
    print("Android Version: ${androidInfo.version.release}");

  //  await LocalDataStorage.getInstance.insertDeviceInformation(deviceID: androidInfo.id);
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    print("Device Name: ${iosInfo.name}");
    print("Device ID: ${iosInfo.identifierForVendor}");
    print("iOS Version: ${iosInfo.systemVersion}");
    // await LocalDataStorage.getInstance.insertDeviceInformation(deviceID: iosInfo.identifierForVendor.toString());
  } else {
    print("Unsupported Platform");
  }
}

}
