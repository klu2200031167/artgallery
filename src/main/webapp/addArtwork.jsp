<!DOCTYPE html>
<html>
<head>
    <title>Add Artwork</title>
</head>
<body>
    <h1>Add Artwork</h1>
    <form action="${pageContext.request.contextPath}/artworks/add" method="post">
        <input type="text" name="artName" placeholder="Art Name" required>
        <input type="text" name="location" placeholder="Location" required>
        <input type="number" step="0.01" name="price" placeholder="Price" required>
        <input type="text" name="imgLink" placeholder="Image Link">
        <button type="submit">Add</button>
    </form>
</body>
</html>
