// When building commonjs packages for node, tsc options must be set as follows:
//      module: es2020 (or later)
//      esModuleInterop: True
// Then code like below works

// dynamic import works with both commonjs and ESM modules
async function importBoth(){
    const moment = await import("moment");
    const pMap = await import("p-map");
    console.log(await pMap.default([1, 2], (n) => n + 1));
    console.log(moment.default());
}
importBoth().then(()=>{console.log("DONE")})

// old require works with commonjs module
const moduleMoment = require("moment")
console.log(moduleMoment());

