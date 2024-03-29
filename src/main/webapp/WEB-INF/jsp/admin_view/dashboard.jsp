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

    <title>Ekka - Admin | Trang chủ.</title>

    <%@include file="/WEB-INF/jsp/layout/admin/assets.jsp"%>


</head>

<body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-light ec-header-light" id="body">

<!--  WRAPPER  -->
<div class="wrapper">

    <!-- LEFT MAIN SIDEBAR -->
    <%@include file="/WEB-INF/jsp/layout/admin/sidebar.jsp"%>

    <!--  PAGE WRAPPER -->
    <div class="ec-page-wrapper">

        <!-- Header -->
        <%@include file="/WEB-INF/jsp/layout/admin/navbar.jsp"%>


        <!-- CONTENT WRAPPER -->
        <div class="ec-content-wrapper">
            <div class="content">
                <!-- Top Statistics -->
                <div class="row">
                    <div class="col-xl-3 col-sm-6 p-b-15 lbl-card">
                        <div class="card card-mini dash-card card-1">
                            <div class="card-body">
                                <h2 class="mb-1">${countUser}</h2>
                                <p>Khách hàng</p>
                                <span class="mdi mdi-account-arrow-left"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 p-b-15 lbl-card">
                        <div class="card card-mini dash-card card-2">
                            <div class="card-body">
                                <h2 class="mb-1">${countProduct}</h2>
                                <p>Sản phẩm</p>
                                <span class="mdi mdi-account-clock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 p-b-15 lbl-card">
                        <div class="card card-mini dash-card card-3">
                            <div class="card-body">
                                <h2 class="mb-1">${countOrder}</h2>
                                <p>Lượt đặt hàng</p>
                                <span class="mdi mdi-package-variant"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 p-b-15 lbl-card">
                        <div class="card card-mini dash-card card-4">
                            <div class="card-body">
                                <h2 class="mb-1">${countRevenue}</h2>
                                <p>Doanh thu</p>
                                <span class="mdi mdi-currency-usd"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 p-b-15">
                        <!-- Recent Order Table -->
                        <div class="card card-table-border-none card-default recent-orders" id="recent-orders">
                            <div class="card-header justify-content-between">
                                <h2>Đơn hàng gần đây</h2>
                                <div class="date-range-report">
                                    <span></span>
                                </div>
                            </div>
                            <div class="card-body pt-0 pb-5">
                                <div class="table-responsive">
                                    <table id="responsive-data-table" class="table" style="width:100%">
                                        <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Mã đơn</th>
                                            <th>Khách hàng</th>
                                            <th>Giá bán</th>
                                            <th>Thanh toán</th>
                                            <th>Tình trạng</th>
                                            <th>Ngày</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${listBill}" var="bill">
                                            <tr>
                                                <td>
                                                    <c:forEach items="${listOrder}" var="order">
                                                        <c:if test="${bill.order_code == order.order_code}">
                                                        <a href="/ekka/admin/product/details/${order.product.id}"><img
                                                                class="tbl-thumb" src="${order.product.productImage}"
                                                                alt="product image"/></a>
                                                        </c:if>
                                                    </c:forEach>
                                                    </td>
                                                <td>#${bill.order_code}</td>
                                                <td><strong>${bill.user.fullName}</strong><br>
                                                    <a href="/ekka/admin/user/details/${bill.user.id}">${bill.user.email}</a>
                                                </td>
                                                <td>$<fmt:formatNumber
                                                        maxFractionDigits="2"
                                                        value="${bill.price}"></fmt:formatNumber></td>
                                                <c:if test="${bill.payment == 0}">
                                                    <td>Tiền mặt</td>
                                                </c:if>
                                                <c:if test="${bill.payment == 1}">
                                                    <td>Thanh toán trực tuyến</td>
                                                </c:if>

                                                <c:if test="${bill.state == 0}">
                                                    <td><span class="mb-2 mr-2 badge badge-danger">
                                                        Đã hủy
                                                    </span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${bill.state == 1}">
                                                    <td><span class="mb-2 mr-2 badge badge-secondary">
                                                        Đang chờ
                                                    </span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${bill.state == 2}">
                                                    <td><span class="mb-2 mr-2 badge badge-warning">
                                                        Sẵn sàng vận chuyển
                                                    </span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${bill.state == 3}">
                                                    <td><span class="mb-2 mr-2 badge badge-info">
                                                        Đang vận chuyển
                                                    </span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${bill.state == 4}">
                                                    <td><span class="mb-2 mr-2 badge badge-success">
                                                        Đã giao hàng
                                                    </span>
                                                    </td>
                                                </c:if>

                                                <td><fmt:formatDate pattern = "dd/MM/yyyy kk:mm:ss"
                                                                                              value = "${bill.updated_at}"/></td>
                                                <td>
                                                    <div class="btn-group mb-1">
                                                        <a style="padding: 3px 10px;"
                                                           class="btn btn-outline-success"
                                                           href="/ekka/admin/order/details/${bill.order_code}">Xem</a>
                                                        <button type="button"
                                                                class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                                                                data-bs-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false" data-display="static">
                                                            <span class="sr-only">Xem</span>
                                                        </button>

                                                        <div class="dropdown-menu">
                                                            <c:if test="${bill.state == 0}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #8a909d!important"
                                                                            type="submit">Đang chờ
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fec400!important"
                                                                            type="submit">Sẵn sàng vận chuyển
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #13cae1!important"
                                                                            type="submit">Đang vận chuyển
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #29cc97!important"
                                                                            type="submit">Đã giao hàng
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${bill.state == 1}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fe5461!important"
                                                                            type="submit">Đã hủy
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fec400!important"
                                                                            type="submit">Sẵn sàng vận chuyển
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #13cae1!important"
                                                                            type="submit">Đang vận chuyển
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #29cc97!important"
                                                                            type="submit">DELIVERED
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${bill.state == 2}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fe5461!important"
                                                                            type="submit">Đã hủy
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #8a909d!important"
                                                                            type="submit">Đang chờ
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #13cae1!important"
                                                                            type="submit">Đang vận chuyển
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #29cc97!important"
                                                                            type="submit">DELIVERED
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${bill.state == 3}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fe5461!important"
                                                                            type="submit">Đã hủy
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #8a909d!important"
                                                                            type="submit">Đang chờ
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fec400!important"
                                                                            type="submit">Sẵn sàng vận chuyển
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #29cc97!important"
                                                                            type="submit">DELIVERED
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${bill.state == 4}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fe5461!important"
                                                                            type="submit">Đã hủy
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #8a909d!important"
                                                                            type="submit">Đang chờ
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fec400!important"
                                                                            type="submit">Sẵn sàng vận chuyển
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #13cae1!important"
                                                                            type="submit">Đang vận chuyển
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-6">
                        <!-- New Customers -->
                        <div class="card ec-cust-card card-table-border-none card-default">
                            <div class="card-header justify-content-between ">
                                <h2>Khách hàng mới</h2>
