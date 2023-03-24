<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<title>Welcome to COMP367</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		if (name == null) {
			name = "student";
		}

		Calendar now = Calendar.getInstance();
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH");
		int hour = Integer.parseInt(timeFormat.format(now.getTime()));

		String greeting;

		if (hour >= 6 && hour < 12) {
			greeting = "Good morning, " + name + ", Welcome to COMP367";
		} else if (hour >= 12 && hour < 18) {
			greeting = "Good afternoon, " + name + ", Welcome to COMP367";
		} else {
			greeting = "Good evening, " + name + ", Welcome to COMP367";
		}
	%>

	<h1><%= greeting %></h1>
</body>
</html>
