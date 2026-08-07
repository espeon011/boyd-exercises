#import "@preview/haita:0.3.0": *

#book(
  debug: false,
  title: "Convex Optimization 演習問題解答",
  lang: "ja",
  canonical-url: "https://espeon011.github.io",
  root: "boyd-exercises",
  html-renderer: new-hamber.html-renderer.with(
    pagefind-enabled: true,
    sidebar-image: html.a(
      href: "/boyd-exercises",
      class: "block p-4 text-xl font-bold text-center dark:text-white no-underline",
      "Convex Optimization\n演習問題解答",
    ),
    summary-image-renderer: new-hamber.summary-image-renderer.with(
      "Convex Optimization Ex",
      "https://espeon011.github.io",
      bottom-content: [
        Solutions for exercises from Stephen Boyd and Lieven Vandenberghe's Convex Optimization
      ],
    ),
  ),
  tree: (
    chapter("index", content: include "pages/home.typ"),
    std.divider(),
    [= Part I Theory],
    chapter("chapter02", content: include "pages/chapter02.typ"),
    chapter("chapter03", content: include "pages/chapter03.typ"),
    std.divider(),
    [= Part II Applications],
    std.divider(),
    [= Part III Algorithms],
    std.divider(),
  ),
)
