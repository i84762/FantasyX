 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <script type="text/javascript">	
 showOnSign('.signin');
</script>
<sec:authorize access="isAuthenticated()">
<sec:authentication var="currentUser" property="principal.name" />
<sec:authentication var="userEmail" property="principal.username" />
<script type="text/javascript">	
				if(null != "${currentUser}" && "" != "${currentUser}")
				{
					setCurrentUser("${currentUser}");
					USER_EMAIL = "${userEmail}";	
				}
</script>
</sec:authorize>