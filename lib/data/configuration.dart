/*
 * Filename: c:\dev\wip\vsm\svsm\lib\data\configuration.dart
 * Path: c:\dev\wip\vsm\svsm\lib\data
 * Created Date: Monday, November 14th 2022, 8:11:19 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'package:svsm/data/cloud.dart';

class Configuration {
  static final Map<String, CachedValue> cache = {};

  bool isOld(value) {
    return false;
  }

  Future<String?> get(id) async {
    if (!cache.containsKey(id) || isOld(cache[id])) {
      var response = await Cloud.get(context: "config", id: id);
      if (response != null) {
        cache[id] = CachedValue(
          timeStamp: DateTime.now().millisecondsSinceEpoch,
          value: response["value"],
        );
      }
    }
    return cache[id]!.value;
  }
}

class CachedValue {
  CachedValue({required this.timeStamp, required this.value});

  final int timeStamp;
  final String value;
}
