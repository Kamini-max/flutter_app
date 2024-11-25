import 'package:flutter/material.dart';
import '../../data/loaction.dart';
import '../screen/location_details_page.dart';

class LocationTile extends StatelessWidget {
  final Location location;

  LocationTile({required this.location});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: {location.area},
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/logo-rgb-black.png'),
              ),
            ),
            title: Text('${location.location} ${location.area}'),
            subtitle: Text('${location.geo}'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationDetailsPage(location: location)));
            },
          ),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
