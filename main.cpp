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
