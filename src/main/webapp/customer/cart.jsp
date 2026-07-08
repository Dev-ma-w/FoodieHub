<%@ page import="java.util.*"%>
<%@ page import="com.tap.Model.CartItem"%>
<%@ page import="com.tap.Model.Restaurant"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
String appliedCoupon =
(String)session.getAttribute("coupon");
if (restaurant == null) {
    response.sendRedirect("../home");
    return;
}

// Calculate Grand Total
double grandTotal = 0;

if (cart != null) {
    for (CartItem item : cart) {
        grandTotal += item.getPrice() * item.getQuantity();
    }
}

// Charges
double deliveryFee = grandTotal >= 299 ? 0 : 40;
double gst = grandTotal * 0.05;
double platformFee = 5;

// Discount
double discount = 0;



if(appliedCoupon != null){

    switch(appliedCoupon){

        case "FOOD100":

            if(grandTotal >= 500){

                discount = 100;

            }

            break;

        case "FREEDEL":

            deliveryFee = 0;

            break;
    }

}

// Final Amount
double finalAmount =
        grandTotal
      + deliveryFee
      + platformFee
      + gst
      - discount;

// Free delivery remaining
double freeDeliveryTarget = 299;
double remaining = Math.max(0, freeDeliveryTarget - grandTotal);

// Cart Count
int cartCount = 0;

