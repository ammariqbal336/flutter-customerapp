import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';



class GeneralController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  var isDataLoading = false.obs;
  //final dateFormat = DateFormat('dd-MMM-yyyy');
  late StreamSubscription<InternetConnectionStatus> subscription;
  RxBool isDeviceConnected = false.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  onInit() {
    super.onInit();
    getConnectivity();
  }

  showSnackbarError(String title, String msg) {
    Get.snackbar(title, msg,
        isDismissible: true,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }

  showSnackbarSuccess(String title, String msg) {
    Get.snackbar(title, msg,
        isDismissible: true,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }

  // showShortToast(String name) {
    
  //   Fluttertoast.showToast(
  //       msg: name, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 2);
  // }

 
  @override
  onDispose() {
    
    subscription.cancel();
    super.dispose();
  }

  getConnectivity() async {
    final connectionChecker = InternetConnectionChecker();
  isDeviceConnected.value = await connectionChecker.hasConnection;
   subscription = connectionChecker.onStatusChange.listen(
    (InternetConnectionStatus status) async{
       isDeviceConnected.value =
            status == InternetConnectionStatus.connected;
      if (status == InternetConnectionStatus.connected) {
          print('Connected to the internet');
      } else {
        print('Disconnected from the internet');
      }
    },
  );

  }

  
  clearSharedPref() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    //Get.offAndToNamed(Constants.loginScreen);
  }
  
  @override
  void onDetached() {
  }
  
  @override
  void onHidden() {
  }
  
  @override
  void onInactive() {
  }
  
  @override
  void onPaused() {
  }
  
  @override
  void onResumed() {
  }

}
