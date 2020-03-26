library singleton;

var singletonLoggedIn = new Impl();

class Impl {
  bool loggedIn = true;
}