#include "../include/aho_corasick.h"

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
    current->matched_word = word;
}

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
