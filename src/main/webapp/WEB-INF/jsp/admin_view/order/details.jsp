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

    <title>Ekka - Admin | Đơn hàng | (${order_code}).</title>

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
                <div class="breadcrumb-wrapper breadcrumb-wrapper-2">
                    <h1>Chi tiết đơn hàng #${order_code}</h1>
                    <p class="breadcrumbs"><span><a href="/ekka/admin">Trang chủ</a></span>
                        <span><i class="mdi mdi-chevron-right"></i></span>Đơn hàng
                    </p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="ec-odr-dtl card card-default">
                            <div class="card-header card-header-border-bottom d-flex justify-content-between">
                                <h2 class="ec-odr">Chi tiết đơn hàng<br>
                                    <span class="small">Mã đơn hàng: #${order_code}</span>
                                </h2>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Cửa hàng:</strong></div>
                                            <br>
                                            <div class="info-content">
                                                <b title="Name">Tên:</b> Ekka, Inc.<br>
                                                <b title="Address">Địa chỉ:</b> Dai Dong, Thach That, Ha Noi<br>
                                                <b title="Phone">Phone:</b> 0336704581
                                            </div>
                                        </address>
                                    </div>
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Gửi tới khách hàng:</strong></div>
                                            <br>
                                            <div class="info-content">
                                                <b title="Name">Tên:</b> ${name_consignee}<br>
                                                <b title="Address">Địa chỉ:</b> ${delivery_address}<br>
                                                <b title="Phone">Phone:</b> ${delivery_phone}
                                            </div>
                                        </address>
                                    </div>
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Hình thức thanh toán:</strong></div>
                                            <br>
                                            <div class="info-content">
                                                ${payment == 0 ? "Thanh toán khi nhận hàng" : "Thanh toán trực tuyến"}<br>
                                            </div>
                                        </address>
                                    </div>
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Ngày đặt hàng:</strong></div>
                                            <br>
                                            <div class="info-content">
                                                <fmt:formatDate pattern = "dd/MM/yyyy kk:mm:ss"
                                                                             value = "${created_at}"/><br>
                                            </div>
                                        </address>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3 class="tbl-title">Trạng thái đơn hàng - ${state == 4 ? "<span style='color:green;'>Đã thanh toán</span>" : "<span style='color:red;'>Chưa thanh toán</span>"}</h3>
                                        <div class="table-responsive">
                                            <table class="table table-striped o-tbl">
                                                <thead>
                                                <tr class="line">
                                                    <td><strong>Mã đơn hàng</strong></td>
                                                    <td class="text-left"><strong>Ảnh sản phẩm</strong></td>
                                                    <td class="text-left"><strong>Sản phẩm</strong></td>
                                                    <td class="text-right"><strong>Giá cả ($)</strong></td>
                                                    <td class="text-right"><strong>Ưu đãi (%)</strong></td>
                                                    <td class="text-right"><strong>Số lượng</strong></td>
                                                    <td class="text-right"><strong>Tổng</strong></td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listOrder}" var="order">
                                                    <tr>
                                                        <td>${order.order_code}</td>
                                                        <td><img class="product-img"
                                                                 src="${order.product.productImage}" alt="IMAGE PRODUCT"/></td>
                                                        <td><strong>${order.product.productName}</strong><br></td>
                                                        <td class="text-right">
                                                            $${order.product.priceProduct}</td>
                                                        <td class="text-right">
                                                            ${order.product.discount == null ? 0 : order.product.discount} %</td>
                                                        <td class="text-right">${order.item}</td>
                                                        <td class="text-right">$<fmt:formatNumber maxFractionDigits="2"
                                                                                                  value="${order.product.discount == null ? (order.product.priceProduct * ((100 - 0)/100)) * order.item : (order.product.priceProduct * ((100 - order.product.discount)/100)) * order.item}"></fmt:formatNumber></td>
                                                    </tr>
                                                </c:forEach>
                                                <tr class="line"></tr>

                                                <tr>
                                                    <td colspan="5"></td>
                                                    <td class="text-right"><strong>Thuế</strong></td>
                                                    <td class="text-right"><strong>N/A</strong></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5">
                                                    </td>
                                                    <td class="text-right"><strong>Thành tiền</strong></td>
                                                    <td class="text-right"><strong>$<fmt:formatNumber
                                                            maxFractionDigits="2"
                                                            value="${orderDto.total_price}"></fmt:formatNumber></strong>
                                                    </td>
                                                </tr>



                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Tracking Detail -->
                        <div class="card mt-4 trk-order">
                            <div class="p-4 text-center text-white text-lg bg-dark rounded-top">
                                <span class="text-uppercase">Theo dõi đơn hàng số - </span>
                                <span class="text-medium">${order_code}</span>
                            </div>
                            <div
                                    class="d-flex flex-wrap flex-sm-nowrap justify-content-between py-3 px-2 bg-secondary">
                                <div class="w-100 text-center py-1 px-2"><span class="text-medium">Đơn vị vận chuyển:</span> Ekka Shop
                                </div>
                                <div class="w-100 text-center py-1 px-2"><span class="text-medium">Tình trạng:</span>
                                    <c:if test="${state == 0}"><span style="color: #fe5461!important">ĐÃ HỦY</span></c:if>
                                    <c:if test="${state == 1}"><span style="color: #8a909d!important">ĐANG CHỜ</span></c:if>
                                    <c:if test="${state == 2}"><span style="color: #fec400!important">SẴN SÀNG VẬN CHUYỂN</span></c:if>
                                    <c:if test="${state == 3}"><span style="color: #13cae1!important">ĐANG VẬN CHUYỂN</span></c:if>
                                    <c:if test="${state == 4}"><span style="color: #29cc97!important">ĐÃ GIAO HÀNG</span></c:if>
                                </div>
                                <div class="w-100 text-center py-1 px-2"><span class="text-medium">Ngày cập nhật:</span> <fmt:formatDate pattern = "dd/MM/yyyy kk:mm:ss"
                                                                                                                                                      value = "${updated_at}"/>
                                </div>
                            </div>
                            <div class="card-body">
                                <div
                                        class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x">
                                    <c:if test="${state == 0}">
                                        <h1 class="mx-auto text-danger" style="color: red;">Đơn hàng đã bị hủy!</h1>
                                    </c:if>
                                    <c:if test="${state == 1}">
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-cart"></i></div>
                                            </div>
                                            <h4 class="step-title">Xác nhận đơn hàng</h4>
                                        </div>
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-tumblr-reblog"></i></div>
                                            </div>
                                            <h4 class="step-title">Đang chờ</h4>
                                        </div>
                                        <div class="step">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-gift"></i></div>
                                            </div>
                                            <h4 class="step-title">Sãn sàng vận chuyển</h4>
                                        </div>
                                        <div class="step">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-truck-delivery"></i></div>
                                            </div>
                                            <h4 class="step-title">Đang vận chuyển</h4>
                                        </div>
                                        <div class="step">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-hail"></i></div>
                                            </div>
                                            <h4 class="step-title">Đã giao hàng</h4>
                                        </div>
                                    </c:if>
                                    <c:if test="${state == 2}">
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-cart"></i></div>
                                            </div>
                                            <h4 class="step-title">Xác nhận đơn hàng</h4>
                                        </div>
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-tumblr-reblog"></i></div>
                                            </div>
                                            <h4 class="step-title">Đang chờ</h4>
                                        </div>
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-gift"></i></div>
                                            </div>
                                            <h4 class="step-title">Sãn sàng vận chuyển</h4>
                                        </div>
                                        <div class="step">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-truck-delivery"></i></div>
                                            </div>
                                            <h4 class="step-title">Đang vận chuyển</h4>
                                        </div>
                                        <div class="step">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-hail"></i></div>
                                            </div>
                                            <h4 class="step-title">Đã giao hàng</h4>
                                        </div>
                                    </c:if>
                                    <c:if test="${state == 3}">
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-cart"></i></div>
                                            </div>
                                            <h4 class="step-title">Xác nhận đơn hàng</h4>
                                        </div>
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-tumblr-reblog"></i></div>
                                            </div>
                                            <h4 class="step-title">Đang chờ</h4>
                                        </div>
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-gift"></i></div>
                                            </div>
                                            <h4 class="step-title">Sãn sàng vận chuyển</h4>
                                        </div>
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-truck-delivery"></i></div>
                                            </div>
                                            <h4 class="step-title">Đang vận chuyển</h4>
                                        </div>
                                        <div class="step">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-hail"></i></div>
                                            </div>
                                            <h4 class="step-title">Đã giao hàng</h4>
                                        </div>
                                    </c:if>
                                    <c:if test="${state == 4}">
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-cart"></i></div>
                                            </div>
                                            <h4 class="step-title">Xác nhận đơn hàng</h4>
                                        </div>
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-tumblr-reblog"></i></div>
                                            </div>
                                            <h4 class="step-title">Đang chờ</h4>
                                        </div>
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-gift"></i></div>
                                            </div>
                                            <h4 class="step-title">Sãn sàng vận chuyển</h4>
                                        </div>
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-truck-delivery"></i></div>
                                            </div>
                                            <h4 class="step-title">Đang vận chuyển</h4>
                                        </div>
                                        <div class="step completed">
                                            <div class="step-icon-wrap">
                                                <div class="step-icon"><i class="mdi mdi-hail"></i></div>
                                            </div>
                                            <h4 class="step-title">Đã giao hàng</h4>
                                        </div>
                                    </c:if>
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
