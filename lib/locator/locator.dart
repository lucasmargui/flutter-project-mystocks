import 'package:get_it/get_it.dart';
import 'package:mystock_app/features/home/home_controller.dart';
import 'package:mystock_app/features/sign_in/sign_in_controller.dart';
import 'package:mystock_app/features/splash/splash_controller.dart';
import 'package:mystock_app/repositories/transaction_repository.dart';
import 'package:mystock_app/services/auth_service.dart';
import 'package:mystock_app/services/firebase_auth_service.dart';
import 'package:mystock_app/services/mock_auth_service.dart';
import 'package:mystock_app/services/secure_storage.dart';

import '../features/sign_up/sign_up_controller.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>((() => FirebaseAuthService()));

  //não há necessidade de fazer um singleton pois passamos ele como constante
  locator.registerFactory<SplashController>(
      () => SplashController(const SecureStorageService()));

  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));

  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));

  locator.registerFactory<TransactionRepository>(
    () => TransactionRepositoryImpl(),
  );
  locator.registerLazySingleton<HomeController>(
    () => HomeController(locator.get<TransactionRepository>()),
  );
}
