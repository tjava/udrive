// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveObjectAdapter extends TypeAdapter<UserHiveObject> {
  @override
  final int typeId = 0;

  @override
  UserHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveObject(
      uuid: fields[0] as String?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      password: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
