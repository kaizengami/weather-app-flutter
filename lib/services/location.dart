import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/http.dart';

const locationUrl = 'http://open.mapquestapi.com/geocoding/v1/address';
const apiKey = 'VKMCBeejcSMGR2g3rJ4Qx9t2gDgBubxy';

class Location {
  double latitude;
  double longitude;
  var cityName;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getLocationByName(String locationName) async {
    Http networkHelper =
        Http('$locationUrl?key=$apiKey&location=$locationName');

    var locationData = await networkHelper.getData();
    // results[0].locations[0].adminArea5

    String city = locationData['results'][0]['locations'][0]['adminArea5'];
    String city2 = locationData['results'][0]['locations'][0]['adminArea4'];
    String city3 = locationData['results'][0]['locations'][0]['adminArea3'];
    String country = locationData['results'][0]['locations'][0]['adminArea1'];
    latitude = locationData['results'][0]['locations'][0]['latLng']['lat'];
    longitude = locationData['results'][0]['locations'][0]['latLng']['lng'];

    if (city != '') {
      cityName = city;
    } else if (city2 != '') {
      cityName = city2;
    } else
      cityName = city3;

    cityName = cityName + ', ' + country;

    return locationData;
  }
}
