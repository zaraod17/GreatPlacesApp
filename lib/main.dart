import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

import './screens/add_place_screen.dart';
import './providers/great_places.dart';
import './screens/places_list_screen.dart';
import './screens/map_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlace.routeName: (ctx) => AddPlace(),
          PlaceDetail.routeName: (ctx) => PlaceDetail()
        },
      ),
    );
  }
}
