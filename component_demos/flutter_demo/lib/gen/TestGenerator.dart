import 'package:source_gen/source_gen.dart';
import 'TestMetadata.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

class TestGenerator extends GeneratorForAnnotation<Multiplier> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final numValue = annotation.read('value').literalValue as num;

    return 'num ${element.name}Multiplied() => ${element.name} * $numValue;';
  }
}

