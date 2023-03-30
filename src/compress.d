import std.algorithm;
import std.conv;
import std.range;
import std.traits;

/// compress
void compress(T)(ref T[] arr)
if (isIntegral!T) {
    auto sorted = arr.dup.sort.uniq.array.assumeSorted;
    foreach (ref a; arr) {
        a = sorted.lowerBound(a).length.to!(T);
    }
}

// https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_o
unittest {
    int[] x = [46, 80, 11, 77, 46];
    compress(x);
    x[] += 1;
    assert(x == [2, 4, 1, 3, 2]);
}

// https://atcoder.jp/contests/abc036/tasks/abc036_c
unittest {
    int[] x = [3, 3, 1, 6, 1];
    compress(x);
    assert(x == [1, 1, 0, 2, 0]);
}