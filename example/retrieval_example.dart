import 'package:retrieval/trie.dart';

void main() {
  final trie = Trie();

  // Insert multiple words into the trie with trie.insertAll().
  final words = <String>['crikey', 'crocodile'];
  trie.insertAll(words);

  // Insert a word into trie with trie.insert().
  trie.insert('brekky');
  trie.insert('breakfast');

  // Check for existence of words.
  print(trie.has('brekky')); // true
  print(trie.has('ghost')); // false

  // Find matching words by prefix.
  print(trie.find('br')); // ['breakfast', 'brekky']
  print(trie.find('cr')); // ['crocodile', 'crikey']
  print(trie.find('crikey')); // ['crikey']
}
