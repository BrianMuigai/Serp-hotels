// Mocks generated by Mockito 5.4.5 from annotations
// in buenro_hotels/test/features/domain/list_hotels_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:buenro_hotels/core/errors/failures.dart' as _i5;
import 'package:buenro_hotels/core/storage/storage_preference_manager.dart'
    as _i8;
import 'package:buenro_hotels/features/hotels/data/models/query_hotel_model.dart'
    as _i7;
import 'package:buenro_hotels/features/hotels/data/models/search_response.dart'
    as _i6;
import 'package:buenro_hotels/features/hotels/domain/repositories/hotels_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HotelsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHotelsRepository extends _i1.Mock implements _i3.HotelsRepository {
  MockHotelsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.SearchResponse>> listHotels(
          _i7.QueryHotelModel? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #listHotels,
          [query],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.SearchResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.SearchResponse>(
          this,
          Invocation.method(
            #listHotels,
            [query],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.SearchResponse>>);
}

/// A class which mocks [SharedPreferencesManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferencesManager extends _i1.Mock
    implements _i8.SharedPreferencesManager {
  MockSharedPreferencesManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> putBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  bool? getBool(String? key) => (super.noSuchMethod(Invocation.method(
        #getBool,
        [key],
      )) as bool?);

  @override
  _i4.Future<bool> putDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  double? getDouble(String? key) => (super.noSuchMethod(Invocation.method(
        #getDouble,
        [key],
      )) as double?);

  @override
  _i4.Future<bool> putInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  int? getInt(String? key) => (super.noSuchMethod(Invocation.method(
        #getInt,
        [key],
      )) as int?);

  @override
  _i4.Future<bool> putString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  String? getString(String? key) => (super.noSuchMethod(Invocation.method(
        #getString,
        [key],
      )) as String?);

  @override
  _i4.Future<bool> putStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getStringList,
        [key],
      )) as List<String>?);

  @override
  bool isKeyExists(String? key) => (super.noSuchMethod(
        Invocation.method(
          #isKeyExists,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i4.Future<bool> clearKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #clearKey,
          [key],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> clearAll() => (super.noSuchMethod(
        Invocation.method(
          #clearAll,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
