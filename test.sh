#!/bin/bash
clear;
rm -fr logs;
rm -fr dist;
mkdir logs;
mkdir dist;

FORMAT="%-10s %-17s %-16s %-9s %-11s\n"

for target in "moment" "p-map"; do
for pkg in "commonjs" "module"; do
cat "pkg-$pkg.json" > package.json
echo
echo package.json: `cat package.json |grep type`  IMPORT: $target
echo

printf "$FORMAT" "MODULE" "CASE" "esModuleInterop" "COMPILE" "EXEC"
echo "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-"

for module in "commonjs" "es2020"; do
for testcase in "default-import" "namespace-import" "import-equal" "old-require" "dynamic-import"; do
for interOp in "True" "False"; do
    OUTDIR="dist/$target/pkg-$pkg/tscfg-$module-$interOp"
    COND="$target-$pkg-$module-$interOp-$testcase"
    OUTFILE="$OUTDIR/$testcase.js"
    if [ $interOp = "True" ];then INTEROP_OPTION="--esModuleInterop";else INTEROP_OPTION="";fi
    CMD="tsc --rootDir ./src/$target --outDir $OUTDIR --target es2020 --noEmitOnError --module $module $INTEROP_OPTION --moduleResolution node src/$target/$testcase.ts"
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
    printf "$FORMAT" "$module" "$testcase" "$interOp" "$compile" "$execution"
done
done
done
done
done
