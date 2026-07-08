/* ==========================================
   PAGE LOADING
========================================== */

window.addEventListener("load",()=>{

    document.body.classList.add("loaded");

});


/* ==========================================
   PROFILE INPUTS
========================================== */

const editBtn =
document.getElementById("editProfileBtn");

const saveBtn =
document.getElementById("saveBtn");

const cancelBtn =
document.getElementById("cancelBtn");


const userName =
document.getElementById("userName");

const email =
document.getElementById("email");

const phone =
document.getElementById("phone");

const address =
document.getElementById("address");


const fields = [

userName,

email,

phone,

address

];



/* ==========================================
   STORE ORIGINAL VALUES
========================================== */

const originalValues = fields.map(field=>field.value);



/* ==========================================
   EDIT PROFILE
========================================== */

editBtn.addEventListener("click",()=>{

    fields.forEach(field=>{

        field.removeAttribute("readonly");

    });

    editBtn.style.display="none";

    saveBtn.style.display="inline-block";

    cancelBtn.style.display="inline-block";

});



/* ==========================================
   CANCEL PROFILE
========================================== */

cancelBtn.addEventListener("click",()=>{

    fields.forEach((field,index)=>{

        field.value=originalValues[index];

        field.setAttribute("readonly",true);

    });

    editBtn.style.display="inline-block";

    saveBtn.style.display="none";

    cancelBtn.style.display="none";

});



/* ==========================================
   ADDRESS EDIT
========================================== */

const addressView =
document.getElementById("addressView");

const addressEditor =
document.getElementById("addressEditor");

const editAddressBtn =
document.getElementById("editAddressBtn");

const saveAddressBtn =
document.getElementById("saveAddressBtn");

const cancelAddressBtn =
document.getElementById("cancelAddressBtn");

const newAddress =
document.getElementById("newAddress");

const addressTypeText =
document.getElementById("addressTypeText");



/* ==========================================
   SHOW ADDRESS EDITOR
========================================== */

editAddressBtn.addEventListener("click",()=>{

    addressView.style.display="none";

    addressEditor.style.display="block";

});



/* ==========================================
   SAVE ADDRESS
========================================== */

saveAddressBtn.addEventListener("click", function () {

    const selectedType =
        document.querySelector('input[name="addressType"]:checked').value;

    // Update hidden input inside the form
    document.getElementById("addressType").value = selectedType;

    // Update address textarea inside the profile form
    document.getElementById("address").value =
        document.getElementById("newAddress").value;

    // Update the text shown in the address card
    if(selectedType === "Home"){
        document.getElementById("addressTypeText").innerHTML = "&#127968; Home";
    }else if(selectedType === "Work"){
        document.getElementById("addressTypeText").innerHTML = "&#127970; Work";
    }else{
        document.getElementById("addressTypeText").innerHTML = "&#128205; Other";
    }

    document.querySelector("#addressView p").innerText =
        document.getElementById("newAddress").value;

    document.getElementById("addressEditor").style.display = "none";
    document.getElementById("addressView").style.display = "block";

    console.log("Hidden addressType = " +
        document.getElementById("addressType").value);

});


/* ==========================================
   CANCEL ADDRESS
========================================== */

cancelAddressBtn.addEventListener("click",()=>{

    newAddress.value =
    address.value;

    addressView.style.display="block";

    addressEditor.style.display="none";

});



/* ==========================================
   CARD HOVER
========================================== */

document.querySelectorAll(

".profile-card,.details-card,.address-card,.overview-item"

).forEach(card=>{

    card.addEventListener("mouseenter",()=>{

        card.style.transform="translateY(-6px)";

    });

    card.addEventListener("mouseleave",()=>{

        card.style.transform="translateY(0px)";

    });

});



/* ==========================================
   BUTTON RIPPLE
========================================== */

document.querySelectorAll("button").forEach(btn=>{

    btn.addEventListener("click",()=>{

        btn.classList.add("clicked");

        setTimeout(()=>{

            btn.classList.remove("clicked");

        },250);

    });

});