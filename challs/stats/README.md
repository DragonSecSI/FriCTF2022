# NASLOV

## Description

There is a `base64` encoded text hidden in the pdf file. 

## Solution

```bash
strings something_interesting.pdf  | grep "==" | base64 -d
```
