import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instaclone_flutterfirebase/providers/user_provider.dart';
import 'package:instaclone_flutterfirebase/responsive/mobile_screen_layout.dart';
import 'package:instaclone_flutterfirebase/responsive/responsive_layout_screen.dart';
import 'package:instaclone_flutterfirebase/responsive/web_screen_layout.dart';
import 'package:instaclone_flutterfirebase/screens/login_screen.dart';
import 'package:instaclone_flutterfirebase/screens/sign_up_screen.dart';
import 'package:instaclone_flutterfirebase/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB3U_sWVVud9glEPAg9RszEdZ-C94VAqMI",
          appId: "1:702862956322:web:386dbc494902a2cf29777b",
          messagingSenderId: "702862956322",
          projectId: "instaclone-flutter-7a755",
          storageBucket: "instaclone-flutter-7a755.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InstaClone',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error ${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
