mkdir ../avalon-learning-static
cp -r static ../avalon-learning-static
cp -r demos ../avalon-learning-static
cd zh_CN
parm make -d ../../avalon-learning-static/html/zh_CN
cd ..
cp index.html ../avalon-learning-static
