<%@ page import="java.util.List"%>
<%@ page import="com.tap.Model.menu"%>

<%
List<menu> menuList =
(List<menu>)request.getAttribute("menuList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>FoodieHub Menu</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
/* Google Font */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#111827;
    color:white;
}

/* NAVBAR */

.navbar{

    position:sticky;
    top:0;

    width:100%;

    height:80px;

    background:rgba(17,24,39,.95);

    backdrop-filter:blur(15px);

    display:flex;
    align-items:center;
    justify-content:space-between;

    padding:0 40px;

    z-index:1000;

    border-bottom:
    1px solid rgba(255,255,255,.08);
}

.logo{

    font-size:32px;
    font-weight:800;

    color:#ff6b35;
}

.back-btn{

    text-decoration:none;

    color:white;

    font-weight:500;

    transition:.3s;
}

.back-btn:hover{

    color:#ff6b35;
}

.search-container{

    flex:1;

    max-width:450px;

    margin:0 40px;
}

.search-container input{

    width:100%;

    padding:12px 20px;

    border:none;

    border-radius:30px;

    outline:none;

    font-size:15px;

    background:#1f2937;

    color:white;
}

.nav-right{

    display:flex;
    align-items:center;
    gap:20px;
}

.cart-link{

    text-decoration:none;

    color:white;

    font-weight:600;

    display:flex;
    align-items:center;
    gap:8px;
}

.cart-badge{

    background:#ff3c00;

    color:white;

    width:24px;
    height:24px;

    display:flex;
    justify-content:center;
    align-items:center;

    border-radius:50%;

    font-size:12px;
}

.profile-menu{

    position:relative;
}

.profile-btn{

    border:none;

    background:#1f2937;

    color:white;

    padding:10px 18px;

    border-radius:30px;

    cursor:pointer;
}

.dropdown-content{

    display:none;

    position:absolute;

    top:55px;

    right:0;

    min-width:220px;

    background:#1f2937;

    border-radius:15px;

    overflow:hidden;

    box-shadow:
    0 10px 25px rgba(0,0,0,.3);
}

.dropdown-content.show{

    display:block;
}

.dropdown-content a{

    display:block;

    padding:15px;

    text-decoration:none;

    color:white;
}

.dropdown-content a:hover{

    background:#ff6b35;
}
/* HERO */

.hero{
    margin-top:80px;
    height:400px;
    background:
    linear-gradient(rgba(0,0,0,.55),
    rgba(0,0,0,.55)),
    url("https://images.unsplash.com/photo-1513104890138-7c749659a591");
    background-size:cover;
    background-position:center;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
}

.hero h1{
    font-size:70px;
    font-weight:800;
}

.hero p{
    font-size:20px;
    color:#ddd;
    margin-top:10px;
}

/* SEARCH */

.search-section{
    width:90%;
    margin:auto;
    margin-top:-35px;
}

.search-box{
    background:white;
    border-radius:50px;
    padding:15px 25px;
    display:flex;
    align-items:center;
    box-shadow:0 10px 30px rgba(0,0,0,.2);
}

.search-box input{
    width:100%;
    border:none;
    outline:none;
    font-size:16px;
}

/* CATEGORY */

.categories{
    width:90%;
    margin:40px auto;
    display:flex;
    gap:15px;
    flex-wrap:wrap;
}

.category{
    background:#1f2937;
    padding:10px 20px;
    border-radius:30px;
    cursor:pointer;
    transition:.3s;
}

.category:hover{
    background:#ff6b35;
}

/* SECTION */

.container{
    width:90%;
    margin:auto;
}

.section-title{
    font-size:38px;
    margin-bottom:30px;
    font-weight:700;
}

/* GRID */

.menu-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
    gap:30px;
}

/* CARD */

.card{
    background:#1f2937;
    border-radius:25px;
    overflow:hidden;
    transition:.4s;
    position:relative;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 15px 40px rgba(255,107,53,.25);
}

.card img{
    width:100%;
    height:220px;
    object-fit:cover;
}

/* FOOD TAG */

.tag{
    position:absolute;
    top:15px;
    left:15px;
    background:#ff6b35;
    color:white;
    padding:6px 14px;
    border-radius:20px;
    font-size:13px;
    font-weight:600;
}

/* CONTENT */

.content{
    padding:20px;
}

.content h2{
    font-size:24px;
    margin-bottom:10px;
}

