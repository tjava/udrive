import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@Injectable()
@module
abstract class ThirdPartyServicesModule {
  @LazySingleton()
  Uuid get uuid => const Uuid();

  @LazySingleton()
  HiveInterface get hive => Hive;

  @LazySingleton()
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
