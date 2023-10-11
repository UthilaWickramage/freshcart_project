<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="Codescandy" name="author">
    <title>${App.getString("app_name")} | Auth</title>
    <!-- Favicon icon-->
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
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-M8S4MT3EYG');
    </script>

</head>

<body>

<layout:block name="content">

</layout:block>

<jsp:include page="../frontend/include/footer.jsp"/>

<!-- Footer -->
<!-- footer -->

<!-- Javascript-->
<script src="${BASE_URL}assets/js/fetchScript.js"></script>
<!-- Libs JS -->
<script src="${BASE_URL}assets/libs/jquery/dist/jquery.min.js"></script>
<script src="${BASE_URL}assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${BASE_URL}assets/libs/simplebar/dist/simplebar.min.js"></script>

<!-- Theme JS -->
<script src="${BASE_URL}assets/js/theme.min.js"></script>
<script src="${BASE_URL}assets/js/vendors/password.js"></script>

<script>
    window.addEventListener('load', function () {
        navigator
            .serviceWorker
            .register('/request-interceptor.js')
            .then(function (registration) {
                console.log('Service worker registered with scope: ', registration.scope);
            }, function (err) {
                console.log('ServiceWorker registration failed: ', err);
            });
    });
</script>

<layout:block name="script">

</layout:block>
</body>
</html>