<%--                                <div>--%>
<%--                                    <button class="text-black-50 mr-2 font-size-20">--%>
<%--                                        <i class="mdi mdi-cached"></i>--%>
<%--                                    </button>--%>
<%--                                    <div class="dropdown show d-inline-block widget-dropdown">--%>
<%--                                        <a class="dropdown-toggle icon-burger-mini" href="#" role="button"--%>
<%--                                           id="dropdown-customar" data-bs-toggle="dropdown" aria-haspopup="true"--%>
<%--                                           aria-expanded="false" data-display="static">--%>
<%--                                        </a>--%>
<%--                                        <ul class="dropdown-menu dropdown-menu-right">--%>
<%--                                            <li class="dropdown-item"><a href="#">Action</a></li>--%>
<%--                                            <li class="dropdown-item"><a href="#">Another action</a></li>--%>
<%--                                            <li class="dropdown-item"><a href="#">Something else here</a></li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </div>
                            <div class="card-body pt-0 pb-15px">
                                <div class="table-responsive">
                                    <table id="daTable" class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Email</th>
                                            <th>Tình trạng</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${listUser}" var="user">
                                            <c:if test="${user.role == 'USER'}">
                                                <tr>
                                                    <td>${user.email}</td>
                                                    <c:if test="${user.state == 1}">
                                                        <td style="color: #34c997!important;">
                                                            Đã kích hoạt
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${user.state == 0}">
                                                        <td style="color: #ec4a58!important;">
                                                            Đã khóa
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${user.state == 2}">
                                                        <td style="color: #ec4a58!important;">
                                                            Chưa kích hoạt
                                                        </td>
                                                    </c:if>
                                                    <td>
                                                        <div class="btn-group mb-1">
                                                            <button type="button"
                                                                    class="btn btn-outline-success"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#infoUser-${user.id}">Xem
                                                            </button>
                                                            <button type="button"
                                                                    class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                                                                    data-bs-toggle="dropdown" aria-haspopup="true"
                                                                    aria-expanded="false" data-display="static">
                                                                <span class="sr-only">Xem</span>
                                                            </button>

                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item"
                                                                   href="/ekka/admin/user/details/${user.id}">Sửa</a>
                                                                <c:if test="${user.state == 1}">
                                                                    <f:form method="post"
                                                                            action="/ekka/admin/user/delete/${user.id}"
                                                                            modelAttribute="userDto"
                                                                            enctype="multipart/form-data">
                                                                        <button class="dropdown-item pl-3"
                                                                                type="submit">Khóa
                                                                        </button>
                                                                    </f:form>
                                                                </c:if>
                                                                <c:if test="${user.state == 0}">
                                                                    <f:form method="post"
                                                                            action="/ekka/admin/user/restore/${user.id}"
                                                                            modelAttribute="userDto"
                                                                            enctype="multipart/form-data">
                                                                        <button class="dropdown-item pl-3"
                                                                                type="submit">Khôi phục
                                                                        </button>
                                                                    </f:form>
                                                                </c:if>
                                                                <c:if test="${user.state == 2}">
                                                                    <f:form method="post"
                                                                            action="/ekka/admin/user/restore/${user.id}"
                                                                            modelAttribute="userDto"
                                                                            enctype="multipart/form-data">
                                                                        <button class="dropdown-item pl-3"
                                                                                type="submit">Kích hoạt
                                                                        </button>
                                                                    </f:form>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <!-- Info User Modal -->
                                                <div class="modal fade modal-add-contact" id="infoUser-${user.id}"
                                                     tabindex="-1"
                                                     role="dialog"
                                                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered modal-lg"
                                                         style="margin: auto;"
                                                         role="document">
                                                        <div class="modal-content">
                                                            <div class="card bg-white profile-content">
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-xl-12">
                                                                        <div class="profile-content-left profile-left-spacing"
                                                                             style="padding: 24px!important;">
                                                                            <div class="text-center widget-profile px-0 border-0"
                                                                                 style="height: 307px;">
                                                                                <div class="card-img mx-auto rounded-circle"
                                                                                     style="width: 100%!important;">
                                                                                    <img src="${user.background_profile}"
                                                                                         alt="user image">
                                                                                </div>
                                                                                <img style="height: 120px;width: 120px;border-radius: 50%;object-fit: cover;position: relative;top: -62px;"
                                                                                     src="${user.avatar}"
                                                                                     alt="user image">

                                                                                <div class="card-body"
                                                                                     style="position: relative;top: -58px;">
                                                                                    <p>( ${user.role} )</p>
                                                                                    <h4 class="py-2 text-dark">${user.fullName}</h4>
                                                                                    <p>${user.email}</p>
                                                                                        ${user.state == 1 ? '<a class="btn btn-success my-3" href="#">Kích hoạt</a>' : '<a class="btn btn-danger my-3" href="#">Khóa</a>'}
                                                                                </div>
                                                                            </div>
                                                                            <hr class="w-100">
                                                                            <div class="contact-info pt-4">
                                                                                <h5 class="text-dark">Thông tin liên lạc</h5>
                                                                                <p class="text-dark font-weight-medium pt-24px mb-2">
                                                                                    Địa chỉ Email</p>
                                                                                <p>${user.email == null ? "( null )" : user.email}</p>
                                                                                <p class="text-dark font-weight-medium pt-24px mb-2">
                                                                                    Số điện thoại</p>
                                                                                <p>${user.phone == null ? "( null )" : user.phone}</p>
                                                                                <p class="text-dark font-weight-medium pt-24px mb-2">
                                                                                    Địa chỉ</p>
                                                                                <p>${user.address == null ? "( null )" : user.address}</p>
                                                                                <p class="text-dark font-weight-medium pt-24px mb-2">
                                                                                    Hành động</p>
                                                                                <c:if test="${user.state == 1}">
                                                                                    <f:form method="post"
                                                                                            action="/ekka/admin/user/delete/${user.id}"
                                                                                            modelAttribute="userDto"
                                                                                            enctype="multipart/form-data">
                                                                                        <button class="btn btn-outline-danger"
                                                                                                type="submit">Khóa
                                                                                        </button>
                                                                                    </f:form>
                                                                                </c:if>
                                                                                <c:if test="${user.state == 0}">
                                                                                    <f:form method="post"
                                                                                            action="/ekka/admin/user/restore/${user.id}"
                                                                                            modelAttribute="userDto"
                                                                                            enctype="multipart/form-data">
                                                                                        <button class="btn btn-outline-success"
                                                                                                type="submit">Khôi phục
                                                                                        </button>
                                                                                    </f:form>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer px-4">
                                                                <button type="button" class="btn btn-secondary btn-pill"
                                                                        data-bs-dismiss="modal">Thoát
                                                                </button>
                                                                <a href="/ekka/admin/user/details/${user.id}">
                                                                    <button class="btn btn-primary btn-pill">Sửa
                                                                    </button>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6">
                        <!-- Top Products -->
                        <div class="card card-default ec-card-top-prod">
                            <div class="card-header justify-content-between">
                                <h2>Sản phẩm mới</h2>
