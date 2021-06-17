// import equal
import pMap = require("p-map");
pMap.default([1,2], (n)=>n+1).then(result=>console.log(result))