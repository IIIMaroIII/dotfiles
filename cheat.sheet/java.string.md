========================================================
= JAVA STRING CHEATSHEET (COMMON METHODS)             =
= Format: method(...)  → explanation + example         =
========================================================


-----------------------
-- BASIC INFO
-----------------------
length()                         → number of characters
                                   "hello".length() → 5

isEmpty()                        → true if length == 0
                                   "".isEmpty()

isBlank()                        → true if empty or whitespace
                                   "   ".isBlank()


-----------------------
-- CHARACTER ACCESS
-----------------------
charAt(i)                        → char at index
                                   "hi".charAt(1) → 'i'

toCharArray()                    → char[]
                                   "hi".toCharArray()

codePointAt(i)                   → unicode code point
                                   "A".codePointAt(0) → 65


-----------------------
-- COMPARISON
-----------------------
equals(str)                      → exact match
                                   "hi".equals("hi")

equalsIgnoreCase(str)            → match ignoring case
                                   "HI".equalsIgnoreCase("hi")

compareTo(str)                   → <0, =0, >0 lexicographically

compareToIgnoreCase(str)         → case-insensitive comparison


-----------------------
-- SEARCHING
-----------------------
contains(seq)                    → true if substring present
                                   "hello".contains("lo")

startsWith(prefix)
endsWith(suffix)

indexOf(str)                     → first index or -1
                                   "banana".indexOf("na") → 2

lastIndexOf(str)                 → last index
                                   "banana".lastIndexOf("na") → 4


-----------------------
-- SUBSTRINGS
-----------------------
substring(begin)
substring(begin, end)
                                   "hello".substring(1,4) → "ell"

split(regex)
                                   "a b c".split(" ") → ["a","b","c"]


-----------------------
-- CASE
-----------------------
toLowerCase()
toUpperCase()


-----------------------
-- TRIMMING
-----------------------
trim()                           → remove ASCII spaces
strip()                          → remove all unicode whitespace
stripLeading()
stripTrailing()


-----------------------
-- REPLACEMENT
-----------------------
replace(old, new)                → char or sequence replacement
                                   "abc".replace("b","X") → "aXc"

replaceAll(regex, repl)          → regex (all matches)

replaceFirst(regex, repl)        → regex (first match only)


-----------------------
-- JOIN / REPEAT
-----------------------
String.join(delim, items...)
                                   String.join(",","a","b") → "a,b"

repeat(n)
                                   "ha".repeat(3) → "hahaha"


-----------------------
-- REGEX MATCHING
-----------------------
matches(regex)
                                   "123".matches("\\d+") → true


-----------------------
-- CONCATENATION
-----------------------
concat(str)
                                   "hi".concat(" there")


-----------------------
-- BYTES
-----------------------
getBytes()
getBytes(charset)


-----------------------
-- FORMATTING
-----------------------
String.format(fmt, args...)
                                   String.format("Age %d", 20)


-----------------------
-- INTERNING
-----------------------
intern()
                                   new String("hi").intern()


-----------------------
-- STREAMS
-----------------------
chars()                          → IntStream of chars
codePoints()                     → IntStream of code points


========================================================
= END OF CHEATSHEET                                    =
========================================================

