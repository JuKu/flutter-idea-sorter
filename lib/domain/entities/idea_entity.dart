import 'package:floor/floor.dart';

@Entity(tableName: 'ideas')
class Idea {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String title;
  final String description;
  //final double grade;

  Idea(this.id, this.title, this.description);
}