import 'package:flutter/material.dart';

import 'notification_details_screen.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static void openDetails(String payload) {
    key.currentState?.push(
      MaterialPageRoute(
        builder: (context) => NotificationDetailsScreen(payload: payload),
      ),
    );
  }
}