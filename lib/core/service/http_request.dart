// dio configuration
import 'package:dio/dio.dart';
import 'package:food_playground/core/service/http_config.dart';

class HttpRequest {
  static final BaseOptions _baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl,
      connectTimeout: const Duration(seconds: HttpConfig.connectTimeout),
      receiveTimeout: const Duration(seconds: HttpConfig.receiveTimeout));

  static final Dio _dio = Dio(_baseOptions);

  static Future<T> send<T> (String url,
      {String method = "get",
      Map<String, dynamic>? queryParams,
      Interceptor? interceptor}) async {
    final options = Options(method: method);

    try {

      // 拦截器
      Interceptor globalInterceptor =
      InterceptorsWrapper(onRequest: (options, handler) {
        print("请求拦截器");
        return handler.next(options);
      }, onResponse: (options, handler) {
        print("响应拦截器");
        return handler.next(options);
      }, onError: (options, handler) {
        print("错误拦截器");
        return handler.next(options);
      });

      // 拦截器列表
      List<Interceptor> interceptorList = [ globalInterceptor ];
      if (interceptor != null) {
        interceptorList.add(interceptor);
      }
      // 添加拦截器
      _dio.interceptors.addAll(interceptorList);
      // 发送请求
      final res = await _dio.request(url, queryParameters: queryParams, options: options);
      return res.data;
    } on DioException catch (e) {
      return Future.error(e);
    }
  }
}
