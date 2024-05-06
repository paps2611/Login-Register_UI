// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDxMi5rzUItoZtIfFsk4xokIQxpRyrmw84',
    appId: '1:673812434871:web:26b1436a99de115f60a232',
    messagingSenderId: '673812434871',
    projectId: 'loginpage-c1e79',
    authDomain: 'loginpage-c1e79.firebaseapp.com',
    storageBucket: 'loginpage-c1e79.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBc8EdoV9W_n5gsNzbstHEDlVOPlcderMs',
    appId: '1:673812434871:android:2c911697eec33af360a232',
    messagingSenderId: '673812434871',
    projectId: 'loginpage-c1e79',
    storageBucket: 'loginpage-c1e79.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-ZPrA0dp-EPRek-mJIR1iAxledG6oCRc',
    appId: '1:673812434871:ios:4179fb7fc26abdd860a232',
    messagingSenderId: '673812434871',
    projectId: 'loginpage-c1e79',
    storageBucket: 'loginpage-c1e79.appspot.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-ZPrA0dp-EPRek-mJIR1iAxledG6oCRc',
    appId: '1:673812434871:ios:f5466618e52011ad60a232',
    messagingSenderId: '673812434871',
    projectId: 'loginpage-c1e79',
    storageBucket: 'loginpage-c1e79.appspot.com',
    iosBundleId: 'com.example.login.RunnerTests',
  );
}