import 'package:hive/hive.dart';

import '../../features/expense/data/models/expense.dart';

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final int typeId = 0; // Unique ID for this adapter

  @override
  Expense read(BinaryReader reader) {
    return Expense(
      id: reader.readString(),
      amount: reader.readDouble(),
      category: reader.readString(),
      date: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
      description: reader.readString(),
      paymentMethod: reader.readString(),
      currency: reader.readString(),
      location: reader.readString(),
      isRecurring: reader.readBool(),
      recurrenceFrequency: reader.readString(),
      tags: (reader.readList() as List).map((e) => e as String).toList(),
      source: reader.readString(),
      groupId: reader.readString(),
      receiptImagePath: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer.writeString(obj.id);
    writer.writeDouble(obj.amount);
    writer.writeString(obj.category);
    writer.writeInt(obj.date.millisecondsSinceEpoch);
    writer.writeString(obj.description);
    writer.writeString(obj.paymentMethod);
    writer.writeString(obj.currency);
    writer.writeString(obj.location ?? '');
    writer.writeBool(obj.isRecurring);
    writer.writeString(obj.recurrenceFrequency ?? '');
    writer.writeList(obj.tags);
    writer.writeString(obj.source ?? '');
    writer.writeString(obj.groupId ?? '');
    writer.writeString(obj.receiptImagePath ?? '');
  }
}