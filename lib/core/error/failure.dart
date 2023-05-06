abstract class Failure {
  const Failure();
}

class LocalFailure extends Failure {
  final String message;

  const LocalFailure(this.message);
}
