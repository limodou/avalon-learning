md ..\avalon-learning-static
md ..\avalon-learning-static\static
md ..\avalon-learning-static\demos
copy static\*.* ..\avalon-learning-static\static
copy demos\*.* ..\avalon-learning-static\demos
cd zh_CN
parm make -d ..\..\avalon-learning-static\zh_CN
cd ..
copy /Y index.html ..\avalon-learning-static\
