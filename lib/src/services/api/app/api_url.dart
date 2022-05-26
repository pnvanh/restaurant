class APIUrl {
  static const host = 'http://localhost:8000/';
  static const apiVersion = 'api/v1/';
  static const root = host + apiVersion;

  static const login = root + 'auth/login';
  static const banners = root + 'banners';
}
