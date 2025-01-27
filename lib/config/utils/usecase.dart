abstract class UseCase<T, Params> {
  Future<T> call(Params params);

  Stream<T> callAsStream(Params params);
}

class NoParams {}
