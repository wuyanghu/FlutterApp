import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter_demo/util/scaffold_mixin.dart';
import 'package:path_provider/path_provider.dart';

class MemoryLeakFileReadPage extends StatefulWidget {
  static String route = "MemoryLeakFileReadPage";
  const MemoryLeakFileReadPage({super.key});

  @override
  State<MemoryLeakFileReadPage> createState() => _MemoryLeakFileReadPageState();
}

class _MemoryLeakFileReadPageState extends State<MemoryLeakFileReadPage> {
  @override
  Widget build(BuildContext context) {
    return buildScaffold(
        "文件读写",
        Column(
          children: [
            CircularProgressIndicator(),
            ElevatedButton(
                onPressed: () {
                  for (int i = 1; i < 6; i++) {
                    writeAssetToFile("hotel/hotel_$i.png");
                  }
                  writeAssetToFile("images/home.png");
                },
                child: Text("写文件")),
            ElevatedButton(
                onPressed: () {
                  for (int i = 1; i < 6; i++) {
                    readFile("hotel_$i.png");
                  }
                  readFile("home.png");
                },
                child: Text("分片读文件")),
          ],
        ));
  }
}

// 定义一个文件切片结构
class FileSlice {
  final int start; // 切片起始位置（字节）
  final int sliceSize; // 切片大小（字节）

  FileSlice(this.start, this.sliceSize);
}

Future<void> writeAssetToFile(String fileName) async {
  try {
    // 1. 加载资源文件的原始字节数据
    ByteData data = await rootBundle.load('assets/$fileName');
    List<int> bytes = data.buffer.asUint8List();

    // 2. 获取应用文档目录路径
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/${fileName.split('/').lastOrNull}';

    // 3. 将字节数据写入文件
    File file = File(filePath);
    await file.writeAsBytes(bytes);

    print('资源已成功写入: $filePath');
  } catch (e) {
    print('写入失败: $e');
  }
}

// 动态生成切片列表的函数
List<FileSlice> generateSlices({
  required int totalFileSize, // 文件总大小（字节）
  int? sliceCount, // 自定义切片数量（优先级高于 sliceSize）
  int? sliceSize, // 自定义每个切片的大小（字节）
}) {
  final List<FileSlice> slices = [];

  // 参数校验
  assert(totalFileSize > 0, "文件大小必须大于0");
  assert(
      sliceCount != null || sliceSize != null, "必须指定 sliceCount 或 sliceSize");

  // 计算切片策略
  if (sliceCount != null) {
    // 模式1：按指定切片数量均分文件
    final baseSize = totalFileSize ~/ sliceCount;
    int remainder = totalFileSize % sliceCount;

    for (int i = 0; i < sliceCount; i++) {
      final currentSize = baseSize + (remainder > 0 ? 1 : 0);
      slices.add(FileSlice(
        i == 0 ? 0 : slices[i - 1].start + slices[i - 1].sliceSize,
        currentSize,
      ));
      remainder--;
    }
  } else if (sliceSize != null) {
    // 模式2：按指定切片大小自动计算数量
    int start = 0;
    while (start < totalFileSize) {
      final currentSize = (start + sliceSize) > totalFileSize
          ? totalFileSize - start
          : sliceSize;
      slices.add(FileSlice(start, currentSize));
      start += currentSize;
    }
  }

  print("分了${slices.length}");
  return slices;
}

void readFile(String fileName) async {
  // 2. 获取应用文档目录路径
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String filePath = '${appDocDir.path}/$fileName';

  try {
    // 打开文件并获取同步随机访问句柄
    final file = File(filePath).openSync(mode: FileMode.read);

    final slices = generateSlices(
      totalFileSize: file.lengthSync(),
      sliceSize: 200000,
    );

    // 存储所有读取到的数据
    final List<int> fullData = [];

    for (final slice in slices) {
      // 设置读取起始位置
      file.setPositionSync(slice.start);

      // 同步读取指定大小的字节
      List<int> data = file.readSync(slice.sliceSize).toList();

      // 检查实际读取的字节数
      if (data.isEmpty) {
        print('警告：从位置 ${slice.start} 开始无更多数据');
        break;
      } else if (data.length < slice.sliceSize) {
        print('警告：请求 ${slice.sliceSize} 字节，实际读取 ${data.length} 字节');
      }

      // 将数据添加到完整集合
      fullData.addAll(data);
      print('读取切片 [${slice.start}-${slice.start + data.length}]');
    }

    // 关闭文件句柄（重要！）
    file.closeSync();

    // 输出完整内容
    print('\n完整文件内容:\n');
  } on FileSystemException catch (e) {
    print('文件操作失败: ${e.message}');
  } catch (e) {
    print('未知错误: $e');
  }
}
