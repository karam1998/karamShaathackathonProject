class ApiSettings {
  static const _baseUrl = "http://events.mr-dev.tech/";
  static const _imageUrl = _baseUrl + "images/";
  static const _apiUrl = _baseUrl + "api/";

  static getImageUrl(String image) {
    return _imageUrl + image;
  }
  static const users = _apiUrl + 'users';
  static const categories = _apiUrl + 'categories';
  static const login = _apiUrl + 'auth/login';
  static const logoutUser = _apiUrl + "auth/logout";
  static const images = _apiUrl + 'student/images/{id}';
}
