<%@ page import="java.util.*"%>
<%@ page import="com.tap.Model.Order"%>
<%@ page import="com.tap.Model.User"%>
<%@ page import="com.tap.DAOImpl.RestaurantDAOImpl"%>
<%@ page import="com.tap.Model.Restaurant"%>
<%
RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
%>


<%
User user =
(User)session.getAttribute("loggedUser");

if(user == null){

    response.sendRedirect("../login.html");
    return;
}

List<Order> orderList =
(List<Order>)request.getAttribute("orderList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Orders | FoodieHub</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/orderHistory.css">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	rel="stylesheet">

</head>

<body>

	<!-- ===========================
        NAVBAR
============================ -->

	<nav class="navbar">

		<a href="<%=request.getContextPath()%>/home" class="logo">
    <i class="fa-solid fa-chevron-right"></i>
    FoodieHub
</a>

		<div class="nav-center">

			<div class="search-box">

				<i class="fa-solid fa-magnifying-glass"></i> <input type="text"
					id="searchOrder" placeholder="Search Orders...">

			</div>

		</div>

		<div class="nav-right">

			<a href="<%=request.getContextPath()%>/home" class="home-btn">
    <i class="fa-solid fa-house"></i>
    Home
</a>

			<div class="profile">

				<i class="fa-solid fa-user"></i>
	
				<%=user.getUserName()%>

			</div>

		</div>

	</nav>


	<!-- ===========================
        HEADER
============================ -->

	<section class="history-header">

		<h1>

			<i class="fa-solid fa-clock-rotate-left"></i> My Orders

		</h1>

		<p>View all your previous food orders.</p>

	</section>


	<!-- ===========================
      MAIN CONTAINER
============================ -->

	<div class="history-container">


		<!-- LEFT SIDE -->

		<div class="left-panel">
			<%
if(orderList != null && !orderList.isEmpty()){

    for(Order order : orderList){
    
    	Restaurant res = restaurantDAO.getRestaurantById(order.getRestaurantId());
   
%>

			<div class="order-card">

				<div class="order-top">

					<div>

						<h2>

							Order #FDH<%=order.getOrderId()%>

						</h2>

						<p>

							Order Date :
							<%=order.getOrderDate()%>

						</p>

					</div>

					<div>

						<%
            String status =
            order.getStatus();

            if(status.equalsIgnoreCase("Delivered")){
            %>

						<span class="status delivered"> Delivered </span>

						<%
            }
            else if(status.equalsIgnoreCase("Pending")){
            %>

						<span class="status pending"> Preparing </span>

						<%
            }
            else{
            %>

						<span class="status cancelled"> Cancelled </span>

						<%
            }
            %>

					</div>

				</div>


				<div class="order-body">

					<div class="restaurant-icon">

						<i class="fa-solid fa-store"></i>

					</div>

					<div class="order-info">

						<h3>
    <i class="fa-solid fa-store"></i>
    <%= res != null ? res.getName() : "Restaurant Not Found" %>
</h3>

						<p>

							Payment : <strong> <%=order.getPaymentMethod()%>

							</strong>

						</p>

						<p>

							Total Amount : <strong> &#8377;<%=String.format("%.2f",
                    order.getTotalAmount())%>

							</strong>

						</p>

					</div>

				</div>


				<div class="order-footer">

					<a href="#" class="view-btn"> <i class="fa-solid fa-eye"></i>

						View Details

					</a> <a href="#" class="reorder-btn"> <i
						class="fa-solid fa-rotate-right"></i> Reorder

					</a>

				</div>

			</div>

			<%
    }

}else{
%>

			<div class="empty-orders">

				<i class="fa-solid fa-bag-shopping"></i>

				<h2>No Orders Yet</h2>

				<p>You haven't placed any orders yet.</p>

				<a href="../home" class="browse-btn"> Browse Restaurants </a>

			</div>

			<%
}
%>
		</div>
		<!-- LEFT PANEL END -->


		<!-- ===========================
            RIGHT PANEL
    ============================ -->

		<div class="right-panel">

			<%
        int totalOrders = 0;
        int pendingOrders = 0;
        int deliveredOrders = 0;
        int cancelledOrders = 0;

        double totalSpent = 0;

        if(orderList != null){

            totalOrders = orderList.size();

            for(Order order : orderList){

                totalSpent += order.getTotalAmount();

                if(order.getStatus().equalsIgnoreCase("Pending")){

                    pendingOrders++;

                }
                else if(order.getStatus().equalsIgnoreCase("Delivered")){

                    deliveredOrders++;

                }
                else{

                    cancelledOrders++;

                }

            }

        }
        %>


			<!-- SUMMARY CARD -->

			<div class="summary-card">

				<h2>Order Summary</h2>

				<div class="summary-row">

					<span> Total Orders </span> <strong> <%=totalOrders%>

					</strong>

				</div>

				<div class="summary-row">

					<span> Delivered </span> <strong> <%=deliveredOrders%>

					</strong>

				</div>

				<div class="summary-row">

					<span> Preparing </span> <strong> <%=pendingOrders%>

					</strong>

				</div>

				<div class="summary-row">

					<span> Cancelled </span> <strong> <%=cancelledOrders%>

					</strong>

				</div>

				<hr>

				<div class="summary-total">

					<span> Total Spent </span> <strong> &#8377;<%=String.format("%.2f",totalSpent)%>

					</strong>

				</div>

			</div>



			<!-- QUICK ACTIONS -->

			<div class="action-card">

				<h3>Quick Actions</h3>

				<a href="<%=request.getContextPath()%>/home" class="action-btn"> <i
					class="fa-solid fa-house"></i> Browse Restaurants

				</a> <a href="c<%=request.getContextPath()%>/cart" class="action-btn"> <i
					class="fa-solid fa-cart-shopping"></i> Go To Cart

				</a>

			</div>



			<!-- TIPS -->

			<div class="tips-card">

				<h3>FoodieHub Tips</h3>

				<ul>

					<li>Reorder your favourite meals instantly.</li>

					<li>Apply coupons while checking out.</li>

					<li>Free delivery on eligible orders.</li>

					<li>Save your favourite restaurants.</li>

				</ul>

			</div>

		</div>

	</div>

	<script src="<%=request.getContextPath()%>/js/orderHistory.js"></script>

</body>
</html>