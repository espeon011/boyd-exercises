#import "@local/haita:0.2.1": *

#let site-name = "Convex Optimization\n演習問題"

#let offset-chapter(path, ..args) = chapter(
  path,
  content: include path + ".typ",
  ..args,
)

#book(
  debug: true,
  title: site-name,
  // canonical-url: "https://wensimehrp.github.io",
  html-renderer: new-hamber.html-renderer.with(
    pagefind-enabled: true,
    sidebar-image: html.a(
      href: "/",
      class: "block p-4 text-xl font-bold text-center dark:text-white no-underline",
      site-name,
    ),
  ),
  tree: (
    chapter("index", content: include "pages/home.typ"),
    [= Part I Theory],
    chapter("chapter02", content: include "pages/chapter02.typ"),
    chapter("chapter03", content: include "pages/chapter03.typ"),
    [= Part II Applications],
    [= Part III Algorithms],
    // chapter("index", content: include "docs/intro.typ"),
    // [= User Guide],
    // offset-chapter("installation"),
    // offset-chapter("tutorial", children: (
    //   offset-chapter("tutorial/authoring"),
    //   offset-chapter("tutorial/using-typst-packages"),
    //   offset-chapter("tutorial/integration"),
    //   offset-chapter("tutorial/custom-renderer"),
    //   offset-chapter("tutorial/continuous-integration"),
    // )),
    // divider(),
    // offset-chapter("references"),
    // offset-chapter("demo", children: (
    //   offset-chapter("demo-code"),
    // )),
  ),
)
