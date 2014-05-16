set jobname=thesis
@echo off
call clean.bat
del %jobname%.pdf
if exist %jobname%.pdf (
echo ��رմ򿪵�%jobname%.pdf������ִ�С�
pause
exit
) 
pdflatex -shell-escape .\%jobname%.tex
makeindex -s %jobname%.ist -t %jobname%.glg -o %jobname%.gls %jobname%.glo
makeindex -s %jobname%.ist -t %jobname%.alg -o %jobname%.acr %jobname%.acn
bibtex .\%jobname%.aux
bibtex .\publications.aux
pdflatex -shell-escape .\%jobname%.tex
makeindex -s %jobname%.ist -t %jobname%.glg -o %jobname%.gls %jobname%.glo
makeindex -s %jobname%.ist -t %jobname%.alg -o %jobname%.acr %jobname%.acn
pdflatex -shell-escape .\%jobname%.tex
call clean.bat

echo ****************************************************************************
echo ��ʽ����ǰӦ�÷���https://github.com/shifujun/UESTCthesis���ģ���Ƿ��и��£�
echo ****************************************************************************
pause