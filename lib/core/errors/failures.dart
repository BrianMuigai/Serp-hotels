import 'package:buenro_hotels/common/res/strings.dart';
import 'package:buenro_hotels/core/api_client/models/server_error.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  const Failure([List props = const []]) : super();
}

// general failures
class ServerFailure extends Failure {
  final ServerError? badResponse;

  const ServerFailure({this.badResponse});

  @override
  List<Object?> get props =>
      [badResponse?.getErrorMessage() ?? AppStrings.serverFailed];

  @override
  String toString() {
    return badResponse?.getErrorMessage() ?? AppStrings.somethingWentWrong;
  }
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [AppStrings.cacheFailure];
}

class ConnectionFailure extends Failure {
  @override
  List<Object?> get props => [AppStrings.failedToConnectToNetwork];
}

class ClientFailure extends Failure {
  final String error;

  const ClientFailure({required this.error});

  @override
  List<Object?> get props => [error];

  @override
  String toString() => error;
}

class GeneralFailure extends Failure {
  final String error;

  const GeneralFailure({required this.error});

  @override
  List<Object?> get props => [error];

  @override
  String toString() => error;
}
