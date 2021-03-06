import 'package:retrieval/trie.dart';
import 'package:test/test.dart';

void main() {
  group('insertion', () {
    test('should insert word into trie', () {
      final trie = Trie();

      trie.insert('aaa');

      expect(trie.has('a'), isFalse);
      expect(trie.has('aa'), isFalse);
      expect(trie.has('aaaa'), isFalse);

      expect(trie.has('aaa'), isTrue);
    });

    test('should insert words with same prefix into trie', () {
      final trie = Trie();

      trie.insert('aaa');
      trie.insert('aaab');

      expect(trie.has('a'), isFalse);
      expect(trie.has('aa'), isFalse);
      expect(trie.has('aaaa'), isFalse);

      expect(trie.has('aaa'), isTrue);
      expect(trie.has('aaab'), isTrue);
    });

    test('should insert multiple words into trie', () {
      final words = <String>['apple', 'appellate', 'trie', 'try', 'tried'];
      final trie = Trie();

      words.forEach(trie.insert);

      for (final word in words) {
        expect(trie.has(word), isTrue);
      }
    });
  });

  group('find', () {
    test('should find words with matching prefix', () {
      final trie = Trie();

      final words = <String>[
        'break',
        'breakfast',
        'crikey',
        'crocodile',
        'cricket'
      ];
      words.forEach(trie.insert);

      expect(trie.find('break'), ['break', 'breakfast']);
      expect(trie.find('cr'), ['crocodile', 'cricket', 'crikey']);
      expect(trie.find('cri'), ['cricket', 'crikey']);
      expect(trie.find('cricket'), ['cricket']);
    });

    test('should find all words with empty prefix', () {
      final trie = Trie();

      final words = <String>['a', 'b'];
      words.forEach(trie.insert);

      expect(trie.find(''), ['b', 'a']);
    });

    test('should find no matches when prefix is not in trie', () {
      final trie = Trie();

      final words = <String>['apple', 'banana'];
      words.forEach(trie.insert);

      expect(trie.find('orange'), <String>[]);
    });
  });
}
