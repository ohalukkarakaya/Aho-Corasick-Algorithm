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
    TrieNode *current = root;

    for (int i = 0; i < text.size(); ++i)
    {
        char ch = text[i];

        // Reach to suitable Node with using fail links
        while (current != root && current->children.find(ch) == current->children.end())
        {
        }
    }
}
