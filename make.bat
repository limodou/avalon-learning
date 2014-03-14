md ..\avalon-learning-static
md ..\avalon-learning-static\static
copy static\*.* ..\avalon-learning-static\static
cd zh_CN
parm make -d ..\..\avalon-learning-static\zh_CN
cd ..
copy /Y index.html ..\avalon-learning-static\
