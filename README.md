# RC4
GLua implementation of RC4

## Usage

```
local key = string.rep("a", 16)
local plainText = string.rep("b", 512)

local cipherText = RC4.crypt(key, plainText)

local decipheredText = RC4.crypt(key, plainText)
```

Full specifications can be found [here](https://people.cs.clemson.edu/~jmarty/courses/Spring-2017/CPSC424/papers/RC4ALGORITHM-Stallings.pdf) and [here](https://en.wikipedia.org/wiki/RC4)
