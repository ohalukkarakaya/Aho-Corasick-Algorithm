#include "../include/aho_corasick.h"

void AhoCorasick::build_failure_links()
{
}

// Add word function
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
}

void AhoCorasick::search(const std::string &text)
{
}
