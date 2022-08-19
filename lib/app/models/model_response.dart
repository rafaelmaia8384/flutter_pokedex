class ServerResponse<T> {
  int? statusCode;
  String? message;
  String? details;
  T? data;

  ServerResponse({
    this.statusCode,
    this.message,
    this.details,
    this.data,
  });

  ServerResponse<U> cast<U>() {
    return ServerResponse<U>()..data = data as U;
  }
}
