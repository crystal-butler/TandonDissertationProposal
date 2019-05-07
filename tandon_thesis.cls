%% Identification

\NeedsTeXFormat{LaTeX2e} % do not need any particular format that I
                         % know of.

\ProvidesClass{tandon_thesis}[2019/03/25 NYU Tandon PhD
thesis class, originally Boris Aronov, modified Crystal Butler]

%% Refuse to run in compatibility mode:
\if@compatibility
  \ClassError{tandon_thesis}{LaTeX 2.09 compatibility not supported}
    {You are trying to use tandon_thesis.cls in LaTeX 2.09 compatibility
  mode. This will not work.}
\else
\fi


%% Preliminary declarations

% default is one-sided
\newif\ifmy@twoside
\@twosidefalse
\my@twosidefalse

\newif\if@indentfirst
\@indentfirsttrue

%% Options
\DeclareOption{twoside}{\@twosidetrue\my@twosidetrue}
%\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{indentfirst}{\@indentfirsttrue}
\DeclareOption{noindentfirst}{\@indentfirstfalse}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{book}%
}

%% Loading other files

% Force one-sided books! Find the right way of doing it later!!!
\ProcessOptions\relax
\PassOptionsToClass{openany,11pt}{book}
\LoadClass{book}
\ifmy@twoside
   \@twosidetrue \message{it was TRUE after loading the class}
\else
   \@twosidefalse \message{it was FALSE after loading the class}
\fi
\RequirePackage{setspace}

%% More declarations
\if@indentfirst
   \RequirePackage{indentfirst}
\fi

\if@twoside
   \ClassWarning{tandon_thesis}{We do not support two-sided formatting
   (yet?)}
\else
   \ClassWarning{tandon_thesis}{We seem to be working one-sided now!}
\fi


\if@twoside
\else
  \raggedbottom
\fi

\RequirePackage{fancyhdr}
\RequirePackage{calc}
\RequirePackage{geometry}[2002/07/08]

\if@twoside
   \ClassWarning{tandon_thesis}{Booooooo!!! Cannot (yet!) use two-sided
   with tandon_thesis!!!!} 
\else
 %% Page layout, from the pink booklet
 \advance\headheight by 2pt     % prevents annoying complaints about
                                % overfull boxes 
 \geometry{
%% This shows the page layout on the first page.
%% Should make this into an option. --BA
%   showframe,
   verbose,
   letterpaper,
   includehead,
   includefoot,
%   top=1in-\headheight-\headsep, % first line of text at 1 inch from the edge 
%   bottom=1in-\footskip,         % last line of text at 1in from the edge
%   left=1.5in,                   % left margin 1in, right 3/4in
%   right=0.75in}
   top=1in-\headheight-\headsep, % first line of text at 1 inch from the edge 
   bottom=1in-\footskip,         % last line of text at 1in from the edge
   left=1.5in,                   % left margin 1 1/2in, right 1in
   right=1in}   
%  \topmargin 0 in
%  \textheight 9in
%  \oddsidemargin .5 in
%  \evensidemargin\oddsidemargin
%  \textwidth 6.25 in
 %% This is the style you get from \pagestyle{fancy} 
 %% \fancyhead[LO,RE]{\slshape \leftmark}
 %% \fancyfoot[C]{\thepage}

 %% We go for something simpler, we redefine the plain style so that
 %% everything acts sane later
 \pagestyle{fancy}
 \fancyhf{}
 \fancyhead[R]{\thepage}
 \renewcommand{\headrulewidth}{0pt}
 \renewcommand{\footrulewidth}{0pt}
\fi

