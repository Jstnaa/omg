
// ignore_for_file: file_names

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  // ignore: non_constant_identifier_names
  static FirebaseOptions get current_Platform {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:972804766636:ios:64698bb2e387ea2ece5809',
        apiKey: 'AIzaSyAyt9tL-j4OHGZfaA6rvoaJ7auzJgCGzH8',
        projectId: 'cjf-computer-parts',
        messagingSenderId: '972804766636',
        iosBundleId: 'com.example.eCommerce',
      );
    } else {
      // Android
       return const FirebaseOptions(
        appId: '1:972804766636:android:cab3d1b5493e377fce5809',
        apiKey: 'AIzaSyDNNvml0BrWa3gKwWEsV0FOoEDrl4CtmTs',
        projectId: 'cjf-computer-parts',
        messagingSenderId: '615216659452',
       );
    }
  }
}