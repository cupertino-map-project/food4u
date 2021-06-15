import 'package:exercise3/screens/login/login_viewmodel.dart';
import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:exercise3/screens/main/profile/profile_viewmodel.dart';
import 'package:exercise3/screens/register/register_viewmodel.dart';
import 'package:exercise3/services/food/food_service.dart';
import 'package:exercise3/services/food/food_service_rest.dart';
import 'package:exercise3/services/user/user_service.dart';
import 'package:exercise3/services/user/user_service_rest.dart';
import 'package:get_it/get_it.dart';

// import '../services/auth/auth_service_mock.dart';
// import '../services/counter/counter_service_mock.dart';
import '../services/rest.dart';
import '../screens/user/user_viewmodel.dart';

import '../services/auth/auth_service.dart';
import '../services/counter/counter_service.dart';

import '../services/auth/auth_service_rest.dart';
import '../services/counter/counter_service_rest.dart';

// import '../services/auth/auth_service_mock.dart';
// import '../services/counter/counter_service_mock.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  dependency.registerLazySingleton<RestService>(
    //() => RestService(baseUrl: 'http://10.211.98.133:3000'),
    // () => RestService(
    //     baseUrl: 'http://10.211.98.133:5001/food4u-60335/us-central1/api'),
    () => RestService(
        baseUrl: 'https://us-central1-food4u-60335.cloudfunctions.net/api'),
  );

  dependency.registerLazySingleton<CounterService>(() => CounterServiceRest());
  dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  dependency.registerLazySingleton<FoodService>(() => FoodServiceRest());
  dependency.registerLazySingleton<UserService>(() => UserServiceRest());

  // dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());

  // Viewmodels
  dependency.registerLazySingleton(() => LoginViewmodel());
  dependency.registerLazySingleton(() => RegisterViewModel());
  dependency.registerLazySingleton(() => MainViewmodel());
  dependency.registerLazySingleton(() => UserViewmodel());
  dependency.registerLazySingleton(() => ProfileViewModel());
}
