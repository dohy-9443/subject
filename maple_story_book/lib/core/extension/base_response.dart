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
  Logger logger = Logger();

  Future<ResultRest<T>> getResult<T>(Future<T> call) async {
    try {
      // API 호출
      final T data = await call;

      // 데이터가 null일 경우 Error 반환
      if (data == null) {
        throw Error<T>(0, 'Received null data', Exception('Data is null'));
      }

      // 성공적으로 데이터를 받은 경우 Success 반환
      return Success<T>(data);

    } on DioException catch (e) {

      // Logger로 에러 정보 출력
      logger.e('DioException : ${e.message}');
      logger.e('Request Data: ${e.requestOptions.data}');
      logger.e('Error: ${e.error}');

      // HTTP 응답이 있으면 해당 응답의 코드와 메시지 처리
      if (e.response != null) {
        return Error<T>(
          e.response!.statusCode ?? 0, // HTTP 응답 코드
          e.response!.statusMessage ?? 'Unknown error', // 응답 메시지
          e,
        );
      }

      // HTTP 응답이 없으면 기본 오류 메시지 반환
      return Error<T>(0, 'No Response from Server', e);

    } catch (e) {
      // 기타 예외 처리 (DioException 외 다른 오류)
      logger.e('Unknown error: $e');

      return Error<T>(0, 'Unknown error occurred', Exception(e.toString()));
    }
  }
}