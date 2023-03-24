<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.TimeZone" %>
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
		now.setTimeZone(TimeZone.getTimeZone("GMT+0")); // set timezone to GMT+0
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH");
		int hour = Integer.parseInt(timeFormat.format(now.getTime()));

		String greeting;

		if (hour >= 0 && hour < 12) {
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
