import 'package:characters/characters.dart';

import 'trie_node.dart';

class Trie {
  final TrieNode _root = TrieNode(null);

  /// Inserts the `word` into the trie.
  void insert(String word) {
    var currentNode = _root;

    for (final character in word.characters) {
      currentNode = currentNode.putChildIfAbsent(character);
    }

    currentNode.isEndOfWord = true;
  }

  /// Adds each word in `words` into the trie.
  void insertAll(Iterable<String> words) {
    words.forEach(insert);
  }

  /// Whether the trie contains the `word`.
  bool has(String word) {
    final endOfWordNode = _find(word);
    return endOfWordNode != null && endOfWordNode.isEndOfWord;
  }

  /// Find a word in the trie.
  ///
  /// Returns the [TrieNode] corresponding to the last character of the `word`,
  /// or `null` when the `word` does not exist in the trie.
  TrieNode? _find(String word) {
    TrieNode? currentNode = _root;

    for (final character in word.characters) {
      currentNode = currentNode?.getChild(character);
      if (currentNode == null) {
        return null;
      }
    }

    return currentNode;
  }

  /// Finds all complete words in the trie matching the `prefix`.
  ///
  /// Returns a list of all matches. If there are no matches, an empty list is
  /// returned.
  List<String> find(String prefix) {
    // Find the node of associated with the last character of the prefix.
    final lastCharacterNode = _find(prefix);

    // The prefix does not exist in the tre.
    if (lastCharacterNode == null) {
      return [];
    }

    final stack = <_PartialMatch>[
      _PartialMatch(node: lastCharacterNode, partialWord: prefix),
    ];
    final foundWords = <String>[];

    while (stack.isNotEmpty) {
      final partialMatch = stack.removeLast();

      // The partial match node corresponds to an entire word.
      if (partialMatch.node.isEndOfWord) {
        foundWords.add(partialMatch.partialWord);
      }

      // Walk each of the child node of the partial match.
      for (final child in partialMatch.node.getChildren()) {
        stack.add(
          _PartialMatch(
            node: child,
            partialWord: "${partialMatch.partialWord}${child.character}",
          ),
        );
      }
    }

    return foundWords;
  }
}

class _PartialMatch {
  final TrieNode node;
  final String partialWord;

  _PartialMatch({
    required this.node,
    required this.partialWord,
  });

  @override
  String toString() => '_PartialMatch(node: $node, prefix: $partialWord)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _PartialMatch &&
        other.node == node &&
        other.partialWord == partialWord;
  }

  @override
  int get hashCode => node.hashCode ^ partialWord.hashCode;
}
