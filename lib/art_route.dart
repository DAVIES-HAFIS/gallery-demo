import 'package:flutter/material.dart';

import 'art_util.dart';

class ArtRoute extends StatefulWidget {
  ArtRoute({required this.art});
  final String art;
  @override
  _ArtRouteState createState() => _ArtRouteState();
}

class _ArtRouteState extends State<ArtRoute> {
  static int _currentIndex =0;
  static String _value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NAVIGATIING ART'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (BuildContext context) {
              return ArtUtil.menuItems.map((String item) {
                return PopupMenuItem<String>(
                  child: Text(item),
                  value: item,
                );
              }).toList();
            },
            onSelected: (value) => changeRoute(context, _value),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Choose your art',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                    image: AssetImage('assets/cloud.jpg'),
                   fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.art_track),
              title: Text(ArtUtil.CARAVAGGIO),
              onTap: () => changeRoute(context, ArtUtil.CARAVAGGIO),
            ),
            ListTile(
              trailing: Icon(Icons.art_track),
              title: Text(ArtUtil.VANGOGH),
              onTap: () => changeRoute(context, ArtUtil.VANGOGH),
            ),
            ListTile(
              trailing: Icon(Icons.art_track),
              title: Text(ArtUtil.MONET),
              onTap: () => changeRoute(context, ArtUtil.MONET),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.art),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightGreen[900],
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text(ArtUtil.CARAVAGGIO),
            icon: Icon(Icons.art_track_rounded),
          ),
          BottomNavigationBarItem(
            title: Text(ArtUtil.MONET),
            icon: Icon(Icons.art_track_rounded),
          ),
          BottomNavigationBarItem(
            title: Text(ArtUtil.VANGOGH),
            icon: Icon(Icons.art_track_rounded),
          ),
        ],
        onTap: (value){
          String _artist = ArtUtil.menuItems[value];
          _currentIndex = value;
          changeRoute(context, _artist);
        },
      ),
    );
  }

  void changeRoute(BuildContext context, String menuItem) {
    late String image;
    switch (menuItem) {
      case ArtUtil.CARAVAGGIO:
        {
          image = ArtUtil.IMG_CARAVAGGIO;
          break;
        }
      case ArtUtil.VANGOGH:
        {
          image = ArtUtil.IMG_VANGOGH;
          break;
        }
      case ArtUtil.MONET:
        {
          image = ArtUtil.IMG_MONET;
          break;
        }
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ArtRoute(
                  art: image,
                )));
  }
}
