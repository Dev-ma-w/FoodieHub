<%@ page import="com.tap.Model.User"%>

<%
User user = (User) session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("../login.html");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Profile | FoodieHub</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/profile.css">

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
=========================== -->

	<nav class="navbar">

		<a href="<%=request.getContextPath()%>/home" class="logo"> <i
			class="fa-solid fa-utensils"></i> FoodieHub

		</a>


		<div class="profile-chip">

			<i class="fa-solid fa-user"></i>

			<%=user.getUserName()%>

		</div>

	</nav>



	<!-- ===========================
PAGE TITLE
=========================== -->

	<section class="page-title">

		<h1>My Profile</h1>

		<p>Manage your personal information and addresses.</p>

	</section>



	<!-- ===========================
MAIN CONTAINER
=========================== -->

	<div class="profile-wrapper">



		<!-- ======================================
LEFT PROFILE CARD
====================================== -->

		<div class="profile-card">

			<div class="avatar">

				<i class="fa-solid fa-user"></i>

			</div>

			<h2>

				<%=user.getUserName()%>

			</h2>

			<span class="premium"> &#9733; Premium Member </span>

			<div class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>

			<button id="editProfileBtn" class="edit-btn">

				<i class="fa-solid fa-pen"></i> Edit Profile

			</button>

		</div>





		<!-- ======================================
RIGHT INFORMATION CARD
====================================== -->

		<form action="<%=request.getContextPath()%>/updateProfile"
			method="post">
<input
type="hidden"
name="addressType"
id="addressType"
value="<%=user.getAddressType()%>">
			<input type="hidden" name="userId" value="<%=user.getUserId()%>">

			<div class="details-card">

				<h2>Personal Information</h2>


				<div class="field">

					<label> Name </label> <input id="userName" name="userName"
						type="text" readonly value="<%=user.getUserName()%>">

				</div>


				<div class="field">

					<label> Email </label> <input id="email" name="email" type="email"
						readonly value="<%=user.getEmail()%>">

				</div>


				<div class="field">

					<label> Phone </label> <input id="phone" name="phone" type="text"
						readonly value="<%=user.getPhone()%>">

				</div>


				<div class="field">

					<label> Address </label>

					<textarea id="address" name="address" readonly><%=user.getAddress()%></textarea>

				</div>



				<div class="action-buttons">

					<button type="submit" id="saveBtn" class="save-btn">

						<i class="fa-solid fa-floppy-disk"></i> Save

					</button>


					<button type="button" id="cancelBtn" class="cancel-btn">

						Cancel</button>

				</div>

			</div>

		</form>

	</div>





	<!-- ======================================
ADDRESS CARD
====================================== -->

	<div class="address-card">

		<h2>

			<i class="fa-solid fa-location-dot"></i> Saved Address

		</h2>


		<div id="addressView">

			<div class="address-header">

				<span class="address-type" id="addressTypeText">

<%
String type = user.getAddressType();

if(type == null || type.equals("Home")){
%>

&#127968; Home

<%
}else if(type.equals("Work")){
%>

&#127970; Work

<%
}else{
%>

 &#128205; Other

<%
}
%>

</span>

				<button type="button" id="editAddressBtn">

					<i class="fa-solid fa-pen"></i> Edit

				</button>

			</div>


			<p>

				<%=user.getAddress()%>

			</p>

		</div>





		<!-- Hidden Address Form -->

		<div id="addressEditor" style="display: none;">

			<label> Address Type </label>

			<div class="type-buttons">

				<label> <input type="radio" name="addressType" value="Home"
					checked> &#127968; Home

				</label> <label> <input type="radio" name="addressType" value="Work">

					&#127970; Work

				</label> <label> <input type="radio" name="addressType"
					value="Other"> &#128205; Other

				</label>

			</div>


			<textarea id="newAddress">

<%=user.getAddress()%>

</textarea>


			<div class="address-actions">

				<button type="button" id="saveAddressBtn">Save Address</button>

				<button type="button" id="cancelAddressBtn">Cancel</button>

			</div>
</div>


	</div>



	<script src="<%=request.getContextPath()%>/js/profile.js"></script>

</body>

</html>