import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weekly_tasks/get_it_conf.config.dart' as get_conf;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => get_conf.init(getIt);
