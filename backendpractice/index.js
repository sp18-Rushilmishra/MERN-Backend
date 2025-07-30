const express = require("express");
const users = require("./MOCK_DATA.json");
const app = express ();
const PORT = 8000;

//Routes

app.get('/api/users' , (req , res) =>{
    return res.json(users);
} )
a
app
.get("/api/users/:id" , (req , res) => {
    const id = Number(req.params.id);
    const user = users.find((user) => user.id === id);
    return res.json(user); 
});

app.post('/api/user' , (req,res) => {
    return res.json({status : "pending"});
});

app.patch((req,res) => {
    return res.json ({ status : "pending"});
});

app.listen(PORT ,() => console.log('server started ') )
 
 