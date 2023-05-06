abstract class Exception {
  const Exception();
}

class LocalException extends Exception {
  final String message;

  const LocalException(this.message);
}
