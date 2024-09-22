import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

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
      }) async {
    Logger logger = Logger();

    await dotenv.load(fileName: "maple_story_book.env");
    final apiKey = dotenv.env['MAPLE_STORY_API_KEY'];

    // Interceptor 추가
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['x-nxopen-api-key'] = apiKey;

        logger.i('Request to $path');
        logger.i('Headers: ${options.headers}');
        logger.i('Query Params: ${options.queryParameters}');
        logger.i('Data: ${options.data}');

        return handler.next(options);
      },
      onResponse: (response, handler) {

        logger.i('Response from $path');
        logger.i('Status Code: ${response.statusCode}');
        logger.i('Response Data: ${response.data}');

        return handler.next(response);
      },
      onError: (DioException e, handler) {

        logger.e('Error during request to $path');
        logger.e('Error Message: ${e.message}');
        if (e.response != null) {
          logger.e('Status Code: ${e.response?.statusCode}');
          logger.e('Error Data: ${e.response?.data}');
        }

        return handler.next(e);
      },
    ));

    return await _dio.get<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

}