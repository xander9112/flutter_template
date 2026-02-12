abstract class UseCase<Response, Params> {
  Future<Response> call(Params params);
}

abstract class UseCaseNoParams<Response> {
  Future<Response> call();
}
