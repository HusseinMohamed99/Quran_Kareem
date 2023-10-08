import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://mp3quran.net/api/v3/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang = 'eng',
    String? token,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers = {
      'language': lang,
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    return await dio.get(
      url,
      queryParameters: query,
      options: Options(),
    );
  }

//   static Future<Response> putData(
//       {required String url,
//       Map<String, dynamic>? query,
//       Map<String, dynamic>? data,
//       String lang = 'ar',
//       String? token}) async {
//     dio.options.headers = {
//       'lang': lang,
//       'Content-Type': 'application/json',
//       'Authorization': '$token'
//     };
//     return await dio.put(
//       url,
//       queryParameters: query,
//       data: data,
//       options: Options(
//         validateStatus: (status) {
//           return true;
//         },
//       ),
//     );
//   }

//   static Future<Response> postData({
//     required String url,
//     Map<String, dynamic>? query,
//     Map<String, dynamic>? data,
//     String lang = 'ar',
//     String? token,
//   }) async {
//     dio.options.headers = {
//       'lang': lang,
//       'Content-Type': 'application/json',
//       'Authorization': '$token'
//     };
//     return await dio.post(
//       url,
//       queryParameters: query,
//       data: data,
//       options: Options(
//         validateStatus: (status) {
//           return true;
//         },
//       ),
//     );
//   }

//   static Future<Response> patchData({
//     required String url,
//     Map<String, dynamic>? query,
//     Map<String, dynamic>? data,
//     String lang = 'ar',
//     String? token,
//   }) async {
//     dio.options.headers = {
//       'lang': lang,
//       'Content-Type': 'application/json',
//       'Authorization': '$token'
//     };
//     return await dio.patch(
//       url,
//       queryParameters: query,
//       data: data,
//       options: Options(
//         validateStatus: (status) {
//           return true;
//         },
//       ),
//     );
//   }

//   static Future<Response> deleteData(
//       {required String url, String lang = 'en', String? token}) async {
//     dio.options.headers = {
//       'lang': lang,
//       'Content-Type': 'application/json',
//       'Authorization': '$token'
//     };
//     return await dio.delete(
//       url,
//       options: Options(
//         validateStatus: (status) {
//           return true;
//         },
//       ),
//     );
//   }
}
