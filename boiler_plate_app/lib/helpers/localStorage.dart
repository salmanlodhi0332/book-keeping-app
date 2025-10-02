import 'package:boiler_plate_app/helpers/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';



import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStorage extends GetxController {
  static LocalDataStorage? _instance;
  static LocalDataStorage get getInstance => _instance ??= LocalDataStorage();
  late SharedPreferences _pref;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   static Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  static RxString fcmToken = ''.obs;
  static RxString deviceID = ''.obs;
  static RxString accessToken = ''.obs;
  static RxString isFirstvisit = ''.obs;
  // Individual RxString variables for user attributes
  static RxString userId = "".obs;
  static RxString userName = ''.obs;
  static RxString userEmail = ''.obs;
  static RxString userPhoneNumber = ''.obs;
  static RxString userProfileImageUrl = ''.obs;
  static RxString authType = ''.obs;
  static RxString Usertype = ''.obs;
  static RxString isSubscribedpackage = ''.obs;
  static RxBool isfreetrialOver = false.obs;
  static RxInt chat_id = 0.obs;
  static RxString languageIndex = "4".obs;

//   Future<void> insertUserData(UserModel userData) async {
//     final SharedPreferences prefs = await _prefs;

//     await prefs.setString('id', userData.id.toString());
//     await prefs.setString('username', userData.username);
//     await prefs.setString('email', userData.email);
//     await prefs.setString('phone_number', userData.phoneNumber);
//     await prefs.setString('authentication_type', userData.authenticationType);
//     await prefs.setString('create_date', userData.createDate.toIso8601String());
//     await prefs.setString('last_login', userData.lastLogin.toIso8601String());

//     if (userData.profileImageUrl != null) {
//       await prefs.setString('profile_image_url',
//           "${Constants.BaseUrl}/${userData.profileImageUrl}");
//     }
//     if (userData.usertype != null) {
//       await prefs.setString('usertype', userData.usertype!);
//     }

//     userId.value = userData.id.toString();
//     userName.value = userData.username;
//     userEmail.value = userData.email;
//     userPhoneNumber.value = userData.phoneNumber;
//     authType.value = userData.authenticationType;
//     Usertype.value = userData.usertype ?? '';
//     userProfileImageUrl.value =
//         "${Constants.BaseUrl}/${userData.profileImageUrl}" ?? '';
//   }

  insertDeviceInformation(
      {
      // required String fcmToken,
      required String deviceID}) async {
    final SharedPreferences prefs = await _prefs;
    // await prefs.setString('fcmToken', fcmToken);
    await prefs.setString('deviceID', deviceID);

    // LocalDataStorage.fcmToken.value = fcmToken;
    LocalDataStorage.deviceID.value = deviceID;
  }

  setAccessToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('accessToken', token);

    accessToken.value = token;
  }

  setlanguagevoice(int index) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('languageIndex', index.toString());

    languageIndex.value = index.toString();
  }

  setuserType(String userType) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('usertype', userType);

    Usertype.value = userType;
  }

  setisSubscribe(String isSubscribed) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('isSubscribed', isSubscribed);

    isSubscribedpackage.value = isSubscribed;
  }

  setfreetrialOver(String freetrialOver) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('isfreetrialOver', freetrialOver);

    isfreetrialOver.value = freetrialOver == 'true' ? true : false;
  }

  updateUserData(String name, String phone, String? profileImageUrl) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.setString('username', name);
    await prefs.setString('phone_number', phone);

    if (profileImageUrl != '' && profileImageUrl != null) {
      await prefs.setString('profile_image_url', profileImageUrl);
      userProfileImageUrl.value =
          "${Constants.BaseUrl}/${profileImageUrl}" ?? '';
    }

    userName.value = name;
    userPhoneNumber.value = phone;
  }

  setfirstVisit() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('isfirstvisit', 'yes');
    isFirstvisit.value = 'yes';
  }

  Future<void> getUserData() async {
    final SharedPreferences prefs = await _prefs;

    final String id = prefs.getString('id') ?? "";
    final String username = prefs.getString('username') ?? '';
    final String email = prefs.getString('email') ?? '';
    final String phoneNumber = prefs.getString('phone_number') ?? '';
    final String authTypeString = prefs.getString('authentication_type') ?? '';
    final String createDateString = prefs.getString('create_date') ?? '';
    final String lastLoginString = prefs.getString('last_login') ?? '';
    final String? profileImageUrl = prefs.getString('profile_image_url');
    final String? Token = prefs.getString('accessToken');
    final String firstVisit = prefs.getString('isfirstvisit') ?? '';
    final String usertype = prefs.getString('usertype') ?? '';
    final String isSubscribed = prefs.getString('isSubscribed') ?? '';
    final String freetrialOver = prefs.getString('isfreetrialOver') ?? '';
    final String langIndex = prefs.getString('languageIndex') ?? '';

    isFirstvisit.value = firstVisit;

    if (id != 0 && username.isNotEmpty && email.isNotEmpty) {
    //   final user = UserModel(
    //     id: int.parse(id),
    //     username: username,
    //     email: email,
    //     phoneNumber: phoneNumber,
    //     profileImageUrl: profileImageUrl,
    //     authenticationType: authTypeString,
    //     createDate: DateTime.tryParse(createDateString) ?? DateTime.now(),
    //     lastLogin: DateTime.tryParse(lastLoginString) ?? DateTime.now(),
    //   );

      // Assign to observable fields
    //   userId.value = user.id.toString();
    //   userName.value = user.username;
    //   userEmail.value = user.email;
    //   userPhoneNumber.value = user.phoneNumber;
    //   userProfileImageUrl.value = user.profileImageUrl ?? '';
    //   authType.value = user.authenticationType;
    //   accessToken.value = Token ?? "";
    //   currentUser.value = user;
    //   Usertype.value = usertype;
    //   isSubscribedpackage.value = isSubscribed;
    //   isfreetrialOver.value = freetrialOver == 'true' ? true : false;
    //   languageIndex.value = langIndex.toString();
      print("token:${accessToken.value}");
    }
  }

  logout() async {
    final SharedPreferences prefs = await _prefs;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();


    // currentUser.value = null;
    userId.value = "";
    userName.value = '';
    userEmail.value = '';
    userProfileImageUrl.value = '';
    fcmToken.value = '';
    deviceID.value = '';
    accessToken.value = '';
  }
}
