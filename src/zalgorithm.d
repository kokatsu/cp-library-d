import std.algorithm;
import std.conv;
import std.traits;

/// Z algorithm
int[] zAlgorithm(T)(T x)
if (isArray!T) {
    int len = x.length.to!int, j;

    auto z = new int[](len);
    foreach (i; 1 .. len) {
        z[i] = (i - j < z[j] ? min(j+z[j]-i, z[i-j]) : 0);

        while (i + z[i] < len && x[z[i]] == x[i+z[i]]) {
            ++z[i];
        }

        if (j + z[j] < i + z[i]) j = i;
    }

    z[0] = len;

    return z;
}

// https://judge.yosupo.jp/problem/zalgorithm
unittest {
    assert(zAlgorithm("abcbcba") == [7, 0, 0, 0, 0, 0, 1]);
    assert(zAlgorithm("mississippi") == [11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
    assert(zAlgorithm("ababacaca") == [9, 0, 3, 0, 1, 0, 1, 0, 1]);
    assert(zAlgorithm("aaaaa") == [5, 4, 3, 2, 1]);
}