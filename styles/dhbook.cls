%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{dhbook} [2012/04/01 v0.01 DHBW-Loerrach specialist LaTeX document class]


%Documentclass dhbook ist abgeleitet von book!
\LoadClass[a4paper,12pt,oneside]{book}  



% Einstellungen der Seitenränder
\usepackage[left=2.5cm,right=2.5cm,top=1.5cm,bottom=2.0cm,includehead]{geometry} 

% neue Rechtschreibung
\usepackage{ngerman}  

% deutsche Silbentrennung                                                        	
\usepackage[ngerman]{babel}                                                   	

% Umlaute
\usepackage[utf8]{inputenc}

% pdf-Output [Fußnoten nicht verlinken]
\usepackage[pdftex,bookmarks=true,hyperfootnotes=false]{hyperref} 

% Inhaltsverzeichniserweiterung (Inhaltsverzeichnis selbst ausblenden)                                  	
\usepackage[nottoc]{tocbibind}

% Index
\usepackage{makeidx}

% for DEBUGGING
%schow indexed words on right upper corner of each page
%\usepackage{showidx}

% Abkürzungsverzeichnis
\usepackage[intoc]{nomencl}

% Fancy Header
\usepackage{fancyhdr}

% Zitate (Erweiterung für Literaturverzeichnis)
\usepackage{bibgerm}

%\usepackage[round]{natbib}
\usepackage{amsmath}


% Bild- und Tabellenunterschrift (fett)
\usepackage[font=small,font+=it,aboveskip=1mm]{caption}

% Abstände für die Titel
\usepackage{titlesec}


% Zeilenabstand (vor footmisc laden!)
\usepackage{setspace}

% Fußnoten [Ausrichtung unten, Trennung durch Seperator bei mehreren Fußnoten]
\usepackage[bottom,multiple,hang,marginal]{footmisc}

% Grafiken
\usepackage{graphicx}

% erweiterte Tabellen
\usepackage{tabularx}

% mehrseitige Tabellen
\usepackage{longtable}

% merhfache Tabellenzellen
\usepackage{multirow}

% Farben
\usepackage{color}



% farbige Tabellen
\usepackage{colortbl}

% Befehl setlist (Zeilenabstand für itemize Umgebung auf 1 setzen)
\usepackage{enumitem}

% Quelltexte
\usepackage{listings}

% Verweise (Anhangsverweise)
\usepackage{zref}

% Glossar
\usepackage[nonumberlist]{glossaries}                            


\usepackage{float}
\usepackage{wrapfig}
\usepackage{hhline}

% Einbindung von PDF Seiten
\usepackage{pdfpages}

% erlaubt IF Then ELSE anweisungen
\usepackage{ifthen}

%schriftart
\usepackage{helvet}
%\usepackage{arev}
\usepackage[T1]{fontenc}



\providecommand\phantomsection{}% for hyperref

%%%%%%%%%%%%%%%%%%%%%%%% Ueberschreiben von befehlen aus der Standart book.cls %%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\chapter{
	\if@openright\cleardoublepage\else\clearpage\fi
       \thispagestyle{fancy}%
        \global\@topnum\z@
        \@afterindentfalse
        \secdef\@chapter\@schapter
}

%---  remove huge space befor each new Chapter
\def\@makechapterhead#1{%
 % \vspace*{10\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
    %    \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
  %      \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \markboth{\thechapter ~ #1}{}
  %  \vskip 40\p@
  }}


\def\@makeschapterhead#1{%
 % \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}





%set smaller space bevor and after new sections, than standart values

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-0.1ex}%
                                   {0.3ex }%
                                   {\normalfont\Large\bfseries}}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-.1ex}%
                                     {0.1ex}%
                                     {\normalfont\large\bfseries}}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                    {-.01ex}%
                                     {0.01ex }%
                                     {\normalfont\normalsize\bfseries}}


%\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {-1em}%
%                                    {\normalfont\normalsize\bfseries}}


%\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
%                                       {3.25ex \@plus1ex \@minus .2ex}%
%                                       {-1em}%
%                                      {\normalfont\normalsize\bfseries}}


% disable indent of sections and paragraph
\parindent 0pt




\renewcommand\familydefault{phv}
\renewcommand{\rmdefault}{phv}
\renewcommand{\sfdefault}{phv}




%%%%%%%%%%%%%%%%%%%%%%%% Eigene Farbwerte definieren %%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{boxgray}{RGB}{238,238,238}		% Hintergrundfarbe für Zitatboxen
\definecolor{green}{rgb}{0,0.5,0}		% Grün für Kommentare in Quelltexten
\definecolor{blue}{rgb}{0.13,0.13,1}		% Blau für 'KeyWords' in Quelltexten
\definecolor{red}{rgb}{0.9,0,0}			% Rot für Strings in Quelltexten


