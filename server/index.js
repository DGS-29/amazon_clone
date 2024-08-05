//Imports FRom packages
const express = require('express');
const mongoose = require('mongoose');
//Imports FRom other files
const authRouter = require("./routes/auth")
//import './features/auth/screens/auth_screen.dart' 

const PORT = 3000;
const app = express();
const DB ="mongodb+srv://deepakgs:deepak123@cluster0.cnoalui.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

//middleware
//Client -> middleware -> SERVER -> CLient
app.use(express.json());
app.use(authRouter);

//connections
mongoose
    .connect(DB)
    .then( () => {
    console.log("Connection Successful");    
    })
    .catch((e) => {
        console.log(e);
    });

app.listen(PORT, () => {
    console.log(`connected at port ${PORT}`); 
});