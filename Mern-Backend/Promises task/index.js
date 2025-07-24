
// // This is the basic promise exapmle i have given

// const taskPromise = new Promise((isSuccess , isFailure) => {
//     const isDone = true;
//     if(isDone){
//         isSuccess("task is completed");
//     }else{
//         isFailure("task is failed");
//     }
// });

// taskPromise.then(result => console.log(result));
// taskPromise.catch(error => console.error(error));

// //This is the example for resolve and reject

// const Success = Promise.resolve("data is loaded");
// const failure = Promise.reject("data is not found");

// Success.then(data => console.log(data));
// failure.catch(err => console.error(err));

// // This is the example promise all 

// const A = Promise.resolve("file A");
// const B = Promise.resolve("file B");
// const C = Promise.resolve("file C");

// Promise.all([A , B , C])
// .then(files => {
//     console.log(files);
// })
// .catch(err => {
//     console.error("one download failed:" , err);
// });

// // This is for promise all settled()

// const user = Promise.resolve("user data");
// const posts = Promise.reject("posts is missing");

// Promise.allSettled([user, posts])
//   .then(results => {
//     results.forEach(result => {
//       if (result.status === "fulfilled") {
//         console.log("Success:", result.value);
//       } else {
//         console.warn("Failed:", result.reason);
//       }
//     });
//   });

// // This code is for promise.race 

// const no1 = new Promise(resolve => setTimeout(() => resolve("work is done")
// ,150));

// const no2 = new Promise(resolve => setTimeout(() => resolve("work is not done")
// ,300));

// Promise.race([no1 , no2]).then(fastest => {
//     console.log("the first finished the task" , fastest);
// });

// //This code is for promise.any

// const option1 = Promise.reject("Option 1 has failed");
// const option2 = Promise.resolve("Option 2 is working");
// const option3 = Promise.resolve("Option 3 is also working");

// Promise.any([option1, option2, option3])
//   .then(result => {
//     console.log("First success:", result);  // Output: Option 2 worked!
//   })
//   .catch(allFailed => {
//     console.error("No successful promises");
//   });

  //This example is for asynch using promise


// this is fetching user from data asynchronously
  function Userdata() {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve("Data is received !")
      }, 1000);
    })
  }

//then this code is waiting to fetch the data and await is used until promise is resolved or rejected 

  async function getuser() {
    console.log("fetch the user ");
    const result = await Userdata();
    console.log(result);
  }
  
  getuser();