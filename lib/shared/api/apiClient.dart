
import 'package:appsfit/shared/constants/conts.dart';
import 'package:dio/dio.dart';

class ApiClient{

  static Future listFitsFormData({String? endpoint, FormData? formData}) async {
   var dio = Dio();
   try {
     Response response =
        await dio.post("${AppConstants.url2}$endpoint", 
                  data: formData, 
                  );
        return response;
   } on DioError catch (e) {
     //print(e.request);
     print(e.message);
     return null;
   }
  }

  static Future listFits({String? endpoint, String? result}) async {
   var dio = Dio();
   try {
      Response response = await dio.post("${AppConstants.url2}$endpoint", data: result);
      return response;
    } on DioError catch (e) {
     // print(e.request);
      print(e.message);
      return null;
    }
  }

}