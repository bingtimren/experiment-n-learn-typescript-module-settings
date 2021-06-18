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
    COND=`printf "%-14s %-6s %-13s %-17s %-5s %1s" "pkg-$pkg" "$target" "ts-$module" "$testcase" "$interOp" "-"`
    OUTFILE="$OUTDIR/$testcase.js"
    if [ $interOp = "True" ];then INTEROP_OPTION="--esModuleInterop";else INTEROP_OPTION="";fi
    CMD="tsc --rootDir ./src/$target --outDir $OUTDIR --target es2020 --noEmitOnError --module $module $INTEROP_OPTION --moduleResolution node src/$target/$testcase.ts"
    echo COMPILE COMMAND: $CMD > logs/"$COND-compile.log";
    echo >> logs/"$COND-compile.log";
    if $CMD &>>logs/"$COND-compile.log";then compile=SUCCESS;else compile=FAIL;fi
    if [ $compile = "SUCCESS" ];then
        # Compile success
        mv logs/"$COND-compile.log" logs/"$COND compile SUCCESS.log"
        EXEC="node $OUTFILE";
        if $EXEC &>logs/"$COND exec.log";then 
            #Execution success
            mv logs/"$COND exec.log" logs/"$COND exec SUCCESS.log"
            execution=SUCCESS;
        else 
            # Execution fail
            mv logs/"$COND exec.log" logs/"$COND exec FAIL.log"
            execution=FAIL;
        fi
    else
        # Compile fail
        mv logs/"$COND-compile.log" logs/"$COND compile FAIL.log"
        execution="- -"
    fi
    printf "$FORMAT" "$module" "$testcase" "$interOp" "$compile" "$execution"
done
done
done
done
done
