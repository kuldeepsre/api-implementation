import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }
class ScreenSizeUtils {
  // Method to get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Method to get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Method to get screen aspect ratio
  static double getAspectRatio(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width / size.height;
  }

  // Method to determine device type
  static DeviceType getDeviceType(BuildContext context) {
    final width = getScreenWidth(context);

    if (width >= 1200) {
      return DeviceType.desktop;
    }
    else if (width >= 600) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }

  // Method to check if the device is mobile
  static bool isMobile(BuildContext context) {
    return getDeviceType(context) == DeviceType.mobile;
  }

  // Method to check if the device is tablet
  static bool isTablet(BuildContext context) {
    return getDeviceType(context) == DeviceType.tablet;
  }

  // Method to check if the device is desktop
  static bool isDesktop(BuildContext context) {
    return getDeviceType(context) == DeviceType.desktop;
  }
}
