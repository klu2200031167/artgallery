<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Artworks</title>
</head>
<body>
    <h1>Your Artworks</h1>
    <a href="${pageContext.request.contextPath}/artworks/add">Add New Artwork</a>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Location</th>
                <th>Price</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="artwork" items="${artworks}">
                <tr>
                    <td>${artwork.artName}</td>
                    <td>${artwork.location}</td>
                    <td>${artwork.price}</td>
                    <td><img src="${artwork.imgLink}" alt="${artwork.artName}" width="100"></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/artworks/edit/${artwork.id}">Edit</a>
                        <a href="${pageContext.request.contextPath}/artworks/delete/${artwork.id}?artistId=${artistId}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
