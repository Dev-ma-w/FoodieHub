/* ==========================================
   PROFILE DROPDOWN
========================================== */

const profileBtn =
document.querySelector(".profile-btn");

const profileDropdown =
document.querySelector(".profile-dropdown");

if(profileBtn && profileDropdown){

    profileBtn.addEventListener("click",function(e){

        e.stopPropagation();

        profileDropdown.classList.toggle("show");

    });

    document.addEventListener("click",function(e){

        if(!profileDropdown.contains(e.target) &&
           !profileBtn.contains(e.target)){

            profileDropdown.classList.remove("show");

        }

    });

}



/* ==========================================
   PAYMENT CARD SELECTION
========================================== */

const paymentCards =
document.querySelectorAll(".payment-card");

paymentCards.forEach(card=>{

    card.addEventListener("click",function(){

        paymentCards.forEach(c=>{

            c.classList.remove("selected");

        });

        this.classList.add("selected");

    });

});



/* ==========================================
   DELIVERY INSTRUCTION
========================================== */

const instructionLabels =
document.querySelectorAll(
".instruction-options label"
);

instructionLabels.forEach(label=>{

    label.addEventListener("click",function(){

        instructionLabels.forEach(l=>{

            l.classList.remove("selected");

        });

        this.classList.add("selected");

    });

});



/* ==========================================
   CONTACTLESS SWITCH
========================================== */

const contactlessSwitch =
document.querySelector(
'input[name="contactless"]'
);

if(contactlessSwitch){

    contactlessSwitch.addEventListener(
    "change",

    function(){

        if(this.checked){

            showToast(

                "Contactless Delivery Enabled"

            );

        }

        else{

            showToast(

                "Contactless Delivery Disabled"

            );

        }

    });

}



/* ==========================================
   CARD HOVER EFFECT
========================================== */

const cards =
document.querySelectorAll(

".card,.summary-card,.bill-card"

);

cards.forEach(card=>{

    card.addEventListener("mouseenter",()=>{

        card.style.transform="translateY(-4px)";

    });

    card.addEventListener("mouseleave",()=>{

        card.style.transform="translateY(0px)";

    });

});



/* ==========================================
   SIMPLE TOAST
========================================== */

function showToast(message){

    const toast =
    document.createElement("div");

    toast.className="toast";

    toast.innerHTML=message;

    document.body.appendChild(toast);

    setTimeout(()=>{

        toast.classList.add("show");

    },100);

    setTimeout(()=>{

        toast.classList.remove("show");

    },2500);

    setTimeout(()=>{

        toast.remove();

    },3000);

}
/* ==========================================
   FORM VALIDATION
========================================== */

const checkoutForm =
document.querySelector("form");

if(checkoutForm){

checkoutForm.addEventListener(

"submit",

function(e){

const phone =
document.querySelector(
'input[name="phone"]'
);

const address =
document.querySelector(
'textarea[name="address"]'
);

if(phone.value.trim()===""){

e.preventDefault();

showToast("Enter phone number.");

phone.focus();

return;

}

if(address.value.trim()===""){

e.preventDefault();

showToast("Enter delivery address.");

address.focus();

return;

}

showLoading();

});

}



/* ==========================================
   LOADING SCREEN
========================================== */

function showLoading(){

const loading =
document.createElement("div");

loading.className="loading-screen";

loading.innerHTML=

`
<div class="loader"></div>

<h2>

Placing Your Order...

</h2>

`;

document.body.appendChild(loading);

}



/* ==========================================
   BUTTON RIPPLE
========================================== */

const placeButton =
document.querySelector(".place-order-btn");

if(placeButton){

placeButton.addEventListener(

"click",

function(){

this.classList.add("clicked");

});

}



/* ==========================================
   PAGE SCROLL ANIMATION
========================================== */

const animatedCards =
document.querySelectorAll(

".card,.summary-card,.bill-card,.delivery-card"

);

const observer =
new IntersectionObserver(

(entries)=>{

entries.forEach(entry=>{

if(entry.isIntersecting){

entry.target.classList.add("visible");

}

});

},

{

threshold:0.15

}

);

animatedCards.forEach(card=>{

observer.observe(card);

});



/* ==========================================
   PAYMENT SUCCESS ANIMATION
========================================== */

paymentCards.forEach(card=>{

card.addEventListener("click",()=>{

card.animate(

[

{

transform:"scale(.95)"

},

{

transform:"scale(1.05)"

},

{

transform:"scale(1)"

}

],

{

duration:300

}

);

});

});



/* ==========================================
   BUTTON HOVER
========================================== */

document.querySelectorAll(

"button"

).forEach(btn=>{

btn.addEventListener(

"mouseenter",

()=>{

btn.style.transition=".25s";

});

});



/* ==========================================
   AUTO CLOSE DROPDOWN
========================================== */

window.addEventListener(

"scroll",

()=>{

if(profileDropdown){

profileDropdown.classList.remove(

"show"

);

}

});



/* ==========================================
   PAGE LOADED
========================================== */

window.addEventListener(

"load",

()=>{

document.body.classList.add(

"loaded"

);

});