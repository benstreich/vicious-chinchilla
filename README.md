# vicious-chinchilla

vicious-chinchilla is the third version of the chinchilla series. This application provides the user with a fast hash comparer, that can be used with the malicious-chinchilla Program. It takes as parameters a hash, the path to your malicious-chinchilla created wordlist and the encryption method.


## Run Locally

To deploy this project run

```bash
  git clone https://github.com/benstreich/vicious-chinchilla.git
```

Go to the project directory

```bash
  cd my-project
```

## Usage/Examples

```
~$: hash;
    [MANDATORY][-p[string]Path] 
    [MANDATORY][-e[int]]
```

```
~$: a1b36887d23646550783ec9fdbfed4b9a92b2f7d; -pC:\Users\Wordlist.txt -e1
~$: 3cb42e48dd62331c3e00bae05a7c8fc7; -pC:\Users\Wordlist.txt -e0
~$: 1316378e8d3b8ee2c66b3f40c1c692758b2adabd8628a964795bd86e4930a77e; -pC:\Users\Wordlist.txt -e2

```


## Encryption Methods


| -e             | Method                                        |
| ----------------- | ----------------------------------------------- |
| 0 | MD5 |
| 1 | SHA1 |
| 2 | SHA256 |
| 3 | SHA384 |
| 4 | SHA512 |

## Preview

![image](https://github.com/benstreich/vicious-chinchilla/assets/90034208/eec73077-56c3-45e1-a603-6580ff069ada)





## License
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

## Related

[malicious-chinchilla](https://github.com/benstreich/malicious-chinchillaV2)
