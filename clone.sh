# at first we need use command "git remote add origin git@github.com:gao2951713/UsefulCompant.git" as remote repository.more information please see each readme.txt file.
# then you can do like below.
# this is a auto clone resources by user hand.
# if you don't use command "git fetch". you can only see your current branch in a special branch directory.
# this is git kernel from GIT it self
git clone git://git.kernel.org/pub/scm/git/git.git
# this is one of test branch for clone operation the remote branch is springMVCfragment
# in this branch,i want to make a springMVC and servlet's webfragment feture only,no hibernate and another.
git clone --branch objrepos git@github.com:gao2951713/UsefulCompant.git springMVCfragment
# this is a demo accoding to my real project EAS.but use springMVC+hibernate+webfragment together.include a entity auto general tool.
git clone --branch productmodel git@github.com:gao2951713/UsefulCompant.git productmodel
git clone --branch master git@github.com:gao2951713/UsefulCompant.git master


#useful command
#########################################################
# about auto clear trash 这是一个 Java 写的清理工具bfg-repo-cleaner，
# java -jar bfg-1.11.7.jar --delete-files *.zip myrepo.git
# java -jar bfg-1.11.7.jar --delete-files *.log myrepo.git
# java -jar bfg-1.11.7.jar --delete-files *.out myrepo.git
# java -jar bfg-1.11.7.jar --strip-blobs-bigger-than 1M myrepo.git
# 复制代码仓库：
# git clone --bare /var/www/html/myrepo.git
# Git 后悔药，覆盖最后一次修改：
# git add . git commit --amend git push origin master -f
# Git 放弃本地修改：
# git checkout .
# Git 销毁最后一次提交：
# git reset --hard HEAD^ git push -f origin HEAD^:master
# 打包时候嵌入版本号：
# git rev-parse HEAD > version.txt



