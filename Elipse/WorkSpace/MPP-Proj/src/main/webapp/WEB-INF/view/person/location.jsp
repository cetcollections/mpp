<%@ include file="/resources/common/header.jspf"%>
<%@ include file="/resources/common/navigation.jspf"%>


<div class="container">

	<spring:url value="/person/location?pid=${pid}" var="saveLocation" />

	<form:form modelAttribute="locationForm" method="POST" action="${saveLocation}">
		<h3>${personName} ADDRESS(es) INFO:</h1><h2 style="display:none">"${pid}"</h3>
		<f:hidden path="id" />
		<f:hidden path="person_id" />
		<table>
			<tr>
				<td>Address : </td>
				<td style="width: 200px;padding:10px">
					<f:input path="address"  />
				</td>
				
			</tr>
			<tr>
				<td>City : </td>
				<td style="width: 200px;padding:10px">
					<f:input path="city"  />
				</td>
			</tr>
			<tr>
				<td>State : </td>
				<td style="width: 200px;padding:10px">
					<f:input path="state" maxlength="2" /> 
       			</td>		
			</tr>
			<tr>
				<td>Zip Code : </td>
				<td style="width: 20px;padding:10px">
					<f:input path="zipcode" maxlength="2" value="" />
				</td>
			</tr>
			<tr>
				<td>Country : </td>
				<td style="width: 20px;padding:10px">
					<f:input path="country" maxlength="10" />
				</td>
			</tr>			
			<tr>
				<td>Is Primary : </td>
				<td style="padding:10px;">
					<f:checkbox path="primary" />
       			</td>		
			</tr>
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
			<th>Address</th>
			<th>City</th>
			<th>State</th>
			<th>Zip Code</th>
			<th>Country</th>
			<th>Is Primary</th>
			<th>Person</th>
			<th colspan="2"> Action</th>
		</tr>
		<c:forEach items="${listLocation}" var="location">
			<tr>
				<td>${location.id}</td>
				<td>${location.address}</td>
				<td>${location.city}</td>
				<td>${location.state}</td>
				<td>${location.zipcode}</td>
				<td>${location.country}</td>
				<td>${location.primary}</td>
				<td>${location.person.getLastName()}</td>
				
				<td>
					<spring:url value="/person/location?id=${pid}&update_id=${location.id}" var="updateLocation" />
					<a type="button" class="btn btn-primary"
						href="${updateLocation}">Update</a>
					<spring:url value="/location/delete?id=${location.id}" var="deleteLocation" />
					<a type="button" class="btn btn-warning"
						href="${deleteLocation}">Delete</a>
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
