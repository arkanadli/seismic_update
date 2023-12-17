import 'package:equatable/equatable.dart';
import 'package:seismic_update/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  final String message;
  final String statusCode;

  const Failure({required this.message, required this.statusCode});

  String get errorMessage => '$statusCode Error : $message';

  @override
  // TODO: implement props
  List<Object?> get props => [
        message,
        statusCode,
      ];
}

class ApiFailure extends Failure {
  const ApiFailure({required super.message, required super.statusCode});

  factory ApiFailure.fromException(ApiException apiException) {
    return ApiFailure(
        message: apiException.message, statusCode: apiException.statusCode);
  }
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: '', statusCode: '');
}
