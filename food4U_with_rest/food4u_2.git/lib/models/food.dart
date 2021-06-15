class Food {
  String _name;
  String _ownerName;
  String _description;
  String _photoUrl;
  double _price;

  get name => _name;
  set name(value) => _name = value;

  get ownerName => _ownerName;
  set ownerName(value) => _ownerName = value;

  get description => _description;
  set description(value) => _description = value;

  get photoUrl => _photoUrl;
  set photoUrl(value) => _photoUrl = value;

  get price => _price;
  set price(value) => _price = value;

  Food(
      {String name = '',
      String ownerName = '',
      String description = '',
      String photoUrl = '',
      double price = 0.0})
      : _name = name,
        _ownerName = ownerName,
        _description = description,
        _photoUrl = photoUrl,
        _price = price;

  Food.copy(Food from)
      : this(
          name: from.name,
          ownerName: from.ownerName,
          description: from.description,
          photoUrl: from.photoUrl,
          price: from.price,
        );

  Food.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          ownerName: json['ownerName'],
          description: json['description'],
          photoUrl: json['photoUrl'],
          price: double.parse(json['price']),
        );

  Map<String, dynamic> toJson() => {
        'name': name,
        'ownerName': ownerName,
        'description': description,
        'photoUrl': photoUrl,
        'price': price,
      };
}