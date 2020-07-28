// qsort.c

#include <stdio.h>

int lst[100000];

void swap(int* left, int* right) {
  int tmp = *left;
  if (left < right) {
    *left = *right;
    *right = tmp;
  }
  return;
}

int* qsort_1(int* left, int* right) {
  int pivot = *right;
  int* i = left;
  int* j = left;

  while (j < right) {
    if (*j < pivot) swap(i, j), i++;
    j++;
  }
  swap(i, right);
  return i;
}

void qsort(int* left, int* right) {
  if (left < right) {
    int* pivot = qsort_1(left, right);
    qsort(left, pivot-1);
    qsort(pivot+1, right);
  }
  return;
}

int main() {
  int i=0;
  int size;

  while (scanf("%d", &lst[i]) != EOF) i++;
  size = i;
  qsort(&lst[0], &lst[size-1]);
  for (i=0; i<size; i++) printf("%d ", lst[i]); printf("\n");
  return 0;
}
