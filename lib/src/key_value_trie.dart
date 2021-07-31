import 'package:characters/characters.dart';

import 'trie_node.dart';
import 'utils.dart';

class KeyValueTrie<T> {
  final _root = TrieNode<T>(key: null, value: null);

  /// Inserts the `word` into the trie.
  void insert(String word, T value) {
    var currentNode = _root;

    for (final character in word.characters) {
      currentNode = currentNode.putChildIfAbsent(character);
    }

    currentNode.isEndOfWord = true;

    // The last character of the word stores the associated word value.
    currentNode.value = value;
  }

  /// Whether the trie contains the `word`.
  bool has(String word) {
    return findPrefix(word, fromNode: _root)?.isEndOfWord ?? false;
  }

  /// Finds all complete words in the trie matching the `prefix`.
  ///
  /// Returns a list of all matches. If there are no matches, an empty list is
  /// returned.
  List<T> find(String prefix) {
    // Find the node of associated with the last character of the prefix.
    final lastCharacterNode = findPrefix(prefix, fromNode: _root);

    // The prefix does not exist in the tre.
    if (lastCharacterNode == null) {
      return [];
    }

    final stack = [lastCharacterNode];
    final foundWords = <T>[];

    while (stack.isNotEmpty) {
      final partialMatchNode = stack.removeLast();

      // The partial match node corresponds to an entire word.
      if (partialMatchNode.isEndOfWord) {
        foundWords.add(partialMatchNode.value!);
      }

      // Walk each of the child node of the partial match.
      for (final child in partialMatchNode.getChildren()) {
        stack.add(child);
      }
    }

    return foundWords;
  }
}
