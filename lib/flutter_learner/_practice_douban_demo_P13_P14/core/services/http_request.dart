import 'package:dio/dio.dart';

import 'package:food_playground/flutter_learner/_practice_douban_demo_P13_P14/core/util/constants.dart';

class HttpRequest {
  const HttpRequest._();

  // 网络请求基础设置
  static final BaseOptions _baseOptions = BaseOptions(
    // 请求基地址
    baseUrl: Constants.baseUrl,
    // 请求的链接时间
    connectTimeout: Constants.connectTimeout,
    // 响应的链接时间
    receiveTimeout: Constants.receiveTimeout,
  );

  static final Dio _dio = Dio(_baseOptions);

  static Future<T> send<T>({
    required String url,
    String method = "GET",
    Map<String, dynamic>? data,
    Interceptor? interceptor,
  }) async {
    // 网络请求的配置
    Options options = Options(method: method);

    // 全局拦截器
    Interceptor globalInterceptor = InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print("全局请求拦截器...");
        handler.next(options);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        print("全局错误拦截器");
        handler.next(error);
      },
      onResponse:
          (Response<dynamic> response, ResponseInterceptorHandler handler) {
            print("全局响应拦截器");
            handler.next(response);
          },
    );

    // 拦截器设置
    List<Interceptor> interceptorList = [globalInterceptor];

    // 自定义拦截器的非空校验
    if (interceptor != null) {
      interceptorList.add(interceptor);
    }

    // 设置拦截器
    _dio.interceptors.addAll(interceptorList);

    try {
      // 发送请求
      final result = await _dio.request(
        url,
        queryParameters: data,
        options: options,
      );
      return result.data;
    } on DioException catch (e) {
      // 捕获异常
      return Future.error(e);
    }
  }
}
