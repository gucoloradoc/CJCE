Details of files provided in the zip file:
==========================================

I. Samples folder contains the below listed files:
--------------------------------------------------

1. wileyNJD-CJCE.tex -> LaTeX input file for sample
2. wileyNJD-CJCE.bib -> sample bib file for reference
3. wileyNJD-CJCE.pdf -> PDF output of the above sample file
4. empty.eps -> dummy eps image used for sample purpose; There is no need to include the width and height 
	        of the image in the optional argument of \includegraphics[]{} tag; It is enough to follow the below format:

\begin{figure}[t]
\centerline{\includegraphics{<eps-image-file-name>}}
\caption{<figure-caption>\label{...}}
\end{figure}


4. wileyNJD-CJCE.bst -> required for compilation and bbl file generation
5. WileyNJD-v2.cls -> required for compilation

6. wileyNJD-CJCE.bbl -> generated during bibtex
7. wileyNJD-CJCE.blg -> generated during bibtex

II. Fonts - This folder contains stix fonts. We need to copy these font files in our current folder.

III. BIB file creation:
-----------------------

Use the sample bib file provided as a base to create customized bib file. To get abbreviated journal title in the bbl file, 
we need to define string name with its corresponding abbreviated journal title as shown in the top of the file "wileyNJD-CJCE.bib".

@STRING{PowTech="Powder Technol"}
@STRING{ComChemEng="Com Chem Eng"}

To create bbl file follow the below steps:

1. Compile the latex input file thrice;
2. Run bibtex - bbl and blg are generated; bbl file will not be generated in case of any errors in the format used in the bib file; 
3. Again compile the latex input file thrice to get proper cross citations in the output;

latex wileyNJD-CJCE
latex wileyNJD-CJCE
latex wileyNJD-CJCE
bibtex wileyNJD-CJCE
latex wileyNJD-CJCE
latex wileyNJD-CJCE
latex wileyNJD-CJCE

