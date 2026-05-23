abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class OtherFailure extends Failure {
  OtherFailure(super.message);
}

class MockLocationFailure extends Failure {
  MockLocationFailure(super.message);
}