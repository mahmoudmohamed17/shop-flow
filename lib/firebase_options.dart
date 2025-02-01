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
    apiKey: 'AIzaSyAnhJV2czxMk22Lmvdp7b2yc3LJSQqvdBY',
    appId: '1:387664786636:web:60e8b2495de9f610aefe69',
    messagingSenderId: '387664786636',
    projectId: 'shop-flow-77fe4',
    authDomain: 'shop-flow-77fe4.firebaseapp.com',
    storageBucket: 'shop-flow-77fe4.firebasestorage.app',
    measurementId: 'G-FK0SPZ15RT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCi6Bmm2p5H2ClKH0sWVHn0zRTjTQ8Xg3I',
    appId: '1:387664786636:android:9b09baad56b9dfd6aefe69',
    messagingSenderId: '387664786636',
    projectId: 'shop-flow-77fe4',
    storageBucket: 'shop-flow-77fe4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPv9tbxtm1pP558AXvJs32Nk2nUNLwDpE',
    appId: '1:387664786636:ios:32286c31f7318424aefe69',
    messagingSenderId: '387664786636',
    projectId: 'shop-flow-77fe4',
    storageBucket: 'shop-flow-77fe4.firebasestorage.app',
    iosBundleId: 'com.example.shopFlow',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPv9tbxtm1pP558AXvJs32Nk2nUNLwDpE',
    appId: '1:387664786636:ios:32286c31f7318424aefe69',
    messagingSenderId: '387664786636',
    projectId: 'shop-flow-77fe4',
    storageBucket: 'shop-flow-77fe4.firebasestorage.app',
    iosBundleId: 'com.example.shopFlow',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAnhJV2czxMk22Lmvdp7b2yc3LJSQqvdBY',
    appId: '1:387664786636:web:c671afc3cb17c886aefe69',
    messagingSenderId: '387664786636',
    projectId: 'shop-flow-77fe4',
    authDomain: 'shop-flow-77fe4.firebaseapp.com',
    storageBucket: 'shop-flow-77fe4.firebasestorage.app',
    measurementId: 'G-1DFQT4Y7PF',
  );
}
