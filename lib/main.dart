import 'package:flutter/material.dart';
import 'package:gallery_app/art_route.dart';

import 'art_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: ArtRoute(art:ArtUtil.IMG_VANGOGH),
    );
  }
}
