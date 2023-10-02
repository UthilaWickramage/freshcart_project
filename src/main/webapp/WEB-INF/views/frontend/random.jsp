<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10/2/2023
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Number Generator</title>
</head>
<body>
<input id="number"/>
<button id="button">Submit</button>


<script>
    document.getElementById("button").addEventListener('click', () => {
        let value = document.getElementById("number").value;

        let formData = new FormData();
        formData.append("value", value);
        fetch('${BASE_URL}random', {
            method: 'post',
            body: formData,
        }).then(response => response.text())
            .then(text => alert(text))


    })
</script>
</body>
</html>
