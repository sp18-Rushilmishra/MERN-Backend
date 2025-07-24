const fs = require("fs");

// //synch..
//  fs.writeFileSync("./test.txt" , "hey there");
//  console.log(1)
// //async
//  fs.writeFile("./test.txt" , "heloo world async" , 
//     () =>{
//         console.log('success')
//     }

//  )
// console.log(2)
// const result = fs.readFileSync("./contacts.txt" , "utf-8");
// console.log(result);

 fs.readFile("./contacts.txt" , "utf-8" , (err , result) =>{
     if(err) {
         console.log("error" , err);
     }else{
         console.log(result);
     }
 })

//fs.appendFileSync("./test.txt" , 'hey there/n')
