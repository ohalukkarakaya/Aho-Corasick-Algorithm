cmake_minimum_required(VERSION 3.27)
project(aho_corasick)

set(CMAKE_CXX_STANDARD 17)

add_executable(
  aho_corasick 
  
  model/include/trie_node.h

  model/include/aho_corasick.h
  model/src/aho_corasick.cpp

  main.cpp
)
