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

    <title>Ekka - Admin | Đánh giá.</title>

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
                <div
                        class="breadcrumb-wrapper breadcrumb-wrapper-2 d-flex align-items-center justify-content-between">
                    <h1>Đánh giá của khách hàng</h1>
                    <p class="breadcrumbs"><span><a href="/ekka/admin">Trang chủ</a></span>
                        <span><i class="mdi mdi-chevron-right"></i></span>Đánh giá
                    </p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="responsive-data-table" class="table" style="width:100%">
                                        <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Bình luận</th>
                                            <th>Email</th>
                                            <th>Đánh giá</th>
                                            <th>Ngày</th>
                                            <th>Tình trạng</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${listReview}" var="review">
                                            <tr>
                                                <td><a href="/ekka/admin/product/details/${review.product.id}"><img class="tbl-thumb" src="${review.product.productImage}" alt="product image"/></a></td>
                                                <td>${review.comment}</td>
                                                <td><strong>${review.user.fullName}</strong><br>
                                                    <a href="/ekka/admin/user/details/${review.user.id}">${review.user.email}</a>
                                                </td>
                                                <td>
                                                    <c:if test="${review.rating == 1}">
                                                    <div class="ec-t-rate">
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                    </div>
                                                    </c:if>
                                                    <c:if test="${review.rating == 2}">
                                                        <div class="ec-t-rate">
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star"></i>
                                                            <i class="mdi mdi-star"></i>
                                                            <i class="mdi mdi-star"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${review.rating == 3}">
                                                        <div class="ec-t-rate">
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star"></i>
                                                            <i class="mdi mdi-star"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${review.rating == 4}">
                                                        <div class="ec-t-rate">
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${review.rating == 5}">
                                                        <div class="ec-t-rate">
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star is-rated"></i>
                                                            <i class="mdi mdi-star is-rated"></i>
                                                        </div>
                                                    </c:if>
                                                </td>
                                                <td><fmt:formatDate pattern = "dd/MM/yyyy kk:mm:ss"
                                                                    value = "${review.created_at}"/></td>
                                                <c:if test="${review.state == 1}">
                                                    <td style="color: #34c997!important;">
                                                        Đang hoạt động
                                                    </td>
                                                </c:if>
                                                <c:if test="${review.state == 0}">
                                                    <td style="color: #ec4a58!important;">
                                                        Đã xóa
                                                    </td>
                                                </c:if>
                                                <td>
                                                    <div class="btn-group mb-1">
                                                        <button type="button"
                                                                class="btn btn-outline-success"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#infoUser-${review.id}">Xem
                                                        </button>
                                                        <button type="button"
                                                                class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                                                                data-bs-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false" data-display="static">
                                                            <span class="sr-only">Xem</span>
                                                        </button>

                                                        <div class="dropdown-menu">
                                                            <c:if test="${review.state == 1}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/review/delete/${review.id}"
                                                                        modelAttribute="reviewDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            type="submit">Xóa
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${review.state == 0}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/review/restore/${review.id}"
                                                                        modelAttribute="reviewDto"
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
                                            <div class="modal fade modal-add-contact" id="infoUser-${review.id}"
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
                                                                            <div class="ec-t-review-item d-flex">
                                                                                <div class="ec-t-review-avtar">
                                                                                    <img style="border-radius: 50%;width: 100px;height: 100px;object-fit: cover;" src="${review.user.avatar}"
                                                                                         alt=""/>
                                                                                </div>
                                                                                <div class="ec-t-review-content" style="padding: 10px;">
                                                                                    <div class="ec-t-review-top">
                                                                                        <div class="ec-t-review-name" style="text-align: left;">${review.user.fullName}</div>
                                                                                        <div class="ec-t-rate" style="text-align: left;">

                                                                                            <c:if test="${review.rating == 1}">
                                                                                                <div class="ec-t-rate">
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star"></i>
                                                                                                    <i class="mdi mdi-star"></i>
                                                                                                    <i class="mdi mdi-star"></i>
                                                                                                    <i class="mdi mdi-star"></i>
                                                                                                </div>
                                                                                            </c:if>
                                                                                            <c:if test="${review.rating == 2}">
                                                                                                <div class="ec-t-rate">
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star"></i>
                                                                                                    <i class="mdi mdi-star"></i>
                                                                                                    <i class="mdi mdi-star"></i>
                                                                                                </div>
                                                                                            </c:if>
                                                                                            <c:if test="${review.rating == 3}">
                                                                                                <div class="ec-t-rate">
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star"></i>
                                                                                                    <i class="mdi mdi-star"></i>
                                                                                                </div>
                                                                                            </c:if>
                                                                                            <c:if test="${review.rating == 4}">
                                                                                                <div class="ec-t-rate">
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star"></i>
                                                                                                </div>
                                                                                            </c:if>
                                                                                            <c:if test="${review.rating == 5}">
                                                                                                <div class="ec-t-rate">
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                    <i class="mdi mdi-star is-rated"></i>
                                                                                                </div>
                                                                                            </c:if>

                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="ec-t-review-bottom">
                                                                                        <p style="text-align: left;">
                                                                                                ${review.comment}
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="d-flex justify-content-center align-items-center">
                                                                                    ${review.state == 1 ? '<a class="btn btn-success my-3 mr-2" href="#">Đang hoạt động</a>' : '<a class="btn btn-danger my-3 mr-2" href="#">Đã xóa</a>'}

                                                                                <c:if test="${review.state == 1}">
                                                                                    <f:form method="post"
                                                                                            action="/ekka/admin/review/delete/${review.id}"
                                                                                            modelAttribute="contactDto"
                                                                                            enctype="multipart/form-data">
                                                                                        <button class="btn btn-outline-danger ml-2"
                                                                                                type="submit"><span
                                                                                                class="brand-delete mdi mdi-delete-outline"></span>
                                                                                        </button>
                                                                                    </f:form>
                                                                                </c:if>
                                                                                <c:if test="${review.state == 0}">
                                                                                    <f:form method="post"
                                                                                            action="/ekka/admin/review/restore/${review.id}"
                                                                                            modelAttribute="contactDto"
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
                                                        <div class="modal-footer px-4 m-auto">
                                                            <button type="button" class="btn btn-secondary btn-pill"
                                                                    data-bs-dismiss="modal">Thoát
                                                            </button>
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
    function ChangeValueColor(e, target) {
        // console.log(e.previousElementSibling);
        // let color1 = document.querySelector(`.color1`);
        let checkboxColor1 = document.querySelector(target);
        checkboxColor1.setAttribute("value", e.value);
    }
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
