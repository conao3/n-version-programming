#include <cstdio>
#include <vector>
#include <iostream>

using namespace std;

// https://ja.wikipedia.org/wiki/%E3%82%AF%E3%82%A4%E3%83%83%E3%82%AF%E3%82%BD%E3%83%BC%E3%83%88

int lst[10000];

template <class RandomAccessIterator>
void quicksort(RandomAccessIterator left, RandomAccessIterator right) {
  if (distance(left, right) > 0) {
    RandomAccessIterator i = left, j = right;
    int pivot = *i;
    while (1) {
      while (*i < pivot) i++;
      while (pivot < *j) j--;
      if (distance(i, j) < 1) break;
      iter_swap(i, j);
      i++, j--;
    }
    quicksort(left, i - 1);
    quicksort(j + 1, right);
  }
}

int main() {
  int elm;
  vector<int> lst;

  while (cin >> elm) lst.push_back(elm);
  quicksort(lst.begin(), lst.end());
  for (auto elm: lst) printf("%d ", elm); printf("\n");
  return 0;
}
