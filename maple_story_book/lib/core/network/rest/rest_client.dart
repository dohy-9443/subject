import 'package:dio/dio.dart';

///
/// @Project name    : maple_story_book
/// @Class           : rest_client.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

const Duration receiveTimeout = Duration(milliseconds: 1000);
const Duration sendTimeout = Duration(milliseconds: 1000);
const Duration connectTimeout = Duration(milliseconds: 1000);

class RestClient {
  late Dio _dio;

  RestClient({ required String baseUrl, Map<String, dynamic>? headers }) : _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      connectTimeout: connectTimeout,
    )
  );

  BaseOptions get options => _dio.options;

  void update({ String? baseUrl, Map<String, dynamic>? headers, }) {
    final BaseOptions options = _dio.options.copyWith(
      baseUrl: baseUrl,
      headers: headers,
    );

    _dio = Dio(options);
  }

  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}