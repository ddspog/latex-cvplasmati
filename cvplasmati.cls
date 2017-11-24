\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cvplasmati}[2017/11/22 Plasmati CV Template]

\RequirePackage{kvoptions}
\SetupKeyvalOptions{%
    family=cv,
    prefix=cv@,
}

\DeclareStringOption[EN,PT]{lang}
\ProcessKeyvalOptions*
 
% !TEX program = lualatex
\LoadClass[a4paper,10pt]{article} % Default font size and paper size


\RequirePackage{fontspec} % For loading fonts
\defaultfontfeatures{Ligatures=TeX}
\setmainfont[Scale = .90]{Arial} % Main document font

\RequirePackage[usenames,dvipsnames]{xcolor} % Required for specifying custom colors
\RequirePackage[big]{layaureo} % Margin formatting of the A4 page, an alternative to layaureo can be \usepackage{fullpage}
\RequirePackage{titlesec} % Used to customize the \section command

\RequirePackage{cvinfo}

\newcommand{\addInfo}[3]{%
    \begin{minipage}{0.3\textwidth}%
        \begin{flushleft}%
            #1%
        \end{flushleft}%
    \end{minipage}%
    \hspace*{\fill}%
    \begin{minipage}{0.35\textwidth}%
        \centering{#2}%
    \end{minipage}%
    \hspace*{\fill}%
    \begin{minipage}{0.3\textwidth}%
        \begin{flushright}%
            #3%
        \end{flushright}%
    \end{minipage}%
}

\newcommand{\addInfoBf}[3]{%
    \addInfo{%
        \textbf{#1}%
    }{%
        \textbf{#2}%
    }{%
        \textbf{#3}%
    }
}

\titleformat{\section}{\scshape \raggedright\normalsize}{}{0em}{}[\titlerule] % Text formatting of sections
\titlespacing{\section}{0pt}{3pt}{0pt} % Spacing around sections

\RequirePackage{forloop}

\newenvironment{cvdoc}[1]{
    \begin{loadinfo}{#1}
        \newenvironment{contact}{%
            \addInfo{
                \small{%
                    \ctcaddress{\cv@lang}\\
                    \ctccity,\ctcstate,\ctccountry{\cv@lang}\\%
                }
            }{
                \LARGE{\textbf{\ctcname{3}}}
            }{
                \small{%
                    \ctccellphone{}\\
                    \ctcemail%
                }
            }
        }{}
        \newenvironment{education}{%
            \section{\textbf{\kwdedutitle{\cv@lang}}}
            \addInfoBf{\edulocal{\cv@lang}}{\eduuniversity{\cv@lang}}{\eduperiod{\cv@lang}}
            \begin{itemize}
                \setlength\itemsep{-0.75em}
                \item \edumajor{\cv@lang}
                \item \edugrade{\cv@lang}
            \end{itemize}
        }{}
        \newenvironment{employment}{%
            \section{\textbf{\kwdwrktitle{\cv@lang}}}
            \newcommand{\showwrk}[1]{%
                \addInfoBf{\wrktype{\cv@lang}{####1}}{\wrkemployer{\cv@lang}{####1}}{\wrkperiod{\cv@lang}{####1}}
                \begin{itemize}
                    \setlength\itemsep{-0.75em}
                    \item \wrktitle{\cv@lang}{####1}
                    \item \wrkinfo{\cv@lang}{####1}
                \end{itemize}
            }
        }{}
        \newenvironment{skills}{
            \section{\textbf{\kwdskltitle{\cv@lang}}}
            \addInfoBf{}{}{}
            \begin{itemize}
                \setlength\itemsep{-0.75em}
                \item \kwdsklstrong{\cv@lang}: \sklstrong%
                \item \kwdsklknowledgeable{\cv@lang}: \sklknowledgeable%
            \end{itemize}
        }{}
}{            
    \end{loadinfo}
}