# This script takes a diffblue-generated testsuite, and tries to put each test file in the right tika module.
# Node that the script is pretty naive and is based on matching file name prefixes, so for example SomeClassTest
# will be put to the module containing SomeClass, but also to the module containing Som
# Usage ./extract-tests.sh path/to/diffblue/testsuite

DIR=.
DIFFBLUEDIR=`readlink -f $1`"/";

for t in `find $DIFFBLUEDIR -type f -name "*Test.java"`; do
  TEST_FILE="${t//"${DIFFBLUEDIR}"/"src/test/"}";
  SRC_FILE="${t//"${DIFFBLUEDIR}"/"src/main/"}";
    if [ -d `dirname $SRC_FILE` ]; then
      mkdir -p `dirname $TEST_FILE`;
      echo "Copying $t to $TEST_FILE";
      cp $t $TEST_FILE;
    else
      echo "`dirname $SRC_FILE` could not be located";
    fi
  echo
done
