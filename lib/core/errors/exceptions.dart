import 'package:equatable/equatable.dart';

class ApiException extends Equatable implements Exception {
  const ApiException({required this.message, required this.statusCode});
  final String message;
  final String statusCode;

  @override
  // TODO: implement props
  List<Object?> get props => [message, statusCode];
}