.desc{
    color:#bdbdbd;
    font-size:14px;
    line-height:1.6;
    min-height:60px;
}

/* PRICE */

.bottom{
    margin-top:20px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.price{
    font-size:28px;
    font-weight:700;
    color:#ff6b35;
}

/* BUTTON */

.btn{
    background:linear-gradient(45deg,#ff6b35,#ff3c00);
    border:none;
    color:white;
    padding:12px 22px;
    border-radius:12px;
    cursor:pointer;
    font-weight:600;
    transition:.3s;
}

.btn:hover{
    transform:scale(1.05);
}

/* RATING */

.rating{
    margin-top:15px;
    color:#ffd700;
    font-weight:600;
}

/* FOOTER */

.footer{
    margin-top:80px;
    text-align:center;
    padding:30px;
    background:#0b1220;
    color:#aaa;
}

/* MOBILE */

@media(max-width:768px){

.hero h1{
    font-size:42px;
}

.navbar{
    padding:0 20px;
}

.nav-links{
    display:none;
}

.section-title{
    font-size:28px;
}

}
</style>

</head>

<body>

	<!-- NAVBAR -->
<nav class="navbar">

    <div class="logo">
        FoodieHub
    </div>

    <a href="home" class="back-btn">
        &#8592; Back to Restaurants
    </a>

    <div class="search-container">

        <input
            type="text"
            id="searchInput"
            placeholder="Search Dishes...">

    </div>

    <div class="nav-right">

        <a href="customer/cart.jsp" class="cart-link">

            &#128722;

            Cart

            <span class="cart-badge">

                <%=session.getAttribute("cart") != null ?
                ((java.util.List)session.getAttribute("cart")).size()
                : 0%>

            </span>

        </a>

        <div class="profile-menu">

            <button class="profile-btn"
            onclick="toggleProfileMenu()">

                &#128100;

                <%=session.getAttribute("loggedUser") != null ?
                ((com.tap.Model.User)
                session.getAttribute("loggedUser"))
                .getUserName()
                : "Guest"%>

                &#9662;

            </button>

            <div class="dropdown-content"
            id="profileDropdown">

                <a href="profile.jsp">
                    My Profile
                </a>

                <a href="<%=request.getContextPath()%>/orderHistory">
                    My Orders
                </a>

                <a href="logout">
                    Logout
                </a>

            </div>

        </div>

    </div>

</nav>

	<!-- HERO -->

	<section class="hero">

		<h1>Delicious Menu</h1>

		<p>Freshly prepared dishes from top restaurants</p>

	</section>

	<!-- MENU -->

	<div class="container">

		<h2 class="section-title">Popular Dishes</h2>

		<div class="menu-grid">

			<%

    for(menu m : menuList) {

    %>

			<div class="card">

				<img src="<%= m.getImagePath() %>">

				<div class="content">

					<h2>
						<%= m.getItemName() %>
					</h2>

					<p class="desc">
						<%= m.getDescription() %>
					</p>

					<div class="bottom">

						<span class="price"> <%= m.getPrice() %>

						</span>
						<form action="<%=request.getContextPath()%>/addToCart"
							method="post">

							<input type="hidden" name="menuId" value="<%=m.getMenuId()%>">

							<input type="hidden" name="itemName" value="<%=m.getItemName()%>">

							<input type="hidden" name="price" value="<%=m.getPrice()%>">

							<button type="submit" class="btn">Add Cart</button>

						</form>

						</form>

					</div>

					

				</div>

			</div>

			<%

    }

    %>

		</div>

	</div>

	<!-- FOOTER -->

	<div class="footer">© 2026 FoodieHub • Crafted with ❤️</div>


<script>

function toggleProfileMenu(){

    document
    .getElementById("profileDropdown")
    .classList
    .toggle("show");
}

window.onclick = function(event){

    if(!event.target.matches('.profile-btn')){

        let dropdown =
        document.getElementById("profileDropdown");

        if(dropdown.classList.contains('show')){

            dropdown.classList.remove('show');
        }
    }
}

const searchInput =
document.getElementById("searchInput");

searchInput.addEventListener("keyup",function(){

    let value =
    this.value.toLowerCase();

    let cards =
    document.querySelectorAll(".card");

    cards.forEach(card=>{

        let itemName =
        card.querySelector("h2")
        .innerText
        .toLowerCase();

        card.style.display =
        itemName.includes(value)
        ? "block"
        : "none";
    });

});

</script>
</body>
</html>