%%%%%%%%%%%%%%%%%%%%%%%% Eigene Abstände definieren %%%%%%%%%%%%%%%%%%%%%%%%%
%\titlespacing*{command}{left}{beforesep}{aftersep}[right]
%\titlespacing{\chapter}{0pt}{0pt}{*0.%2}
\titlespacing*{\chapter}{0pt}{0pt}{40pt}
\titlespacing{\section}{0pt}{0pt}{*1.2}
\titlespacing{\subsection}{0pt}{*2}{*0.5}
\titlespacing{\subsubsection}{0pt}{*2}{*0.25}
\parskip 5pt

%%%%%%%%%%%%%%%%%%%%%%%% Eigene Kommandos definieren %%%%%%%%%%%%%%%%%%%%%%%%
\newboolean{sperrvermerk}
\setboolean{sperrvermerk}{false}

\renewcommand{\author}[1]{\def\valueAuthor{#1}}
\renewcommand{\date}[1]{\def\valueDate{#1}}

\newcommand{\type}[1]		{\def\valueType{#1}}
\renewcommand{\title}[1]	{\def\valueTitle{#1}}
\newcommand{\subtitle}[1]	{\def\valueSubtitle{#1}}
\newcommand{\kurs}[1]		{\def\valueKurs{#1}}
\newcommand{\companyName}[1]	{\def\valueCompanyName{#1}}
\newcommand{\companyAddress}[1]	{\def\valueCompanyAddress{#1}}
\newcommand{\companyContact}[1]	{\def\valueCompanyContact{#1}}


\newcommand{\companyLogo}[1]	{\def\valueCompanyLogo{#1}}
\newcommand{\companySupervisor}[1]{\def\valueCompanySupervisor{#1}}

\newcommand{\dhlogo}[1]		{\def\valueDhlogo{#1}}
\newcommand{\schoolSupervisor}[1]{\def\valueSchoolSupervisor{#1}}
\newcommand{\projectNumber}[1]	{\def\valueProjectNumber{#1}}
\newcommand{\studiengang}[1]	{\def\valueStudiengang{#1}}
\newcommand{\fspo}[1]		{\def\valueFspo{#1}}

\newcommand{\issperrvermerk}{ \setboolean{sperrvermerk}{true}}




% Definition von \gqq{#1: text}: Text in Anführungszeichen
\newcommand{\gqq}[1]{\glqq #1\grqq}

% Definition von \footref{#1: label}
% Verweis auf bereits existierende Fußnoten mittels
\providecommand*{\footref}[1]{
	\begingroup
		\unrestored@protected@xdef\@thefnmark{\ref{#1}}
	\endgroup
\@footnotemark}

% Definition von \mypageref{#1: label}
% Kombination aus \ref{#1: label} und \pageref{#1: label}
\newcommand{\mypageref}[1]{\ref{#1} auf Seite \pageref{#1}}

% Definition von \myboxquote{#1: text}
% grau hinterlegte Quotation-Umgebung (für Zitate)
\newcommand{\myboxquote}[1]{
	\begin{quotation}
		\colorbox{boxgray}{\parbox{0.78\textwidth}{#1}}
	\end{quotation}
	\vspace*{1mm}
}


%set @ as letter
\makeatletter
\zref@newprop*{appsec}{}
\zref@addprop{main}{appsec}

% Definition von \applabel{#1: label}{#2: text}
% von \appsec{#1: text}{#2: label} zur Erzeugung des Labels verwendet)
\def\applabel#1#2{%
	\zref@setcurrent{appsec}{#2}%   
	\zref@wrapper@immediate{\zref@label{#1}}%
}

% Definition von \appref{#1: label}
% anstelle \ref{#1: label} zum referenzieren von Anhängen verwenden)
\def\appref#1{%
	\hyperref[#1]{\zref@extract{#1}{appsec}}%
}
%reset @ as other
\makeatother


% Festlegung der Art der Zitierung (Havardmethode: Abkuerzung Autor + Jahr) %
%\bibliographystyle{unsrtnat}
\bibliographystyle{gerunsrt}
%\bibliographystyle{natdin}


% Definition von \appsection{#1: text}{#2: label}
% Ersetzt \section{#1: text} und \label{#2: label} für Anhänge)
\newcommand{\theappsection}[1]{Anhang \Alph{section}:~\protect #1}
\newcommand{\appsection}[2]{
	\addtocounter{section}{1}
	\phantomsection
	\addcontentsline{toc}{section}{\theappsection{#1}}
	\markboth{\theappsection{#1}}{}

	\section*{\theappsection{#1}}
	\applabel{#2}{Anhang \Alph{section}}
	\label{#2}
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%% Kopf- und Fußzeile %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\print[1][]
{%
\ifthenelse{\equal{#1}{}}
{\leftmark}
{#1}
}

\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{14.5pt}
\fancyhead[L]{\nouppercase{\print[\rightmark]}}	% Kopfzeile links bzw. innen
\fancyhead[R]{\thepage}                         % Kopfzeile rechts bzw. außen
\renewcommand{\headrulewidth}{0.5pt}            % Kopfzeile linie




%%%%%%%%%%%%%%%%%%%%%%%%% Layout und Beschriftungen %%%%%%%%%%%%%%%%%%%%%%%%%
\onehalfspacing                % Zeilenabstand: 1.5 (Standard: 1.2)
\setlist{noitemsep}            % Zeilenabstand für items auf 1 setzen

\addto\captionsngerman{        % Tabllen- und Abbildungsunterschriften ändern
  \renewcommand{\figurename}{Abb.}
  \renewcommand{\tablename}{Tab.}
}
%\numberwithin{table}{section}                               % Tabellennummerierung je Sektion zurücksetzen
%\numberwithin{figure}{section}                              % Abbildungsnummerierung je Sektion zurücksetzen

%\renewcommand{\thetable}{\arabic{section}.\arabic{table}}   % Tabellennummerierung mit Section
%\renewcommand{\thefigure}{\arabic{section}.\arabic{figure}} % Abbildungsnummerierung mit Section
\renewcommand{\thefootnote}{\arabic{footnote}}              % Sektionsbezeichnung von Fußnoten entfernen
	

\renewcommand{\multfootsep}{, }                             % Mehrere Fußnoten durch ", " trennen

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Listingstyle %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\lstset{
	language=C,
	basicstyle=\ttfamily\small,
	commentstyle=\color{green}\textit,
	showstringspaces=false,
	stringstyle=\color{red},
	keywordstyle=\color{blue},
	numbers=left,
	numberstyle=\tiny,
	stepnumber=1,
	numbersep=15pt,
	tabsize=2,
	fontadjust=true,
	frame=single,
	backgroundcolor=\color{boxgray},
	captionpos=b,
	linewidth=1.00\linewidth,
	xleftmargin=0.1\linewidth,
	breaklines=true,
	aboveskip=16pt,
%	showspaces=false,
%	showtabs=false,
%	breaklines=true,
%	breakatwhitespace=true,
	escapeinside={(*@}{@*)},
	literate={ldots}{$\ldots$}1 {cdots}{\cdots}1 {vdots}{\vdots}1
}
 


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Titelseite, Deckblatt %%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\makeatletter
\renewcommand{\maketitle}{

\ifthenelse{\boolean{sperrvermerk}}{

    \AddToShipoutPicture*{%
            \setlength{\@tempdimb}{.5\paperwidth}%
            \setlength{\@tempdimc}{.5\paperheight}%
            \setlength{\unitlength}{1pt}%
            \put(\strip@pt\@tempdimb,\strip@pt\@tempdimc){%
                \makebox(0,0){
                    \rotatebox{50}{
                        \textcolor[gray]{0.75}%
			%\color[red]{0.7}%
                        {
                          \fontsize{2.cm}{10cm}
                          \selectfont{MIT SPERRVERMERK}
                        }
                     }
                }%
            }%
    }
}{}

\begin{titlepage}
	
	\includegraphics[height=2cm]{\valueCompanyLogo}
	\hfill
	\includegraphics[height=2cm]{\valueDhlogo}
	\\
	\begin{center}
		\vspace*{1cm}
		\LARGE\bf\valueTitle\\

		\Large\rm\valueSubtitle\\

		\vspace*{2cm}
		\bf \valueType \\
		\vspace*{1cm}
		\normalsize\rm
		für die Prüfung zum\\
		\valueFspo
				
		des Studiengangs \valueStudiengang\\
		
		an der Dualen Hochschule Baden-Württemberg Lörrach\\
		\vspace*{1cm}
		von\\
		\valueAuthor\\
		\vspace*{2cm}
		\valueDate\\
		
		\vfill
	\end{center}
	\begin{tabular}{ll}		
		Kurs:&\valueKurs\\
		Ausbildungsbetrieb:&\valueCompanyName, \valueCompanyAddress\\
		Betreuer + Gutachter der Ausbildungsfirma:&\valueCompanySupervisor\\
		Wissenschaftlicher Betreuer + Gutachter: &\valueSchoolSupervisor\\
		
		
	\end{tabular}
	\newline
	\vspace*{1cm}
	\newline
	%\begin{tabularx}{\textwidth}{l@{\extracolsep\fill}r}
	%  Unterschrift des verantwortlichen Ausbilders&\\
	%  (oder des Personalverantwortlichen)&\rule{6cm}{0.3mm}\\
	%\end{tabularx}
\end{titlepage}
\makeatother

%if sperrvermerk is set, insert sperrvermerk
\ifthenelse{\boolean{sperrvermerk}}{
    \makesperrvermerk
}
{}
\newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  SPERRVERMERK %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makesperrvermerk}{


\phantomsection
\addcontentsline{toc}{chapter}{Sperrklausel}%
\chapter*{}%

	\begin{center}
		\vspace*{1cm}
		\Huge\bf Sperrklausel\\
		\vspace*{2cm}
		\normalsize\rm
		\begin{quotation}
			\parbox{0.8\textwidth}{
			    

			Die vorliegende Arbeit enthält zum Teil Informationen, die nicht für die Öffentlichkeit bestimmt sind. Der Inhalt darf daher nur mit der ausdrücklichen schriftlichen Genehmigung des Verfassers  und der \valueCompanyName ~an Dritte weitergegeben werden. \\
      
			Ausgenommen sind alle, die mit der Prüfung und Bewertung der Arbeit beauftragten Personen.\\

			\large\bf Kontakt \\
			\normalsize\rm

			\valueCompanyContact
		}
	      \end{quotation}
		\vspace*{1cm}
		\begin{quotation}
		  \parbox{0.8\textwidth}{
		  \begin{tabularx}{0.78\textwidth}{l@{\extracolsep\fill}l}
				\rule{4cm}{0.3mm}&\rule{4cm}{0.3mm}\\
	    	Ort, Datum&\valueAuthor
			\end{tabularx}}
		\end{quotation}
	\end{center}
\newpage



}


\newcommand{\makelisting}{
    
 \stepcounter{page}%
  \renewcommand{\lstlistingname}{Quellcodeverzeichnis}

  %Listingsverzeichnis in das Inhaltsverzeichnis aufnehmen.
  \phantomsection
  \addcontentsline{toc}{chapter}{\lstlistingname}




  \lstlistoflistings

}

\newcommand{\makestatement}{

%\thispagestyle{empty}
\phantomsection
\addcontentsline{toc}{chapter}{Ehrenwörtliche Erklärung}%
\chapter*{}%

\markboth{}{}%
\begin{center}
	\vspace*{2cm}
	\Huge\bf Erklärung\\
	\vspace*{3cm}
	\normalsize\rm

	gemäß § 5 (2) der „Studien- und Prüfungsordnung DHBW Technik“ vom 18. Mai 2009.

	\vspace*{2cm}

	Ich habe die vorliegende Arbeit mit dem Titel "\valueTitle" ~selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel verwendet


	\vspace*{3cm}
	
	
	\begin{tabularx}{\textwidth}{l@{\extracolsep\fill}r}
	    \rule{7cm}{0.3mm}&\rule{7.55cm}{0.3mm}\\
	\end{tabularx}

	\begin{tabularx}{\textwidth}{*{2}{>{\arraybackslash}X}}
	    Ort, Datum&Unterschrift\\
	\end{tabularx}
\end{center}

}




\makeatletter

\newcommand\listofillustrations{%

    \renewcommand{\@@glossarysec}{section}
    \chapter*{Illustrationsverzeichnis}%
    \phantomsection
    \addcontentsline{toc}{chapter}{Illustrationsverzeichnis}%
    \markboth{}{}%

    \section*{Abbildungen}%
    \phantomsection
    %\addcontentsline{toc}{section}{\protect\numberline{}Figures}%
    \@starttoc{lof}%

    \bigskip
    \section*{Tabellen}%
    \phantomsection
    %\addcontentsline{toc}{section}{\protect\numberline{}Tables}%
   \@starttoc{lot}

    \bigskip
    \section*{Quellcode}%
    \phantomsection
    %\addcontentsline{toc}{section}{\protect\numberline{}Tables}%
    \@starttoc{lol}


    \newpage
}
\makeatother




\newcommand{\listglossaries}{

\renewcommand*{\glossaryname}{Glossar}%
\markboth{}{}%
\printglossaries
\markboth{}{}%
\clearpage

}


