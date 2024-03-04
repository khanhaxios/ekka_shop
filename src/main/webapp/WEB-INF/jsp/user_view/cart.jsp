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
    <title>Ekka | Giỏ hàng (${countCart}).</title>

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
                        <h2 class="ec-breadcrumb-title">Giỏ hàng</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="/ekka">Trang chủ</a></li>
                            <li class="ec-breadcrumb-item active">Giỏ hàng</li>
                        </ul>
                        <!-- ec-breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ec breadcrumb end -->

<!-- Ec cart page -->
<section class="ec-page-content section-space-p p-0">
    <div class="container">
        <div class="row">
            <c:if test="${listCartUserId == []}">
                <div class="row">
                    <div class="ec-wish-rightside col-lg-12 col-md-12">
                        <p class="emp-wishlist-msg">Giỏ hàng đang trống!</p>
                    </div>
                    <div class="ec-wish-rightside col-lg-12 col-md-12 pt-0">
                        <p class="emp-wishlist-msg pt-0 text-decoration-underline"><a href="/ekka/product">Mua sắm ngay!</a>
                        </p>
                    </div>
                </div>
            </c:if>
            <c:if test="${listCartUserId != []}">
                <div class="row empty-cart-list d-none">
                    <div class="ec-wish-rightside col-lg-12 col-md-12">
                        <p class="emp-wishlist-msg">Giỏ hàng đang trống!</p>
                    </div>
                    <div class="ec-wish-rightside col-lg-12 col-md-12 pt-0">
                        <p class="emp-wishlist-msg pt-0 text-decoration-underline"><a href="/ekka/product">Mua sắm ngay!</a>
                        </p>
                    </div>
                </div>

                <f:form cssClass="row ec-show-cart-list" method="post" action="/ekka/order/save"
                        modelAttribute="orderDto">

                    <div class="ec-cart-leftside col-md-12 col-lg-12 col-xl-8">
                        <!-- cart content Start -->
                        <div class="ec-cart-content">
                            <div class="ec-cart-inner">
                                <div class="row">
                                    <div class="table-content cart-table-content">
                                        <table>
                                            <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th>Màu</th>
                                                <th>Kích cỡ</th>
                                                <th>Giá($)</th>
                                                <th>Ưu đãi(%)</th>
                                                <th style="text-align: center;">Số lượng</th>
                                                <th>Tổng($)</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach items="${listCartUserId}" var="cartUserId">
                                                <f:input cssClass="d-none" path="product"
                                                         value="${cartUserId.product.id}"></f:input>
                                                <f:input cssClass="d-none" path="cart"
                                                         value="${cartUserId.id}"></f:input>

                                                <tr class="cart-list cart-list-${cartUserId.id}">
                                                    <td data-label="Product" class="ec-cart-pro-name"><a
                                                            class="cart-product-name"
                                                            title="${cartUserId.product.productName}"
                                                            href="/ekka/product-details/${cartUserId.product.id}"><img
                                                            class="ec-cart-pro-img mr-4"
                                                            src="${cartUserId.product.productImage}"
                                                            alt=""/><span>${cartUserId.product.productName}</span></a>
                                                    </td>
                                                    <td data-label="Color">
                                                        <div class="btn-group">
                                                            <button class="showColor" type="button"
                                                                    style="background-color: ${cartUserId.color_product};border: 2px solid;width: 40px;height: 40px;"></button>

                                                            <button type="button"
                                                                    class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split"
                                                                    style="width: 40px;height: 40px;"
                                                                    data-toggle="dropdown"
                                                                    aria-expanded="false">
                                                                <span class="sr-only">Toggle Dropdown</span>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right px-4" style="min-width: auto;">
                                                                <c:forEach items="${listProductColor}"
                                                                           var="productColor">
                                                                    <c:if test="${cartUserId.product.id == productColor.product.id}">
                                                                        <button class="changeColor" type="button"
                                                                                style="background-color: ${productColor.colorName};border: 2px solid;width: 40px;height: 40px;"></button>

                                                                    </c:if>
                                                                </c:forEach>

                                                            </div>
                                                            <f:input cssClass="color d-none" path="color"
                                                                     value="${cartUserId.color_product}"></f:input>

                                                        </div>

                                                    </td>
                                                    <td data-label="Size">
                                                        <div class="btn-group">
                                                            <button class="showSize" type="button"
                                                                    style="border: 2px solid;width: 40px;height: 40px;">${cartUserId.size_product}</button>

                                                            <button type="button"
                                                                    class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split"
                                                                    style="width: 40px;height: 40px;"
                                                                    data-toggle="dropdown"
                                                                    aria-expanded="false">
                                                                <span class="sr-only">Toggle Dropdown</span>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right px-4" style="min-width: auto;">
                                                                <c:forEach items="${listProductSize}" var="productSize">
                                                                    <c:if test="${cartUserId.product.id == productSize.product.id}">
                                                                        <button class="changeSize" type="button"
                                                                                style="border: 2px solid;width: 40px;height: 40px;">${productSize.sizeName}</button>

                                                                    </c:if>
                                                                </c:forEach>

                                                            </div>
                                                            <f:input cssClass="size d-none" path="size"
                                                                     value="${cartUserId.size_product}"></f:input>

                                                        </div>

                                                    </td>
                                                    <td class="price text-right"
                                                        data-label="Price">${cartUserId.product.priceProduct}</td>
                                                    <td class="discount text-right"
                                                        data-label="Discount">${cartUserId.product.discount}</td>
                                                    <td data-label="Quantity"
                                                        style="text-align: center;">
                                                        <div class="form-group">
                                                            <c:if test="${cartUserId.product.totalProduct > 0}">
                                                                <input class="form-control px-3 py-0 item"
                                                                       style="height: 40px!important;min-height: 40px!important; width: 75px;"
                                                                       type="number" min="1"
                                                                       max="${cartUserId.product.totalProduct}"
                                                                       value="${cartUserId.product.totalProduct == 0 ? 0 : cartUserId.item}"/>
                                                            </c:if>
                                                            <c:if test="${cartUserId.product.totalProduct <= 0}">
                                                                <input class="form-control px-3 py-0 item d-none"
                                                                       style="height: 40px!important;min-height: 40px!important; width: 75px;"
                                                                       type="number" min="0"
                                                                       max="${cartUserId.product.totalProduct}"
                                                                       value="${cartUserId.product.totalProduct == 0 ? 0 : cartUserId.item}"/>
                                                                <span class="text-danger">(Trống)</span>
                                                            </c:if>
                                                        </div>
                                                        <f:input cssClass="itemProduct d-none" path="itemProduct"
                                                                 value="${cartUserId.item}"></f:input>
                                                        <f:input cssClass="totalPrice d-none" path="totalPrice"
                                                                 value="${cartUserId.price}"></f:input>

                                                    </td>
                                                    <td class="total text-right" data-label="Total">$<fmt:formatNumber
                                                            maxFractionDigits="2"
                                                            value="${cartUserId.product.totalProduct == 0 ? 0 : cartUserId.price}"></fmt:formatNumber></td>

                                                    <td data-label="Remove">
                                                            <%--                                                        <f:form method="post" action="/ekka/cart/delete/${cartUserId.id}"--%>
                                                            <%--                                                                modelAttribute="urlDto">--%>
                                                            <%--                                                            <f:input type="text" path="url"--%>
                                                            <%--                                                                     value="${urlDto.url}"--%>
                                                            <%--                                                                     cssClass="d-none" id="one"/>--%>
                                                            <%--                                                            <button formmethod="post" formaction="/ekka/cart/delete/${cartUserId.id}"><i class="ecicon eci-trash-o"></i>--%>
                                                            <%--                                                            </button>--%>
                                                            <%--                                                        </f:form>--%>

                                                                <button type="button" title="Remove To Cart"
                                                                        class="ecicon eci-trash-o remove-to-cart btn-remove-${cartUserId.id}">
                                                                </button>
                                                                <script>
                                                                    $(document).ready(function () {

                                                                        $("button.remove-to-cart.btn-remove-${cartUserId.id}").click(function (event) {

                                                                            var url = "${urlDto.url}";

                                                                            $.post("/ekka/cart/delete/${cartUserId.id}", {
                                                                                url: url,
                                                                            }, function (data) {
                                                                            }).done(function () {
                                                                            }).fail(function (xhr, textStatus, errorThrown) {
                                                                                toastr.error('Xóa sản phẩm khỏi giỏ hàng thất bại!');

                                                                            }).complete(function () {
                                                                                $("tr.cart-list-${cartUserId.id}").remove();
                                                                                var el = $("tr.cart-list").length;
                                                                                console.log(el);
                                                                                if(el == 0){
                                                                                    console.log(el)
                                                                                    $("div.empty-cart-list").removeClass("d-none");
                                                                                    $("form.ec-show-cart-list").remove();
                                                                                }
                                                                                toastr.success('Xóa sản phẩm khỏi giỏ hàng thành công!');


                                                                            });

                                                                        });
                                                                    });
                                                                </script>

                                                    </td>
                                                </tr>


                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>


                                </div>
                            </div>
                        </div>
                        <!--cart content End -->
                    </div>
                    <!-- Sidebar Area Start -->
                    <div class="ec-cart-rightside col-md-12 col-lg-12 col-xl-4">
                        <div class="ec-sidebar-wrap">
                            <!-- Sidebar Summary Block -->
                            <div class="ec-sidebar-block">
                                <div class="ec-sb-title">
                                    <h3 class="ec-sidebar-title">Đặt hàng</h3>
                                </div>
                                <div class="ec-sb-block-content">
