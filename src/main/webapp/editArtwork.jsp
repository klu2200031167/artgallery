<!DOCTYPE html>
<html>
<head>
    <title>Edit Artwork</title>
</head>
<body>
    <h1>Edit Artwork</h1>
    <form action="${pageContext.request.contextPath}/artworks/update" method="post">
        <input type="hidden" name="id" value="${artwork.id}">
        <input type="text" name="artName" value="${artwork.artName}" required>
        <input type="text" name="location" value="${artwork.location}" required>
        <input type="number" step="0.01" name="price" value="${artwork.price}" required>
        <input type="text" name="imgLink" value="${artwork.imgLink}">
        <button type="submit">Update</button>
    </form>
</body>
</html>
