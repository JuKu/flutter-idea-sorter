import 'package:flutter_idea_sorter/domain/repositories/idea_dao.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';
import 'package:mockito/annotations.dart';

import 'idea_usecases_test.mocks.dart';

@GenerateMocks([IdeaDao])
void main() {
  late IdeaUseCases ideaUseCases;
  late MockIdeaDao mockIdeaDao;
}
