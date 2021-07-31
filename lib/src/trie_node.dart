/// A single node in the trie.
class TrieNode<T> {
  /// The character key stored in this node.
  ///
  /// `null` indicates this node is a root node.
  final String? key;

  /// The value stored in this node.
  T? value;

  /// Whether a word in the trie terminates at this node.
  bool isEndOfWord = false;

  /// Whether this node is the root of the trie.
  bool get isRoot => key == null;

  /// The children [TrieNode] nodes, linked to this node.
  final Map<String, TrieNode<T>> _children = {};

  /// Whether this node has any children.
  bool get hasChildren => _children.isEmpty;

  /// The number of children nodes of this node.
  int get childrenCount => _children.length;

  TrieNode({required this.key, this.value});

  /// Returns the [TrieNode] children of this node.
  Iterable<TrieNode<T>> getChildren() {
    return _children.values;
  }

  /// Whether this node has a child [TrieNode] of `key`.
  bool hasChild(String key) {
    return _children.containsKey(key);
  }

  /// Lookup the [TrieNode] associated with `key`.
  ///
  /// Returns the associated [TrieNode], or `null` if there is no child node
  /// associated with `key`.
  TrieNode<T>? getChild(String key) {
    return _children[key];
  }

  /// Lookup a child [TrieNode] with a `key` if it exists, or creates a
  /// new [TrieNode] with a `key`.
  ///
  /// Returns the [TrieNode] associated with the key of `key` if it
  /// exists, or returns the new [TrieNode].
  TrieNode<T> putChildIfAbsent(String key, {T? value}) {
    return _children.putIfAbsent(
      key,
      () => TrieNode<T>(key: key, value: value),
    );
  }

  @override
  String toString() {
    return "TrieNode(key=$key, value=$value)";
  }
}
