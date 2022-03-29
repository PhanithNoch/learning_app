class Singleton {
  static final Singleton _singleton = Singleton._internal();
  String? message;

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