<%--                                    <h4 class="ec-ship-title">Estimate Shipping</h4>--%>
                                    <div class="ec-cart-form">
<%--                                        <p>Enter your destination to get a shipping estimate</p>--%>
                                        <span class="ec-cart-wrap">
                                        <label>Địa chỉ giao hàng (<span class="text-danger">*</span>)</label>
                                        <f:input type="text" cssClass="DeliveryAddress mb-0" path="delivery_address"
                                                 placeholder="Vui lòng nhập địa chỉ giao hàng chính xác..."
                                                 aria-label="Delivery address"/>
                                        <p class="show-delivery-address text-danger">Không thể để trống!</p>
                                        </span>
                                        <span class="ec-cart-wrap">
                                            <label>Họ và tên người nhận hàng (<span class="text-danger">*</span>)</label>
                                        <f:input cssClass="NameConsignee mb-0" type="text" path="name_consignee"
                                                 placeholder="Vui lòng nhập chính xác họ và tên người nhận hàng..."
                                                 aria-label="Name of consignee"/>
                                        <p class="show-name-consignee text-danger">Không thể để trống!</p>

                                        </span>
                                        <span class="ec-cart-wrap">
                                            <label>Số điện thoại người nhận hàng (<span class="text-danger">*</span>)</label>
                                        <f:input cssClass="DeliveryPhone mb-0" type="tel" path="delivery_phone"
                                                 placeholder="Vui lòng nhập chính xác số điện thoại người nhận hàng..."
                                                 pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b"
                                                 aria-label="Delivery phone number"/>
                                        <p class="show-delivery-phone text-danger">Không thể để trống!</p>
                                        </span>

                                        <span class="ec-cart-wrap">
                                            <label>Thanh toán (<span class="text-danger">*</span>)</label>
                                        <f:select cssClass="form-control border" path="payment">
                                            <f:option value="0">Tiền mặt</f:option>
