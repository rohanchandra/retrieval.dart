import 'package:retrieval/trie.dart';
import 'package:test/test.dart';

void main() {
  group('insertion', () {
    test('should bulk insert words', () {
      final words = <String>['apple', 'trie', 'try', 'tried', 'appellate'];
      final trie = Trie();

      trie.insertAll(words);

      for (final word in words) {
        expect(trie.has(word), isTrue);
      }
    });
  });
}