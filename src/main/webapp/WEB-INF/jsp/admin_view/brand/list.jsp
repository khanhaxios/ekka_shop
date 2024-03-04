<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Ekka - Admin Dashboard eCommerce HTML Template.">

    <title>Ekka - Admin | Nhãn hiệu.</title>

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
                <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                    <div>
                        <h1>Nhãn hiệu</h1>
                        <p class="breadcrumbs"><span><a href="/ekka/admin">Trang chủ</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span> Nhãn hiệu</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-4 col-lg-12">
                        <div class="ec-cat-list card card-default mb-24px">
                            <div class="card-body">
                                <div class="ec-cat-form">
                                    <h4>Thêm nhãn hiệu</h4>
                                    <span style="color: red">${message}</span>

                                    <f:form method="post" action="/ekka/admin/brand/save" modelAttribute="brandDto"
                                            enctype="multipart/form-data">
                                        <div class="ec-vendor-block-detail" style="margin-top: 75px;">
                                            <div class="thumb-upload">
                                                <div class="thumb-edit">
                                                    <f:input type="file" accept="image/*" id="thumbUpload02"
                                                             cssClass="ec-image-upload" path="fileLogo"
                                                             placeholder="Chọn file"
                                                             aria-label="Ảnh đại diện" required="required"/>
                                                    <label><img src="/user/assets/images/icons/edit.svg"
                                                                class="svg_img header_svg"
                                                                alt="edit"/></label>
                                                </div>
                                                <div class="thumb-preview ec-preview">
                                                    <div class="image-thumb-preview">
                                                        <img id="fileLogo"
                                                             style="object-fit: cover; border-radius: 35%!important;"
                                                             class="image-thumb-preview ec-image-preview v-img"
                                                             src="/admin/assets/img/brand/1.jpg"
                                                             alt="edit"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Tên nhãn hiệu (<span style="color: red;">*</span>)</label>
                                                <f:input type="text" path="nameBrand" class="form-control"
                                                         placeholder="Vui lòng nhập tên nhãn hiệu..."
                                                         aria-label="Enter your user name"
                                                         required="required"/>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-pill">Thêm nhãn hiệu</button>

                                    </f:form>


                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-12">
                        <div class="ec-cat-list card card-default">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="responsive-data-table" class="table">
                                        <thead>
                                        <tr>
                                            <th>Logo</th>
                                            <th>Tên</th>
                                            <th>Tình trạng</th>
                                            <th>Cập nhập</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${list}" var="brand">
                                            <tr>
                                                <td><img style="object-fit: cover;" class="cat-thumb"
                                                         src="${brand.logo}"
                                                         alt="brand logo"/></td>
                                                <td>${brand.nameBrand}</td>
                                                <c:if test="${brand.state == 1}">
                                                    <td style="color: #34c997!important;">
                                                        Đang hoạt động
                                                    </td>
                                                </c:if>
                                                <c:if test="${brand.state == 0}">
                                                    <td style="color: #ec4a58!important;">
                                                        Đã khóa
                                                    </td>
                                                </c:if>

                                                <td><fmt:formatDate pattern = "dd/MM/yyyy kk:mm:ss"
                                                                                       value = "${brand.updated_at}"/></td>
                                                <td>
                                                    <div class="btn-group mb-1">
                                                        <button type="button"
                                                                class="btn btn-outline-success"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#infoUser-${brand.id}">Xem
                                                        </button>
                                                        <button type="button"
                                                                class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                                                                data-bs-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false" data-display="static">
                                                            <span class="sr-only">Xem</span>
                                                        </button>

                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item"
                                                               href="/ekka/admin/brand/edit/${brand.id}">Sửa</a>
                                                            <c:if test="${brand.state == 1}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/brand/delete/${brand.id}"
                                                                        modelAttribute="brandDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            type="submit">Khóa
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${brand.state == 0}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/brand/restore/${brand.id}"
                                                                        modelAttribute="brandDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            type="submit">Khôi phục
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <!-- Info User Modal -->
                                            <div class="modal fade modal-add-contact" id="infoUser-${brand.id}"
                                                 tabindex="-1"
                                                 role="dialog"
                                                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-lg"
                                                     role="document" style="width: fit-content; margin: auto;">
                                                    <div class="modal-content">
                                                        <div class="card bg-white profile-content">
                                                            <div class="row">
                                                                <div class="col-md-12 col-lg-12">
                                                                    <div class="card card-default">
                                                                        <div class="card-body text-center p-24px">
                                                                            <div class="image mb-3">
                                                                                <img src="${brand.logo}"
                                                                                     class="img-fluid rounded-circle"
                                                                                     alt="Avatar Image"
                                                                                     style="width: 200px; height: 200px; object-fit: cover;">
                                                                            </div>

                                                                            <h5 class="card-title text-dark">${brand.nameBrand}</h5>
                                                                            <p class="item-count">${brand.item == null ? 0 : brand.item}<span> sản phẩm</span>
                                                                            </p>
                                                                                <div class="d-flex justify-content-center align-items-center">
                                                                                        ${brand.state == 1 ? '<a class="btn btn-success my-3 mr-2" href="#">Đang hoạt động</a>' : '<a class="btn btn-danger my-3 mr-2" href="#">Đã khóa</a>'}

                                                                                    <c:if test="${brand.state == 1}">
                                                                                        <f:form method="post"
                                                                                                action="/ekka/admin/brand/delete/${brand.id}"
                                                                                                modelAttribute="brandDto"
                                                                                                enctype="multipart/form-data">
                                                                                            <button class="btn btn-outline-danger ml-2"
                                                                                                    type="submit"><span
                                                                                                    class="brand-delete mdi mdi-delete-outline"></span>
                                                                                            </button>
                                                                                        </f:form>
                                                                                    </c:if>
                                                                                    <c:if test="${brand.state == 0}">
                                                                                        <f:form method="post"
                                                                                                action="/ekka/admin/brand/restore/${brand.id}"
                                                                                                modelAttribute="brandDto"
                                                                                                enctype="multipart/form-data">
                                                                                            <button class="btn btn-outline-success ml-2"
                                                                                                    type="submit"><span
                                                                                                    class="brand-delete mdi mdi-backup-restore"></span>
                                                                                            </button>
                                                                                        </f:form>
                                                                                    </c:if>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer px-4">
                                                            <button type="button" class="btn btn-secondary btn-pill"
                                                                    data-bs-dismiss="modal">Thoát
                                                            </button>
                                                            <a href="/ekka/admin/brand/edit/${brand.id}">
                                                                <button class="btn btn-primary btn-pill">Sửa
                                                                </button>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </c:forEach>
                                        </tbody>
                                    </table>
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
