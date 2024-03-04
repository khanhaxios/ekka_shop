<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Ekka | Hóa đơn (${order_code}).</title>

    <%@include file="/WEB-INF/jsp/layout/user/assets.jsp" %>

</head>
<body>
<div id="ec-overlay"><span class="loader_img"></span></div>

<!-- Header start  -->
<%@include file="/WEB-INF/jsp/layout/user/header.jsp" %>
<!-- Header End  -->
<!-- ekka Cart Start -->
<div class="ec-side-cart-overlay"></div>
<!-- ekka Cart End -->

<!-- Ec breadcrumb start -->
<div class="sticky-header-next-sec  ec-breadcrumb section-space-mb">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row ec_breadcrumb_inner">
                    <div class="col-md-6 col-sm-12">
                        <h2 class="ec-breadcrumb-title">Hóa đơn (${order_code})</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="/ekka">Trang chủ</a></li>
                            <li class="ec-breadcrumb-item active">Hóa đơn (${order_code})</li>
                        </ul>
                        <!-- ec-breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ec breadcrumb end -->

<!-- User invoice section -->
<section class="ec-page-content ec-vendor-uploads ec-user-account section-space-p">
    <div class="container">
        <div class="row">
            <!-- Sidebar Area Start -->
            <div class="ec-shop-leftside ec-vendor-sidebar col-lg-3 col-md-12">
                <div class="ec-sidebar-wrap">
                    <!-- Sidebar Category Block -->
                    <div class="ec-sidebar-block">
                        <div class="ec-vendor-block">
                            <div class="ec-vendor-block-items">
                                <ul>
                                    <li><a href="/ekka/profile">Hồ sơ</a></li>
                                    <li><a href="/ekka/history">Lịch sử đặt hàng</a></li>
                                    <li><a href="/ekka/wish-list">Sản phẩm yêu thích (${countWishList})</a></li>
                                    <li><a href="/ekka/cart">Giỏ hàng (${countCart})</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ec-shop-rightside col-lg-9 col-md-12">
                <div class="ec-vendor-dashboard-card">
                    <div class="ec-vendor-card-header">
                        <h5>Hóa đơn số: ${order_code}</h5>
<%--                        <div class="ec-header-btn">--%>
<%--                            <a class="btn btn-lg btn-secondary" href="#">Print</a>--%>
<%--                            <a class="btn btn-lg btn-primary" href="#">Export</a>--%>
<%--                        </div>--%>
                    </div>
                    <div class="ec-vendor-card-body padding-b-0">
                        <div class="page-content">
                            <div class="page-header text-blue-d2">
                                <img src="/user/assets/images/logo/logo.png" alt="Site Logo">
                            </div>

                            <div class="container px-0">
                                <div class="row mt-4">
                                    <div class="col-lg-12">
                                        <hr class="row brc-default-l1 mx-n1 mb-4" />

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="my-2">
                                                    <span class="text-600 text-grey-m2 align-middle">Người nhận hàng: </span>
                                                    <span class="text-600 text-110 text-blue align-middle">${name_consignee}</span>
                                                </div>
                                                <div class="text-grey-m2">
                                                    <div class="my-2">
                                                        <b class="text-600">Địa chỉ: </b>
                                                        ${delivery_address}
                                                    </div>
                                                    <div class="my-2"><b class="text-600">Số điện thoại: </b>${delivery_phone}
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.col -->

                                            <div
                                                    class="text-95 col-sm-6 align-self-start d-sm-flex justify-content-end">
                                                <hr class="d-sm-none" />
                                                <div class="text-grey-m2">

                                                    <div class="my-2"><span class="text-600 text-90">ID: </span>
                                                        #${order_code}</div>

                                                    <div class="my-2"><span class="text-600 text-90">Đơn hàng đặt lúc:
                                                            </span> <fmt:formatDate pattern = "dd/MM/yyyy kk:mm:ss"
                                                                                    value = "${created_at}"/></div>

                                                    <div class="my-2"><span class="text-600 text-90">Trạng thái:
                                                            </span><c:if test="${state == 0}"><span style="color: #fe5461!important">Đã hủy</span></c:if>
                                                        <c:if test="${state == 1}"><span style="color: #8a909d!important">Đang chờ</span></c:if>
                                                        <c:if test="${state == 2}"><span style="color: #fec400!important">Đã sẵn sàng</span></c:if>
                                                        <c:if test="${state == 3}"><span style="color: #13cae1!important">Đang vận chuyển hàng</span></c:if>
                                                        <c:if test="${state == 4}"><span style="color: #29cc97!important">Hoàn thành + thanh toán</span></c:if></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                        </div>

                                        <div class="mt-4">

                                            <div class="text-95 text-secondary-d3">
                                                <div class="ec-vendor-card-table">
                                                    <table class="table ec-table">
                                                        <thead>
                                                        <tr>
                                                            <th scope="col">Ảnh</th>
                                                            <th scope="col">Tên sản phẩm</th>
                                                            <th scope="col">Số lượng</th>
                                                            <th scope="col">Giá ($)</th>
                                                            <th scope="col">Ưu đãi (%)</th>
                                                            <th scope="col">Tổng</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${listOrder}" var="order">
                                                            <tr>
                                                                <td><span><a href="/ekka/product-details/${order.product.id}"><img class="prod-img" src="${order.product.productImage}"
                                                                                                                                   alt="product image"></a></span></td>
                                                                <td><span><a href="/ekka/product-details/${order.product.id}">${order.product.productName}</a></span></td>
                                                                <td><span>${order.item}</span></td>
                                                                <td><span>$${order.product.priceProduct}</span></td>
                                                                <td><span>${order.product.discount}%</span></td>
                                                                <td><span>$${order.price}</span></td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                        <tfoot>
                                                        <tr>
                                                            <td class="border-none" colspan="4">
                                                                <span></span></td>
                                                            <td class="border-color" colspan="1">
                                                                <span><strong>Tổng cộng</strong></span></td>
                                                            <td class="border-color">
                                                                <span>$${orderDto.total_price}</span></td>
                                                        </tr>
