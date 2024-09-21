import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:maple_story_book/app/data/source/model/result.dart';

///
/// @Project name    : maple_story_book
/// @Class           : base_remote_data_source.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

mixin BaseResponse {
  Future<ResultRest<T>> handleApiResponse<T>({
    required Future<dynamic> Function() request,
    required T Function(dynamic json) fromJson,
  }) async {
    Logger logger = Logger();
    try {
      final json = await request();
      if (json == null) {
        throw Error<T>(0, 'Received null data', Exception('Data is null'));
      }

      return Success<T>(fromJson(json));
    } on DioException catch (e) {
      // Logger로 에러 정보 출력
      logger.e('DioException : ${e.message}');
      logger.e('Request Data: ${e.requestOptions.data}');
      logger.e('Error: ${e.error}');

      if (e.response != null) {
        return Error<T>(
          e.response!.statusCode ?? 0,
          e.response!.statusMessage ?? 'Unknown error',
          e,
        );
      }

      return Error<T>(0, 'No Response from Server', e);
    } catch (e) {
      logger.e('Unknown error: $e');
      return Error<T>(0, 'Unknown error occurred', Exception(e.toString()));
    }
  }
}