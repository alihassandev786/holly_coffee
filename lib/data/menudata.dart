import 'package:hollycoffee/core/constants/appimages.dart';
import 'package:hollycoffee/models/populardrinkmodel.dart';
import 'package:hollycoffee/models/categorychipmodel.dart';

class Menudata {
  static const List<Categorychipmodel> categories = [
    Categorychipmodel(
      image: Appimages.categorychip,
      title: "Hot Lattes",
      id: "hot_lattes",
    ),
    Categorychipmodel(
      image: Appimages.categorychip,
      title: "Brewd Coffee",
      id: "brewd_coffee",
    ),
    Categorychipmodel(
      image: Appimages.categorychip,
      title: "Iced Lattes",
      id: "iced_lettes",
    ),
    Categorychipmodel(
      image: Appimages.categorychip,
      title: "Shaken Espressos",
      id: "shaken_espressos",
    ),
    Categorychipmodel(
      image: Appimages.categorychip,
      title: "Cold Brews",
      id: "cold_brews",
    ),
    Categorychipmodel(
      image: Appimages.categorychip,
      title: "Frappes",
      id: "frappes",
    ),
    Categorychipmodel(
      image: Appimages.categorychip,
      title: "Matcha",
      id: "matcha",
    ),
    Categorychipmodel(image: Appimages.categorychip, title: "Teas", id: "teas"),
    Categorychipmodel(
      image: Appimages.categorychip,
      title: "Refreshers",
      id: "refreshers",
    ),
    Categorychipmodel(
      image: Appimages.categorychip,
      title: "Boba Add-On",
      id: "boba_addon",
    ),
    Categorychipmodel(
      id: 'add-ons',
      title: 'Add Ons',
      image: Appimages.categorychip,
    ),
    Categorychipmodel(
      id: 'energy',
      title: 'Energy',
      image: Appimages.categorychip,
    ),
    Categorychipmodel(
      id: 'arepa_cake',
      title: 'Arepa Cake',
      image: Appimages.categorychip,
    ),
    Categorychipmodel(
      id: 'pastries',
      title: 'Pastries',
      image: Appimages.categorychip,
    ),
    Categorychipmodel(
      id: 'breakfast',
      title: 'Breakfast',
      image: Appimages.categorychip,
    ),
  ];
  static final List<Populardrinkmodel> product = [
    //hot lattee product
    Populardrinkmodel(
      image: Appimages.categorycard,
      name: "Holy Latte",
      price: 4.99,
      divinePrice: 5.99,
      categoryId: "hot_lattes",
    ),
    Populardrinkmodel(
      name: 'Blessed Vanilla Latte',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'hot_lattes',
    ),
    Populardrinkmodel(
      name: 'Heavenly Caramel Latte',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'hot_lattes',
    ),
    Populardrinkmodel(
      name: 'Sinful Mocha',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'hot_lattes',
    ),
    Populardrinkmodel(
      name: 'White Halo Mocha',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'hot_lattes',
    ),
    Populardrinkmodel(
      name: 'Spiced Holy Chai',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'hot_lattes',
    ),
    // brewd coffee product
    Populardrinkmodel(
      name: 'Holy Brew',
      image: Appimages.categorycard,
      price: 2.99,
      divinePrice: 3.99,
      categoryId: 'brewd_coffee',
    ),
    Populardrinkmodel(
      name: 'Heaven Brew Dark Roast',
      image: Appimages.categorycard,
      price: 3.99,
      divinePrice: 4.99,
      categoryId: 'brewd_coffee',
    ),
    // iced lattes product
    Populardrinkmodel(
      name: 'Iced Holy Latte',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'iced_lettes',
    ),
    Populardrinkmodel(
      name: 'Iced Blessed Vanilla',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'iced_lettes',
    ),
    Populardrinkmodel(
      name: 'Iced Heavenly Caramel',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'iced_lettes',
    ),
    Populardrinkmodel(
      name: 'Iced Sinful Mocha',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'iced_lettes',
    ),
    // shaken espressos product
    Populardrinkmodel(
      name: 'Brown Sugar Holy Shaken',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'shaken_espressos',
    ),
    Populardrinkmodel(
      name: 'Heavenly Caramel Shaken',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'shaken_espressos',
    ),
    //cold brews product
    Populardrinkmodel(
      name: 'Cold Brew of the Saints',
      image: Appimages.categorycard,
      price: 4.99,
      divinePrice: 5.99,
      categoryId: 'cold_brews',
    ),
    Populardrinkmodel(
      name: 'Heaven Foam Cold Brew',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'cold_brews',
    ),
    // frappes
    Populardrinkmodel(
      name: 'Caramel Cloud Frappe',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'frappes',
    ),
    Populardrinkmodel(
      name: 'Mocha Miracle Frappe',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'frappes',
    ),
    //matcha product
    Populardrinkmodel(
      name: 'Green Angel Matcha',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'matcha',
    ),

    //teas product
    Populardrinkmodel(
      name: 'Heavenly Black Tea',
      image: Appimages.categorycard,
      price: 3.99,
      divinePrice: 4.99,
      categoryId: 'teas',
    ),
    Populardrinkmodel(
      name: 'Heavenly Green Tea',
      image: Appimages.categorycard,
      price: 3.99,
      divinePrice: 4.99,
      categoryId: 'teas',
    ),

    //refreshers products
    Populardrinkmodel(
      name: 'Strawberry Halo',
      image: Appimages.categorycard,
      price: 4.99,
      divinePrice: 5.99,
      categoryId: 'refreshers',
    ),
    Populardrinkmodel(
      name: 'Mango Halo',
      image: Appimages.categorycard,
      price: 4.99,
      divinePrice: 5.99,
      categoryId: 'refreshers',
    ),

    //boba product
    Populardrinkmodel(
      name: 'Add Boba',
      image: Appimages.categorycard,
      price: 1.49,
      categoryId: 'boba_addon',
    ),

    //add ons product
    Populardrinkmodel(
      name: 'Holy Shot (extra espresso)',
      image: Appimages.categorycard,
      price: 0.99,
      categoryId: 'add-ons',
    ),
    Populardrinkmodel(
      name: 'Cold Foam',
      image: Appimages.categorycard,
      price: 0.99,
      categoryId: 'add-ons',
    ),
    Populardrinkmodel(
      name: 'Angel Milk (oat/almond)',
      image: Appimages.categorycard,
      price: 0.99,
      categoryId: 'add-ons',
    ),
    Populardrinkmodel(
      name: 'Flavor Blessing (any syrup)',
      image: Appimages.categorycard,
      price: 0.99,
      categoryId: 'add-ons',
    ),

    //energy product
    Populardrinkmodel(
      name: 'Holy Pink Bull',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'energy',
    ),
    Populardrinkmodel(
      name: 'Holy Blue Bull',
      image: Appimages.categorycard,
      price: 5.99,
      divinePrice: 6.99,
      categoryId: 'energy',
    ),
    Populardrinkmodel(
      name: 'Holy Bull Cream Float',
      image: Appimages.categorycard,
      price: 6.99,
      divinePrice: 7.99,
      categoryId: 'energy',
    ),
    Populardrinkmodel(
      name: 'Holy Bull Boba Refresher',
      image: Appimages.categorycard,
      price: 6.49,
      divinePrice: 7.49,
      categoryId: 'energy',
    ),
    Populardrinkmodel(
      name: 'Holy Wings Shot',
      image: Appimages.categorycard,
      price: 2.99,
      categoryId: 'energy',
    ),

    //arepa cake product
    Populardrinkmodel(
      name: 'Holy Honey Corn Cake (Arepa Cake)',
      image: Appimages.categorycard,
      price: 3.99,
      categoryId: 'arepa_cake',
    ),

    //pastries product
    Populardrinkmodel(
      name: 'Holy Nutella Croissant',
      image: Appimages.categorycard,
      price: 4.99,
      categoryId: 'pastries',
    ),
    Populardrinkmodel(
      name: 'Butter Croissant',
      image: Appimages.categorycard,
      price: 3.99,
      categoryId: 'pastries',
    ),
    Populardrinkmodel(
      name: 'Chocolate Croissant',
      image: Appimages.categorycard,
      price: 4.49,
      categoryId: 'pastries',
    ),
    Populardrinkmodel(
      name: 'Cream Cheese Danish',
      image: Appimages.categorycard,
      price: 4.49,
      categoryId: 'pastries',
    ),
    Populardrinkmodel(
      name: 'Blueberry Muffin',
      image: Appimages.categorycard,
      price: 3.99,
      categoryId: 'pastries',
    ),
    Populardrinkmodel(
      name: 'Lemon Loaf Slice',
      image: Appimages.categorycard,
      price: 3.99,
      categoryId: 'pastries',
    ),

    //breakfast products
    Populardrinkmodel(
      name: 'Holy Egg & Cheese Croissant',
      image: Appimages.categorycard,
      price: 4.49,
      categoryId: 'breakfast',
    ),
  ];
  static List<Populardrinkmodel> getProducts(String categoryId) {
    return product
        .where((product) => product.categoryId == categoryId)
        .toList();
  }

  static List<Categorychipmodel> get homecategories {
    return categories.take(4).toList();
  }

  static List<Populardrinkmodel> get popularproducts {
    return product.take(3).toList();
  }
}
