// Mocks generated by Mockito 5.4.5 from annotations
// in buenro_hotels/test/features/domain/list_hotels_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:buenro_hotels/core/errors/failures.dart' as _i5;
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
