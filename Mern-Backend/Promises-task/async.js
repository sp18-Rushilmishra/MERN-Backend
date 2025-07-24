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