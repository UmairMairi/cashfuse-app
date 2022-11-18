import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyB29Rl1IKWA-sTP-gHvlrN7scS7hO4Mp4s",
    authDomain: "cashfuse-60939.firebaseapp.com",
    projectId: "cashfuse-60939",
    storageBucket: "cashfuse-60939.appspot.com",
    messagingSenderId: "521109211624",
    appId: "1:521109211624:web:1f3cec9c3cbbfea4c53c5d",
    measurementId: "G-KBPRBBZRYC",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFb8NYxP_fiNKuMnQsRO8NtRGf4jDYuDY',
    appId: '1:822395613156:android:8e01e13ed8159ea17921f1',
    messagingSenderId: '822395613156',
    projectId: 'deliveryking-9f006',
    authDomain: 'deliveryking-9f006.firebaseapp.com',
    databaseURL: 'https://deliveryking-9f006-default-rtdb.firebaseio.com/',
    storageBucket: 'deliveryking-9f006.appspot.com',
  );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'place-your-api-key',
  //   appId: '1:447864724601:ios:2dea6e0b4441b4320708a8',
  //   messagingSenderId: '447864724601',
  //   projectId: 'deliveryking-9f006',
  //   databaseURL: 'https://divine-pact-342808-default-rtdb.firebaseio.com/',
  //   storageBucket: 'divine-pact-342808.appspot.com',
  //   androidClientId:
  //   '447864724601-91f6167t7bu16vh0kedk037h8unb63vc.apps.googleusercontent.com',
  //   iosClientId:
  //   '447864724601-0762i4qj11k2de2ssr57518af369sjpu.apps.googleusercontent.com',
  //   iosBundleId: 'com.aloura.user',
  // );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'place-your-api-key',
  //   appId: '1:448618578101:ios:0b11ed8263232715ac3efc',
  //   messagingSenderId: '448618578101',
  //   projectId: 'react-native-firebase-testing',
  //   databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
  //   storageBucket: 'react-native-firebase-testing.appspot.com',
  //   androidClientId:
  //   '448618578101-a9p7bj5jlakabp22fo3cbkj7nsmag24e.apps.googleusercontent.com',
  //   iosClientId:
  //   '448618578101-evbjdqq9co9v29pi8jcua8bm7kr4smuu.apps.googleusercontent.com',
  //   iosBundleId: 'io.flutter.plugins.firebase.messaging',
  // );
}
