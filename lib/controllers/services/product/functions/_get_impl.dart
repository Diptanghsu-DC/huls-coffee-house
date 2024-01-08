part of '../product_controller.dart';

Stream<List<ProductModel>> _getImpl({
  String? id,
  String? category,
  String? itemName,
  bool forceGet = false,
}) async* {
  if (itemName == null && category == null && id == null) {
    throw ArgumentError(
        "item-id or food category or item name must be provided");
  }

  List<ProductModel> filteredProducts = [];
  filteredProducts = await _fetchLocal(
    id: id,
    category: category,
    itemName: itemName,
    forceGet: forceGet,
  );

  if (filteredProducts.isNotEmpty) yield filteredProducts;
  filteredProducts = await _fetchFromBackend(
    id: id,
    category: category,
    itemName: itemName,
    forceGet: forceGet,
  );

  yield filteredProducts;
}

Future<List<ProductModel>> _fetchLocal({
  String? id,
  String? category,
  String? itemName,
  bool forceGet = false,
}) async {
  List<ProductModel> filteredProducts = [];
  if (forceGet) {
    await LocalDatabase.deleteKey(LocalDocuments.products.name);
  } else {
    List<String> data = LocalDatabase.get(LocalDocuments.products.name);
    Map res = data.isEmpty ? {} : jsonDecode(data[0]);

    for (dynamic model in res.values) {
      model = Formatter.convertMapToMapStringDynamic(model);
      if (id != null && model["_id"] == id) {
        filteredProducts.add(ProductModel.fromJson(model));
        break;
      } else if (category != null &&
          model[ProductFields.category.name] == category) {
        filteredProducts.add(ProductModel.fromJson(model));
      } else if (itemName != null &&
          model[ProductFields.itemName.name] == itemName) {
        filteredProducts.add(ProductModel.fromJson(model));
      }
    }
  }
  return filteredProducts;
}

Future<List<ProductModel>> _fetchFromBackend({
  String? id,
  String? category,
  String? itemName,
  bool forceGet = false,
}) async {
  List<ProductModel> filteredProducts = [];

  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(ProductController._collectionName);

  Query query = collection;

  if (id != null) {
    query = query.where(FieldPath.documentId, isEqualTo: id);
  }
  if (category != null) {
    query = query.where(ProductFields.category.name, isEqualTo: category);
  }
  if (itemName != null) {
    query = query.where(ProductFields.itemName.name, isEqualTo: itemName);
  }

  QuerySnapshot querySnapshot = await query.get();

  List<Map<String, dynamic>> res = querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();

  filteredProducts = res.map((model) => ProductModel.fromJson(model)).toList();

  // for (int i = 0; i < filteredProducts.length; i++) {
  //   filteredProducts[i] = await ProductController._save(filteredProducts[i]);
  // }
  return filteredProducts;
}
