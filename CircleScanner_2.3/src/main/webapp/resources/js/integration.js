const passengerInfoSpan = document.querySelector('.passengerInfoSpan'); 
const passportInfoSpan= document.querySelector('.passportInfoSpan'); 
const paySpan= document.querySelector('.paySpan');
 
const passengerInfo = document.querySelector('.passengerInfo');  
const passportInfo = document.querySelector('.passportInfo');  
const pay = document.querySelector('.pay');  

const passengerInfoBtn =document.querySelector('.passengerInfoBtn'); 
const passportInfoBtn=document.querySelector('.passportInfoBtn'); 

passengerInfo.style.display = "none";
passportInfo.style.display = "none";
pay.style.display = "none";
passengerInfo.style.display = "block";

passengerInfoSpan.addEventListener("click", ()=>{
    passengerInfo.style.display = "block";
    passengerInfoSpan.style.backgroundColor = "#457B9D";
    
    passportInfo.style.display = "none";
    passportInfoSpan.style.backgroundColor = "#999";
    
    pay.style.display = "none";
    paySpan.style.backgroundColor = "#999";
    
});

passportInfoSpan.addEventListener("click", ()=>{
    passengerInfo.style.display = "none";
    passengerInfoSpan.style.backgroundColor = "#999";
    
    passportInfo.style.display = "block";
    passportInfoSpan.style.backgroundColor = "#457B9D";
    
    pay.style.display = "none";
    paySpan.style.backgroundColor = "#999";
});

paySpan.addEventListener("click", ()=>{
    passengerInfo.style.display = "none";
    passengerInfoSpan.style.backgroundColor = "#999";
    
    passportInfo.style.display = "none";
    passportInfoSpan.style.backgroundColor = "#999";
    
    pay.style.display = "block";
    paySpan.style.backgroundColor = "#457B9D";
});

passengerInfoBtn.addEventListener("click", ()=>{
	passengerInfo.style.display = "none";
    passengerInfoSpan.style.backgroundColor = "#999";
    
    passportInfo.style.display = "block";
    passportInfoSpan.style.backgroundColor = "#457B9D";
    
    pay.style.display = "none";
    paySpan.style.backgroundColor = "#999";
});

passportInfoBtn.addEventListener("click", ()=>{
	passengerInfo.style.display = "none";
    passengerInfoSpan.style.backgroundColor = "#999";
    
    passportInfo.style.display = "none";
    passportInfoSpan.style.backgroundColor = "#999";
    
    pay.style.display = "block";
    paySpan.style.backgroundColor = "#457B9D";
});
