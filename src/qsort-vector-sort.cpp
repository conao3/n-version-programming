#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

int main() {
  int elm;
  vector<int> lst;

  while (cin >> elm) lst.push_back(elm);
  sort(lst.begin(), lst.end());
  for (auto elm: lst) printf("%d ", elm); printf("\n");
  return 0;
}
