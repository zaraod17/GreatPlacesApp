import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import '../screens/add_place_screen.dart';
import '../providers/great_places.dart';
import '../screens/place_detail_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlace.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: Center(
                      child: Text('Got no places yet, start adding some!'),
                    ),
                    builder: (ctx, greatPlaces, ch) => greatPlaces
                                .items.length <=
                            0
                        ? ch
                        : ListView.builder(
                            itemBuilder: (ctx, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.items[index].image),
                              ),
                              title: Text(greatPlaces.items[index].title),
                              subtitle: Text(
                                  greatPlaces.items[index].location.address),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    PlaceDetail.routeName,
                                    arguments: greatPlaces.items[index].id);
                              },
                            ),
                            itemCount: greatPlaces.items.length,
                          ),
                  );
          }),
    );
  }
}
