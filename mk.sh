#!/bin/bash


TEXFILE=ausarbeitung.tex
cd LaTex\ Vorlage/
pdflatex ${TEXFILE} && ${TEXFILE} vorlage.tex
