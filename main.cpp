#include <iostream>

#include "model/include/aho_corasick.h"

int main(int argc, char *argv[])
{
    // Words to search
    std::vector<std::string> patterns = {"he", "she", "his"};
    std::string text = "ushers hope his she";

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
