import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/activity_model.dart';
import '../../data/models/daily_step_model.dart';
import '../../data/models/water_model.dart';
import '../../data/models/settings_model.dart';

class LocalStorageService {
  static Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);

    // Register Adapters
    Hive.registerAdapter(ActivityModelAdapter());
    Hive.registerAdapter(DailyStepModelAdapter());
    Hive.registerAdapter(WaterModelAdapter());
    Hive.registerAdapter(SettingsModelAdapter());

    // Open Boxes
    await Hive.openBox<ActivityModel>('activities');
    await Hive.openBox<DailyStepModel>('daily_steps');
    await Hive.openBox<WaterModel>('water_intake');
    await Hive.openBox<SettingsModel>('settings');
  }

  Box<ActivityModel> get activityBox => Hive.box<ActivityModel>('activities');
  Box<DailyStepModel> get dailyStepBox => Hive.box<DailyStepModel>('daily_steps');
  Box<WaterModel> get waterBox => Hive.box<WaterModel>('water_intake');
  Box<SettingsModel> get settingsBox => Hive.box<SettingsModel>('settings');

  Future<void> close() async {
    await Hive.close();
  }
}
