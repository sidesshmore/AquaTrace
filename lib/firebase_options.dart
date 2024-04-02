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
    apiKey: 'AIzaSyD3Tbol8NQ3gsdLW8UdpYruIVRyOqI81Hc',
    appId: '1:925804687441:web:82940ea99538b746060870',
    messagingSenderId: '925804687441',
    projectId: 'aquatrace-analytics',
    authDomain: 'aquatrace-analytics.firebaseapp.com',
    storageBucket: 'aquatrace-analytics.appspot.com',
    measurementId: 'G-Z0WPTNETGX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRHl7MWqhECRDRII8tRG-Tfo_FHkS93WI',
    appId: '1:925804687441:android:a582f957a897d35e060870',
    messagingSenderId: '925804687441',
    projectId: 'aquatrace-analytics',
    storageBucket: 'aquatrace-analytics.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAe_58dryeoTSOsmidNg7UkyMxLMcVFPX4',
    appId: '1:925804687441:ios:d71acb725119b175060870',
    messagingSenderId: '925804687441',
    projectId: 'aquatrace-analytics',
    storageBucket: 'aquatrace-analytics.appspot.com',
    androidClientId: '925804687441-lnbi7dq8po7psb0p20rg8ffguub77n9t.apps.googleusercontent.com',
    iosClientId: '925804687441-ri1r8819o6kolal4lkgp0msbfih3ldov.apps.googleusercontent.com',
    iosBundleId: 'com.sidesshmore.aquaTrace',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAe_58dryeoTSOsmidNg7UkyMxLMcVFPX4',
    appId: '1:925804687441:ios:3c8595b0e47a8297060870',
    messagingSenderId: '925804687441',
    projectId: 'aquatrace-analytics',
    storageBucket: 'aquatrace-analytics.appspot.com',
    androidClientId: '925804687441-lnbi7dq8po7psb0p20rg8ffguub77n9t.apps.googleusercontent.com',
    iosClientId: '925804687441-71upc6g49a11uueoet4ve5shmmvbsv5l.apps.googleusercontent.com',
    iosBundleId: 'com.example.aquaTrace.RunnerTests',
  );
}
