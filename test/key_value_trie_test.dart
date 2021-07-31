import 'package:retrieval/key_value_trie.dart';
import 'package:test/test.dart';

void main() {
  group('insertion', () {
    test('should insert word into trie', () {
      final trie = KeyValueTrie<String>();

      trie.insert('aaa', 'associated value');

      expect(trie.has('a'), isFalse);
      expect(trie.has('aa'), isFalse);
      expect(trie.has('aaaa'), isFalse);

      expect(trie.has('aaa'), isTrue);
    });

    test('should insert words with same prefix into trie', () {
      final trie = KeyValueTrie<String>();

      trie.insert('aaa', 'associated value');
      trie.insert('aaab', 'associated value');

      expect(trie.has('a'), isFalse);
      expect(trie.has('aa'), isFalse);
      expect(trie.has('aaaa'), isFalse);

      expect(trie.has('aaa'), isTrue);
      expect(trie.has('aaab'), isTrue);
    });
  });

  group('find', () {
    test('should find words with matching prefix', () {
      final trie = KeyValueTrie<String>();

      final words = <String>[
        'break',
        'breakfast',
        'crikey',
        'crocodile',
        'cricket'
      ];
      for (var word in words) {
        trie.insert(word, word);
      }

      expect(trie.find('break'), ['break', 'breakfast']);
      expect(trie.find('cr'), ['crocodile', 'cricket', 'crikey']);
      expect(trie.find('cri'), ['cricket', 'crikey']);
      expect(trie.find('cricket'), ['cricket']);
    });

    test('should return associated values for words with matching prefix', () {
      final trie = KeyValueTrie<String>();

      trie.insert('trophy', '🏆');
      trie.insert('train', '🚆');

      expect(trie.find('tr'), ['🚆', '🏆']);
      expect(trie.find('trophy'), ['🏆']);
      expect(trie.find('trie'), <String>[]);
    });

    test('should find all words with empty prefix', () {
      final trie = KeyValueTrie<String>();

      final words = <String>['a', 'b'];
      for (var word in words) {
        trie.insert(word, word);
      }

      expect(trie.find(''), ['b', 'a']);
    });

    test('should find no matches when prefix is not in trie', () {
      final trie = KeyValueTrie<String>();

      final words = <String>['apple', 'banana'];
      for (var word in words) {
        trie.insert(word, word);
      }

      expect(trie.find('orange'), <String>[]);
    });
  });
}
