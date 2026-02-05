import 'package:clockin/core/config/app_config.dart';
import 'package:clockin/core/network/network_client.dart';
import 'package:dio/dio.dart';

class DioNetworkClient extends NetworkClient {
  late final Dio _dio;

  DioNetworkClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.instance.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  @override
  Future delete(String url, {Map<String, String>? headers}) {
    return _dio.delete(url, options: Options(headers: headers));
  }

  @override
  Future get(String url, {Map<String, String>? headers}) {
    return _dio.get(url, options: Options(headers: headers));
  }

  @override
  Future post(String url, {Map<String, String>? headers, body}) {
    return _dio.post(
      url,
      options: Options(headers: headers),
      data: body,
    );
  }

  @override
  Future put(String url, {Map<String, String>? headers, body}) {
    return _dio.put(
      url,
      options: Options(headers: headers),
      data: body,
    );
  }
}
