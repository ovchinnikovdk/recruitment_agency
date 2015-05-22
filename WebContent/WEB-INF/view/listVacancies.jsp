<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-header">
<h1><spring:message code="label.vacancies"/></h1>
</div>
<div class="row">
<a href="addVacancy.do"><button type="button" class="btn btn-lg btn-primary"><spring:message code="label.add_vacancy"/></button></a>
<c:if test="${hasParametres}">
	<p><spring:message code="label.parametres"/>:</p>
	<table class="table">
		<c:if test="${(parametres.minSal>0 || parametres.maxSal>0) && parametres.minSal<parametres.maxSal}">
		<tr>
			<td><spring:message code="label.salary"/></td>
			<td>
				<spring:message code="label.from"/>
				${parametres.minSal}
				<spring:message code="label.to" />
				${parametres.maxSal}
			</td>
		</tr>
		</c:if>
		<tr>
			<td><spring:message code="label.langs"/>(${parametres.langs.size()}):</td>
			<td>
				<c:forEach items="${parametres.langs}" var="l">${l.langname},<br></c:forEach>
			</td>
		</tr>
		<tr>
			<td><spring:message code="label.skills"/>(${parametres.skills.size()}):</td>
			<td>
				<c:forEach items="${parametres.skills}" var="l">${l.skillname},<br></c:forEach>
			</td>
		</tr>
	</table>
</c:if>
<c:if test="${!empty vacancyList}">
<table class="table table-striped">
<thead>
<tr>
	<th><spring:message code="label.post"/></th>
	<th><spring:message code="label.company" /></th>
    <th><spring:message code="label.spec"/></th>
    <th><spring:message code="label.salary"/></th>
    <th>&nbsp;</th>
</tr>
</thead>
<c:forEach items="${vacancyList}" var="v">
    <tr>
    	<td><a href="showVacancy${v.idvacancy}.do">${v.post.postname}</a></td>
    	<td>${v.company.name}</td>
        <td>${v.spec.specname}</td> 
        <td>${v.salary} </td>
        <td>
        	<a href="deleteVacancy${v.idvacancy}.do">
        		<button type="button" class="btn btn-danger"><spring:message code="label.delete"/></button>
        	</a>
        </td>
    </tr>
</c:forEach>
</table>
</c:if>
</div>