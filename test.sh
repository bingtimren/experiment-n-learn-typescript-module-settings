#!/bin/bash
clear;
rm -fr logs;
rm -fr dist;
mkdir logs;
mkdir dist;

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
    OUTDIR="dist/$pkg/$module-$interOp"
    COND="$pkg-$module-$interOp-$testcase"
    OUTFILE="$OUTDIR/test-$testcase.js"
    if [ $interOp = "True" ];then INTEROP_OPTION="--esModuleInterop";else INTEROP_OPTION="";fi
    CMD="tsc --rootDir ./src --outDir $OUTDIR --target es2020 --noEmitOnError --module $module $INTEROP_OPTION --moduleResolution node src/test-$testcase.ts"
    echo COMPILE COMMAND: $CMD > logs/$COND-compile.log;
    echo >> logs/$COND.log;
    if $CMD &>>logs/$COND-compile.log;then compile=SUCCESS;else compile=FAIL;fi
    if [ $compile = "SUCCESS" ];then
        EXEC="node $OUTFILE";
        if $EXEC &>logs/$COND-exec.log;then execution=SUCCESS;else execution=FAIL;fi
    else
        EXEC=SKIPPED
        execution="- -"
    fi
    printf "$FORMAT" "$testcase" "$module" "$interOp" "$compile" "$execution"
done
done
done
done