<%--                                                        <tr>--%>
<%--                                                            <td class="border-none" colspan="3">--%>
<%--                                                                <span></span></td>--%>
<%--                                                            <td class="border-color" colspan="1">--%>
<%--                                                                <span><strong>Tax (10%)</strong></span></td>--%>
<%--                                                            <td class="border-color">--%>
<%--                                                                <span>$352</span></td>--%>
<%--                                                        </tr>--%>
                                                        <tr>
                                                            <td class="border-none m-m15"
                                                                colspan="4"></td>
                                                            <td class="border-color m-m15"
                                                                colspan="1"><span><strong>Tổng tiền cần thanh toán</strong></span>
                                                            </td>
                                                            <td class="border-color m-m15">
                                                                <span>$${orderDto.total_price}</span></td>
                                                        </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ec-vendor-card-body padding-b-0">
                        <div class="ec-trackorder-inner">
                            <div class="ec-trackorder-top">
                                <h2 class="ec-order-id" style="text-transform: none;">Đơn hàng #${order_code}</h2>
                                <c:if test="${state != 0}">

                                <div class="ec-order-detail">
                                    <div>Dự tính đến nơi <fmt:formatDate pattern = "dd/MM/yyyy"
                                                                          value = "${shippingEstimated}"/></div>
                                    <%--                        <div>Grasshoppers <span>v534hb</span></div>--%>
                                </div>
                                </c:if>

                            </div>
                            <div class="ec-trackorder-bottom">
                                <div class="ec-progress-track">
                                    <c:if test="${state == 0}">
                                        <h1 class="text-danger">Đơn hàng đã bị hủy!</h1>
                                    </c:if>
                                    <c:if test="${state != 0}">
                                    <ul id="ec-progressbar">
                                        <c:if test="${state == 1}">
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_1.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                        <br>Đặt hàng</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_2.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đang
                                            <br>Chờ</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_3.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                            <br>Sẵn sàng</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_4.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đang <br>Vận chuyển</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_5.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                            <br>Giao hàng</span></li>
                                        </c:if>
                                        <c:if test="${state == 2}">
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_1.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                        <br>Đặt hàng</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_2.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đang
                                            <br>Chờ</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_3.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                            <br>Sẵn sàng</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_4.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đang <br>Vận chuyển</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_5.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                            <br>Giao hàng</span></li>
                                        </c:if>
                                        <c:if test="${state == 3}">
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_1.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                        <br>Đặt hàng</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_2.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đang
                                            <br>Chờ</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_3.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                            <br>Sẵn sàng</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_4.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đang <br>Vận chuyển</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_5.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                            <br>Giao hàng</span></li>
                                        </c:if>
                                        <c:if test="${state == 4}">
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_1.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                        <br>Đặt hàng</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_2.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đang
                                            <br>Chờ</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_3.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                            <br>Sẵn sàng</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_4.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đang <br>Vận chuyển</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_5.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">Đã
                                            <br>Giao hàng</span></li>
                                        </c:if>
                                    </ul>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End User invoice section -->

