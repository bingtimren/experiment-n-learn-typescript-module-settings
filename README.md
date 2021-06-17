# Experiment Typescript Option "esModuleInterop"

This repo is for experimenting Typescript option "esModuleInterop" in all conditions, to find out what works, what doesn't work, and when to use what settings.

## Usage

Change "type" field in "package.json" between "commonjs" and "module", and repeat the following commands to run the experiment.

<pre><code>
npm install
npm run test
</code></pre>

## Results

<pre><code>

package.json: "type": "commonjs",

CASE              MODULE     esModuleInterop  COMPILE   EXEC       
-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-
default-import    commonjs   True             SUCCESS   SUCCESS    
default-import    commonjs   False            FAIL      - -        
default-import    es2020     True             SUCCESS   FAIL       
default-import    es2020     False            FAIL      - -        
namespace-import  commonjs   True             FAIL      - -        
namespace-import  commonjs   False            SUCCESS   SUCCESS    
namespace-import  es2020     True             FAIL      - -        
namespace-import  es2020     False            SUCCESS   FAIL       
import-equal      commonjs   True             SUCCESS   SUCCESS    
import-equal      commonjs   False            SUCCESS   SUCCESS    
import-equal      es2020     True             FAIL      - -        
import-equal      es2020     False            FAIL      - -        
old-require       commonjs   True             SUCCESS   SUCCESS    
old-require       commonjs   False            SUCCESS   SUCCESS    
old-require       es2020     True             SUCCESS   SUCCESS    
old-require       es2020     False            SUCCESS   SUCCESS    

package.json: "type": "module",

CASE              MODULE     esModuleInterop  COMPILE   EXEC       
-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-
default-import    commonjs   True             SUCCESS   FAIL       
default-import    commonjs   False            FAIL      - -        
default-import    es2020     True             SUCCESS   SUCCESS    
default-import    es2020     False            FAIL      - -        
namespace-import  commonjs   True             FAIL      - -        
namespace-import  commonjs   False            SUCCESS   FAIL       
namespace-import  es2020     True             FAIL      - -        
namespace-import  es2020     False            SUCCESS   FAIL       
import-equal      commonjs   True             SUCCESS   FAIL       
import-equal      commonjs   False            SUCCESS   FAIL       
import-equal      es2020     True             FAIL      - -        
import-equal      es2020     False            FAIL      - -        
old-require       commonjs   True             SUCCESS   FAIL       
old-require       commonjs   False            SUCCESS   FAIL       
old-require       es2020     True             SUCCESS   FAIL       
old-require       es2020     False            SUCCESS   FAIL       


</code></pre>
