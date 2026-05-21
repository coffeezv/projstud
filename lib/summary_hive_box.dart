import 'package:hive_flutter/hive_flutter.dart';
import 'package:wiki_reader/summary.dart';
import 'package:hive/hive.dart';

const summaryHiveBox = "summaryhivebox";

class SummaryHiveBox {
  static Box<Summary> get box => Hive.box<Summary>(summaryHiveBox);
  static void create(Summary summary) {
    box.put(summary.pageId.toString(), summary);
  }

  static Summary? get(String key) {
    return box.get(key);
  }

  static List<Summary> getAll() {
    return box.values.toList();
  }
}

@HiveType(typeId: 1)
class Article {
  @HiveField(0)
  final String titles;
  @HiveField(1)
  final String? imageSource;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final int id;

  const Article({
    required this.id,
    required this.titles,
    this.imageSource,
    this.description,
  });
}

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 1;

  @override
  Article read(BinaryReader reader) {
    return Article(
      titles: reader.read() as String,
      imageSource: reader.read() as String,
      description: reader.read() as String,
      id: reader.read() as int,
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer.write(obj.titles);
    writer.write(obj.imageSource);
  }
}

Future main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleAdapter());
}
