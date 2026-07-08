<%@ page import="com.tap.Model.User"%>
<%@ page import="com.tap.Model.Restaurant"%>

<%
User user = (User)session.getAttribute("loggedUser");
Restaurant restaurant =
(Restaurant)session.getAttribute("restaurant");

Integer orderId =
(Integer)session.getAttribute("orderId");

Double orderTotal =
(Double)session.getAttribute("orderTotal");

String paymentMethod =
(String)session.getAttribute("paymentMethod");

if(user==null){
    response.sendRedirect("../login.html");
    return;
}

if(orderId==null){
    response.sendRedirect("../home");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Order Success</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/orderSuccess.css?v=1">

<link
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
rel="stylesheet">

<link
href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

</head>

<body>
<div class="confetti"></div>
 <div class="bg-icons">

<i class="fa-solid fa-pizza-slice"></i>

<i class="fa-solid fa-burger"></i>

<i class="fa-solid fa-ice-cream"></i>

<i class="fa-solid fa-mug-hot"></i>

<i class="fa-solid fa-cookie"></i>

</div>

<div class="success-card">

    <div class="success-icon">

        <i class="fa-solid fa-circle-check"></i>

    </div>

    <h1>Order Placed Successfully!</h1>

    <p>

        Thank you
        <strong><%=user.getUserName()%></strong>

    </p>

    <div class="order-details">

        <div class="row">

            <span>Order ID</span>

            <strong>#FDH<%=orderId%></strong>

        </div>

        <div class="row">

            <span>Restaurant</span>

            <strong>

            <%=restaurant!=null ?
            restaurant.getName() :
            "FoodieHub"%>

            </strong>

        </div>

        <div class="row">

            <span>Payment</span>

            <strong><%=paymentMethod%></strong>

        </div>

        <div class="row total">

            <span>Total Paid</span>

            <strong>

            &#8377;<%=String.format("%.2f",orderTotal)%>

            </strong>

        </div>

    </div>
  

    <div class="buttons">

        <a href="../home"
        class="continue">

            Continue Shopping

        </a>

        <a href="../home"
        class="home">

            Back Home

        </a>

    </div>

</div>

</body>
</html>