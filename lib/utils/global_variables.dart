import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instaclone_flutterfirebase/screens/add_posts_screen.dart';
import 'package:instaclone_flutterfirebase/screens/feed_screen.dart';
import 'package:instaclone_flutterfirebase/screens/profile_screen.dart';
import 'package:instaclone_flutterfirebase/screens/search_screen.dart';

const webScreenSize = 600;

var homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('Noti'),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid),
];
