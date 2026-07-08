/* ==========================================
   PAGE LOADED
========================================== */

window.addEventListener("load", () => {

    document.body.classList.add("loaded");

    showToast("🎉 Order Placed Successfully!");

    animateTimeline();

    startConfetti();

});


/* ==========================================
   CARD FADE ANIMATION
========================================== */

const cards = document.querySelectorAll(

".card,.summary-card,.action-card,.support-card,.recommend-card"

);

const observer = new IntersectionObserver(

(entries)=>{

entries.forEach(entry=>{

if(entry.isIntersecting){

entry.target.style.opacity="1";

entry.target.style.transform="translateY(0px)";

}

});

},

{

threshold:.15

}

);

cards.forEach(card=>{

card.style.opacity="0";

card.style.transform="translateY(40px)";

card.style.transition=".6s";

observer.observe(card);

});


/* ==========================================
   DELIVERY TIMELINE
========================================== */

function animateTimeline(){

const steps=document.querySelectorAll(".timeline-item");

steps.forEach((step,index)=>{

setTimeout(()=>{

step.classList.add("active-step");

},index*500);

});

}


/* ==========================================
   BUTTON RIPPLE EFFECT
========================================== */

document.querySelectorAll(

".primary-btn,.secondary-btn"

).forEach(btn=>{

btn.addEventListener("click",function(e){

const circle=document.createElement("span");

const diameter=Math.max(

this.clientWidth,

this.clientHeight

);

circle.style.width=diameter+"px";

circle.style.height=diameter+"px";

circle.style.left=

e.offsetX-diameter/2+"px";

circle.style.top=

e.offsetY-diameter/2+"px";

circle.classList.add("ripple");

this.appendChild(circle);

setTimeout(()=>{

circle.remove();

},600);

});

});


/* ==========================================
   TOAST
========================================== */

function showToast(message){

const toast=document.createElement("div");

toast.className="toast";

toast.innerHTML=message;

document.body.appendChild(toast);

setTimeout(()=>{

toast.classList.add("show");

},100);

setTimeout(()=>{

toast.classList.remove("show");

},3000);

setTimeout(()=>{

toast.remove();

},3500);

}


/* ==========================================
   CONFETTI EFFECT
========================================== */

function startConfetti(){

for(let i=0;i<40;i++){

createConfetti();

}

}

function createConfetti(){

const confetti=document.createElement("div");

confetti.className="confetti";

confetti.style.left=Math.random()*100+"vw";

confetti.style.animationDuration=

(Math.random()*3+2)+"s";

confetti.style.background=

randomColor();

document.body.appendChild(confetti);

setTimeout(()=>{

confetti.remove();

},5000);

}

function randomColor(){

const colors=[

"#f97316",

"#22c55e",

"#3b82f6",

"#facc15",

"#ec4899"

];

return colors[

Math.floor(Math.random()*colors.length)

];

}


/* ==========================================
   SCROLL TO TOP
========================================== */

window.scrollTo({

top:0,

behavior:"smooth"

});


/* ==========================================
   RECOMMEND ITEMS
========================================== */

document.querySelectorAll(

".recommend-item"

).forEach(item=>{

item.addEventListener("mouseenter",()=>{

item.style.paddingLeft="12px";

});

item.addEventListener("mouseleave",()=>{

item.style.paddingLeft="0px";

});

});