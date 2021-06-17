// dynamic import
import("p-map").then(pMap=>{
    pMap.default([1,2], (n)=>n+1).then(result=>console.log(result))
})
