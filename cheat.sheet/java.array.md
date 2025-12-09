========================================================
= JAVA ARRAY CHEATSHEET — WITH EXAMPLES                =
========================================================


-----------------------
-- ARRAY BASICS
-----------------------
length                              → number of elements
                                      int[] a = {1,2,3};
                                      a.length       → 3

index access                        → a[i]
                                      a[0]           → 1

clone()                             → shallow copy
                                      int[] b = a.clone();
                                      // b = {1,2,3}

Arrays.toString(arr)                → converts array to text
                                      Arrays.toString(a)
                                      // "[1, 2, 3]"

Arrays.deepToString(arr2D)          → for nested arrays
                                      int[][] m = {{1,2},{3,4}};
                                      Arrays.deepToString(m)
                                      // "[[1, 2], [3, 4]]"


-----------------------
-- ARRAY CREATION
-----------------------
new int[size]                       → allocated array, default values
                                      int[] x = new int[4];
                                      // {0,0,0,0}

new int[]{1,2,3}                    → literal initialization
                                      int[] y = new int[]{1,2,3};


-----------------------
-- COPY / SLICE / RESIZE
-----------------------
Arrays.copyOf(a, newLen)            → copy and resize
                                      int[] b = Arrays.copyOf(a, 5);
                                      // {1,2,3,0,0}

Arrays.copyOfRange(a, 1, 3)         → slice (end-exclusive)
                                      int[] sub = Arrays.copyOfRange(a,1,3);
                                      // {2,3}


-----------------------
-- SORTING
-----------------------
Arrays.sort(a)                      → ascending sort
                                      int[] z = {3,1,2};
                                      Arrays.sort(z);
                                      // {1,2,3}

Arrays.sort(a, from, to)
                                      Arrays.sort(z, 0, 2);
                                      // sort [0..1]

Arrays.parallelSort(a)              → faster on large arrays
                                      Arrays.parallelSort(z);


-----------------------
-- SEARCHING
-----------------------
Arrays.binarySearch(a, key)         → search sorted array
                                      int[] k = {1,3,5,7};
                                      Arrays.binarySearch(k,5)
                                      // → 2

Arrays.binarySearch(a, from, to, key)
                                      Arrays.binarySearch(k,1,3,3)
                                      // search only [1..2]


-----------------------
-- FILLING ARRAYS
-----------------------
Arrays.fill(a, value)               → fill entire array
                                      int[] q = new int[4];
                                      Arrays.fill(q, 7);
                                      // {7,7,7,7}

Arrays.fill(a, from, to, value)
                                      Arrays.fill(q,1,3,9);
                                      // {7,9,9,7}


-----------------------
-- COMPARISON / MATCH
-----------------------
Arrays.equals(a,b)                  → shallow compare
                                      int[] u={1,2}; int[] v={1,2};
                                      Arrays.equals(u,v)  // true

Arrays.deepEquals(a,b)              → compare nested arrays
                                      int[][] aa={{1},{2}};
                                      Arrays.deepEquals(aa, aa) // true

Arrays.compare(a,b)                 → lexicographic (Java 9+)
                                      Arrays.compare(
                                        new int[]{1,2},
                                        new int[]{1,3}
                                      )     // <0

Arrays.mismatch(a,b)                → index of first difference
                                      Arrays.mismatch(
                                        new int[]{1,2,3},
                                        new int[]{1,9,3}
                                      )     // 1


-----------------------
-- HASHING
-----------------------
Arrays.hashCode(a)                  → hash for array
                                      Arrays.hashCode(new int[]{1,2})
                                      // example output: 994

Arrays.deepHashCode(a)              → nested arrays
                                      Arrays.deepHashCode(
                                          new int[][]{{1},{2}}
                                      );


-----------------------
-- STREAMING OVER ARRAYS
-----------------------
Arrays.stream(objArray)             → Stream<T>
                                      Arrays.stream(new String[]{"a","b"})
                                      // Stream of "a","b"

Arrays.stream(int[])                → IntStream
                                      int[] nums={1,2,3};
                                      Arrays.stream(nums)
                                            .sum();     // 6


-----------------------
-- MULTIDIMENSIONAL ARRAYS
-----------------------
matrix.length                       → row count
matrix[row].length                  → column count
                                      int[][] m={{1,2},{3,4,5}};
                                      m.length        → 2
                                      m[1].length     → 3

clone()                             → shallow clone (inner arrays shared)
                                      int[][] n = m.clone();


-----------------------
-- MANUAL ALGORITHMS (NO COLLECTIONS)
-----------------------
swap elements:
    temp = a[i];
    a[i] = a[j];
    a[j] = temp;

reverse array:
    for (i=0, j=a.length-1; i<j; i++, j--)
        swap(a[i], a[j]);

find max/min:
    int max = a[0];
    for (int x : a)
        if (x > max) max = x;

count occurrences:
    int count = 0;
    for (int x : a)
        if (x == target) count++;

========================================================
= END OF ARRAY CHEATSHEET                               =
========================================================

