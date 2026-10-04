// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:lenguo_app/features/auth/data/data_source/auth_data_source.dart'
    as _i231;
import 'package:lenguo_app/features/auth/data/data_source/auth_data_source_impl.dart'
    as _i1035;
import 'package:lenguo_app/features/auth/data/reposatory/auth_repositorr_impl.dart'
    as _i800;
import 'package:lenguo_app/features/auth/domain/repository/auth_repository.dart'
    as _i987;
import 'package:lenguo_app/features/auth/domain/usecases/auth_forgot_password.dart'
    as _i564;
import 'package:lenguo_app/features/auth/domain/usecases/auth_log_out.dart'
    as _i103;
import 'package:lenguo_app/features/auth/domain/usecases/auth_login_usecase.dart'
    as _i76;
import 'package:lenguo_app/features/auth/domain/usecases/auth_register_usecase.dart'
    as _i232;
import 'package:lenguo_app/features/auth/domain/usecases/auth_sign_in_with_google.dart'
    as _i757;
import 'package:lenguo_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i524;
import 'package:lenguo_app/features/language_selection/data/datasource/language_selecton_datasource.dart'
    as _i101;
import 'package:lenguo_app/features/language_selection/data/datasource/language_selecton_datasource_impl.dart'
    as _i722;
import 'package:lenguo_app/features/language_selection/data/repository/language_selection_repository_impl.dart'
    as _i382;
import 'package:lenguo_app/features/language_selection/domain/repository/language_selection_repository.dart'
    as _i243;
import 'package:lenguo_app/features/language_selection/domain/usecase/language_selection_get_selected_language_usecase.dart'
    as _i239;
import 'package:lenguo_app/features/language_selection/domain/usecase/language_selection_set_selected_language_usecase.dart'
    as _i244;
import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_cubit.dart'
    as _i843;
import 'package:lenguo_app/features/vocablaries/data/datasource/vocablaries_datasource.dart'
    as _i1037;
import 'package:lenguo_app/features/vocablaries/data/datasource/vocblaries_datasource_impl.dart'
    as _i160;
import 'package:lenguo_app/features/vocablaries/data/repository/vocblaries_repository_impl.dart'
    as _i84;
import 'package:lenguo_app/features/vocablaries/domain/repository/vocablaries_repository.dart'
    as _i339;
import 'package:lenguo_app/features/vocablaries/domain/usecase/vocablaries_usecase.dart'
    as _i126;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.factory<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i1037.VocabulariesDataSource>(
      () => _i160.VocabulariesDatasourceImpl(),
    );
    gh.factory<_i339.VocabulariesRepository>(
      () => _i84.VocabulariesRepositoryImpl(
        dataSource: gh<_i1037.VocabulariesDataSource>(),
      ),
    );
    gh.factory<_i101.LanguageSelectionDatasource>(
      () => _i722.LanguageSelectionDatasourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i231.AuthDataSource>(
      () => _i1035.AuthDataSourceImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i987.AuthRepository>(
      () => _i800.AuthRepositoryImpl(gh<_i231.AuthDataSource>()),
    );
    gh.factory<_i243.LanguageSelectionRepository>(
      () => _i382.LanguageSelectionRepositoryImpl(
        localDataSource: gh<_i101.LanguageSelectionDatasource>(),
      ),
    );
    gh.factory<_i126.GetVocabulary>(
      () => _i126.GetVocabulary(gh<_i339.VocabulariesRepository>()),
    );
    gh.factory<_i239.LanguageSelectionGetSelectedLanguageUsecase>(
      () => _i239.LanguageSelectionGetSelectedLanguageUsecase(
        repository: gh<_i243.LanguageSelectionRepository>(),
      ),
    );
    gh.factory<_i244.LanguageSelectionSetSelectedLanguageUsecase>(
      () => _i244.LanguageSelectionSetSelectedLanguageUsecase(
        repository: gh<_i243.LanguageSelectionRepository>(),
      ),
    );
    gh.factory<_i564.AuthForgotPassword>(
      () => _i564.AuthForgotPassword(gh<_i987.AuthRepository>()),
    );
    gh.factory<_i103.AuthLogOut>(
      () => _i103.AuthLogOut(gh<_i987.AuthRepository>()),
    );
    gh.factory<_i76.AuthLoginUsecase>(
      () => _i76.AuthLoginUsecase(gh<_i987.AuthRepository>()),
    );
    gh.factory<_i232.AuthRegisterUsecase>(
      () => _i232.AuthRegisterUsecase(gh<_i987.AuthRepository>()),
    );
    gh.factory<_i757.AuthSignInWithGoogle>(
      () => _i757.AuthSignInWithGoogle(gh<_i987.AuthRepository>()),
    );
    gh.factory<_i843.LanguageSelectionCubit>(
      () => _i843.LanguageSelectionCubit(
        getSelectedLanguageUseCase:
            gh<_i239.LanguageSelectionGetSelectedLanguageUsecase>(),
        setSelectedLanguageUseCase:
            gh<_i244.LanguageSelectionSetSelectedLanguageUsecase>(),
      ),
    );
    gh.factory<_i524.AuthCubit>(
      () => _i524.AuthCubit(
        loginUseCase: gh<_i76.AuthLoginUsecase>(),
        registerUseCase: gh<_i232.AuthRegisterUsecase>(),
        forgotPasswordUseCase: gh<_i564.AuthForgotPassword>(),
        logOutUseCase: gh<_i103.AuthLogOut>(),
        signInWithGoogleUseCase: gh<_i757.AuthSignInWithGoogle>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i1035.FirebaseModule {}

class _$SharedPreferencesModule extends _i722.SharedPreferencesModule {}