<!-- Footer Start -->
<footer class="ec-footer section-space-mt">
    <div class="footer-container">
        <div class="footer-top section-space-footer-p">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-lg-3 ec-footer-contact">
                        <div class="ec-footer-widget">
                            <div class="ec-footer-logo"><a href="#"><img src="/user/assets/images/logo/footer-logo.png"
                                                                         alt=""><img class="dark-footer-logo" src="/user/assets/images/logo/dark-logo.png"
                                                                                     alt="Site Logo" style="display: none;" /></a></div>
                            <h4 class="ec-footer-heading">Liên hệ chúng tôi</h4>
                            <div class="ec-footer-links">
                                <ul class="align-items-center">
                                    <li class="ec-footer-link">Đại Đồng, Thạch Thất, Hà Nội</li>
                                    <li class="ec-footer-link"><span>Call Us:</span><a href="#">0987654321</a></li>
                                    <li class="ec-footer-link"><span>Email:</span><a href="#"><span data-cfemail="#">vutuankiet2411@gmail.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-2 ec-footer-info">
                        <div class="ec-footer-widget">
                            <h4 class="ec-footer-heading">Thông tin</h4>
                            <div class="ec-footer-links">
                                <ul class="align-items-center">
                                    <li class="ec-footer-link"><a href="/ekka/about-us">Về chúng tôi</a></li>
                                    <li class="ec-footer-link"><a href="/ekka/faq">Câu hỏi thường gặp</a></li>
                                    <li class="ec-footer-link"><a href="/ekka/track-order">Thông tin giao hàng</a></li>
                                    <li class="ec-footer-link"><a href="/ekka/contact-us">Liên hệ chúng tôi</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-2 ec-footer-account">
                        <div class="ec-footer-widget">
                            <h4 class="ec-footer-heading">Tài khoản</h4>
                            <div class="ec-footer-links">
                                <ul class="align-items-center">
                                    <li class="ec-footer-link"><a href="/ekka/profile">Tài khoản của tôi</a></li>
                                    <li class="ec-footer-link"><a href="/ekka/track-order">lịch sử đơn hàng</a></li>
                                    <li class="ec-footer-link"><a href="/ekka/wish-list">Sản phẩm yêu thích</a></li>
                                    <li class="ec-footer-link"><a href="/ekka/offer">Đặc biệt</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-2 ec-footer-service">
                        <div class="ec-footer-widget">
                            <h4 class="ec-footer-heading">Dịch vụ</h4>
                            <div class="ec-footer-links">
                                <ul class="align-items-center">
                                    <li class="ec-footer-link"><a href="/ekka/track-order">Hoàn tiền hàng trả lại</a></li>
                                    <li class="ec-footer-link"><a href="/ekka/privacy-policy">Chính sách</a></li>
                                    <li class="ec-footer-link"><a href="/ekka/terms-condition">Dịch vụ khách hàng</a></li>
                                    <li class="ec-footer-link"><a href="/ekka/terms-condition">Kì hạn và điều kiện</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-3 ec-footer-news">
                        <div class="ec-footer-widget">
                            <h4 class="ec-footer-heading">Viết thư phản hồi</h4>
                            <div class="ec-footer-links">
                                <ul class="align-items-center">
                                    <li class="ec-footer-link">Nhận cập nhật tức thì về các sản phẩm mới và khuyến mãi đặc biệt của chúng tôi!</li>
                                </ul>
                                <div class="ec-subscribe-form">
                                    <form id="ec-newsletter-form" name="ec-newsletter-form" method="get"
                                          action="/ekka/contact-us">
                                        <div id="ec_news_signup" class="ec-form">
                                            <input class="ec-email" type="email" required=""
                                                   placeholder="Vui lòng nhập địa chỉ Email tại đây..." name="ec-email" value="" />
                                            <button id="ec-news-btn" class="button btn-primary" type="submit"
                                                    name="subscribe" value=""><i class="ecicon eci-paper-plane-o"
                                                                                 aria-hidden="true"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Footer social Start -->
                    <div class="col text-left footer-bottom-left">
                        <div class="footer-bottom-social">
                            <span class="social-text text-upper">Follow us on:</span>
                            <ul class="mb-0">
                                <li class="list-inline-item"><a class="hdr-facebook" href="#"><i class="ecicon eci-facebook"></i></a></li>
                                <li class="list-inline-item"><a class="hdr-twitter" href="#"><i class="ecicon eci-twitter"></i></a></li>
                                <li class="list-inline-item"><a class="hdr-instagram" href="#"><i class="ecicon eci-instagram"></i></a></li>
                                <li class="list-inline-item"><a class="hdr-linkedin" href="#"><i class="ecicon eci-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Footer social End -->
                    <!-- Footer Copyright Start -->
                    <div class="col text-center footer-copy">
                        <div class="footer-bottom-copy ">
                            <div class="ec-copy">Bản quyền © 2021-2022 <a class="site-name text-upper"
                                                                          href="/ekka">ekka<span>.</span></a>. Đã đăng ký Bản quyền</div>
                        </div>
                    </div>
                    <!-- Footer Copyright End -->
                    <!-- Footer payment -->
                    <div class="col footer-bottom-right">
                        <div class="footer-bottom-payment d-flex justify-content-end">
                            <div class="payment-link">
                                <img src="/user/assets/images/icons/payment.png" alt="">
                            </div>

                        </div>
                    </div>
                    <!-- Footer payment -->
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Footer Area End -->


<!-- Footer navigation panel for responsive display -->
<%@include file="/WEB-INF/jsp/layout/user/footer.jsp" %>
<!-- Footer navigation panel for responsive display end -->
<!-- Cart Floating Button end -->

<%--script start--%>
<%@include file="/WEB-INF/jsp/layout/user/scripts.jsp" %>
</body>
<%--body end--%>
</html>