# boyd-exercises

## Build

typst と pagefind が必要.
SSG として typst package の [haita](https://typst.app/universe/package/haita) を用いる. 

```shell
typst compile --features bundle,html --format bundle src/main.typ ./docs && pagefind --site ./docs --output-subdir boyd-exercises/pagefind
```

nix 環境であれば

```shell
nix run .#compile
```
