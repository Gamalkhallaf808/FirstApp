import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCvaRzVWCrNGfPKQuCcJuiPJLPvwSmpPsM',
    appId: '1:48329184642:web:5f71402ec457502085ab9b',
    messagingSenderId: '48329184642',
    projectId: 'fluttergroup-f3c47',
    authDomain: 'fluttergroup-f3c47.firebaseapp.com',
    storageBucket: 'fluttergroup-f3c47.appspot.com',
    measurementId: 'G-6WEPDD2D1P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCrjF81QatF_pbAThTLfvE4i4Sovj5rO4',
    appId: '1:48329184642:android:33f56f7da50fb13185ab9b',
    messagingSenderId: '48329184642',
    projectId: 'fluttergroup-f3c47',
    storageBucket: 'fluttergroup-f3c47.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQLKl8m3S06CHgQtcClVFYXGxrcqzR6O0',
    appId: '1:48329184642:ios:94d2e53795a4817c85ab9b',
    messagingSenderId: '48329184642',
    projectId: 'fluttergroup-f3c47',
    storageBucket: 'fluttergroup-f3c47.appspot.com',
    iosBundleId: 'com.example.flutterGroup1',
  );
}