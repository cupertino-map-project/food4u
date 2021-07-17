import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/viewmodel.dart';
import 'package:exercise3/services/food/food_service.dart';

class AddProductViewModel extends Viewmodel {
  FoodService get _service => dependency();

  Food _food = Food();

  get name => _food.name;
  set name(value) {
    turnBusy();
    _food.name = value;
    turnIdle();
  }

  get ownerName => _food.ownerName;
  set ownerName(value) {
    turnBusy();
    _food.ownerName = value;
    turnIdle();
  }

  get description => _food.description;
  set description(value) {
    turnBusy();
    _food.description = value;
    turnIdle();
  }

  get price => _food.price;
  set price(value) {
    turnBusy();
    _food.price = value;
    turnIdle();
  }

  get photoUrl => _food.photoUrl;
  void setPhotoUrl(value) {
    print(name);
    //print(address);
    print(photoUrl);
    turnBusy();
    _food.photoUrl = value;
    turnIdle();
  }

  Future<Food> addFood() async {
    turnBusy();
    final Food _food = await _service.addFood(
        food: new Food(
      name: name,
      ownerName: ownerName,
      description: description,
      photoUrl: photoUrl,
      price: price,
    ));
    turnIdle();
    return _food;
  }
}
