// Mocks generated by Mockito 5.4.2 from annotations
// in anywhere_code_challange/test/presentation/view_models/home_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:anywhere_code_challange/data/models/character_model.dart'
    as _i5;
import 'package:anywhere_code_challange/domain/repositories/character_repository.dart'
    as _i2;
import 'package:anywhere_code_challange/domain/use_cases/get_characters_use_case.dart'
    as _i3;
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
// ignore_for_file: subtype_of_sealed_class

class _FakeCharacterRepository_0 extends _i1.SmartFake
    implements _i2.CharacterRepository {
  _FakeCharacterRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetCharactersUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCharactersUseCase extends _i1.Mock
    implements _i3.GetCharactersUseCase {
  MockGetCharactersUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CharacterRepository get characterRepository => (super.noSuchMethod(
        Invocation.getter(#characterRepository),
        returnValue: _FakeCharacterRepository_0(
          this,
          Invocation.getter(#characterRepository),
        ),
      ) as _i2.CharacterRepository);

  @override
  _i4.Future<List<_i5.CharacterModel>> getCharacters() => (super.noSuchMethod(
        Invocation.method(
          #getCharacters,
          [],
        ),
        returnValue:
            _i4.Future<List<_i5.CharacterModel>>.value(<_i5.CharacterModel>[]),
      ) as _i4.Future<List<_i5.CharacterModel>>);
}

/// A class which mocks [CharacterModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharacterModel extends _i1.Mock implements _i5.CharacterModel {
  MockCharacterModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: '',
      ) as String);

  @override
  String get text => (super.noSuchMethod(
        Invocation.getter(#text),
        returnValue: '',
      ) as String);

  @override
  String get image => (super.noSuchMethod(
        Invocation.getter(#image),
        returnValue: '',
      ) as String);

  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);
}
