#!/bin/bash
clear;
rm -fr logs;
mkdir logs;

FORMAT="%-17s %-10s %-16s %-9s %-11s\n"

for pkg in "commonjs" "module"; do
cat "pkg-$pkg.json" > package.json
echo
echo package.json: `cat package.json |grep type`
echo

printf "$FORMAT" "CASE" "MODULE" "esModuleInterop" "COMPILE" "EXEC"
echo "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-"

for testcase in "default-import" "namespace-import" "import-equal" "old-require"; do
for module in "commonjs" "es2020"; do
for interOp in "True" "False"; do
    rm -f src/*.js;
    if [ $interOp = "True" ];then INTEROP_OPTION="--esModuleInterop";else INTEROP_OPTION="";fi
    CMD="tsc --module $module $INTEROP_OPTION src/test-$testcase.ts"
    echo COMPILE COMMAND: $CMD > logs/$module-$testcase-compile.log;
    echo > logs/$module-$testcase-compile.log;
    if $CMD &>logs/$module-$testcase-compile.log;then compile=SUCCESS;else compile=FAIL;fi
    if [ $compile = "SUCCESS" ];then
        EXEC="node src/test-$testcase.js";
        if $EXEC &>logs/$module-$testcase-exec.log;then execution=SUCCESS;else execution=FAIL;fi
    else
    EXEC=SKIPPED
    execution="- -"
    fi
    printf "$FORMAT" "$testcase" "$module" "$interOp" "$compile" "$execution"
done
done
done
done

rm -f src/*.js
