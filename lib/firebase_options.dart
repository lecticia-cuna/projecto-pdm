// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBEuVrkxEAaXcg3Tn2tK7Z0mPagbZOI-qU',
    appId: '1:350266483523:web:6970bf8e3dad22ceb885f6',
    messagingSenderId: '350266483523',
    projectId: 'toll-project-pdm',
    authDomain: 'toll-project-pdm.firebaseapp.com',
    storageBucket: 'toll-project-pdm.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBl_QuB1iGyXn-uWwCneIxAXcAbE0iDLBQ',
    appId: '1:350266483523:android:d129dfa65b7ff27cb885f6',
    messagingSenderId: '350266483523',
    projectId: 'toll-project-pdm',
    storageBucket: 'toll-project-pdm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMQE2r5A_qc5ijZvnUCTREIEzeQuoVC_k',
    appId: '1:350266483523:ios:10654545900b32fab885f6',
    messagingSenderId: '350266483523',
    projectId: 'toll-project-pdm',
    storageBucket: 'toll-project-pdm.appspot.com',
    iosBundleId: 'com.example.projectoFinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMQE2r5A_qc5ijZvnUCTREIEzeQuoVC_k',
    appId: '1:350266483523:ios:10654545900b32fab885f6',
    messagingSenderId: '350266483523',
    projectId: 'toll-project-pdm',
    storageBucket: 'toll-project-pdm.appspot.com',
    iosBundleId: 'com.example.projectoFinal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBEuVrkxEAaXcg3Tn2tK7Z0mPagbZOI-qU',
    appId: '1:350266483523:web:3fced37ac1dac8cdb885f6',
    messagingSenderId: '350266483523',
    projectId: 'toll-project-pdm',
    authDomain: 'toll-project-pdm.firebaseapp.com',
    storageBucket: 'toll-project-pdm.appspot.com',
  );
}
