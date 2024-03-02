import 'package:get_it/get_it.dart';
import '../../features/home/home_controller.dart';
import '../../features/sign_in/sign_in_controller.dart';
import '../../features/splash/splash_controller.dart';
import '../../repositories/transaction_repository.dart';

import '../features/sign_up/sign_up_controller.dart';
import '../services/services.dart';

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