<%--                                <div>--%>
<%--                                    <button class="text-black-50 mr-2 font-size-20"><i--%>
<%--                                            class="mdi mdi-cached"></i></button>--%>
<%--                                    <div class="dropdown show d-inline-block widget-dropdown">--%>
<%--                                        <a class="dropdown-toggle icon-burger-mini" href="#" role="button"--%>
<%--                                           id="dropdown-product" data-bs-toggle="dropdown" aria-haspopup="true"--%>
<%--                                           aria-expanded="false" data-display="static">--%>
<%--                                        </a>--%>
<%--                                        <ul class="dropdown-menu dropdown-menu-right">--%>
<%--                                            <li class="dropdown-item"><a href="#">Update Data</a></li>--%>
<%--                                            <li class="dropdown-item"><a href="#">Detailed Log</a></li>--%>
<%--                                            <li class="dropdown-item"><a href="#">Statistics</a></li>--%>
<%--                                            <li class="dropdown-item"><a href="#">Clear Data</a></li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </div>
                            <div class="card-body mt-10px mb-10px py-0">
                                <div class="table-responsive">
                                    <table id="productTable" class="table"
                                           style="width:100%">
                                        <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Tên</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${listProduct}" var="product">
                                            <tr>
                                                <td>
                                                    <img style="object-fit: cover;" class="tbl-thumb"
                                                         src="${product.productImage}"
                                                         alt="user profile"/>


                                                </td>
                                                <td>${product.productName}</td>
                                                <td>
                                                    <div class="btn-group mb-1">
                                                            <%--                                                        <button type="button"--%>
                                                            <%--                                                                class="btn btn-outline-success"--%>
                                                            <%--                                                                data-bs-toggle="modal"--%>
                                                            <%--                                                                data-bs-target="#infoUser-${product.id}">Info--%>
                                                            <%--                                                        </button>--%>
                                                        <a style="padding: 3px 10px;" class="btn btn-outline-success"
                                                           href="/ekka/admin/product/details/${product.id}">Xem</a>
                                                        <button type="button"
                                                                class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                                                                data-bs-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false" data-display="static">
                                                            <span class="sr-only">Xem</span>
                                                        </button>

                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item"
                                                               href="/ekka/admin/product/edit/${product.id}">Sửa</a>
                                                            <c:if test="${product.state == 1}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/product/delete/${product.id}"
                                                                        modelAttribute="productDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            type="submit">Xóa
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${product.state == 0}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/product/restore/${product.id}"
                                                                        modelAttribute="productDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            type="submit">khôi phục
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
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
        $('#daTable').DataTable();
    });

    $(document).ready(function () {
        $('#productTable').DataTable();
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
