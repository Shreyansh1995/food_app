// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FoodDao? _foodDaoInstance;

  CartDao? _cartDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `food` (`id` INTEGER, `name` TEXT, `imageUrl` TEXT, `price` REAL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cart` (`id` INTEGER, `name` TEXT, `imageUrl` TEXT, `price` REAL, `quantity` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FoodDao get foodDao {
    return _foodDaoInstance ??= _$FoodDao(database, changeListener);
  }

  @override
  CartDao get cartDao {
    return _cartDaoInstance ??= _$CartDao(database, changeListener);
  }
}

class _$FoodDao extends FoodDao {
  _$FoodDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _foodItemModelInsertionAdapter = InsertionAdapter(
            database,
            'food',
            (FoodItemModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'price': item.price
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FoodItemModel> _foodItemModelInsertionAdapter;

  @override
  Future<List<FoodItemModel>> getFood() async {
    return _queryAdapter.queryList('SELECT * FROM food',
        mapper: (Map<String, Object?> row) => FoodItemModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            imageUrl: row['imageUrl'] as String?,
            price: row['price'] as double?));
  }

  @override
  Future<FoodItemModel?> findFoodById(int id) async {
    return _queryAdapter.query('SELECT * FROM food WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FoodItemModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            imageUrl: row['imageUrl'] as String?,
            price: row['price'] as double?),
        arguments: [id]);
  }

  @override
  Future<void> insertFood(FoodItemModel food) async {
    await _foodItemModelInsertionAdapter.insert(food, OnConflictStrategy.replace);
  }
}

class _$CartDao extends CartDao {
  _$CartDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cartModelInsertionAdapter = InsertionAdapter(
            database,
            'cart',
            (CartModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'price': item.price,
                  'quantity': item.quantity
                }),
        _cartModelUpdateAdapter = UpdateAdapter(
            database,
            'cart',
            ['id'],
            (CartModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'price': item.price,
                  'quantity': item.quantity
                }),
        _cartModelDeletionAdapter = DeletionAdapter(
            database,
            'cart',
            ['id'],
            (CartModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'price': item.price,
                  'quantity': item.quantity
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CartModel> _cartModelInsertionAdapter;

  final UpdateAdapter<CartModel> _cartModelUpdateAdapter;

  final DeletionAdapter<CartModel> _cartModelDeletionAdapter;

  @override
  Future<List<CartModel>> findAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM cart',
        mapper: (Map<String, Object?> row) => CartModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            imageUrl: row['imageUrl'] as String?,
            price: row['price'] as double?,
            quantity: row['quantity'] as int?));
  }

  @override
  Future<CartModel?> findProductById(int id) async {
    return _queryAdapter.query('SELECT * FROM cart WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CartModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            imageUrl: row['imageUrl'] as String?,
            price: row['price'] as double?,
            quantity: row['quantity'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> updateProductQuantity(
    int id,
    int quantity,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE cart SET quantity = ?2 WHERE id = ?1',
        arguments: [id, quantity]);
  }

  @override
  Future<void> insertProduct(CartModel cart) async {
    await _cartModelInsertionAdapter.insert(cart, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateProduct(CartModel cart) async {
    await _cartModelUpdateAdapter.update(cart, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteProduct(CartModel cart) async {
    await _cartModelDeletionAdapter.delete(cart);
  }
}
