#include <stdio.h>

// https://ja.wikipedia.org/wiki/%E3%82%AF%E3%82%A4%E3%83%83%E3%82%AF%E3%82%BD%E3%83%BC%E3%83%88

int lst[10000];

void swap(int* left, int* right) {
  int tmp = *left;
  if (left < right) {
    *left = *right;
    *right = tmp;
  }
  return;
}

int med3(int x, int y, int z) {
  if (x < y)
    return y<z ? y
           : z<x ? x
           : z;
  else
    return x<z ? x
           : z<y ? y
           : z;
}

void quicksort(int a[], int left, int right) {
  if (left < right) {
    int i = left, j = right;
    int pivot = med3(a[i], a[i + (j - i) / 2], a[j]);
    while (1) {
      while (a[i] < pivot) i++;
      while (pivot < a[j]) j--;
      if (i >= j) break;
      swap(&a[i], &a[j]);
      i++, j--;
    }
    quicksort(a, left, i - 1);
    quicksort(a, j + 1, right);
  }
}

int main() {
  int i=0;
  int size;

  while (scanf("%d", &lst[i]) != EOF) i++;
  size = i;
  quicksort(lst, 0, size-1);
  for (i=0; i<size; i++) printf("%d ", lst[i]); printf("\n");
  return 0;
}
