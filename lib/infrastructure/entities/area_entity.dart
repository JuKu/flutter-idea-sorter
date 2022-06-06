import 'package:floor/floor.dart';

enum SyncMode {
  /// This mode is enable
  googleDrive,

  cloud,

  none
}

@Entity(tableName: 'areas')
class Area {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String title;

  final bool syncEnabled;

  final SyncMode syncMode;

  Area(this.id, this.title, this.syncEnabled, this.syncMode);
}
