<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>

<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from freshcart.codescandy.com/dashboard/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 03 Aug 2023 15:39:29 GMT -->
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta content="Codescandy" name="author">
  <title>FreshCart | Admin Dashboard </title>
  <!-- Favicon icon-->
  <link href="${BASE_URL}assets/libs/dropzone/dist/min/dropzone.min.css" rel="stylesheet">
  <link rel="shortcut icon" type="image/x-icon" href="${BASE_URL}assets/images/favicon/favicon.ico">


  <!-- Libs CSS -->
  <link href="${BASE_URL}assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
  <link href="${BASE_URL}assets/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
  <link href="${BASE_URL}assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">


  <!-- Theme CSS -->
  <link rel="stylesheet" href="${BASE_URL}assets/css/theme.min.css">
  <!-- Google tag (gtag.js) -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-M8S4MT3EYG"></script>
  <script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
      dataLayer.push(arguments);
    }

    gtag('js', new Date());

    gtag('config', 'G-M8S4MT3EYG');
  </script>


</head>

<body>
<!-- main -->
<div>
  <jsp:include page="../backend/header.jsp"/>

  <div class="main-wrapper">
    <!-- navbar vertical -->

    <jsp:include page="../backend/admin/include/sidebar.jsp"/>


    <layout:block name="content">

    </layout:block>


  </div>
</div>

<!-- Libs JS -->
<script src="${BASE_URL}assets/libs/jquery/dist/jquery.min.js"></script>
<script src="${BASE_URL}assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${BASE_URL}assets/libs/simplebar/dist/simplebar.min.js"></script>

<!-- Theme JS -->
<script src="${BASE_URL}assets/js/theme.min.js"></script>
<script src="${BASE_URL}assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="${BASE_URL}assets/js/vendors/chart.js"></script>
<script src="${BASE_URL}assets/libs/quill/dist/quill.min.js"></script>
<script src="${BASE_URL}assets/js/vendors/editor.js"></script>
<script src="${BASE_URL}assets/libs/dropzone/dist/min/dropzone.min.js"></script>

<layout:block name="script">

</layout:block>
</body>
</html>