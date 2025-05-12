import 'package:flutter_bloc_learn/core/errors/failures.dart';

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final AppFailure error;
  Failure(this.error);
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get data => this is Success<T> ? (this as Success<T>).data : null;
  AppFailure? get error =>
      this is Failure<T> ? (this as Failure<T>).error : null;
}
