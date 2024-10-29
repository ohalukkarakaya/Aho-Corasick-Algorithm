<div align="center">
    <img src="https://github.com/ohalukkarakaya/Aho-Corasick-Algorithm/blob/1b33a9447dfeb9ea7050d65b7b628d30fa04d340/assets/thumbnail.png" alt="thumbnail" style="width: 100%; height: auto;"></img>

<h1>Aho-Corasick Algorithm</h1>
<p>Aho-Corasick Algorithm review and C++ code implementation</p>
</div>

## 🗺️ map 
- [<code>🧐 What It Is For</code>](#-what-it-is-for)
- [<code>📝 How It Works</code>](#-how-it-works)
- [<code>💻 Code Implementation</code>](#-code-implementation)
- [<code>⌛ Time Complexity</code>](#-time-complexity)
- [<code>👍 Conclusion</code>](#-conclusion)
- [<code>👉 References</code>](#-references)

## 🧐 What It Is For
Aho–Corasick algorithm is a string-searching algorithm invented by Alfred V. Aho and Margaret J. Corasick in 1975. It is a kind of dictionary-matching algorithm that locates elements of a finite set of strings (the "dictionary") within an input text. [\[1\]](#reference-1)

Let's say we want to search for the words ["hello", "world", "day"] in the sentence "Today is a perfect day, I said hello to everyone in the world".

If we try this with other regular search algorithms, we will have to run the same algorithm for each word. Aho–Corasick algorithm can find multiple words in a long text in a single scan.

## 📝 How It Works
The Aho–Corasick algorithm has three stages:

1. A **Trie** structure is created from the words to be searched.
2. If no match is found at a node during the search in the **Trie** structure, **failure links** are created to point to an alternative node where the algorithm will continue. These links expedite the search process, ensuring the algorithm progresses efficiently.
3. The **search** process starts sequentially on the long text.
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

## 👉 References
1. <a id="reference-1"></a>[Wikipedia](https://en.wikipedia.org/wiki/Aho%E2%80%93Corasick_algorithm) - Aho–Corasick algorithm (visited at: 29.10.2024)
