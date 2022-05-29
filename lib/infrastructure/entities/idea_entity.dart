import 'package:floor/floor.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/area_entity.dart';

@Entity(
  tableName: 'ideas',
  // see also: https://gitee.com/TheKingGo/floor#entities
  foreignKeys: [
    ForeignKey(
      childColumns: ['area_id'],
      parentColumns: ['id'],
      entity: Area,
    )
  ],
  indices: [
    Index(value: ['area_id'])
  ],
)
class Idea {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'area_id')
  final int areaId;

  final String title;
  final String description;
  //final double grade;

  Idea(this.id, this.title, this.description, this.areaId);
}
