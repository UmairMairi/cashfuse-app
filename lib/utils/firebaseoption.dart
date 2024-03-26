import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyAejv97J4qFVvHehCI8K2hoQT3C9Gl5MH0",
      authDomain: "bovi-price.firebaseapp.com",
      projectId: "bovi-price",
      storageBucket: "bovi-price.appspot.com",
      messagingSenderId: "773714635993",
      appId: "1:773714635993:web:a0452d67e8560f7dc062c8",
      measurementId: "G-HSM06TWT3P"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyD5HujxmsmauocAtWnOm-E8px5FX8SxZsE",
    authDomain: "bovi-price.firebaseapp.com",
    projectId: "bovi-price",
    storageBucket: "bovi-price.appspot.com",
    messagingSenderId: "773714635993",
    appId: "1:773714635993:android:76b9e3afaad27509c062c8",
    measurementId: "G-HSM06TWT3P",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyCuGP6eCEJW5mGHvk4YoCOoXz6TiKxKJSM",
    authDomain: "cashfuse-60939.firebaseapp.com",
    projectId: "cashfuse-60939",
    storageBucket: "cashfuse-60939.appspot.com",
    messagingSenderId: "521109211624",
    appId: "1:773714635993:ios:ec8db40b00b19902c062c8",
    measurementId: "G-KBPRBBZRYC",
  );
}
