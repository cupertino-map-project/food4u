class User {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _name;
  String _photoUrl;
  String _login;
  String _password;
  String _phoneNo;
  String _address;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get photoUrl => _photoUrl;
  set photoUrl(value) => _photoUrl = value;

  get login => _login;
  set login(value) => _login = value;

  get password => _password;
  set password(value) => _password = value;

  get phoneNo => _phoneNo;
  set phoneNo(value) => _phoneNo = value;

  get address => _address;
  set address(value) => _address = value;

  User(
      {dynamic id,
      String name = '',
      String photoUrl = '',
      String login = '',
      String password = '',
      String email = '',
      String phoneNo = '',
      String address = ''})
      : _id = id,
        _name = name,
        _photoUrl = photoUrl,
        _login = login,
        _password = password,
        _phoneNo = phoneNo,
        _address = address;

  User.copy(User from)
      : this(
            id: from.id,
            name: from.name,
            photoUrl: from.photoUrl,
            login: from.login,
            password: from.password,
            phoneNo: from.phoneNo,
            address: from.address);

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          photoUrl: json['photoUrl'],
          login: json['login'],
          password: json['password'],
          phoneNo: json['phoneNo'],
          address: json['address'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photoUrl': photoUrl,
        'login': login,
        'password': password,
        'phoneNo': phoneNo,
        'address': address,
      };
}