<%--                                            <f:option value="1">Pay</f:option>--%>
                                        </f:select>
                                        </span>
                                    </div>
                                </div>

                                <div class="ec-sb-block-content">
                                    <div class="ec-cart-summary-bottom">
                                        <div class="ec-cart-summary">
                                            <div class="show-sub-total">
                                                <span class="text-left">Tổng cộng</span>
                                                <span class="text-right sub-total">$${totaltotal}</span>
                                            </div>
                                            <div class="ec-cart-summary-total">
                                                <span class="text-left">Tổng tiền cần thanh toán</span>
                                                <span class="text-right all-total">$${totaltotal}</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="ec-cart-update-bottom d-flex flex-column">
                                            <a class="mb-2" href="/ekka/product">Tiếp tục mua sắm</a>
                                            <button type="submit" class="btn btn-primary">Đặt hàng ngay</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Sidebar Summary Block -->
                        </div>
                    </div>
                </f:form>
            </c:if>

        </div>
    </div>
</section>

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


<!-- Vendor JS -->
<%@include file="/WEB-INF/jsp/layout/user/scripts.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

<script>

    $("button.changeColor").click(function () {
        var el = $(this).css('background-color');
        console.log(el);
        $(this).parent().prevAll().last().css('background-color', el);
        $(this).parent().parent().children('input.color').val(el);
    });

    $("button.changeSize").click(function () {
        var el = $(this).text();
        console.log(el);
        $(this).parent().prevAll().last().text(el);
        $(this).parent().parent().children('input.size').val(el);
    });


    $("input.item").change(function (element) {
        var allTotal = 0;
        $("input.item").each(function () {
            var el = $(this).val();
            $(this).parent().parent().children('input.itemProduct').val(el)
            var price = $(this).parents("tr").children('td.price').text();
            var discount = $(this).parents("tr").children('td.discount').text();
            var total = (price * ((100 - discount) / 100)) * el;
            $(this).parent().parent().parent().children('td.total').text('$' + (+total.toFixed(2)));
            $(this).parent().parent().children('input.totalPrice').val((+total.toFixed(2)))
            allTotal += total;
        })

        console.log(+allTotal.toFixed(2))
        $('.ec-cart-summary-total .all-total').text('$' + (+allTotal.toFixed(2)));
        $('.show-sub-total .sub-total').text('$' + (+allTotal.toFixed(2)));

    });

    $("input.DeliveryAddress").change(function (element) {
        var el = $(this).val();
        if (el == "") {
            $('p.show-delivery-address').text(`Can't be left blank!`);
        } else {
            $('p.show-delivery-address').text('');
        }
    });

    $("input.NameConsignee").change(function (element) {
        var el = $(this).val();
        if (el == "") {
            $('p.show-name-consignee').text(`Can't be left blank!`);
        } else {
            $('p.show-name-consignee').text('');
        }
    });

    $("input.DeliveryPhone").change(function (element) {
        var el = $(this).val();
        if (el == "") {
            $('p.show-delivery-phone').text(`Can't be left blank!`);
        } else {
            $('p.show-delivery-phone').text('');
        }
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
        <c:if test="${message_err_empty != null}">
        toastr.error('${message_err_empty}');
        </c:if>
    }
</script>
</body>
</html>