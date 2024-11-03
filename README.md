<div align="center">
    <img src="https://github.com/ohalukkarakaya/Aho-Corasick-Algorithm/blob/1b33a9447dfeb9ea7050d65b7b628d30fa04d340/assets/thumbnail.png" alt="thumbnail" style="width: 100%; height: auto;"></img>

<h1>Aho-Corasick Algorithm</h1>
<p>Aho-Corasick Algorithm review and C++ code implementation</p>
</div>

## 🗺️ map 
- [<code>🧐 What Is It For</code>](#-what-is-it-for)
- [<code>📝 How It Works</code>](#-how-it-works)
- [<code>🧵 Failure Links (Suffix Links) Explained</code>](#-failure-links-suffix-links-explained)
- [<code>💻 Code Implementation</code>](#-code-implementation)
- [<code>⌛ Time Complexity</code>](#-time-complexity)
- [<code>👍 Conclusion</code>](#-conclusion)
- [<code>👉 References</code>](#-references)

<hr style="border: 0.1px solid #ccc;" />

## 🧐 What Is It For
Aho–Corasick algorithm is a string-searching algorithm invented by Alfred V. Aho and Margaret J. Corasick in 1975. It is a kind of dictionary-matching algorithm that locates elements of a finite set of strings (the "dictionary") within an input text. [\[1\]](#reference-1)

Let's say we want to search for the words ["hello", "world", "day"] in the sentence "Today is a perfect day, I said hello to everyone in the world".

If we try this with other regular search algorithms, we will need to run the same algorithm for each word. Aho–Corasick algorithm can find multiple words in a long text in a single traversal.

<hr style="border: 0.1px solid #ccc;" />

## 📝 How It Works
The Aho–Corasick algorithm has three stages:

1. A **Trie** structure gets created from the words to be searched
2. **Failure links** gets generated
3. The **search** process starts sequentially on the long text
<br>

**Let's say we want to search for the words ["hello", "world", "day"] in the sentence "Today is a perfect day, I said hello to everyone in the world" :**

<h3>🌳 Trie Structure Creation</h3>
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

<h3>🧵 Failure Links Generation</h3>

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
   - All nodes directly connected to the root (```h```, ```w```, and ```d```) have their failure links set to the root itself because there’s no matching prefix among them.

2. **Breadth-First Search:**
   - Process nodes level by level, from top to bottom and left to right.
   - For each node, try to set its failure link by looking for the longest suffix that matches a prefix in the Trie.

3. **Setting Failure Links for Each Node:**
   - For each node ```N``` with character ```C```, we:
      - Follow the failure link of ```N```’s parent to find a node ```P```.
      - Check if ```P``` has a child with character ```C```. If it does, set ```N```’s failure link to that child.
      - If no match is found in ```P```, continue following ```P```’s failure link until either a match is found or we reach the root.
      - If we reach the root and don’t find a match, set ```N```'s failure link to the root.

**For our Trie:**
1. **Root Level:**
    - Nodes ```h```, ```w```, and ```d``` are directly connected to the root. Thus, their failure links point to the root.

2. **Level of ```h -> e```, ```w -> o```, and ```d -> a```:**
    - ```e``` (child of ```h```): Fails to root since there is no path from root that starts with ```e```
    - ```o``` (child of ```w```): Fails to root since there is no path from root that starts with ```o```
    - ```a``` (child of ```d```): Fails to root since there is no path from root that starts with ```a``

3. **Level of ```e -> l```, ```o -> r```, and ```a -> y```:**
    - ```l``` (child of ```e``): Fails to root
    - ```r``` (child of ```o```): Fails to root
    - ```y``` (child of ```a```): Fails to root

4. **Level of ```l -> l```, ```r -> l```, ```r -> d```, and ```y```:**
    - ```l``` (second ```l``` from ```h -> e -> l```): Fails to root
    - ```l``` (child of ```r```): Fails to ```l``` in ```h -> e -> l``` since this is the longest matching suffix
    - ```d``` (child of ```r``` in ```w -> o -> r```): Fails to root

5. **Final Level of ```o```, ```d```, and ```d```:**
    - ```o``` (from ```h -> e -> l -> l```): Fails to root since no further matching prefix exists
    - ```d``` (from ```w -> o -> r -> l -> d```): Fails to the ```d``` at ```w -> o -> r```

<h3>🔍 Search Step</h3>

The algorithm searches the tree in order for each character of the long text to be searched, if it reaches a finishing node, it means that it has found a pattern.

<hr style="border: 0.1px solid #ccc;" />

## 🧵 Failure Links (Suffix Links) Explained

Failure links (or Suffix Links) are at the core of the Aho-Corasick algorithm's success, allowing the algorithm to continue from the most appropriate place instead of "starting over" when a match is not found at a node. These links use previous partial matches at each node to find the longest valid prefix, thus avoiding repetitive computations.

Let's say the words we are looking for are ```"hello"```, ```"help"```, and ```"helium"``` and now we have found matches up to ```"hel"``` in the Trie. If the letter after ```"l"``` does not match the expected match, the algorithm follows the failure link to find another word that forms the prefix ```"hel"```. These links allow us to quickly check for partial matches (longest prefix). This way, the failure link allows the algorithm to continue from the correct position using partial prefix matches without starting from scratch, for paths that contain the same letters but lead to different words. The ```"hel"``` part is common to ```"hello"``` and ```"helium"```, so the failure link considers both words. [\[2\]](#reference-2)

<hr style="border: 0.1px solid #ccc;" />

## 💻 Code Implementation
1. First we need to implement Nodes. Therefore we will define **```TrieNode```** struct in ```TrieNode.h```:

```
#ifndef TRIE_NODE_H
#define TRIE_NODE_H

#include <iostream>
#include <unordered_map>
#include <vector>

struct TrieNode
{
    std::unordered_map<char, TrieNode *> children;
    TrieNode *fail;
    bool isEnd;
    std::string matched_word;

    TrieNode() : fail(nullptr), isEnd(false)
    {
    }
};

#endif // TRIE_NODE_H
```

2. We need to implement Trie structure. We will create it as class so we can also write our methods.
    - We need to define class and write method prototypes in a header file. In our case it is ```aho_corasick.h```:
       ```
        #ifndef AHO_CORASICK_H
        #define AHO_CORASICK_H
        
        #include <iostream>
        
        #include "trie_node.h"
        
        class AhoCorasick
        {
          private:
            TrieNode *root;
        
          public:
            AhoCorasick()
            {
                root = new TrieNode();
            }
        
            void add_word(const std::string &word);
            void build_failure_links();
            void search(const std::string &text);
        };
        
        #endif // AHO_CORASICK_H
       ```

    - Now we need to implement **```void add_word(const std::string &word);```**, **```void build_failure_links();```** and **```void search(const std::string &text);```** methods:
       - **```void add_word(const std::string &word)```** method: <br>
        this method will add search words and create the Trie:

            ```
            void AhoCorasick::add_word(const std::string &word)
            {
                TrieNode *current = root;
                for (char ch : word)
                {
                    if (current->children.find(ch) == current->children.end())
                    {
                        current->children[ch] = new TrieNode();
                    }
                    current = current->children[ch];
                }
                current->isEnd = true;
                current->matched_word = word;
            }
            ```
        - **```void build_failure_links()```** method: <br>
           this method uses **Breadth First Search** algorithm to generate **Failure Links**:

           ```
            void AhoCorasick::build_failure_links()
            {
                std::queue<TrieNode *> q;
                root->fail = root;
            
                // Failure links for nodes which is at root level is root
                for (auto &[ch, child] : root->children)
                {
                    child->fail = root;
                    q.push(child);
                }
            
                // Create Fail links with breadth-first search
                while (!q.empty())
                {
                    TrieNode *current = q.front();
                    q.pop();
            
                    for (auto &[ch, child] : current->children)
                    {
                        TrieNode *fail_node = current->fail;
            
                        while (fail_node != root && fail_node->children.find(ch) == fail_node->children.end())
                        {
                            fail_node = fail_node->fail;
                        }
            
                        if (fail_node->children.find(ch) != fail_node->children.end())
                        {
                            child->fail = fail_node->children[ch];
                        }
                        else
                        {
                            child->fail = root;
                        }
            
                        // Add other Nodes to queue to allso do same for them
                        q.push(child);
                    }
                }
            }
           ```
        - **```void search(const std::string &text)```** method: <br>
           this method goes for each character in long text one by one and prints indexes if it reaches to any of the end nodes:

           ```
            void AhoCorasick::search(const std::string &text)
            {
                TrieNode *current = root;
            
                for (int i = 0; i < text.size(); ++i)
                {
                    char ch = text[i];
            
                    // Reaching the appropriate node using the perpetrator connections
                    while (current != root && current->children.find(ch) == current->children.end())
                    {
                        current = current->fail;
                    }
            
                    if (current->children.find(ch) != current->children.end())
                    {
                        current = current->children[ch];
                    }
                    else
                    {
                        current = root;
                    }
            
                    // Check if we have reached the end of the word in case of a match
                    TrieNode *temp = current;
                    while (temp != root)
                    {
                        if (temp->isEnd)
                        {
                            // i: character position, calculate the starting position of the word
                            int start_index = i - temp->matched_word.size() + 1;
                            if (start_index >= 0) // Check for a valid starting index
                            {
                                std::cout << "Found pattern match from index " << start_index << " to index " << i
                                          << " matched word: " << temp->matched_word << std::endl;
                            }
                            break;
                        }
                        temp = temp->fail;
                    }
                }
            }
           ```

3. Usage in ```main``` function:
       in our example program, we take pattern list and text to search in as arguement and then we create the logic. So our main function looks like this:

        #include <iostream>

        #include "model/include/aho_corasick.h"
        
        int main(int argc, char *argv[])
        {
            if (argc < 4)
            {
                std::cerr << "Usage: " << argv[0] << " [pattern1 pattern2 pattern3 ...] \"text to search in\"" << std::endl;
                return 1;
            }
        
            std::vector<std::string> patterns;
            for (int i = 1; i < argc - 1; ++i)
            {
                patterns.push_back(argv[i]);
            }
        
            std::string text = argv[argc - 1];
        
            // Create Aho-Corasick Class instance and add Words
            AhoCorasick ac;
            for (const std::string &word : patterns)
            {
                ac.add_word(word);
            }
        
            // Create Failure Links
            ac.build_failure_links();
        
            // Search words in text
            ac.search(text);
        
            std::cout << std::endl;
            std::cout << "Yaşasın Cumhuriyet!" << std::endl;
        
            return 0;
        }
<hr style="border: 0.1px solid #ccc;" />

## ⌛ Time Complexity

The **Aho-Corasick algorithm** has a time complexity of **O(n + m + z)**, where:

- \( n \): The length of the input text.
- \( m \): The total number of characters across all patterns (sum of the lengths of all patterns).
- \( z \): The number of matches found in the text (optional, if you want to report when a match catched, in worst case we include this).

### Breakdown of Complexity

1. **Trie Generation Phase**:  
   - In the first phase, we build a Trie from the patterns.
   - Building a Trie requires processing each character of every pattern only once.
   - This phase takes **O(m)** time, where \( m \) is the sum of the lengths of all patterns.

2. **Failure Link Generation Phase**:
   - The failure links (or failure function) are built using a breadth-first traversal of the Trie, which processes each node once.
   - Setting failure links for all nodes requires **O(m)** time as well.

3. **Search Phase**:
   - During the search phase, we traverse the text while following links in the Trie.
   - For each character in the input text, we either move forward in the Trie or follow a failure link.
   - Each character in the text is processed only once, so this phase requires **O(n)** time, where \( n \) is the length of the input text.

4. **Match Reporting** (optional, if you want to report when a match catched, in worst case we include this):
   - Reporting each match takes constant time per match.
   - Since there can be up to **z** matches in the worst case, this part requires **O(z)** time.

### Final Time Complexity

Combining all phases, the total time complexity of the Aho-Corasick algorithm is:


$\Large O(n + m + z)$


- **O(m)** for building the Trie and failure links.
- **O(n)** for processing each character in the text.
- **O(z)** for reporting each match found (optional, if you want to report when a match catched, in worst case we include this).

This efficient complexity allows the Aho-Corasick algorithm to perform multi-pattern matching very quickly, even on large texts and multiple patterns, by using the Trie structure and failure links to avoid redundant comparisons.

<hr style="border: 0.1px solid #ccc;" />

## 👍 Conclusion

The Aho-Corasick algorithm stands out among string-searching algorithms due to its ability to search for multiple patterns simultaneously within linear time. Unlike Knuth-Morris-Pratt (KMP), which is optimized for single-pattern searches, Aho-Corasick constructs a Trie to organize multiple patterns and uses failure links to efficiently transition between patterns. Compared to Boyer-Moore, which skips sections of the text based on mismatched characters, Aho-Corasick performs a continuous scan without skipping, ensuring no matches are overlooked. This makes it ideal for applications requiring the identification of multiple keywords in large datasets, offering both efficiency and versatility in pattern matching. [\[3\]](#reference-3)

<hr style="border: 0.1px solid #ccc;" />

## 👉 References

1. <a id="reference-1"></a>[Wikipedia](https://en.wikipedia.org/wiki/Aho%E2%80%93Corasick_algorithm) - Aho–Corasick algorithm (visited at: 29.10.2024)
2. <a id ="reference-2"></a>[YouTube - Niema Moshiri](https://www.youtube.com/watch?v=OFKxWFew_L0) - Advanced Data Structures: Aho-Corasick Dictionary Links (visited at: 30.10.2024)
3. <a id="reference-3"></a>[YouTube - ComputerBread](https://youtu.be/XWujo7KQL54?si=0yLfk2ODc-GmJfoB) - Ctrl+F on steroids - Aho-Corasick Algorithm (pt. 1) (visited at: 29.10.2024)
