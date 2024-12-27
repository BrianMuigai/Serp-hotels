import 'package:buenro_hotels/core/errors/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type?>> call(Params params);
}

// Pass this when the usecase expects no parameters
// e.g a call to get a list of shows
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetHotelsParams extends Equatable {
  final String engine;
  final String q;
  final String gl;
  final String hl;
  final String currency;
  final String checkInDate;
  final String checkOutDate;

  const GetHotelsParams(
      {this.engine = 'google_hotels',
      this.q = 'Bali Resorts',
      this.gl = 'us',
      this.hl = 'en',
      this.currency = 'USD',
      required this.checkInDate,
      required this.checkOutDate});

  @override
  List<Object?> get props =>
      [engine, q, gl, hl, currency, checkInDate, checkOutDate];
}
