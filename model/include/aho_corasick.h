#ifndef AHO_CORASICK_H
#define AHO_CORASICK_H

#include <iostream>

#include "trie_node.h"

class AhoCorasick
{
  private:
    TrieNode *root;
    void build_failure_links();

  public:
    AhoCorasick()
    {
        root = new TrieNode();
    }

    void add_word(const std::string &word);
    void search(const std::string &text);
};

#endif // AHO_CORASICK_H
