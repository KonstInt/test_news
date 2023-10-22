// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api/api_news_util.dart' as _i14;
import '../../data/api/api_user_util.dart' as _i15;
import '../../data/api/service/news_service.dart' as _i9;
import '../../data/api/service/user_service.dart' as _i13;
import '../../data/mapper/news_post_mapper.dart' as _i8;
import '../../data/mapper/user_mapper.dart' as _i12;
import '../../data/repository/mock_news_repository.dart' as _i4;
import '../../data/repository/mock_user_repository.dart' as _i6;
import '../../domain/bloc/news_list_bloc/news_list_bloc.dart' as _i7;
import '../../domain/bloc/top_news_bloc/top_news_bloc.dart' as _i10;
import '../../domain/bloc/user-bloc/user_bloc.dart' as _i11;
import '../../domain/repository/abstract_news_repository.dart' as _i3;
import '../../domain/repository/abstract_user_repository.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AbstractNewsRepository>(_i4.MockNewsRepository());
    gh.singleton<_i5.AbstractUserRepository>(_i6.MockUserRepository());
    gh.factory<_i7.NewsListBloc>(
        () => _i7.NewsListBloc(repository: gh<_i3.AbstractNewsRepository>()));
    gh.singleton<_i8.NewsPostMapper>(_i8.NewsPostMapper());
    gh.singleton<_i9.NewsService>(_i9.NewsService());
    gh.factory<_i10.TopNewsBloc>(
        () => _i10.TopNewsBloc(gh<_i3.AbstractNewsRepository>()));
    gh.factory<_i11.UserBloc>(
        () => _i11.UserBloc(repository: gh<_i5.AbstractUserRepository>()));
    gh.singleton<_i12.UserMapper>(_i12.UserMapper());
    gh.singleton<_i13.UserService>(_i13.UserService());
    gh.singleton<_i14.ApiNewsUtil>(_i14.ApiNewsUtil(
      newsListService: gh<_i9.NewsService>(),
      newsPostMapper: gh<_i8.NewsPostMapper>(),
    ));
    gh.singleton<_i15.ApiUserUtil>(_i15.ApiUserUtil(
      userMapper: gh<_i12.UserMapper>(),
      userService: gh<_i13.UserService>(),
    ));
    return this;
  }
}
