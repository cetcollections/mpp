<%@ include file="/resources/common/header.jspf"%>
<%@ include file="/resources/common/navigation.jspf"%>


<div class="container">

	<spring:url value="/person/email?pid=${pid}" var="saveEmail" />

	<form:form modelAttribute="EmailForm" method="POST" action="${saveEmail}">
		<h3>${personName} ADDRESS(es) INFO:</h1><h2 style="display:none">"${pid}"</h3>
		<f:hidden path="id" />
		<f:hidden path="person_id" />
		<table>
				<%-- <tr>
				<td>Person: </td>
				<td style="width: 200px;padding:10px">
				<f:select id="person_id" path="person_id">
						<option value="-1">Select Person</option>
						<f:options items="${PersonList}" itemValue="id" itemLabel="lastName"/>
       			</f:select>
				</td>	
			</tr> --%>
			<tr>
				<td>Email Name : </td>
				<td style="width: 200px;padding:10px">
					<f:input path="email"  />
				</td>				
			</tr>			
			<tr>
				<td>Is Primary : </td>
				<td style="padding:10px;">
					<f:checkbox path="primary" />
       			</td>		
			</tr>			
			<tr>		
					
			</tr>			
			<tr>
				<td>
					<spring:url value="/person" var="back" />
					<a type="button" class="btn btn-primary" href="${back}">Back</a>
				</td>
				<td><button type="submit" class="btn btn-success">Save</button></td>
			</tr>
		</table>
	</form:form>
 
	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>Person</th>
			<th>Email Name</th>
			<th>Is Primary</th>
			
			<th colspan="2"> Action</th>
		</tr>
		<c:forEach items="${listEmail}" var="Email">
			<tr>
				<td>${Email.id}</td>
				<td>${Email.person.getLastName()}</td>
				<td>${Email.email}</td>
				<td>${Email.primary}</td>
								
				<td>
					<spring:url value="/person/email?id=${pid}&update_id=${Email.id}" var="updateEmail" />
					<a type="button" class="btn btn-primary"
						href="${updateEmail}">Update</a>
					<spring:url value="/email/delete?id=${Email.id}" var="deleteEmail" />
					<a type="button" class="btn btn-warning"
						href="${deleteEmail}">Delete</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<%@ include file="/resources/common/footer.jspf"%>

<script>
$(document).ready(function () {
    var url = window.location;
    $('ul.nav > li').removeClass('active');
    $('ul.nav a[href="'+ url +'"]').parent().addClass('active');
    $('ul.nav a').filter(function() {
         return this.href == url;
    }).parent().addClass('active');
});
</script>