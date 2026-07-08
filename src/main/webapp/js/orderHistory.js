/* ==========================================
            SEARCH ORDERS
========================================== */

const searchBox =
document.getElementById("searchOrder");

const orderCards =
document.querySelectorAll(".order-card");

if(searchBox){

    searchBox.addEventListener("keyup",function(){

        const value =
        this.value.toLowerCase();

        orderCards.forEach(card=>{

            const text =
            card.innerText.toLowerCase();

            if(text.includes(value)){

                card.style.display="block";

            }
            else{

                card.style.display="none";

            }

        });

    });

}


/* ==========================================
        CARD HOVER ANIMATION
========================================== */

orderCards.forEach(card=>{

    card.addEventListener("mouseenter",()=>{

        card.style.transform="translateY(-5px)";

    });

    card.addEventListener("mouseleave",()=>{

        card.style.transform="translateY(0px)";

    });

});


/* ==========================================
        REORDER BUTTON
========================================== */

const reorderBtns =
document.querySelectorAll(".reorder-btn");

reorderBtns.forEach(btn=>{

    btn.addEventListener("click",function(e){

        e.preventDefault();

        if(confirm("Reorder this food?")){

            showToast("Reorder feature coming soon.");

        }

    });

});


/* ==========================================
        VIEW DETAILS
========================================== */

const detailBtns =
document.querySelectorAll(".view-btn");

detailBtns.forEach(btn=>{

    btn.addEventListener("click",function(e){

        e.preventDefault();

        showToast("Order details page coming soon.");

    });

});


/* ==========================================
            PAGE ANIMATION
========================================== */

window.addEventListener("load",()=>{

    orderCards.forEach((card,index)=>{

        card.style.opacity="0";

        card.style.transform="translateY(25px)";

        setTimeout(()=>{

            card.style.transition=".5s";

            card.style.opacity="1";

            card.style.transform="translateY(0px)";

        },index*150);

    });

});


/* ==========================================
            TOAST
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