# boyd-exercises

## Build

typst と pagefind が必要.
typst package の haita の最新コミットを用いるため @local に git clone して import している. 

```shell
typst compile --features bundle,html --format bundle src/main.typ ./docs && pagefind --site ./docs --output-subdir boyd-exercises/pagefind
```
