# boyd-exercises

## Build

typst と pagefind が必要.
SSG として typst package の [haita](https://typst.app/universe/package/haita) を用いる. 

```shell
find docs -mindepth 1 -delete && typst compile --features bundle,html --format bundle src/main.typ ./docs --root ./ && pagefind --site ./docs
```

nix 環境であれば

```shell
nix run .#compile
```
