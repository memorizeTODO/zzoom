<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation List</title>
</head>
<body>


<h2>Received Data:</h2>
<div id="dataContainer"></div>

<script>
fetch('http://localhost:80/sendData')
    .then(response => response.json())
    .then(data => {
        // 받은 데이터를 처리
        const dataContainer = document.getElementById('dataContainer');
        dataContainer.innerHTML = `
            <p>ID: ${"${data.id}"}</p>
            <p>Room Number: ${"${data.roomNumber}"}</p>
            <p>Reservation Number: ${"${data.reservationNumber}"}</p>
            <p>Purpose: ${"${data.purpose}"}</p>
            <p>Name: ${"${data.name}"}</p>
            <p>Status: ${"${data.status}"}</p>
        `;
    })
    .catch(error => {
        console.error('Error fetching data:', error);
    });
</script>

</body>
</html>