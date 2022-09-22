The **abspos** package lets you place contents at an absolute position, anchored
at some specified part of the contents, similar to how **tikz** nodes work,
though without using the two-pass strategy of **tikz**. It also avoids messing
with the order of **beamer** overlays, which is what happens when one uses the
**textpos** package with the **overlay** option. The solution used is quite
straightforward, combining *coffins* (using **l3coffins**) with the placement
mechanisms of **atbegshi**.

The package is written by [Magnus Lie Hetland](mailto:mlh@ntnu.no) and released
under the [MIT license](LICENSE).
