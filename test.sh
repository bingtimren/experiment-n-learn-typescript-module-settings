#!/bin/bash
echo Node Version `node -v`
echo TSC `tsc -v`
echo
rm -fr logs;
rm -fr dist;
mkdir logs;
mkdir dist;

FORMAT="%-10s %-6s %-10s %-17s %-16s %-9s %-11s\n"
printf "$FORMAT" "PKG-TYPE" "TARGET" "MODULE" "CASE" "esModuleInterop" "COMPILE" "EXEC"

for target in "moment" "p-map" "mixing"; do
for pkg in "commonjs" "module"; do
cat "pkg-$pkg.json" > package.json
verifyPkg=`cat package.json |grep type|cut -d ':' -f 2|cut -d '"' -f 2`
if [ "$pkg" != "$verifyPkg" ]; then echo ERROR pacakge.json type incorrect;exit 1;fi
echo "-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-"

for module in "commonjs" "es2020"; do
for testcase in "default-import" "namespace-import" "import-equal" "old-require" "dynamic-import" "build-commonjs" "build-module"; do
SRC="src/$target/$testcase.ts"
if test -f "$SRC"; then
    for interOp in "True" "False"; do
        OUTDIR="dist/$target/pkg-$pkg/tscfg-$module-$interOp"
        COND=`printf "%-14s %-6s %-13s %-17s %-5s %1s" "pkg-$pkg" "$target" "ts-$module" "$testcase" "$interOp" "-"`
        OUTFILE="$OUTDIR/$testcase.js"
        if [ $interOp = "True" ];then INTEROP_OPTION="--esModuleInterop";else INTEROP_OPTION="";fi
        CMD="tsc --rootDir ./src/$target --outDir $OUTDIR --target es2020 --noEmitOnError --module $module $INTEROP_OPTION --moduleResolution node $SRC"
        echo COMPILE COMMAND: $CMD > logs/"$COND-compile.log";
        echo >> logs/"$COND-compile.log";
        if $CMD &>>logs/"$COND-compile.log";then compile=SUCCESS;else compile=FAIL;fi
        if [ $compile = "SUCCESS" ];then
            # Compile success
            mv logs/"$COND-compile.log" logs/"$COND compile SUCCESS.log"
            EXEC="node $OUTFILE";
            if $EXEC &>logs/"$COND exec.log";then 
                execution=SUCCESS;
            else 
                execution=FAIL;
            fi
            mv logs/"$COND exec.log" logs/"$COND exec $execution.log"            
        else
            # Compile fail
            mv logs/"$COND-compile.log" logs/"$COND compile FAIL.log"
            execution="- -"
        fi
        printf "$FORMAT" "$pkg" "$target" "$module" "$testcase" "$interOp" "$compile" "$execution"
    done
fi
done
done
done
done
