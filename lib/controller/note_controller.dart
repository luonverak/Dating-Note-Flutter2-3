import 'package:local_storage/database/service_db.dart';
import 'package:local_storage/model/note_model.dart';

class NoteController {
  final service = ServiceDatabase();
  Future<void> insertData(NoteModel noteModel) async {
    final db = await service.initializeData();
    await db.insert(service.table, noteModel.fromJson());
  }

  Future<List<NoteModel>> getData() async {
    final db = await service.initializeData();
    List<Map<String, dynamic>> result = await db.query(service.table);
    return result.map((e) => NoteModel.toJson(e)).toList();
  }

  Future<void> updateData(NoteModel noteModel) async {
    final db = await service.initializeData();
    await db.update(service.table, noteModel.fromJson(),
        where: 'id=?', whereArgs: [noteModel.id]);
  }

  Future<void> deleteData(int id) async {
    final db = await service.initializeData();
    await db.delete(service.table, where: 'id=?', whereArgs: [id]);
  }
}
