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

    TrieNode() : fail(nullptr), isEnd(false)
    {
    }
};

#endif // TRIE_NODE_H
