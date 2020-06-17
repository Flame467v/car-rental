<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Car-Rental</title>

    <style type="text/css">
      <%@ include file="css/styles.css" %>
    </style>
  </head>
  <body>
    <div>
      <h1>Inventory Management</h1>

      <div class="header">
        <a href="${pageContext.request.contextPath}/" class="header-button">VIEW ALL</a>
        <a href="${pageContext.request.contextPath}/add" class="header-button">ADD A CAR</a>
      </div>
    </div>
    <div>
      <c:if test="${book != null}">
        <h2>Edit CAR</h2>
        <form action="update" method="post">
          <input type="hidden" name="id" value="<c:out value="${book.id}" />" />

          <label>
            NAME
            <input type="text" name="NAME" value="<c:out value="${book.title}" />" />
          </label>
          <label>
            MANUFACTURER
            <input type="text" name="MANUFACTURER" value="<c:out value="${book.author}" />" />
          </label>
          <label>
            # Available
            <select name="Amount">
              <c:forEach begin="1" end="15" varStatus="loop">
                <option value="${loop.index}"
                  <c:if test="${book.copies == loop.index}">selected</c:if>
                >
                  ${loop.index}
                </option>
              </c:forEach>
            </select>
          </label>
          <div class="form-actions">
            <input type="submit" value="SAVE" name="submit" />
            <input type="submit" value="DELETE" name="submit" />
          </div>
        </form>
      </c:if>
      <c:if test="${book == null}">
        <h2>Add Car</h2>
        <form action="insert" method="post">
          <input type="hidden" name="id" />

          <label>
            Name
            <input type="text" name="name" />
          </label>
          <label>
            Manufacturer
            <input type="text" name="manufacturer" />
          </label>
          <label>
            # Available
            <input type="text" name="available" />
          </label>
          <input type="submit" value="ADD" name="submit" />
        </form>
      </c:if>
    </div>
  </body>
</html>
