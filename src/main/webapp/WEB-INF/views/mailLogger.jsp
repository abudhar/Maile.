<%--
  Created by IntelliJ IDEA.
  User: mohammed.abudhar
  Date: 10/02/2023
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />

<div id="mailLogTable" style="padding-left: 30rem;" class="table table-bordered">
    <table id="MailLogger">
        <thead>
        <tr>
            <th>Sl No.</th>
            <th>From</th>
            <th>To</th>
            <th>Subject</th>
            <th>Content</th>
            <th>Triggered By</th>
            <th>Triggered On</th>
            <th>Status</th>
            <th style="text-align: center;">view</th>
        </tr>
        </thead>
    </table>
</div>

<script>
$(document).ready(function () {
    $('#AdminTable').DataTable();
});
</script>

</body>
</html>
