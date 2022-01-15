import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

class ProfileController extends GetxController  {
  FirebaseAuth auth = FirebaseAuth.instance;

  void updateProfile(
  {
    required String name,
    required String email,
    required String phone,
    required String address
  }
      ){
    CollectionReference users = FirebaseFirestore.instance.collection('users');
       users.doc(auth.currentUser!.uid)
          .update({
         'address': address,
         'email':email,
         'name':name,
         'phone':phone
          })
          .then((value){
         setControllers(
           name: name,
           email: email,
           address: address,
           phone: phone
         );
         update();
       })
          .catchError((error) => print("Failed to update user: $error"));
       update();
  }


  void setControllers(
  {
    required String name,
    required String email,
    required String phone,
    required String address
 }
      ){
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
       address= doc['address'];
        email=doc['email'];
       name= doc['name'];
        phone=doc['phone'];
        print(doc['email']);

        update();
      });
    });

  }

  Location location = new Location();
  String? address;
  Future<bool> isServiceEnabled() async {

    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    return _serviceEnabled;
  }

  Future<bool> isServicesGrantee() async {
    PermissionStatus _permissionGranted;
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    return _permissionGranted == PermissionStatus.granted;
  }

  late LocationData _locationData;
  void getUserLocation() async {
    var isLocationEnabled= await isServiceEnabled();
    if(! isLocationEnabled) return;//do nothing

    var isLocationGrantee= await isServicesGrantee();
    if(! isLocationGrantee) return;//do nothing

    _locationData=await location.getLocation();
    print(_locationData.latitude);
    print(_locationData.latitude);
    double? lat=_locationData.latitude;
    double? long=_locationData.longitude;
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(lat!, long!);
    geo.Placemark placeMark  = placemarks[0];
    String? name = placeMark.name;
    String? subLocality = placeMark.subLocality;
    String? locality = placeMark.locality;
    String? administrativeArea = placeMark.administrativeArea;
    String? postalCode = placeMark.postalCode;
    String? country = placeMark.country;
    String myaddress = "${locality},${administrativeArea} ${postalCode},${country}.";
    print(myaddress);
    address=myaddress;
    update();

  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    update();
  }
}