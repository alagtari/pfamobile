class ResponseWrapper<T> {
  final String? message;
  final T? payload;

  ResponseWrapper({required this.message, required this.payload});

  factory ResponseWrapper.fromJson(
      dynamic json, T Function(dynamic) fromJsonT) {
    final String message = json['message'];
    return ResponseWrapper(
      message: message,
      payload: json['payload'] != null ? fromJsonT(json['payload']) : null,
    );
  }
}
