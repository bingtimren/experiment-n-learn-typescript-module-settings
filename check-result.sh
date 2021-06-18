#!/bin/bash

echo "================== Check all exec success =================="
echo "Check the outputs, make sure they are correct"
echo
for i in logs/*exec*SUCCESS*;do cat "$i";done

echo
echo "================== List all exec success (PKG-TYPE=commonjs) =================="
cat test.log |grep -E "EXEC|(^commonjs.*SUCCESS\s+SUCCESS)"

echo
echo "================== List all exec success (PKG-TYPE=module) =================="
cat test.log |grep -E "EXEC|(^module.*SUCCESS\s+SUCCESS)"