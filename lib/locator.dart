import 'package:get_it/get_it.dart';
import 'package:my_app/services/navigation.dart';

final locator = GetIt.instance;

void setupLocator() async {
  locator.registerLazySingleton(() => NavigationService.getInstance());
}
