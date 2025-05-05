import 'package:source_gen/source_gen.dart';
import 'gen/TestGenerator.dart';
import 'package:build/build.dart';

Builder testBuilder(BuilderOptions options) =>
    SharedPartBuilder([TestGenerator()], 'multiply');

// Builder metadataLibraryBuilder(BuilderOptions options) => LibraryBuilder(
//   MemberCountLibraryGenerator(),
//   generatedExtension: '.info.dart',
// );
// Builder multiplyBuilder(BuilderOptions options) =>
//     SharedPartBuilder([TestGenerator()], 'multiply');
