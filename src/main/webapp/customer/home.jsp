
<%@ page import="java.util.*"%>
<%@ page import="com.tap.Model.Restaurant"%>
<%@ page import="com.tap.Model.User"%>
<%@ page import="com.tap.Model.CartItem"%>

<%
User user = (User) session.getAttribute("loggedUser");
List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("restaurantList");
%>
<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

int cartCount = 0;

if (cart != null) {

	cartCount = cart.size();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub - Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/home.css">
</head>
<body>
	<%
	System.out.println("Session User = " + session.getAttribute("loggedUser"));
	%>
	<div class="navbar">

    <div class="logo">
        FoodieHub
    </div>

    <div class="nav-links">

        <a href="home">
            Home
        </a>

        <a href="#restaurants">
            Restaurants
        </a>

        <a href="#offers">
            Offers
        </a>

        <a href="<%=request.getContextPath()%>/orderHistory">
    Orders
</a>

        <a href="customer/cart.jsp">

            Cart

            <span class="cart-badge">
                <%=cartCount%>
            </span>

        </a>

    </div>

   

<div class="profile-menu">
 

    <button class="profile-btn" id="profileBtn">
        <i class="fa-solid fa-user"></i>
        &#128100;
        <%=user.getUserName()%>
            &#9662;
        <i class="fa-solid fa-angle-down"></i>
    </button>

    <div class="dropdown-content" id="dropdown">

        <a href="<%=request.getContextPath()%>/customer/profile.jsp">
            <i class="fa-solid fa-user"></i>
            My Profile
        </a>

        <a href="<%=request.getContextPath()%>/orders">
            <i class="fa-solid fa-box"></i>
            My Orders
        </a>

        <hr>

        <a href="<%=request.getContextPath()%>/logout"
   onclick="return confirm('Are you sure you want to logout?');">
    <i class="fa-solid fa-right-from-bracket"></i>
    Logout
</a>

    </div>

</div>
</div>
	<section class="hero">

		<h1>
			Discover <span>Delicious Food</span>
		</h1>

		<p>Order from your favorite restaurants.</p>
		<form action="searchRestaurant" method="get" class="search-box">

			<input type="text" name="keyword"
				value="<%=request.getAttribute("keyword") != null ? request.getAttribute("keyword") : ""%>"
				placeholder="Search restaurants or cuisines">

			<button type="submit">Search</button>

		</form>

	</section>
	<section class="section">

		<h2 class="section-title">Popular Categories</h2>

		<div class="categories">

			<a href="home" class="cat">All</a> <a href="category?type=Pizza"
				class="cat">Pizza</a> <a href="category?type=Burger" class="cat">Burgers</a>

			<a href="category?type=Biryani" class="cat">Biryani</a> <a
				href="category?type=Chinese" class="cat">Chinese</a> <a
				href="category?type=Healthy" class="cat">Healthy</a> <a
				href="category?type=Dessert" class="cat">Desserts</a>

		</div>

	</section>

	<div class="offer-slider" id = "offers">

		<div class="offer-track">

			<div class="offer-slide">
				<h2>50% OFF First Order</h2>
				<p>Exclusive for new customers</p>
				<button class="offer-btn">Order Now</button>
			</div>

			<div class="offer-slide">
				<h2>Free Delivery</h2>
				<p>On orders above &#8377;199</p>
				<button class="offer-btn">Explore</button>
			</div>

			<div class="offer-slide">
				<h2>FOOD100</h2>
				<p>Save &#8377;100 instantly</p>
				<button class="offer-btn">Use Coupon</button>
			</div>

		</div>

	</div>

	<section class="section" id="restaurants">
		<%
		String keyword = (String) request.getAttribute("keyword");

		if (keyword != null && !keyword.trim().isEmpty()) {
		%>

		<h2 class="section-title">

			Search Results for "<%=keyword%>"

		</h2>

		<a href="home">

			<button class="btn" style="width: 220px; margin-bottom: 20px;">

				Show All Restaurants</button>

		</a>

		<%
		} else {
		%>

		<%
		String selectedCategory = (String) request.getAttribute("selectedCategory");
		%>

		<%
		if (selectedCategory != null) {
		%>

		<h2 class="section-title">
			<%=selectedCategory%>
			Restaurants
		</h2>

		<%
		} else {
		%>

		<h2 class="section-title">Trending Restaurants</h2>

		<%
		}
		%>

		<%
		}
		%>
		<p style="margin-bottom: 20px; color: #aaa;">

			Found <b> <%=restaurantList != null ? restaurantList.size() : 0%>

			</b> restaurant(s)

		</p>
		<div class="restaurant-grid">

			<%
			if (restaurantList == null || restaurantList.isEmpty()) {
			%>

			<div style="text-align: center; padding: 80px;">

				<h1>😔 No Restaurants Found</h1>

				<p>Try searching another restaurant.</p>

				<br> <a href="home">

					<button class="btn" style="width: 250px;">Browse
						Restaurants</button>

				</a>

			</div>

			<%
			}
			%>
			<%
			if (restaurantList != null) {
				for (Restaurant r : restaurantList) {
			%>

			<div class="card">
				<img src="<%=r.getImagePath()%>">
				<div class="content">
					<h3><%=r.getName()%></h3>
					<p><%=r.getCuisineType()%></p>
					<p>
						<%=r.getRatings()%></p>
					<p>
						<%=r.getDeliveryTime()%></p>

					<form action="menu" method="get">
						<input type="hidden" name="restaurantId"
							value="<%=r.getRestaurantId()%>">
						<button class="btn">View Menu</button>
					</form>

				</div>
			</div>

			<%
			}
			}
			%>

		</div>
	</section>

	<footer class="footer">

		<h1>FoodieHub</h1>

		<p>Order Food Anytime Anywhere</p>

		<div class="footer-links">

			<a href="#">About</a> <a href="#">Contact</a> <a href="#">Privacy</a>
			<a href="#">Support</a>

		</div>

		<p>© 2026 FoodieHub</p>

	</footer>
	<script>

const track = document.querySelector(".offer-track");
const slides = document.querySelectorAll(".offer-slide");

console.log("Track:", track);
console.log("Slides:", slides.length);

let index = 0;

setInterval(() => {

    index++;

    if(index >= slides.length){
        index = 0;
    }

    console.log("Current Slide:", index);

    track.style.transform =
        "translateX(-" + (index * 100) + "%)";

},3000);

function toggleProfileMenu(){

    document
    .getElementById("profileDropdown")
    .classList
    .toggle("show");
}

window.addEventListener("click",function(e){

    const btn =
    document.querySelector(".profile-btn");

    const dropdown =
    document.getElementById("profileDropdown");

    if(
        !btn.contains(e.target) &&
        !dropdown.contains(e.target)
    ){
        dropdown.classList.remove("show");
    }
});
const profileBtn = document.getElementById("profileBtn");
const dropdown = document.getElementById("dropdown");

profileBtn.addEventListener("click", function (e) {
    e.stopPropagation();
    dropdown.classList.toggle("show");
});

document.addEventListener("click", function () {
    dropdown.classList.remove("show");
});

</script>
</body>

</html>