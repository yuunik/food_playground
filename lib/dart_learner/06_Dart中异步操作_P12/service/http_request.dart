import 'package:dio/dio.dart';

import 'http_config.dart';

class HttpRequest {
  // 网络请求的基本配置
  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    connectTimeout: const Duration(seconds: HttpConfig.connectTimeout),
    receiveTimeout: const Duration(seconds: HttpConfig.receiveTimeout),
  );

  // 网络请求实例
  static final Dio _dio = Dio(_baseOptions);

  static Future<T> send<T>(
    /// 请求地址
    String url, {

    /// 请求方式
    String method = "GET",

    /// 请求参数
    Map<String, dynamic>? params,

    /// 拦截器
    Interceptor? interceptor,
  }) async {
    // 单独配置
    final Options options = Options(method: method);

    // 全局拦截器
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

    // 拦截器列表
    List<Interceptor> interceptors = [globalInterceptor];

    // 判断是否有传入单独的拦截器
    if (interceptor != null) {
      interceptors.add(interceptor);
    }

    // 添加拦截器
    _dio.interceptors.addAll(interceptors);

    print("本地请求的地址为: $url");

    // 发送网络请求
    try {
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
