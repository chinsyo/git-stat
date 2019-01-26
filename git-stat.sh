#! /bin/bash

NC='\033[0m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'

function map () {
    case $1 in 
    xue) echo -e "${RED}薛俊强${NC}"
    ;;
    he1293919887) echo -e "${RED}何君超${NC}"
    ;;
    Chinsyo) echo -e "${RED}王晨晓${NC}"
    ;;
    peiyu) echo -e "${RED}姚佩玉${NC}"
    ;;
    mach) echo -e "${BLUE}马超${NC}"
    ;;
    马超) echo -e "${BLUE}马超${NC}"
    ;;
    卫杰李) echo -e "${BLUE}李卫杰${NC}"
    ;;
    蒋泽康) echo -e "${BLUE}蒋泽康${NC}"
    ;;
    esac;
}

DECORATION="========================================"
SEPARATION="----------------------------------------"
#
#   琥珀盾
#
echo $DECORATION
echo "琥珀盾"
echo $DECORATION
echo "参与开发人员："
AUTHORS=$(git log | grep "^Author: " | awk '{print $2}' | sort | uniq)
for author in $AUTHORS
do 
    echo $(map $author) $author
done

echo $SEPARATION
echo "代码提交总次数："
git log --oneline | wc -l

echo $SEPARATION
echo "代码提交次数："
for author in $AUTHORS
do
    echo $(map $author) $(git log --author=$author --oneline | wc -l)
done

echo $SEPARATION
echo "代码修改总行数："
echo $(git log --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "添加: %s, 删除: %s, 合计: %s\n", add, subs, loc }' -)


echo $SEPARATION
echo "代码修改行数："
for author in $AUTHORS
do
    lines=$(git log --author=$author --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "添加: %s, 删除: %s, 合计: %s\n", add, subs, loc }' -)
    echo $(map $author) $lines
done

#
#   琥珀盾二期
#
echo $DECORATION
echo "琥珀盾二期"
echo $DECORATION

DATE='--since="2018-12-03"'
echo "参与开发人员："
AUTHORS=$(git log $DATE | grep "^Author: " | awk '{print $2}' | sort | uniq)
for author in $AUTHORS
do 
    echo $(map $author) $author
done

echo $SEPARATION
echo "代码提交总次数："
git log $DATE --oneline | wc -l

echo $SEPARATION
echo "代码提交次数："
for author in $AUTHORS
do
    echo $(map $author) $(git log $DATE --author=$author --oneline | wc -l)
done

echo $SEPARATION
echo "代码修改总行数："
echo $(git log $DATE --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "添加: %s, 删除: %s, 合计: %s\n", add, subs, loc }' -)


echo $SEPARATION
echo "代码修改行数："
for author in $AUTHORS
do
    lines=$(git log $DATE --author=$author --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "添加: %s, 删除: %s, 合计: %s\n", add, subs, loc }' -)
    echo $(map $author) $lines
done
