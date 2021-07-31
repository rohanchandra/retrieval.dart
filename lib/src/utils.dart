import 'package:characters/characters.dart';

import 'trie_node.dart';

/// Find the end node of a word.
///
/// Traverses the nodes starting from `fromNode`.
///
/// Returns the [TrieNode] corresponding to the last character of the `word`,
/// or `null` when the `word` cannot be found from the initial [TrieNode].
TrieNode<T>? findPrefix<T>(String word, {required TrieNode<T> fromNode}) {
  TrieNode<T>? currentNode = fromNode;

  for (final character in word.characters) {
    currentNode = currentNode?.getChild(character);
    if (currentNode == null) {
      return null;
    }
  }

  return currentNode;
}
