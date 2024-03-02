import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/home_controller.dart';
import '../../features/sign_in/sign_in_controller.dart';
import '../../features/splash/splash_controller.dart';
import '../../repositories/transaction_repository.dart';

import '../common/features/balance/balance.dart';
import '../common/features/transaction/transaction.dart';
import '../features/profile/profile.dart';
import '../features/sign_up/sign_up_controller.dart';
import '../features/stats/stats_controller.dart';
import '../features/wallet/wallet_controller.dart';
import '../services/services.dart';
import '../services/user_data_service/user_data_service.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>((() => FirebaseAuthService()));

  locator.registerFactory<SecureStorageService>(
      () => const SecureStorageService());

  locator.registerFactory<UserDataService>(() => UserDataServiceImpl(
        firebaseAuth: FirebaseAuth.instance,
        firebaseFunctions: FirebaseFunctions.instance,
      ));

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

  locator.registerLazySingleton<BalanceController>(
    () => BalanceController(
      transactionRepository: locator.get<TransactionRepository>(),
    ),
  );

  //Register Repositories

  locator.registerLazySingleton<TransactionController>(
    () => TransactionController(
      transactionRepository: locator.get<TransactionRepository>(),
      secureStorageService: locator.get<SecureStorageService>(),
    ),
  );

  locator.registerLazySingleton<WalletController>(
    () => WalletController(
      transactionRepository: locator.get<TransactionRepository>(),
    ),
  );

  locator.registerFactory<ProfileController>(
      () => ProfileController(userDataService: locator.get<UserDataService>()));

  locator.registerLazySingleton<StatsController>(() => StatsController(
      transactionRepository: locator.get<TransactionRepository>()));
}
