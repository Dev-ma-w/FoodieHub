<%@ page import="java.util.*"%><%@ page import="com.tap.Model.CartItem"%>
<%@ page import="com.tap.Model.Restaurant"%>
<%@ page import="com.tap.Model.User"%>

<%
User user = (User)session.getAttribute("loggedUser");
Restaurant restaurant = (Restaurant)session.getAttribute("restaurant");
List<CartItem> cart =
(List<CartItem>)session.getAttribute("cart");
String appliedCoupon =
(String)session.getAttribute("coupon");

if(user == null){
    response.sendRedirect("../login.html");
    return;
}

if(restaurant == null){
    response.sendRedirect("../home");
    return;
}

double grandTotal = 0;

if(cart != null){
    for(CartItem c : cart){
        grandTotal += c.getPrice()*c.getQuantity();
    }
}

double deliveryFee = grandTotal >= 299 ? 0 : 40;
double platformFee = 5;
double gst = grandTotal * 0.05;

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

double finalAmount =
        grandTotal
      + deliveryFee
      + platformFee
      + gst
      - discount;
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Checkout | FoodieHub</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/checkout.css">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	rel="stylesheet">

</head>

<body>

	<!-- =========================
     NAVBAR
========================= -->

	<nav class="navbar">

		<div class="logo">FoodieHub</div>

		<div class="nav-center">

			<a href="cart.jsp"> <i class="fa-solid fa-arrow-left"></i> Back
				To Cart

			</a>

		</div>

		<div class="nav-right">

			<div class="secure-checkout">

				<i class="fa-solid fa-shield-halved"></i> Secure Checkout

			</div>

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

	<!-- =========================
     CHECKOUT STEPPER
========================= -->

	<section class="checkout-progress">

		<div class="step completed">

			<div class="circle">1</div>

			<p>Cart</p>

		</div>

		<div class="line active"></div>

		<div class="step active">

			<div class="circle">2</div>

			<p>Checkout</p>

		</div>

		<div class="line"></div>

		<div class="step">

			<div class="circle">3</div>

			<p>Payment</p>

		</div>

		<div class="line"></div>

		<div class="step">

			<div class="circle">4</div>

			<p>Success</p>

		</div>

	</section>

	<!-- =========================
     MAIN LAYOUT
========================= -->

	<form action="../placeOrder" method="post">

		<div class="checkout-container">

			<!-- =========================
     LEFT PANEL
========================= -->

			<div class="left-panel">

				<!-- Restaurant -->

				<div class="card">

					<div class="card-title">Restaurant</div>

					<div class="restaurant-card">

						<img src="<%=restaurant.getImagePath()%>">

						<div>

							<h2>

								<%=restaurant.getName()%>

							</h2>

							<p>

								<i class="fa-solid fa-star"></i>

								<%=restaurant.getRatings()%>

								&nbsp;&nbsp; <i class="fa-solid fa-motorcycle"></i>

								<%=restaurant.getDeliveryTime()%>
								mins

							</p>

							<p>

								<%=restaurant.getCuisineType()%>

							</p>

							<span class="offer"> <%=restaurant.getOffer()%>

							</span>

						</div>

					</div>

				</div>

				<!-- Address -->

				<div class="card">

					<div class="card-title">Delivery Address</div>

					<input type="text" name="customerName"
						value="<%=user.getUserName()%>" readonly> <input
						type="text" name="phone" value="<%=user.getPhone()%>" required>

					<textarea name="address" required><%=user.getAddress()%></textarea>

				</div>

				<!-- Contact -->
				<!-- Contact -->

				<div class="card">

					<div class="card-title">Contact Information</div>

					<input type="email" value="<%=user.getEmail()%>" readonly>

					<input type="text" name="phone" value="<%=user.getPhone()%>"
						required>

				</div>

				==================== DELIVERY INSTRUCTIONS =========================
				-->

				<div class="card">

					<div class="card-title">Delivery Instructions</div>

					<textarea name="instructions" rows="4"
						placeholder="Example: Ring the bell once, leave at the door, don't call..."></textarea>

					<div class="instruction-options">

						<label> <input type="radio" name="deliveryInstruction"
							value="Ring Bell" checked> Ring Bell

						</label> <label> <input type="radio" name="deliveryInstruction"
							value="Call On Arrival"> Call On Arrival

						</label> <label> <input type="radio" name="deliveryInstruction"
							value="Leave At Door"> Leave At Door

						</label>

					</div>

				</div>



				<!-- =========================
     CONTACTLESS DELIVERY
========================= -->

				<div class="card">

					<div class="card-title">Contactless Delivery</div>

					<div class="contactless-box">

						<div>

							<h4>Leave order at my doorstep</h4>

							<p>Our delivery partner will leave the food safely at your
								door.</p>

						</div>

						<label class="switch"> <input type="checkbox"
							name="contactless"> <span class="slider"></span>

						</label>

					</div>

				</div>



				<!-- =========================
     PAYMENT METHODS
