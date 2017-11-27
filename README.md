# latex-cvplasmati

By [ddspog](https://github.com/ddspog)

**cvplasmati** template allow printing a resume using data fetched from a JSON, using multi-language configuration.

## License

You are free to copy, modify and distribute **cvplasmati** with attribution under the terms of the MIT license. See the [LICENSE](https://github.com/ddspog/latex-cvinfo/blob/master/LICENSE) file for details.

## Installation

Before using **cvplasmati** you need:

* LuaLaTeX Engine

Setup your way of reading and compiling Latex files. Then, on folder for public packages, put these files naming the folder as **cvinfo**. Update the packages, and you're ready to use this template.

## How to use

Import the package like this:

```latex
\documentclass[lang=EN]{cvplasmati}
```

Then you're ready to use it with the environment **loadinfo**:

```latex
\begin{cvdoc}{testinfo.json}%
    \begin{contact}%
    \end{contact}
    \begin{education}%
    \end{education}%
    \begin{employment}%
        \showwrk{1}%
        \showwrk{2}%
    \end{employment}
    \begin{skills}%
    \end{skills}
\end{cvdoc}%
```

The *testinfo.json* must contain the fields used on cvinfo.sty file (check [cvinfo](https://github.com/ddspog/latex-cvinfo) for more information). Call each environment if you want that type of section to be added on your resume. Also when importing **cvplasmati** choose your language: EN or PT.

## Contribution

This package has two objectives from now:

* Publish the package on Latex official repo.

Any interest in help is much appreciated.
