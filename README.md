# Experiment Typescript Module Related Settings

This repo is for experimenting Typescript module related setting combinations, to find out what works, what doesn't work, and when to use what settings.

## Usage

Change "type" field in "package.json" between "commonjs" and "module", and repeat the following commands to run the experiment.

<pre><code>
npm install
npm run test
</code></pre>

## Results

<pre><code>

package.json: "type": "commonjs", IMPORT: moment

MODULE     CASE              esModuleInterop  COMPILE   EXEC       
-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-
commonjs   default-import    True             SUCCESS   SUCCESS    
commonjs   default-import    False            FAIL      - -        
commonjs   namespace-import  True             FAIL      - -        
commonjs   namespace-import  False            SUCCESS   SUCCESS    
commonjs   import-equal      True             SUCCESS   SUCCESS    
commonjs   import-equal      False            SUCCESS   SUCCESS    
commonjs   old-require       True             SUCCESS   SUCCESS    
commonjs   old-require       False            SUCCESS   SUCCESS    
commonjs   dynamic-import    True             SUCCESS   SUCCESS    
commonjs   dynamic-import    False            FAIL      - -        
es2020     default-import    True             SUCCESS   FAIL       
es2020     default-import    False            FAIL      - -        
es2020     namespace-import  True             FAIL      - -        
es2020     namespace-import  False            SUCCESS   FAIL       
es2020     import-equal      True             FAIL      - -        
es2020     import-equal      False            FAIL      - -        
es2020     old-require       True             SUCCESS   SUCCESS    
es2020     old-require       False            SUCCESS   SUCCESS    
es2020     dynamic-import    True             SUCCESS   SUCCESS    
es2020     dynamic-import    False            FAIL      - -        

package.json: "type": "module", IMPORT: moment

MODULE     CASE              esModuleInterop  COMPILE   EXEC       
-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-
commonjs   default-import    True             SUCCESS   FAIL       
commonjs   default-import    False            FAIL      - -        
commonjs   namespace-import  True             FAIL      - -        
commonjs   namespace-import  False            SUCCESS   FAIL       
commonjs   import-equal      True             SUCCESS   FAIL       
commonjs   import-equal      False            SUCCESS   FAIL       
commonjs   old-require       True             SUCCESS   FAIL       
commonjs   old-require       False            SUCCESS   FAIL       
commonjs   dynamic-import    True             SUCCESS   FAIL       
commonjs   dynamic-import    False            FAIL      - -        
es2020     default-import    True             SUCCESS   SUCCESS    
es2020     default-import    False            FAIL      - -        
es2020     namespace-import  True             FAIL      - -        
es2020     namespace-import  False            SUCCESS   FAIL       
es2020     import-equal      True             FAIL      - -        
es2020     import-equal      False            FAIL      - -        
es2020     old-require       True             SUCCESS   FAIL       
es2020     old-require       False            SUCCESS   FAIL       
es2020     dynamic-import    True             SUCCESS   SUCCESS    
es2020     dynamic-import    False            FAIL      - -        

package.json: "type": "commonjs", IMPORT: p-map

MODULE     CASE              esModuleInterop  COMPILE   EXEC       
-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-
commonjs   default-import    True             SUCCESS   FAIL       
commonjs   default-import    False            SUCCESS   FAIL       
commonjs   namespace-import  True             SUCCESS   FAIL       
commonjs   namespace-import  False            SUCCESS   FAIL       
commonjs   import-equal      True             SUCCESS   FAIL       
commonjs   import-equal      False            SUCCESS   FAIL       
commonjs   old-require       True             SUCCESS   FAIL       
commonjs   old-require       False            SUCCESS   FAIL       
commonjs   dynamic-import    True             SUCCESS   FAIL       
commonjs   dynamic-import    False            SUCCESS   FAIL       
es2020     default-import    True             SUCCESS   FAIL       
es2020     default-import    False            SUCCESS   FAIL       
es2020     namespace-import  True             SUCCESS   FAIL       
es2020     namespace-import  False            SUCCESS   FAIL       
es2020     import-equal      True             FAIL      - -        
es2020     import-equal      False            FAIL      - -        
es2020     old-require       True             SUCCESS   FAIL       
es2020     old-require       False            SUCCESS   FAIL       
es2020     dynamic-import    True             SUCCESS   SUCCESS    
es2020     dynamic-import    False            SUCCESS   SUCCESS    

package.json: "type": "module", IMPORT: p-map

MODULE     CASE              esModuleInterop  COMPILE   EXEC       
-*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*-
commonjs   default-import    True             SUCCESS   FAIL       
commonjs   default-import    False            SUCCESS   FAIL       
commonjs   namespace-import  True             SUCCESS   FAIL       
commonjs   namespace-import  False            SUCCESS   FAIL       
commonjs   import-equal      True             SUCCESS   FAIL       
commonjs   import-equal      False            SUCCESS   FAIL       
commonjs   old-require       True             SUCCESS   FAIL       
commonjs   old-require       False            SUCCESS   FAIL       
commonjs   dynamic-import    True             SUCCESS   FAIL       
commonjs   dynamic-import    False            SUCCESS   FAIL       
es2020     default-import    True             SUCCESS   SUCCESS    
es2020     default-import    False            SUCCESS   SUCCESS    
es2020     namespace-import  True             SUCCESS   SUCCESS    
es2020     namespace-import  False            SUCCESS   SUCCESS    
es2020     import-equal      True             FAIL      - -        
es2020     import-equal      False            FAIL      - -        
es2020     old-require       True             SUCCESS   FAIL       
es2020     old-require       False            SUCCESS   FAIL       
es2020     dynamic-import    True             SUCCESS   SUCCESS    
es2020     dynamic-import    False            SUCCESS   SUCCESS    


</code></pre>
