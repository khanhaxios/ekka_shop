<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Ekka - Admin Dashboard eCommerce HTML Template.">

    <title>Ekka - Admin | Hồ sơ.</title>

    <%@include file="/WEB-INF/jsp/layout/admin/assets.jsp" %>


</head>

<body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-light ec-header-light" id="body">

<!--  WRAPPER  -->
<div class="wrapper">

    <!-- LEFT MAIN SIDEBAR -->
    <%@include file="/WEB-INF/jsp/layout/admin/sidebar.jsp" %>

    <!--  PAGE WRAPPER -->
    <div class="ec-page-wrapper">

        <!-- Header -->
        <%@include file="/WEB-INF/jsp/layout/admin/navbar.jsp" %>


        <!-- CONTENT WRAPPER -->
        <div class="ec-content-wrapper">
            <div class="content">
                <div class="breadcrumb-wrapper breadcrumb-contacts">
                    <div>
                        <h1>User Profile</h1>
                        <p class="breadcrumbs"><span><a href="/ekka/admin">Trang chủ</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>Thông tin cá nhân
                        </p>
                    </div>
<%--                    <div>--%>
<%--                        <a href="user-list.html" class="btn btn-primary">Chỉnh sửa</a>--%>
<%--                    </div>--%>
                </div>
                <div class="card bg-white profile-content">
                    <div class="row">
                        <div class="col-lg-4 col-xl-3">
                            <div class="profile-content-left profile-left-spacing">
                                <div class="text-center widget-profile px-0 border-0" style="height: 250px;">
                                    <div class="card-img mx-auto rounded-circle" style="width: 100%!important;">
                                        <img id="fileImageBackGround" src="<sec:authentication
                                                            property="principal.background_profile"></sec:authentication>"
                                                                     alt="user image">
                                    </div>
                                        <img id="fileImageAvatar" style="height: 120px;width: 120px;border-radius: 50%;object-fit: cover;position: relative;top: -62px;" src="<sec:authentication
                                                            property="principal.avatar"></sec:authentication>"
                                             alt="user image">

                                    <div class="card-body" style="position: relative;top: -58px;">
                                        <p>( Admin )</p>
                                        <h4 class="py-2 text-dark showUserName"><sec:authentication
                                                property="principal.fullName"></sec:authentication></h4>
                                        <p><sec:authentication
                                                property="principal.email"></sec:authentication></p>
                                    </div>
                                </div>

                                <hr class="w-100">

                                <div class="contact-info pt-4">
                                    <h5 class="text-dark">Thông tin liên lạc</h5>
                                    <p class="text-dark font-weight-medium pt-24px mb-2">Địa chỉ Email</p>
                                    <p><sec:authentication
                                            property="principal.email"></sec:authentication></p>
                                    <p class="text-dark font-weight-medium pt-24px mb-2">Số điện thoại</p>
                                    <p class="showUserPhone"><sec:authentication
                                            property="principal.phone"></sec:authentication></p>
                                    <p class="text-dark font-weight-medium pt-24px mb-2">Địa chỉ</p>
                                    <p class="showUserAddress"><sec:authentication
                                            property="principal.address"></sec:authentication></p>
                                    <p class="text-dark font-weight-medium pt-24px mb-2"></p>
                                    <p class="social-button">
                                        <a href="#" class="mb-1 btn btn-outline btn-twitter rounded-circle">
                                            <i class="mdi mdi-twitter"></i>
                                        </a>

                                        <a href="#" class="mb-1 btn btn-outline btn-linkedin rounded-circle">
                                            <i class="mdi mdi-linkedin"></i>
                                        </a>

                                        <a href="#" class="mb-1 btn btn-outline btn-facebook rounded-circle">
                                            <i class="mdi mdi-facebook"></i>
                                        </a>

                                        <a href="#" class="mb-1 btn btn-outline btn-skype rounded-circle">
                                            <i class="mdi mdi-skype"></i>
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-8 col-xl-9">
                            <div class="profile-content-right profile-right-spacing py-5">
                                <ul class="nav nav-tabs px-3 px-xl-5 nav-style-border" id="myProfileTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="settings-tab" data-bs-toggle="tab"
                                                data-bs-target="#settings" type="button" role="tab"
                                                aria-controls="settings" aria-selected="false">Cài đặt
                                        </button>
                                    </li>
                                </ul>
                                <div class="tab-content px-3 px-xl-5" id="myTabContent">

                                    <div class="tab-pane fade show active" id="settings" role="tabpanel"
                                         aria-labelledby="settings-tab">
                                        <div class="tab-pane-content mt-5">
                                            <f:form method="post" action="/ekka/admin/update" cssClass="row g-3" modelAttribute="userDto" enctype="multipart/form-data">
                                                <div class="space-bottom-30">
                                                    <div class="ec-vendor-block-bg cover-upload">
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" onchange="readURLBackGround(this);" id="thumbUpload01" cssClass="ec-image-upload" path="fileImageBackground" placeholder="Chọn file" aria-label="Ảnh đại diện"/>
                                                                <label><img src="/user/assets/images/icons/edit.svg"
                                                                            class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img style="object-fit: cover; width: 100%;" class="image-thumb-preview ec-image-preview v-img"
                                                                         src="<sec:authentication property="principal.background_profile"></sec:authentication>" alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ec-vendor-block-detail">
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" onchange="readURL(this);" id="thumbUpload02" cssClass="ec-image-upload" path="fileImage" placeholder="Chọn file" aria-label="Ảnh đại diện"/>
                                                                <label><img src="/user/assets/images/icons/edit.svg"
                                                                            class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img id="fileImage" style="object-fit: cover;" class="image-thumb-preview ec-image-preview v-img"
                                                                         src="<sec:authentication property="principal.avatar"></sec:authentication>"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ec-vendor-upload-detail">
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">Tên người dùng (<span style="color: red;">*</span>)</label>
                                                            <f:input type="text" path="fullName" class="form-control userName"
                                                                     placeholder="Vui lòng nhập tên người dùng..." aria-label="Enter your full name"
                                                                     required="required"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">Địa chỉ Email (<span style="color: red;">*</span>)</label>
                                                            <f:input type="text" path="email" class="form-control"
                                                                     placeholder="Vui lòng nhập địa chỉ Email..." aria-label="Enter your Email"
                                                                     required="required" readonly="true"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">Số điện thoại (<span style="color: red;">*</span>)</label>
                                                            <f:input type="text" path="phone" class="form-control userPhone"
                                                                     placeholder="Vui lòng nhập số điện thoại..." maxlength="15" pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b" aria-label="Enter your phone"
                                                                     required="required"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">Địa chỉ (<span style="color: red;">*</span>)</label>
                                                            <f:input type="text" path="address" class="form-control userAddress"
                                                                     placeholder="Vui lòng nhập địa chỉ..." aria-label="Enter your address"
                                                                     required="required"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15">
                                                            <div class="d-flex justify-content-end mt-5">
                                                                <button type="submit"
                                                                        class="btn btn-primary mb-2 btn-pill">Cập nhật hồ sơ
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </f:form>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End Content -->
        </div> <!-- End Content Wrapper -->

        <!-- Footer -->
        <%@include file="/WEB-INF/jsp/layout/admin/foot.jsp" %>


    </div> <!-- End Page Wrapper -->
