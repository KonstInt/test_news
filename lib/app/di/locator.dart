import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_news/app/di/locator.config.dart';

final getIt = GetIt.I;
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();
