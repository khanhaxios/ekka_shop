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
    <title>Ekka | Sản phẩm yêu thích (${countWishList}).</title>

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
                        <h2 class="ec-breadcrumb-title">Sản phẩm yêu thích</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="/ekka">Trang chủ</a></li>
                            <li class="ec-breadcrumb-item active">Sản phẩm yêu thích</li>
                        </ul>
                        <!-- ec-breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ec breadcrumb end -->

<!-- Ec Wishlist page -->
<section class="ec-page-content section-space-p" style="padding-top: 0!important;">
    <div class="container">
        <div class="row">
            <c:if test="${listWishListUserId == []}">
                <div class="ec-wish-rightside col-lg-12 col-md-12"><p class="emp-wishlist-msg">Không có sản phẩm yêu thích!</p></div>
            </c:if>
            <div class="ec-wish-rightside col-lg-12 col-md-12 empty-wish-list d-none"><p class="emp-wishlist-msg">Không có sản phẩm yêu thích!</p></div>
            <!-- Compare Content Start -->
            <div class="ec-wish-rightside col-lg-12 col-md-12 ec-show-wish-list">
                <!-- Compare content Start -->
                <div class="ec-compare-content">
                    <div class="ec-compare-inner">
                        <div class="row margin-minus-b-30">
                            <c:forEach items="${listWishListUserId}" var="wishList">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-6 mb-6 pro-gl-content wish-list wish-list-${wishList.product.id}">
                                    <div class="ec-product-inner">
                                        <div class="ec-pro-image-outer">
                                            <div class="ec-pro-image">
                                                <a href="product-detail.html" class="image">
                                                    <img class="main-image"
                                                         src="${wishList.product.productImage}" alt="Product"
                                                         style="height: 335px; width: 100%; object-fit: cover;"/>
                                                    <img class="hover-image"
                                                         src="${wishList.product.productImage}" alt="Product"
                                                         style="height: 335px; width: 100%; object-fit: cover;"/>
                                                </a>
                                                <span class="ec-com-remove">
                                                    <c:forEach items="${listWishListUserId}" var="wishListUser">
                                                        <c:if test="${wishList.product.id == wishListUser.product.id}">
                                                                <button class="text-white remove-to-wish-list x-wish-list-${wishListUser.id}"/>
                                                                x</button>

                                                                <script>
                                                        $(document).ready(function () {

                                                            $("button.remove-to-wish-list.x-wish-list-${wishListUser.id}").click(function (event) {

                                                                var url = "${urlDto.url}";

                                                                $.post("/ekka/wish-list/delete/${wishListUser.id}", {
                                                                    url: url,
                                                                }, function (data) {
                                                                }).done(function () {
                                                                }).fail(function (xhr, textStatus, errorThrown) {
                                                                    toastr.error('Xóa sản phẩm yêu thích thất bại!');
                                                                }).complete(function () {
                                                                    $("div.wish-list-${wishList.product.id}").remove();
                                                                    var el = $("div.wish-list").length;
                                                                    console.log(el);
                                                                    if(el == 0){
                                                                        console.log(el)
                                                                        $("div.empty-wish-list").removeClass("d-none");
                                                                        $("div.ec-show-wish-list").remove();
                                                                    }
                                                                    toastr.success('Xóa sản phẩm yêu thích thành công!');
                                                                });
                                                            });
                                                        });
                                                    </script>
                                                        </c:if>
                                                    </c:forEach>

                                                </span>
                                                <c:if test="${wishList.product.discount > 0}">
                                                    <span class="percentage">${wishList.product.discount}%</span>
                                                </c:if>
                                                <a href="/ekka/product-details/${wishList.product.id}" class="quickview"
                                                   data-link-action="quickview"
                                                   title="Quick view"><img
                                                        src="/user/assets/images/icons/quickview.svg"
                                                        class="svg_img pro_svg"
                                                        alt=""/></a>
                                                <div class="ec-pro-actions">
                                                    <c:if test="${wishList.product.totalProduct <= 0}">
                                                        <button disabled="disabled" style="background-color: #555555;"
                                                                type="button"
                                                                title="Thêm sản phẩm vào giỏ hàng" class="out-to-cart">
                                                            <img style="fill: #FFFFFF;"
                                                                 src="/user/assets/images/icons/cart.svg"
                                                                 class="svg_img pro_svg"
                                                                 alt=""/> Thêm sản phẩm vào giỏ hàng
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${wishList.product.totalProduct > 0}">

                                                        <button title="Thêm sản phẩm vào giỏ hàng"
                                                                class="add-to-cart btn-save-${wishList.product.id}"><img
                                                                src="/user/assets/images/icons/cart.svg"
                                                                id="cart-active-${wishList.product.id}"
                                                                class="svg_img pro_svg"
                                                                alt=""/> Thêm sản phẩm vào giỏ hàng
                                                        </button>
                                                        <c:forEach items="${listCartUserId}" var="cartUser">
                                                            <c:if test="${wishList.product.id == cartUser.product.id}">
                                                                <button disabled="disabled" title="Cart"
                                                                        style="background-color: #3575d4;"
                                                                        class="out-to-cart btn-remove-${cartUser.id}">
                                                                    <img style="fill: #FFFFFF;"
                                                                         src="/user/assets/images/icons/cart.svg"
                                                                         id="cart-active-${cartUser.id}"
                                                                         class="svg_img pro_svg"
                                                                         alt=""/> Xóa sản phẩm khỏi giỏ hàng
                                                                </button>
                                                            </c:if>
                                                        </c:forEach>
                                                        <script>
                                                            $(document).ready(function () {

                                                                $("button.btn-save-${wishList.product.id}").click(function (event) {

                                                                    var url = "${urlDto.url}";

                                                                    $.post("/ekka/cart/create/${wishList.product.id}", {
                                                                        url: url,
                                                                    }, function (data) {
                                                                    }).done(function (response) {
                                                                        $("button.btn-save-${wishList.product.id}").css("background-color", "#3575d4");
                                                                        $("#cart-active-${wishList.product.id}").css("fill", "#ffffff");

                                                                        $("button.add-to-cart.btn-save-${wishList.product.id}").removeClass("add-to-cart btn-save-${wishList.product.id}").addClass("out-to-cart");
                                                                        $("button.out-to-cart").prop("disabled", true);

                                                                        toastr.success('Thêm sản phẩm vào giỏ hàng thành công!');
                                                                        console.log(response)
                                                                    }).fail(function (xhr, textStatus, errorThrown) {
                                                                        console.log({xhr,textStatus,errorThrown})
                                                                        toastr.error('Thêm sản phẩm vào giỏ hàng thất bại!');

                                                                    });

                                                                });
                                                            });
                                                        </script>

                                                    </c:if>

                                                    <c:forEach items="${listWishListUserId}" var="wishListUser">
                                                        <c:if test="${wishList.product.id == wishListUser.product.id}">
                                                            <button class="ec-btn-group wishlist active remove-to-wish-list remove-wish-list-${wishListUser.id}"
                                                                    title="Wishlist" style="background-color: #3575d4;"><img
                                                                    src="/user/assets/images/icons/wishlist.svg"
                                                                    class="svg_img pro_svg" style="fill: #ffffff;" alt=""/></button>
                                                            <script>
                                                                $(document).ready(function () {

                                                                    $("button.remove-to-wish-list.remove-wish-list-${wishListUser.id}").click(function (event) {

                                                                        var url = "${urlDto.url}";

                                                                        $.post("/ekka/wish-list/delete/${wishListUser.id}", {
                                                                            url: url,
                                                                        }, function (data) {
                                                                        }).done(function () {
                                                                        }).fail(function (xhr, textStatus, errorThrown) {
                                                                            toastr.error('Xóa sản phẩm yêu thích thất bại!');
                                                                        }).complete(function () {
                                                                            $("div.wish-list-${wishList.product.id}").remove();
                                                                            var el = $("div.wish-list").length;
                                                                            console.log(el);
                                                                            if(el == 0){
                                                                                console.log(el)
                                                                                $("div.empty-wish-list").removeClass("d-none");
                                                                                $("div.ec-show-wish-list").remove();
                                                                            }
                                                                            toastr.success('Xóa sản phẩm yêu thích thành công!');
                                                                        });
                                                                    });
                                                                });
                                                            </script>

                                                        </c:if>
                                                    </c:forEach>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="ec-pro-content">
                                            <h5 class="ec-pro-title"><a
                                                    href="/ekka/product-details/${wishList.product.id}">${wishList.product.productName}</a>
                                            </h5>
                                            <div class="ec-pro-rating">
                                                <c:if test="${wishList.product.rating <= 0}">
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating > 0 && wishList.product.rating < 1}">
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating > 1 && wishList.product.rating < 2}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating > 2 && wishList.product.rating < 3}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating > 3 && wishList.product.rating < 4}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating > 4 && wishList.product.rating < 5}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                </c:if>

                                                <c:if test="${wishList.product.rating == 1}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>

                                                <c:if test="${wishList.product.rating == 2}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>

                                                <c:if test="${wishList.product.rating == 3}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating == 4}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating == 5}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                </c:if>
                                            </div>
                                            <div class="ec-pro-list-desc"
                                                 style="margin-left: 0!important;">${wishList.product.details}</div>
                                            <span class="ec-price">
                                            <c:if test="${wishList.product.discount > 0}">
                                                <span class="old-price">$${wishList.product.priceProduct}</span>
                                            </c:if>
                                                <span class="new-price">$<fmt:formatNumber maxFractionDigits="2"
                                                                                           value="${wishList.product.priceProduct * ((100 - wishList.product.discount)/100)}"></fmt:formatNumber></span>
                                            </span>
                                            <div class="ec-pro-option">
                                                <div class="ec-pro-color">
                                                    <span class="ec-pro-opt-label">Màu</span>
                                                    <ul class="ec-opt-swatch ec-change-img">
                                                        <c:forEach items="${listProductColor}" var="productColor">
                                                            <c:if test="${productColor.product.id == wishList.product.id}">
                                                                <li style="border: 1px solid darkgray;"><a href="#"
                                                                                                           class="ec-opt-clr-img"
                                                                                                           data-src="${wishList.product.productImage}"
                                                                                                           data-src-hover="${wishList.product.productImage}"
                                                                                                           data-tooltip="Gray"><span
                                                                        style="background-color:${productColor.colorName};"></span></a>
                                                                </li>
                                                            </c:if>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                                <div class="ec-pro-size">
                                                    <span class="ec-pro-opt-label">Kích cỡ</span>
                                                    <ul class="ec-opt-size">
                                                        <c:forEach items="${listProductSize}" var="productSize">
                                                            <c:if test="${productSize.product.id == wishList.product.id}">
                                                                <li><a href="#" class="ec-opt-sz"
                                                                       data-tooltip="Small">${productSize.sizeName}</a>
                                                                </li>
                                                            </c:if>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!--compare content End -->
            </div>
            <!-- Compare Content end -->
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