// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/hotels/data/datasources/hotels_remote_datasource.dart'
    as _i996;
import '../../features/hotels/data/repositories/hotels_repository_impl.dart'
    as _i224;
import '../../features/hotels/domain/repositories/hotels_repository.dart'
    as _i974;
import '../../features/hotels/domain/usecases/list_hotels_usecase.dart'
    as _i873;
import '../../features/hotels/presentation/bloc/hotels_bloc.dart' as _i179;
import '../api_client/client/dio_client.dart' as _i758;
import '../api_client/client_provider.dart' as _i546;
import '../storage/storage_preference_manager.dart' as _i934;
import 'module_injector.dart' as _i759;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModules.prefs(),
      preResolve: true,
    );
    gh.factory<String>(
      () => registerModules.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<String>(
      () => registerModules.apiKey,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i934.SharedPreferencesManager>(
        () => _i934.SharedPreferencesManager(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i361.Dio>(
        () => registerModules.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i758.DioClient>(() => _i758.DioClient(
          gh<_i361.Dio>(),
          gh<String>(instanceName: 'ApiKey'),
        ));
    gh.lazySingleton<_i546.ClientProvider>(
        () => _i546.ClientProvider(gh<_i758.DioClient>()));
    gh.lazySingleton<_i996.HotelsRemoteDatasource>(
        () => _i996.HotelsRemoteDatasource(gh<_i546.ClientProvider>()));
    gh.lazySingleton<_i974.HotelsRepository>(
        () => _i224.HotelsRepositoryImpl(gh<_i996.HotelsRemoteDatasource>()));
    gh.lazySingleton<_i873.ListHotelsUsecase>(
        () => _i873.ListHotelsUsecase(gh<_i974.HotelsRepository>()));
    gh.factory<_i179.HotelsBloc>(
        () => _i179.HotelsBloc(gh<_i873.ListHotelsUsecase>()));
    return this;
  }
}

class _$RegisterModules extends _i759.RegisterModules {}
