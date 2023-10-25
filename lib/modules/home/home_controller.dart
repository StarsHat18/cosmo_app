import 'dart:convert';

import 'package:cosmo_app/model/planets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;

class HomeController extends GetxController {
  var planet = <Planets>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPlanets();
  }

  Future<List<Planets>> fetchPlanets() async {
    var headers = {
      'Accept': 'application/json',
    };
    var url = Uri.parse('https://653601d7c620ba9358ecdd88.mockapi.io/milkyway');
    final response = await https.get(url, headers: headers);
    if (response.statusCode == 200) {
      print('menjalankan get konten');
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse is List) {
        print('berhasil');
        List<dynamic> jsonResponse = json.decode(response.body);
        planet.value = jsonResponse.map((e) => Planets.fromJson(e)).toList();
      }
    } else {
      print(response.reasonPhrase);
      throw Exception('Gagal mengambil data');
    }
    return [];
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    Get.find<HomeController>().onClose();
  }
}
