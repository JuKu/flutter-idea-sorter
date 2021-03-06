// Mocks generated by Mockito 5.2.0 from annotations
// in flutter_idea_sorter/test/domain/usecases/idea_usecases_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:flutter_idea_sorter/domain/repositories/idea_repository.dart'
    as _i5;
import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart'
    as _i4;
import 'package:flutter_idea_sorter/infrastructure/repositories/idea_dao.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [IdeaDao].
///
/// See the documentation for Mockito's code generation for more information.
class MockIdeaDao extends _i1.Mock implements _i2.IdeaDao {
  MockIdeaDao() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Idea>> findAllIdeas() =>
      (super.noSuchMethod(Invocation.method(#findAllIdeas, []),
              returnValue: Future<List<_i4.Idea>>.value(<_i4.Idea>[]))
          as _i3.Future<List<_i4.Idea>>);
  @override
  _i3.Future<List<_i4.Idea>> findAllIdeasByArea(int? areaID) =>
      (super.noSuchMethod(Invocation.method(#findAllIdeasByArea, [areaID]),
              returnValue: Future<List<_i4.Idea>>.value(<_i4.Idea>[]))
          as _i3.Future<List<_i4.Idea>>);
  @override
  _i3.Stream<_i4.Idea?> findIdeaById(int? id) =>
      (super.noSuchMethod(Invocation.method(#findIdeaById, [id]),
          returnValue: Stream<_i4.Idea?>.empty()) as _i3.Stream<_i4.Idea?>);
  @override
  _i3.Stream<_i4.Idea?> findIdeaByTitle(String? title) =>
      (super.noSuchMethod(Invocation.method(#findIdeaByTitle, [title]),
          returnValue: Stream<_i4.Idea?>.empty()) as _i3.Stream<_i4.Idea?>);
  @override
  _i3.Future<void> insertIdea(_i4.Idea? idea) =>
      (super.noSuchMethod(Invocation.method(#insertIdea, [idea]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> delete(int? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<_i4.Idea?> getNewestGlobalIdea() =>
      (super.noSuchMethod(Invocation.method(#getNewestGlobalIdea, []),
          returnValue: Future<_i4.Idea?>.value()) as _i3.Future<_i4.Idea?>);
  @override
  _i3.Future<int?> countAll() =>
      (super.noSuchMethod(Invocation.method(#countAll, []),
          returnValue: Future<int?>.value()) as _i3.Future<int?>);
}

/// A class which mocks [IdeaRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIdeaRepository extends _i1.Mock implements _i5.IdeaRepository {
  MockIdeaRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Idea>> findAllIdeas() =>
      (super.noSuchMethod(Invocation.method(#findAllIdeas, []),
              returnValue: Future<List<_i4.Idea>>.value(<_i4.Idea>[]))
          as _i3.Future<List<_i4.Idea>>);
  @override
  _i3.Future<List<_i4.Idea>> findAllIdeasByArea(int? areaID) =>
      (super.noSuchMethod(Invocation.method(#findAllIdeasByArea, [areaID]),
              returnValue: Future<List<_i4.Idea>>.value(<_i4.Idea>[]))
          as _i3.Future<List<_i4.Idea>>);
  @override
  _i3.Stream<_i4.Idea?> findIdeaById(int? id) =>
      (super.noSuchMethod(Invocation.method(#findIdeaById, [id]),
          returnValue: Stream<_i4.Idea?>.empty()) as _i3.Stream<_i4.Idea?>);
  @override
  _i3.Future<void> insertIdea(_i4.Idea? idea) =>
      (super.noSuchMethod(Invocation.method(#insertIdea, [idea]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> delete(int? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<int> countAll() =>
      (super.noSuchMethod(Invocation.method(#countAll, []),
          returnValue: Future<int>.value(0)) as _i3.Future<int>);
}
