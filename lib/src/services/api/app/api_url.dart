class APIUrl {
  static const host = 'http://localhost:8000/';
  static const apiVersion = 'api/v1/';
  static const root = host + apiVersion;

  static const login = root + 'auth/login';
  static const banners = root + 'banners';
  static const newFood = root + 'new-food';
  static const restaurant = root + 'restaurant';
}

class APIDiscoveryUrl {
  static const host = 'https://api.yelp.com/';
  static const apiVersion = 'v3/';
  static const root = host + apiVersion;
  static const business = root + 'businesses/';
  static const search = business + "search";
}
