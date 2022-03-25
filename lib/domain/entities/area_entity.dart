import 'package:floor/floor.dart';

@Entity(tableName: 'areas')
class Area {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String title;

  Area(this.id, this.title);
}
