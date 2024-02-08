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



## Preview

![image](https://github.com/benstreich/vicious-chinchilla/assets/90034208/eec73077-56c3-45e1-a603-6580ff069ada)


## Usage/Examples

```
~!: hash;
    [MANDATORY][-p[string]Path] 
    [MANDATORY][-e[int]]
```
## Encryption Methods


| -e             | Method                                        |
| ----------------- | ----------------------------------------------- |
| 0 | MD5 |
| 1 | SHA1 |
| 2 | SHA256 |
| 3 | SHA384 |
| 4 | SHA512 |


## License
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

## Related

[malicious-chinchilla](https://github.com/benstreich/malicious-chinchillaV2)
