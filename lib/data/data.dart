

class Services{
final String imageUrl;
  final String name;

  Services({this.imageUrl, this.name});
}

final _police =Services(
    imageUrl: 'assets/icons8-police-96.png',
    name: 'Police',
);
final _ambulance = Services(
    imageUrl: 'assets/icons8-ambulance-64.png',
    name: 'Ambulance',

);
final _fire = Services(
  imageUrl: 'assets/icons8-fire-truck-80.png',
  name: 'Fire',
);

final List<Services> emergSer = [
   _police,
   _ambulance,
   _fire
  ];