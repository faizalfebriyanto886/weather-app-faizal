import 'package:faizal_mobile_dev/model/current_location_model.dart';
import 'package:faizal_mobile_dev/presentation/homepage/widget/alert_dialog.dart';
import 'package:faizal_mobile_dev/service/api_service.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    getCurrentWeather();
    getDaysAgoWeather();
    super.onInit();
  }

  CurrentLocationModel? locationModel;
  RxBool loadingShimmer = false.obs;
  RxList daysAgoList = [].obs;
  
  

  getCurrentWeather() async {
    loadingShimmer.value = true;
    Position position = await getGeoLocationPosition();
    
    APIClientService.getData(
      url: "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=df506b5e16297c5ec344e3fb938bf159"
    ).then((value) {
      loadingShimmer.value = false;
      if (value['message'] == "success") {
        locationModel = CurrentLocationModel.fromJson(value['response'].data);
        update();
      } else {
        Get.to(() => const AlertDialog401());
        update();
      }
    });
    update();
  }

  getDaysAgoWeather() async {
    Position position = await getGeoLocationPosition();
    
    APIClientService.getData(
      url: "https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&appid=df506b5e16297c5ec344e3fb938bf159"
    ).then((value) {
      if (value['message'] == "success") {
        daysAgoList.addAll(value['response'].data['list']);
        update();
      } else {}
    });
    update();
  }

  String timestampToDateTime(int times) {
    DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(times * 1000);
    String fdatetime = DateFormat('EEEE, dd MMMM yy').format(tsdate);
    return fdatetime;
  }

  String timestampToTime(int times) {
    DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(times * 1000);
    String fdatetime = DateFormat('HH:mm').format(tsdate);
    return fdatetime;
  }

  String timeGreeting() {
    var time = DateTime.now().hour;

    if (time >= 6 && time <= 11) {
      return "Good morning";
    } else if (time >= 11 && time < 17) {
      return "Good afternoon";
    }
    return "Good night";
  }

  int tempConvert(var value) {
    var temp = value - 273;
    return temp.toInt();
  }

  String clouds(var items) {
    if (items == "few clouds") {
      return "assets/image/sunrise_img.png";
    } else if (items == "broken clouds" || items == "scattered clouds") {
      return "assets/image/overcast.png";
    }
    return "assets/image/rain.png";
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //location service not enabled, don't continue
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service Not Enabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    //permission denied forever
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permission denied forever, we cannot access',
      );
    }
    //continue accessing the position of device
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}