#include "../include/aho_corasick.h"

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
            }
        }
    }
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
