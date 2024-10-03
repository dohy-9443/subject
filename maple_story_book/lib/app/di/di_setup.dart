import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/repository/repository.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/di/di_setup.config.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : di_setup.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 25..
/// Description      : 
///

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

// 이곳에 모든 의존성 모듈을 설정합니다.
@module
abstract class RegisterModule {
  // RestClient를 등록하는 메소드 생성

  @singleton
  MapleStoryBookRestClient provideRestClient() => MapleStoryBookRestClient();

  // 데이터 소스 등록
  @singleton
  IGetCharacterDataSource provideCharacterDataSource(CharacterDataSource dataSource) => dataSource;

  @lazySingleton
  IGetUnionDataSource provideUnionDataSource(UnionDataSource dataSource) => dataSource;

  @lazySingleton
  IGetRankingDataSource provideRankingDataSource(RankingDataSource dataSource) => dataSource;

  @lazySingleton
  IGetGuildDataSource provideGuildDataSource(GuildDataSource dataSource) => dataSource;

  @lazySingleton
  IGetPotentialDataSource providePotentialDataSource(PotentialDataSource dataSource) => dataSource;

  @lazySingleton
  IGetStarForceDataSource provideStarForceDataSource(StarForceDataSource dataSource) => dataSource;

  @lazySingleton
  IGetNoticeDataSource provideNoticeDataSource(NoticeDataSource dataSource) => dataSource;

  // 레포지토리 등록
  @singleton
  ICharacterRepository provideCharacterRepository(CharacterRepository repository) => repository;

  @singleton
  ILocalStorageRepository provideLocalStorageRepository(LocalStorageRepository repository) => repository;

  @lazySingleton
  IUnionRepository provideUnionRepository(UnionRepository repository) => repository;

  @lazySingleton
  IRankingRepository provideRankingRepository(RankingRepository repository) => repository;

  @lazySingleton
  IGuildRepository provideGuildRepository(GuildRepository repository) => repository;

  @lazySingleton
  IPotentialRepository providePotentialRepository(PotentialRepository repository) => repository;

  @lazySingleton
  IStarForceRepository provideStarForceRepository(StarForceRepository repository) => repository;

  @lazySingleton
  INoticeRepository provideNoticeRepository(NoticeRepository repository) => repository;
}