import 'package:hive_flutter/hive_flutter.dart';
import 'package:wiki_reader/summary.dart';

class SummaryAdapter extends TypeAdapter<Summary> {
  @override
  final int typeId = 0;

  @override
  Summary read(BinaryReader reader) {
    return Summary(
      titles: reader.read(),
      extract: reader.read(),
      pageId: reader.read(),
      extractHtml: reader.read(),
      lang: reader.read(),
      dir: reader.read(),
      url: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Summary obj) {
    writer.write(obj.titles);
    writer.write(obj.pageId);
    writer.write(obj.extract);
    writer.write(obj.extractHtml);
    writer.write(obj.lang);
    writer.write(obj.dir);
    writer.write(obj.url);
  }
}

