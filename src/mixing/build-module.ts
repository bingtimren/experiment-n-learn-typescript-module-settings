// When building ESM packages for node, tsc options must be set as follows:
//      module: es2020 (or later)
//      esModuleInterop: True
// Then code like below works

// for commonjs modules, default import works
import moment from "moment"
console.log(moment())

// for commonjs module, dynamic import also works
import("moment").then(moment=>{
    console.log(moment.default())
})

// for ESM module, default import, dynamic import and namespace import all works
import pMap from "p-map"
pMap([1,2], (n)=>n+1).then(result=>console.log(result))

// dynamic import
import("p-map").then(pMap=>{
    pMap.default([1,2], (n)=>n+1).then(result=>console.log(result))
})

// namespace import
import * as pMapNS from "p-map"
pMapNS.default([1,2], (n)=>n+1).then(result=>console.log(result))
