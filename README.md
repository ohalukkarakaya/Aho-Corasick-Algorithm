<div align="center">
    <img src="https://github.com/ohalukkarakaya/Aho-Corasick-Algorithm/blob/1b33a9447dfeb9ea7050d65b7b628d30fa04d340/assets/thumbnail.png" alt="thumbnail" style="width: 100%; height: auto;"></img>

<h1>Aho-Corasick Algorithm</h1>
<p>Aho-Corasick Algorithm review and C++ code implementation</p>
</div>

## 🗺️ map 
- [<code>🧐 What Is It For</code>](#-what-is-it-for)
- [<code>📝 How It Works</code>](#-how-it-works)
- [<code>💻 Code Implementation</code>](#-code-implementation)
- [<code>⌛ Time Complexity</code>](#-time-complexity)
- [<code>👍 Conclusion</code>](#-conclusion)
- [<code>👉 References</code>](#-references)

## 🧐 What Is It For
Aho–Corasick algorithm is a string-searching algorithm invented by Alfred V. Aho and Margaret J. Corasick in 1975. It is a kind of dictionary-matching algorithm that locates elements of a finite set of strings (the "dictionary") within an input text. [\[1\]](#reference-1)

Let's say we want to search for the words ["hello", "world", "day"] in the sentence "Today is a perfect day, I said hello to everyone in the world".

If we try this with other regular search algorithms, we will have to run the same algorithm for each word. Aho–Corasick algorithm can find multiple words in a long text in a single scan.

## 📝 How It Works
The Aho–Corasick algorithm has three stages:

1. A **Trie** structure gets created from the words to be searched
2. **Failure links** gets generated
3. The **search** process starts sequentially on the long text
<br>

**Let's say we want to search for the words ["hello", "world", "day"] in the sentence "Today is a perfect day, I said hello to everyone in the world" :**

<h3>Trie structure creation</h3>
In the Aho–Corasick algorithm, the first phase is creating a Trie (prefix tree) structure from the list of words we want to search for.
<br> <br>

1. **Initialize the Trie root:** Start with an empty root node, which will be the base of our Trie
2. **Add each word to the Trie:**
   1. For each word, add one letter at a time to create a path from the root to the end of the word
   2. If a letter is already present in that sequence, we reuse the existing node
   3. Mark the end of each word with a flag (like ```isEnd=True```) to indicate that a complete word terminates at that node

**Building the Trie with ["hello", "world", "day"] words:**

Word 1: **"hello"**:
1. Start from the root
2. Add ```h -> e -> l -> l -> o``` as separate nodes, with ```o``` being the end of the word "hello"

Word 2: **"world"**:
1. Start from the root again
2. Add ```w -> o -> r -> l -> d``` as separate nodes, marking ```d``` as the end of the word "world"

Word 3: **"day"**:
1. Start from the root again
2. Add ```d -> a -> y``` as separate nodes, marking ```y``` as the end of the word "day"

**After adding all the words, the Trie structure will look like this:**

```
         (root)
       /    |    \
     h      w      d
     |      |      |
     e      o      a
     |      |      |
     l      r      y
     |      |   [end of "day"]
     l      l      
     |      |
     o      d
        [end of "world"]
[end of "hello"]
```

If we added the word **"word"** using the same method, the tree would look like this (even though not in our case):
```
         (root)
       /    |    \
     h      w      d
     |      |      |
     e      o      a
     |      |      |
     l      r      y
     |     / \  [end of "day"]
     l    l   d  
     |    |   [end of "word"]
     o    d
        [end of "world"]
[end of "hello"]
```

<h3>Failure links generation</h3>

If no match is found at a node during the search in the **Trie** structure, **failure links** are created to point to an alternative node where the algorithm will continue. These links expedite the search process, ensuring the algorithm progresses efficiently.

**Let's say we gonna generate failure links of this Trie:**
```
         (root)
       /    |    \
     h      w      d
     |      |      |
     e      o      a
     |      |      |
     l      r      y
     |     / \  [end of "day"]
     l    l   d  
     |    |   [end of "word"]
     o    d
        [end of "world"]
[end of "hello"]
```
We follow these steps:
1. **Set Failure Links for Children of Root:**
   1. All nodes directly connected to the root (```h```, ```w```, and ```d```) have their failure links set to the root itself because there’s no matching prefix among them.

2. **Breadth-First Search:**
   1. Process nodes level by level, from top to bottom and left to right.
   2. For each node, try to set its failure link by looking for the longest suffix that matches a prefix in the Trie.

3. **Setting Failure Links for Each Node:**
   1. For each node ```N``` with character ```C``, we:
      1. Follow the failure link of ```N```’s parent to find a node ```P```.
      2. Check if ```P``` has a child with character ```C```. If it does, set ```N```’s failure link to that child.
      3. If no match is found in ```P```, continue following ```P``’s failure link until either a match is found or we reach the root.
      4. If we reach the root and don’t find a match, set ```N```'s failure link to the root.

**For our Trie:**
1. **Root Level:**
    1. Nodes ```h```, ```w```, and ```d`` are directly connected to the root. Thus, their failure links point to the root.

2. **Level of ```h -> e```, ```w -> o```, and ```d -> a```:**
    1. ```e``` (child of ```h```): Fails to root since there is no path from root that starts with ```e```
    2. ```o``` (child of ```w```): Fails to root since there is no path from root that starts with ```o```
    3. ```a``` (child of ```d```): Fails to root since there is no path from root that starts with ```a``

3. **Level of ```e -> l```, ```o -> r```, and ```a -> y```:**
    1. ```l``` (child of ```e``): Fails to root
    2. ```r``` (child of ```o```): Fails to root
    3. ```y``` (child of ```a```): Fails to root

4. **Level of ```l -> l```, ```r -> l```, ```r -> d```, and ```y```:**
    1. ```l``` (second ```l``` from ```h -> e -> l```): Fails to root
    2. ```l``` (child of ```r```): Fails to ```l``` in ```h -> e -> l``` since this is the longest matching suffix
    3. ```d``` (child of ```r``` in ```w -> o -> r```): Fails to root

5. **Final Level of ```o```, ```d```, and ```d```:**
    1. ```o``` (from ```h -> e -> l -> l```): Fails to root since no further matching prefix exists
    2. ```d``` (from ```w -> o -> r -> l -> d```): Fails to the ```d``` at ```w -> o -> r```

## 👉 References
1. <a id="reference-1"></a>[Wikipedia](https://en.wikipedia.org/wiki/Aho%E2%80%93Corasick_algorithm) - Aho–Corasick algorithm (visited at: 29.10.2024)
