import 'package:hive/hive.dart';

part 'activity_model.g.dart';

@HiveType(typeId: 0)
class ActivityModel extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int duration;

  @HiveField(2)
  late int calories;

  @HiveField(3)
  late DateTime timestamp;
}
