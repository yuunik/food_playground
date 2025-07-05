import 'package:dio/dio.dart';

import 'package:food_playground/core/service/http_config.dart';

class HttpRequest {
  static final BaseOptions _options = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    connectTimeout: const Duration(seconds: HttpConfig.connectTimeout),
    receiveTimeout: const Duration(seconds: HttpConfig.receiveTimeout),
    responseType: ResponseType.json,
  );

  static final Dio _dio = Dio(_options);

  static Future<T> send<T>(
    String url, {
    String method = 'GET',
    Map<String, dynamic>? params,
    Interceptor? interceptor,
  }) async {
    final options = Options(method: method);

    try {
      Interceptor globalInterceptor = InterceptorsWrapper(
        onRequest: (options, handler) {
          print('global request');
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('global response');
          handler.next(response);
        },
        onError: (DioException e, handler) {
          print('global error');
          handler.next(e);
        },
      );

      List<Interceptor> interceptorList = [globalInterceptor];

      if (interceptor != null) {
        interceptorList.add(interceptor);
      }
      // add interceptor
      _dio.interceptors.addAll(interceptorList);

      // send request
      final response = await _dio.request(
        url,
        queryParameters: params,
        options: options,
      );

      return response.data;
    } on DioException catch (e) {
      return Future.error(e);
    }
  }
}