if (cart != null) {
    for (CartItem item : cart) {
        cartCount += item.getQuantity();
    }
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart &#8211; FoodieHub</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css">
</head>
<body>
	<nav class="navbar">

		<div class="logo">FoodieHub</div>

		<div class="nav-center">

			<a href="../menu?restaurantId=<%=restaurant.getRestaurantId()%>"
				class="nav-link"> &#8592; Back To Menu </a> <a href="orderHistory"
				class="nav-link"> Orders </a>

		</div>

		<div class="nav-right">

			<a href="cart.jsp" class="cart-pill"> &#128722; Cart (<%=cartCount%>)

			</a>

			<div class="profile-menu">

				<button class="profile-btn" onclick="toggleProfileMenu()">

					&#128100;

					<%=session.getAttribute("loggedUser") != null ?
                ((com.tap.Model.User)
                session.getAttribute("loggedUser"))
                .getUserName()
                : "Guest"%>

					&#9662;

				</button>

				<div id="profileDropdown" class="profile-dropdown">

					<a href="#"> My Profile </a> <a
						href="<%=request.getContextPath()%>/orderHistory"> My Orders </a>

					<a href="logout"> Logout </a>

				</div>

			</div>

		</div>

	</nav>
	<section class="restaurant-hero">

		<div class="restaurant-overlay"></div>

		<img src="<%=restaurant.getImagePath()%>" class="restaurant-bg">

		<div class="restaurant-content">

			<h1><%=restaurant.getName()%></h1>

			<div class="restaurant-meta">
				<span>&#11088; <%=restaurant.getRatings()%></span> <span>
					&#128757; <%=restaurant.getDeliveryTime()%>
				</span> <span><%=restaurant.getCuisineType()%></span>
			</div>

			<div class="offer-badge">
				<%=restaurant.getOffer()%>
			</div>

		</div>

	</section>

	<div class="cart-container">

		<!-- LEFT SIDE -->
		<div class="left-panel">

			<div class="section-heading">Your Cart</div>

			<%
			if(cart != null && !cart.isEmpty()){
				for(CartItem c : cart){
					double itemTotal = c.getPrice() * c.getQuantity();
			%>

			<div class="cart-item-card">



				<div class="item-details">
					<h3><%=c.getItemName()%></h3>
					<p>Freshly Prepared</p>
					<span class="item-price">&#8377;<%=String.format("%.2f", c.getPrice())%></span>
				</div>

				<div class="item-actions">

					<div class="qty-stepper">

						<form action="<%=request.getContextPath()%>/updateCart"
							method="post">
							<input type="hidden" name="menuId" value="<%=c.getMenuId()%>">
							<input type="hidden" name="action" value="decrease">
							<button type="submit" class="qty-btn">&#8722;</button>
						</form>

						<span class="qty-num"><%=c.getQuantity()%></span>

						<form action="<%=request.getContextPath()%>/updateCart"
							method="post">
							<input type="hidden" name="menuId" value="<%=c.getMenuId()%>">
							<input type="hidden" name="action" value="increase">
							<button type="submit" class="qty-btn">&#43;</button>
						</form>

					</div>

					<div class="subtotal">
						&#8377;<%=String.format("%.2f", itemTotal)%></div>

					<form action="<%=request.getContextPath()%>/removeItem"
						method="post">
						<input type="hidden" name="menuId" value="<%=c.getMenuId()%>">
						<button class="remove-btn" type="submit">Remove</button>
					</form>

				</div>

			</div>

			<%
				}
			}else{
			%>

			<div class="empty-cart">

				<div class="empty-icon">&#128722;</div>

				<h2>Your Cart Is Empty</h2>

				<p>Looks like you haven't added anything yet.</p>

				<a href="../home" class="browse-btn"> Browse Restaurants </a>

			</div>

			<%
			}
			%>

			<div class="add-more-card">
				<div>Want something more?</div>
				<a href="../menu?restaurantId=<%=restaurant.getRestaurantId()%>"
					class="add-more-btn"> &#43; Add More Items </a>
			</div>

			<%
String couponError = (String) session.getAttribute("couponError");

if(couponError != null){
%>

			<div class="coupon-error">

				<%=couponError%>

			</div>

			<%
session.removeAttribute("couponError");
}
%>

			<div class="coupon-suggestions">

				<div class="card-header">Available Coupons</div>

				<div class="coupon-item">
					<div>
						<strong>FOOD100</strong>
						<p>&#8377;100 OFF on orders above &#8377;500</p>
					</div>
					<form action="<%=request.getContextPath()%>/applyCoupon"
						method="post">

						<input type="hidden" name="coupon" value="FOOD100">

						<%
boolean food100Applied = "FOOD100".equals(appliedCoupon);
%>

						<button type="submit" <%=food100Applied ? "disabled" : ""%>>
							<%=food100Applied ? "Applied" : "Apply"%>
						</button>

					</form>
				</div>

				<% if(deliveryFee > 0){ %>

<div class="coupon-item">

    <div>
        <strong>FREEDEL</strong>
        <p>Free Delivery on orders below &#8377;299</p>
    </div>

    <form action="<%=request.getContextPath()%>/applyCoupon"
          method="post">

        <input type="hidden" name="coupon" value="FREEDEL">

        <%
        boolean freeDelApplied = "FREEDEL".equals(appliedCoupon);
        %>

        <button type="submit" <%=freeDelApplied ? "disabled" : ""%>>
            <%=freeDelApplied ? "Applied" : "Apply"%>
        </button>

    </form>

</div>

<% } else { %>

<div class="free-delivery-card">

    <div class="icon">🚚</div>

    <div>
        <h3>Congratulations!</h3>
        <p>
            You've unlocked
            <strong>FREE Delivery</strong>
            on this order.
        </p>
    </div>

</div>

<% } %>
				<%
if(appliedCoupon != null){
%>

				<div class="coupon-success">

					<div>

						✅ Coupon Applied : <strong><%=appliedCoupon%></strong>

					</div>

					<form action="<%=request.getContextPath()%>/removeCoupon"
						method="post">

						<button class="remove-coupon-btn" type="submit">Remove</button>

					</form>

				</div>

				<%
}
%>
			</div>
		</div>


		<!-- RIGHT SIDE -->
		<div class="right-panel">

			<% if(discount > 0){ %>
			<!-- SAVINGS CARD -->
			<div class="savings-card">
				<h3>
					You Saved &#8377;<%=String.format("%.0f", discount)%></h3>
				<p>Restaurant offers and coupons applied</p>
			</div>
			<% } %>

			<!-- BILL DETAILS -->
			<div class="bill-card">

				<div class="bill-header">Bill Details</div>

				<div class="bill-row">
					<span>Item Total</span> <span>&#8377;<%=String.format("%.2f", grandTotal)%></span>
				</div>

				<div class="bill-row">
					<span>Delivery Fee</span> <span><%=deliveryFee == 0 ? "FREE" : "&#8377;" + String.format("%.2f", deliveryFee)%></span>
				</div>

				<div class="bill-row">
					<span>Platform Fee</span> <span>&#8377;<%=String.format("%.2f", platformFee)%></span>
				</div>

				<div class="bill-row">
					<span>GST (5%)</span> <span>&#8377;<%=String.format("%.2f", gst)%></span>
				</div>

				<% if(discount > 0){ %>
				<div class="bill-row discount">
					<span>Coupon Discount</span> <span>-&#8377;<%=String.format("%.2f", discount)%></span>
				</div>
				<% } %>

				<div class="bill-divider"></div>

				<div class="bill-total">
					<span>To Pay</span> <span>&#8377;<%=String.format("%.2f", Math.max(finalAmount, 0))%></span>
				</div>


			</div>

			<!-- SECURITY -->
			<div class="security-card">
				<div>Secure Payments</div>
				<div>Live Order Tracking</div>
				<div>Fresh Food Guarantee</div>
			</div>

			<!-- CHECKOUT -->
			<% if(cart != null && !cart.isEmpty()){ %>
			<a href="checkout.jsp" class="checkout-btn">Proceed To Checkout</a>
			<% }else{ %>
			<a href="../home" class="checkout-btn"
				style="opacity: .5; pointer-events: none;">Cart Is Empty</a>
			<% } %>

		</div>

	</div>
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
        document.getElementById(
        "profileDropdown"
        );

        if(dropdown.classList.contains(
        "show")){

            dropdown.classList.remove(
            "show"
            );
        }
    }
}

</script>
</body>
</html>
