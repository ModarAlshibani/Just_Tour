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
    apiKey: 'AIzaSyCVkgsfWOvLkmYo2heenNbRZKR6BeW5ePI',
    appId: '1:817296311904:web:9b54f1f3f4de8fc684a505',
    messagingSenderId: '817296311904',
    projectId: 'test1-c74a9',
    authDomain: 'test1-c74a9.firebaseapp.com',
    storageBucket: 'test1-c74a9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVqE6kknFZH6iCqirUNe6ufSsxPsEC0ZE',
    appId: '1:817296311904:android:50a43b73a08ff6fe84a505',
    messagingSenderId: '817296311904',
    projectId: 'test1-c74a9',
    storageBucket: 'test1-c74a9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0FbLSJkcXMdUWHZt7U9tDnmzj_cmtS5s',
    appId: '1:817296311904:ios:165a9f9f452c130784a505',
    messagingSenderId: '817296311904',
    projectId: 'test1-c74a9',
    storageBucket: 'test1-c74a9.appspot.com',
    iosBundleId: 'com.example.terez',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0FbLSJkcXMdUWHZt7U9tDnmzj_cmtS5s',
    appId: '1:817296311904:ios:165a9f9f452c130784a505',
    messagingSenderId: '817296311904',
    projectId: 'test1-c74a9',
    storageBucket: 'test1-c74a9.appspot.com',
    iosBundleId: 'com.example.terez',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCVkgsfWOvLkmYo2heenNbRZKR6BeW5ePI',
    appId: '1:817296311904:web:4e1304a56419c99184a505',
    messagingSenderId: '817296311904',
    projectId: 'test1-c74a9',
    authDomain: 'test1-c74a9.firebaseapp.com',
    storageBucket: 'test1-c74a9.appspot.com',
  );
}