========================= -->

				<div class="card">

					<div class="card-title">Select Payment Method</div>

					<div class="payment-grid">

						<!-- Cash On Delivery -->
						<label class="payment-card"> <input type="radio"
							name="paymentMethod" value="cash" checked> <i
							class="fa-solid fa-money-bill-wave"></i> <span>Cash On
								Delivery</span>
						</label>

						<!-- UPI -->
						<label class="payment-card"> <input type="radio"
							name="paymentMethod" value="upi"> <i
							class="fa-solid fa-mobile-screen-button"></i> <span>UPI</span>
						</label>

						<!-- Card -->
						<label class="payment-card"> <input type="radio"
							name="paymentMethod" value="card"> <i
							class="fa-regular fa-credit-card"></i> <span>Debit /
								Credit Card</span>
						</label>

						<!-- Net Banking -->
						<label class="payment-card"> <input type="radio"
							name="paymentMethod" value="netbanking"> <i
							class="fa-solid fa-building-columns"></i> <span>Net
								Banking</span>
						</label>

					</div>

				</div>



				<!-- =========================
     AVAILABLE COUPONS
========================= -->

				<div class="card">

					<div class="card-title">Applied Coupon</div>

					<% if(appliedCoupon != null){ %>

					<div class="coupon-success">

						<h4>
							
							<%=appliedCoupon%>
						</h4>

						<p>Coupon already applied in Cart.</p>

					</div>

					<% } else { %>

					<p>No coupon applied.</p>

					<% } %>

				</div>
				</div>

				<!-- LEFT PANEL ENDS -->


				<!-- =========================
     RIGHT PANEL STARTS
========================= -->

<div class="right-panel">

    <% if(discount > 0){ %>

    <!-- Savings Card -->
    <div class="savings-card">

        <div class="save-icon">
            <i class="fa-solid fa-tags"></i>
        </div>

        <div>
            <h3>You Saved &#8377;<%=String.format("%.2f",discount)%></h3>
            <p>Discounts and restaurant offers applied.</p>
        </div>

    </div>

    <% } %>

    <!-- Order Summary -->
    <div class="summary-card">

        <div class="card-title">Order Summary</div>

        <%
        if(cart != null){
            for(CartItem item : cart){

                double subtotal =
                item.getPrice() *
                item.getQuantity();
        %>

        <div class="summary-item">

            <div class="summary-left">

                <div class="food-icon">
                    <i class="fa-solid fa-bowl-food"></i>
                </div>

                <div>

                    <h4><%=item.getItemName()%></h4>

                    <p>Qty : <%=item.getQuantity()%></p>

                </div>

            </div>

            <strong>
                &#8377;<%=String.format("%.2f",subtotal)%>
            </strong>

        </div>

        <%
            }
        }
        %>

    </div>

    <!-- =========================
         BILL DETAILS
    ========================= -->

    <div class="bill-card">

        <div class="card-title">Bill Details</div>

        <div class="bill-row">
            <span>Item Total</span>
            <span>&#8377;<%=String.format("%.2f",grandTotal)%></span>
        </div>

        <div class="bill-row">
            <span>Delivery Fee</span>
            <span><%=deliveryFee==0?"FREE":"&#8377;"+String.format("%.2f",deliveryFee)%></span>
        </div>

        <div class="bill-row">
            <span>Platform Fee</span>
            <span>&#8377;<%=String.format("%.2f",platformFee)%></span>
        </div>

        <div class="bill-row">
            <span>GST (5%)</span>
            <span>&#8377;<%=String.format("%.2f",gst)%></span>
        </div>

        <% if(discount>0){ %>

        <div class="bill-row discount">
            <span>Coupon Discount</span>
            <span>-&#8377;<%=String.format("%.2f",discount)%></span>
        </div>

        <% } %>

        <hr>

        <div class="bill-total">
            <strong>Total</strong>
            <strong>&#8377;<%=String.format("%.2f",finalAmount)%></strong>
        </div>

    </div>

    <!-- =========================
         ESTIMATED DELIVERY
    ========================= -->

    <div class="delivery-card">

        <div class="card-title">

            Estimated Delivery

        </div>

        <h2>

            <i class="fa-solid fa-motorcycle"></i>

            <%=restaurant.getDeliveryTime()%> 

        </h2>

        <p>

            Your order will be freshly prepared and delivered safely.

        </p>

    </div>

    <!-- PLACE ORDER -->

    <button type="submit" class="place-order-btn">

        <i class="fa-solid fa-bag-shopping"></i>

        Place Order |
        &#8377;<%=String.format("%.2f",finalAmount)%>

    </button>

</div>
				<!-- right-panel -->

			</div>
			<!-- checkout-container -->
	</form>

	<script src="<%=request.getContextPath()%>/js/checkout.js"></script>

</body>

</html>