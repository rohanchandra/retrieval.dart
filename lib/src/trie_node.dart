/// A single node in the trie.
class TrieNode {
  /// The single character stored in this node.
  ///
  /// `null` indicates this node is a root node.
  final String? character;

  /// Whether a word in the trie terminates at this node.
  bool isEndOfWord = false;

  /// Whether this node is the root of the trie.
  bool get isRoot => character == null;

  /// The children [TrieNode] nodes, linked to this node.
  final Map<String, TrieNode> _children = {};

  /// Whether this node has any children.
  bool get hasChildren => _children.isEmpty;

  /// The number of children nodes of this node.
  int get childrenCount => _children.length;

  TrieNode(this.character);

  /// Creates a new child [TrieNode] with a `character`.
  ///
  /// Returns the new [TrieNode].
  TrieNode addChild(String character) {
    final childNode = TrieNode(character);
    _children[character] = childNode;
    return childNode;
  }

  /// Returns the [TrieNode] children of this node.
  Iterable<TrieNode> getChildren() {
    return _children.values;
  }

  /// Whether this node has a child [TrieNode] of `character`.
  bool hasChild(String character) {
    return _children.containsKey(character);
  }

  /// Lookup the [TrieNode] associated with `character`.
  ///
  /// Returns the associated [TrieNode], or `null` if there is no child node
  /// associated with `character`.
  TrieNode? getChild(String character) {
    return _children[character];
  }

  /// Lookup a child [TrieNode] with a `character` if it exists, or creates a
  /// new [TrieNode] with a `character`.
  ///
  /// Returns the [TrieNode] associated with the character of `character` if it
  /// exists, or returns the new [TrieNode].
  TrieNode putChildIfAbsent(String character) {
    return _children.putIfAbsent(character, () => TrieNode(character));
  }

  @override
  String toString() {
    return "TrieNode(character=$character)";
  }
}
