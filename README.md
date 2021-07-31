<p align="center">
  <img src="https://github.com/rohanchandra/retrieval.dart/raw/master/assets/logo.png" alt="logo" width="400px"/>
</p>

A trie data structure Dart implementation — useful for autocomplete.

## Features

- 🔍 Tries are useful for type-ahead, autocomplete and other search problems
- ⚡ Has a simple API for storing text
- 🚀 Has an API to map strings to objects to handle a variety of problems
- 🎯 This library is built in modern Dart code, with sound null-safety
- 💙 Written in pure Dart, this library is usable in all Flutter platforms

## Usage

### Trie

#### Example

```dart
import 'package:retrieval/trie.dart';

void main() {
  final trie = Trie();

  // Insert a word into trie with trie.insert().
  trie.insert('crikey');
  trie.insert('crocodile');

  // Check for existence of words.
  print(trie.has('crikey')); // true
  print(trie.has('ghost')); // false

  // Find matching words by prefix.
  print(trie.find('cr')); // ['crocodile', 'crikey']
  print(trie.find('crikey')); // ['crikey']
  print(trie.find('ghost')); // []
}
```

#### API Reference

Import the `Trie` class via:

```dart
import 'package:retrieval/trie.dart';
```

Create a new `Trie` with:

```dart
final trie = Trie();
```

Add a word to the `trie` with the `insert` method:

```dart
trie.insert('crikey');
```

Check if a word is in the `trie` with the `has` method:

```dart
trie.has('crikey');
```

Find all words with a given prefix with the `find` method:

```dart
trie.find('cr');
```

All words that start with `'cr'` will be returned in a list of strings.

### Key-Value Trie

While the `Trie` class covers the majority of use-cases, the `KeyValueTrie` class allows you to map strings to objects. When retrieving from the `KeyValueTrie`, you search for string prefixes and get back the associated values.

#### Example

```dart
import 'package:retrieval/key_value_trie.dart';

void main() {
  // Use a key-value trie to associate each word with a value.
  final keyValueTrie = KeyValueTrie<String>(); // Values of type String.

  keyValueTrie.insert('trophy', '🏆');
  keyValueTrie.insert('train', '🚆');

  // When finding matching words by prefix, the associated value is returned.
  print(keyValueTrie.find('tr')); // ['🚆', '🏆']
  print(keyValueTrie.find('trophy')); // ['🏆']
  print(keyValueTrie.find('trie')); // []
}
```

#### API Reference

Import the `KeyValueTrie` class via:

```dart
import 'package:retrieval/key_value_trie.dart';
```

Create a new `KeyValueTrie`, declaring the type of values stored within `<>`, with:

```dart
final keyValueTrie = KeyValueTrie<String>();
```

Add a word and its associated value to the `keyValueTrie` with the `insert` method:

```dart
keyValueTrie.insert('trophy', '🏆');
```

Check if a word is in the `keyValueTrie` with the `has` method:

```dart
trie.has('trophy');
```

Find all values associated with a word's given prefix with the `keyValueTrie` method:

```dart
trie.find('tr');
```

## What is a trie?

> Trie with words of `DART`, `DASH`, `DASHI`,`DARE` and `APP`.
>
> <img src="https://github.com/rohanchandra/retrieval.dart/raw/master/assets/trie.png" alt="trie" width="400px"/>

A trie is a search tree data structure. In this implementation, each character is a node in the trie, for example, after inserting the word `DART`, nodes of `D`, `A`, `R` and `T` are created.

In the trie, words with the same prefix are in the same subtree. For example, since `DART` and `DASH` both have a prefix of `DA`, they can be found by searching from the `A` node (that's below the `D` node). This property makes finding words in a trie, by prefix, easy!

## Links

- [GitHub](https://github.com/rohanchandra/retrieval.dart)
- [Dart Package](https://pub.dev/packages/retrieval)
- [Issue Tracker](https://github.com/rohanchandra/retrieval.dart/issues)