</div> <!-- End Wrapper -->

<%@include file="/WEB-INF/jsp/layout/admin/scripts.jsp" %>
<script>
    function readURL(input) {
        // for (let i = 0; i < input.files.length; i++) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                document.getElementById("fileImageAvatar").src = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    function readURLBackGround(input) {
        // for (let i = 0; i < input.files.length; i++) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                document.getElementById("fileImageBackGround").src = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("input.userName").keyup(function (element) {
        var el = $(this).val();
        console.log(el)
        $('h4.showUserName').text(el);
    });

    $("input.userPhone").keyup(function (element) {
        var el = $(this).val();
        console.log(el)
        $('p.showUserPhone').text(el);
    });

    $("input.userAddress").keyup(function (element) {
        var el = $(this).val();
        console.log(el)
        $('p.showUserAddress').text(el);
    });
</script>
<script>
    $(document).ready(function () {
        toastr.options = {
            'closeButton': true,
            'debug': false,
            'newestOnTop': false,
            'progressBar': false,
            'positionClass': 'toast-bottom-right',
            'preventDuplicates': false,
            'showDuration': '1000',
            'hideDuration': '1000',
            'timeOut': '5000',
            'extendedTimeOut': '1000',
            'showEasing': 'swing',
            'hideEasing': 'linear',
            'showMethod': 'fadeIn',
            'hideMethod': 'fadeOut',
        }
    });

    const success = setTimeout(Success, 1000);
    const error = setTimeout(Err, 1000);

    function Success() {
        <c:if test="${message_success != null}">
        toastr.success('${message_success}');
        </c:if>
    }

    function Err() {
        <c:if test="${message_err != null}">
        toastr.error('${message_err}');
        </c:if>
    }
</script>

</body>
</html>
