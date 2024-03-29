<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Ekka | Trang chủ.</title>

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

<!-- Category Sidebar start -->
<div class="ec-side-cat-overlay"></div>
<!-- ekka Cart Start -->
<div class="ec-side-cart-overlay"></div>
<!-- ekka Cart End -->

<!-- Category Sidebar start -->
<div class="ec-side-cat-overlay"></div>

<!-- Main Slider Start -->
<div class="sticky-header-next-sec ec-main-slider section section-space-pb">
    <div class="ec-slider swiper-container main-slider-nav main-slider-dot">
        <!-- Main slider -->
        <div class="swiper-wrapper">
            <div class="ec-slide-item swiper-slide d-flex ec-slide-1">
                <div class="container align-self-center">
                    <div class="row">
                        <div class="col-xl-6 col-lg-7 col-md-7 col-sm-7 align-self-center">
                            <div class="ec-slide-content slider-animation">
                                <h1 class="ec-slide-title">Bộ sưu tập thời trang mới</h1>
                                <h2 class="ec-slide-stitle">Ưu đãi giảm giá</h2>
                                <p>Mua ngay kẻo hết.</p>
<%--                                <a href="#" class="btn btn-lg btn-secondary">Order Now</a>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ec-slide-item swiper-slide d-flex ec-slide-2">
                <div class="container align-self-center">
                    <div class="row">
                        <div class="col-xl-6 col-lg-7 col-md-7 col-sm-7 align-self-center">
                            <div class="ec-slide-content slider-animation">
                                <h1 class="ec-slide-title">Bộ tai nghe thuyền</h1>
                                <h2 class="ec-slide-stitle">Ưu đãi giảm giá</h2>
                                <p>Mua ngay kẻo hết.</p>
<%--                                <a href="#" class="btn btn-lg btn-secondary">Order Now</a>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-pagination swiper-pagination-white"></div>
        <div class="swiper-buttons">
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
</div>
<!-- Main Slider End -->

<!-- Product tab Area Start -->
<section class="section ec-product-tab section-space-p" id="collection">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="section-title">
                    <h2 class="ec-bg-title">Bộ Sưu Tập Hàng Đầu Của Chúng Tôi</h2>
                    <h2 class="ec-title">Bộ Sưu Tập Hàng Đầu Của Chúng Tôi</h2>
                    <p class="sub-title">Duyệt bộ sưu tập các sản phẩm hàng đầu</p>
                </div>
            </div>

            <!-- Tab Start -->
            <div class="col-md-12 text-center">
                <ul class="ec-pro-tab-nav nav justify-content-center">
                    <li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" href="#tab-pro-for-all">Tất cả</a></li>
                    <c:forEach items="${listGenderCategory}" var="genderCategory">
                        <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
                                                href="#tab-pro-for-${genderCategory.id}">${genderCategory.genderCategoryName}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <!-- Tab End -->
        </div>
        <div class="row">
            <div class="col">
                <div class="tab-content">
                    <!-- 1st Product tab start -->
                    <div class="tab-pane fade show active" id="tab-pro-for-all">
                        <div class="row">
                            <c:if test="${list.data == []}">
                                <div class="ec-wish-rightside col-lg-12 col-md-12"><p class="emp-wishlist-msg">Sản phẩm trống!</p></div>
                            </c:if>
                            <c:if test="${list.data != []}">
                                <!-- Product Content -->
                                <c:forEach items="${list.data}" var="product">
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 mb-6  ec-product-content"
                                         data-animation="fadeIn">
                                        <div class="ec-product-inner">
                                            <div class="ec-pro-image-outer">
                                                <div class="ec-pro-image">
                                                    <a href="product-detail.html" class="image">
                                                        <img class="main-image"
                                                             src="${product.productImage}" style="height: 355px; width: -webkit-fill-available; object-fit: cover;"
                                                             alt="Product"/>
                                                        <img class="hover-image"
                                                             src="${product.productImage}" style="height: 355px; width: -webkit-fill-available; object-fit: cover;"
                                                             alt="Product"/>
                                                    </a>
                                                    <c:if test="${product.discount > 0}">
                                                        <span class="percentage">${product.discount}%</span>
                                                    </c:if>
                                                    <a href="/ekka/product-details/${product.id}" class="quickview"
                                                       data-link-action="quickview"
                                                       title="Quick view"><img
                                                            src="/user/assets/images/icons/quickview.svg"
                                                            class="svg_img pro_svg"
                                                            alt=""/></a>
                                                    <sec:authorize access="hasAnyRole('ROLE_USER')">
                                                    <div class="ec-pro-actions">
                                                        <c:if test="${product.totalProduct <= 0}">
                                                            <button disabled="disabled" style="background-color: #555555;" type="button" title="Thêm vào giỏ hàng" class="add-to-cart">
                                                                <img style="fill: #FFFFFF;"
                                                                     src="/user/assets/images/icons/cart.svg"
                                                                     class="svg_img pro_svg"
                                                                     alt=""/> Thêm vào giỏ hàng
                                                            </button>
                                                        </c:if>
                                                        <c:if test="${product.totalProduct > 0}">

                                                            <button title="Thêm vào giỏ hàng"
                                                                    class="btn-active-cart-${product.id} add-to-cart btn-save-${product.id}"><img
                                                                    src="/user/assets/images/icons/cart.svg"
                                                                    class="svg_img pro_svg" id="cart-active-${product.id}"
                                                                    alt=""/> Thêm vào giỏ hàng
                                                            </button>
                                                            <c:forEach items="${listCartUserId}" var="cartUser">
                                                                <c:if test="${product.id == cartUser.product.id}">
                                                                    <button disabled="disabled" title="Cart"
                                                                            style="background-color: #3575d4;"
                                                                            class="out-to-cart btn-remove-${cartUser.id}">
                                                                        <img style="fill: #FFFFFF;"
                                                                             src="/user/assets/images/icons/cart.svg"
                                                                             id="cart-active-${cartUser.id}"
                                                                             class="svg_img pro_svg"
                                                                             alt=""/> Xóa khỏi giỏ hàng
                                                                    </button>
                                                                </c:if>
                                                            </c:forEach>
                                                            <script>
                                                                $(document).ready(function () {

                                                                    $("button.btn-save-${product.id}").click(function (event) {

                                                                        var url = "${urlDto.url}";

                                                                        $.post("/ekka/cart/create/${product.id}", {
                                                                            url: url,
                                                                        }, function (data) {
                                                                        }).done(function () {
                                                                        }).fail(function (xhr, textStatus, errorThrown) {
                                                                            toastr.error('Thêm vào giỏ hàng thất bại!');

                                                                        }).complete(function () {
                                                                            $("button.btn-active-cart-${product.id}").css("background-color", "#3575d4");
                                                                            $("#cart-active-${product.id}").css("fill", "#ffffff");
                                                                            $("#cart-gender-active-${product.id}").css("fill", "#ffffff");

                                                                            $("button.add-to-cart.btn-save-${product.id}").removeClass("add-to-cart btn-save-${product.id}").addClass("out-to-cart");
                                                                            $("button.add-to-cart.btn-save-gender-${product.id}").removeClass("add-to-cart btn-save-gender-${product.id}").addClass("out-to-cart");

                                                                            $("button.out-to-cart").prop("disabled", true);

                                                                            toastr.success('Thêm vào giỏ hàng thành công!');


                                                                        });

                                                                    });
                                                                });
                                                            </script>

                                                        </c:if>


                                                            <button class="ec-btn-group wishlist btn-active-${product.id} add-to-wish-list btn-wish-list-${product.id}"
                                                                    title="Wishlist"><img id="wish-list-active-${product.id}"
                                                                    src="/user/assets/images/icons/wishlist.svg"
                                                                    class="svg_img pro_svg" alt=""/></button>
                                                            <c:forEach items="${listWishListUserId}" var="wishListUser">
                                                                <c:if test="${product.id == wishListUser.product.id}">
                                                                    <button disabled="disabled" class="ec-btn-group wishlist" style="background-color: #3575d4; cursor: default;"
                                                                            title="Wishlist"><img style="fill: #FFFFFF;"
                                                                                                  src="/user/assets/images/icons/wishlist.svg"
                                                                                                  class="svg_img pro_svg" alt=""/></button>
                                                                </c:if>
                                                            </c:forEach>
                                                            <script>
                                                                $(document).ready(function () {

                                                                    $("button.add-to-wish-list.btn-wish-list-${product.id}").click(function (event) {

                                                                        var url = "${urlDto.url}";

                                                                        $.post("/ekka/wish-list/create/${product.id}", {
                                                                            url: url,
                                                                        }, function (data) {
                                                                        }).done(function () {
                                                                        }).fail(function (xhr, textStatus, errorThrown) {
                                                                            toastr.error('Thêm vào danh sách yêu thích thất bại!');

                                                                        }).complete(function () {
                                                                            $("button.btn-active-${product.id}").css("background-color", "#3575d4").css("cursor","default");
                                                                            $("#wish-list-active-${product.id}").css("fill", "#ffffff");
                                                                            $("#wish-list-gender-active-${product.id}").css("fill", "#ffffff");

                                                                            $("button.btn-wish-list-${product.id}").removeClass("btn-wish-list-${product.id}").addClass("out-to-wish-list");
                                                                            $("button.add-to-wish-list.btn-wish-list-gender-${product.id}").removeClass("add-to-wish-list btn-wish-list-gender-${product.id}").addClass("out-to-wish-list");
                                                                            $("button.out-to-wish-list").prop("disabled", true);

                                                                            toastr.success('Thêm vào danh sách yêu thích thành công!');


                                                                        });

                                                                    });
                                                                });
                                                            </script>


                                                    </div>
                                                    </sec:authorize>
                                                    <sec:authorize access="!hasAnyRole('ROLE_USER')">
                                                        <div class="ec-pro-actions">
                                                            <f:form method="post" action="/ekka/cart/create/${product.id}" modelAttribute="urlDto">
                                                                <f:input type="text" path="url"
                                                                         value="${urlDto.url}"
                                                                         cssClass="d-none" id="one"/>
                                                                <button type="submit" title="Thêm vào giỏ hàng"
                                                                        class="btn-active-cart-${product.id} add-to-cart btn-save-${product.id}"><img
                                                                        src="/user/assets/images/icons/cart.svg"
                                                                        class="svg_img pro_svg" id="cart-active-${product.id}"
                                                                        alt=""/> Thêm vào giỏ hàng
                                                                </button>
                                                            </f:form>

                                                            <f:form method="post" action="/ekka/wish-list/create/${product.id}" modelAttribute="urlDto">
                                                            <f:input type="text" path="url"
                                                                     value="${urlDto.url}"
                                                                     cssClass="d-none" id="one"/>
                                                            <button type="submit" class="ec-btn-group wishlist btn-active-${product.id} add-to-wish-list btn-wish-list-${product.id}"
                                                                    title="Wishlist"><img id="wish-list-active-${product.id}"
                                                                                          src="/user/assets/images/icons/wishlist.svg"
                                                                                          class="svg_img pro_svg" alt=""/></button>
                                                            </f:form>

                                                        </div>
                                                    </sec:authorize>
                                                </div>
                                            </div>
                                            <div class="ec-pro-content">
                                                <h5 class="ec-pro-title"><a
                                                        href="/ekka/product-details/${product.id}">${product.productName}</a>
                                                </h5>
                                                <div class="ec-pro-rating">
                                                    <c:if test="${product.rating <= 0}">
                                                        <i class="ecicon eci-star"></i>
                                                        <i class="ecicon eci-star"></i>
                                                        <i class="ecicon eci-star"></i>
                                                        <i class="ecicon eci-star"></i>
                                                        <i class="ecicon eci-star"></i>
                                                    </c:if>
                                                    <c:if test="${product.rating > 0 && product.rating < 1}">
                                                        <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                    </c:if>
                                                    <c:if test="${product.rating > 1 && product.rating < 2}">
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                    </c:if>
                                                    <c:if test="${product.rating > 2 && product.rating < 3}">
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                    </c:if>
                                                    <c:if test="${product.rating > 3 && product.rating < 4}">
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                    </c:if>
                                                    <c:if test="${product.rating > 4 && product.rating < 5}">
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                    </c:if>

                                                    <c:if test="${product.rating == 1}">
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                    </c:if>

                                                    <c:if test="${product.rating == 2}">
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                    </c:if>

                                                    <c:if test="${product.rating == 3}">
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                    </c:if>
                                                    <c:if test="${product.rating == 4}">
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star-o"></i>
                                                    </c:if>
                                                    <c:if test="${product.rating == 5}">
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                        <i class="ecicon eci-star fill"></i>
                                                    </c:if>
                                                </div>
                                                <span class="ec-price">
                                                <c:if test="${product.discount > 0}">
                                                    <span class="old-price">$${product.priceProduct}</span>
                                                </c:if>
                                                <span class="new-price">$<fmt:formatNumber maxFractionDigits="2"
                                                                                           value="${product.priceProduct * ((100 - product.discount)/100)}"></fmt:formatNumber></span>
                                            </span>
                                                <div class="ec-pro-option">
                                                    <div class="ec-pro-color">
                                                        <span class="ec-pro-opt-label">Màu</span>
                                                        <ul class="ec-opt-swatch ec-change-img">
                                                            <c:forEach items="${listProductColor}" var="productColor">
                                                                <c:if test="${productColor.product.id == product.id}">
                                                                    <li style="border: 1px solid darkgray;"><a href="#" class="ec-opt-clr-img"
                                                                                                               data-src="${product.productImage}"
                                                                                                               data-src-hover="${product.productImage}"
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
                                                                <c:if test="${productSize.product.id == product.id}">
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
                                <%@include file="/WEB-INF/jsp/layout/user/paging.jsp" %>
<%--                                <div class="col-sm-12 shop-all-btn"><a href="shop-left-sidebar-col-3.html">Shop All--%>
<%--                                    Collection</a></div>--%>
                            </c:if>

                        </div>
                    </div>
                    <!-- ec 1st Product tab end -->
                    <!-- ec 2nd Product tab start -->
                    <c:forEach items="${listGenderCategory}" var="genderCategory">
                        <div class="tab-pane fade" id="tab-pro-for-${genderCategory.id}">
                            <div class="row">
                                <c:if test="${list.data == []}">
                                    <div class="ec-wish-rightside col-lg-12 col-md-12"><p class="emp-wishlist-msg">Danh sách sản phẩm trống!</p></div>
                                </c:if>
                                <c:if test="${list.data != []}">
                                    <!-- Product Content -->
                                    <c:forEach items="${list.data}" var="product">
                                        <c:if test="${genderCategory.id == product.category.genderCategory.id}">
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 mb-6 ec-product-content"
                                                 data-animation="fadeIn">
                                                <div class="ec-product-inner">
                                                    <div class="ec-pro-image-outer">
                                                        <div class="ec-pro-image">
                                                            <a href="product-detail.html" class="image">
                                                                <img class="main-image"
                                                                     src="${product.productImage}" style="height: 355px; width: -webkit-fill-available; object-fit: cover;"
                                                                     alt="Product"/>
                                                                <img class="hover-image"
                                                                     src="${product.productImage}" style="height: 355px; width: -webkit-fill-available; object-fit: cover;"
                                                                     alt="Product"/>
                                                            </a>
                                                            <c:if test="${product.discount > 0}">
                                                                <span class="percentage">${product.discount}%</span>
                                                            </c:if>
                                                            <a href="/ekka/product-details/${product.id}" class="quickview"
                                                               data-link-action="quickview"
                                                               title="Quick view"><img
                                                                    src="/user/assets/images/icons/quickview.svg"
                                                                    class="svg_img pro_svg"
                                                                    alt=""/></a>
                                                            <sec:authorize access="hasAnyRole('ROLE_USER')">
                                                            <div class="ec-pro-actions">
                                                                <c:if test="${product.totalProduct <= 0}">
                                                                    <button disabled="disabled" style="background-color: #555555;" type="button" title="Thêm vào giỏ hàng" class="add-to-cart">
                                                                        <img style="fill: #FFFFFF;"
                                                                             src="/user/assets/images/icons/cart.svg"
                                                                             class="svg_img pro_svg"
                                                                             alt=""/> Thêm vào giỏ hàng
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${product.totalProduct > 0}">

                                                                    <button title="Thêm vào giỏ hàng"
                                                                            class="btn-active-cart-${product.id} add-to-cart btn-save-gender-${product.id}"><img
                                                                            src="/user/assets/images/icons/cart.svg"
                                                                            class="svg_img pro_svg" id="cart-gender-active-${product.id}"
                                                                            alt=""/> Thêm vào giỏ hàng
                                                                    </button>
                                                                    <c:forEach items="${listCartUserId}" var="cartUser">
                                                                        <c:if test="${product.id == cartUser.product.id}">
                                                                            <button disabled="disabled" title="Cart"
                                                                                    style="background-color: #3575d4;"
                                                                                    class="out-to-cart btn-remove-${cartUser.id}">
                                                                                <img src="/user/assets/images/icons/cart.svg"
                                                                                     id="cart-active-${cartUser.id}"
                                                                                     class="svg_img pro_svg" style="fill: #FFFFFF;"
                                                                                     alt=""/> Xóa khỏi giỏ hàng
                                                                            </button>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <script>
                                                                        $(document).ready(function () {

                                                                            $("button.add-to-cart.btn-save-gender-${product.id}").click(function (event) {

                                                                                var url = "${urlDto.url}";

                                                                                $.post("/ekka/cart/create/${product.id}", {
                                                                                    url: url,
                                                                                }, function (data) {
                                                                                }).done(function () {
                                                                                }).fail(function (xhr, textStatus, errorThrown) {
                                                                                    toastr.error('Thêm vào giỏ hàng thất bại!');

                                                                                }).complete(function () {
                                                                                    $("button.btn-active-cart-${product.id}").css("background-color", "#3575d4");
                                                                                    $("#cart-active-${product.id}").css("fill", "#ffffff");
                                                                                    $("#cart-gender-active-${product.id}").css("fill", "#ffffff");

                                                                                    $("button.add-to-cart.btn-save-gender-${product.id}").removeClass("add-to-cart btn-save-gender-${product.id}").addClass("out-to-cart");
                                                                                    $("button.add-to-cart.btn-save-${product.id}").removeClass("add-to-cart btn-save-${product.id}").addClass("out-to-cart");

                                                                                    $("button.out-to-cart").prop("disabled", true);

                                                                                    toastr.success('Thêm vào giỏ hàng thành công!');


                                                                                });

                                                                            });
                                                                        });
                                                                    </script>

                                                                </c:if>

                                                                <button class="ec-btn-group wishlist btn-active-${product.id} add-to-wish-list btn-wish-list-gender-${product.id}"
                                                                        title="Wishlist"><img id="wish-list-gender-active-${product.id}"
                                                                                              src="/user/assets/images/icons/wishlist.svg"
                                                                                              class="svg_img pro_svg" alt=""/></button>
                                                                <c:forEach items="${listWishListUserId}" var="wishListUser">
                                                                    <c:if test="${product.id == wishListUser.product.id}">
                                                                        <button disabled="disabled" class="ec-btn-group wishlist" style="background-color: #3575d4; cursor: default;"
                                                                                title="Wishlist"><img src="/user/assets/images/icons/wishlist.svg"
                                                                                                      class="svg_img pro_svg" style="fill: #FFFFFF;" alt=""/></button>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <script>
                                                                    $(document).ready(function () {

                                                                        $("button.add-to-wish-list.btn-wish-list-gender-${product.id}").click(function (event) {

                                                                            var url = "${urlDto.url}";

                                                                            $.post("/ekka/wish-list/create/${product.id}", {
                                                                                url: url,
                                                                            }, function (data) {
                                                                            }).done(function (response) {
                                                                                console.log(response);
                                                                            }).fail(function (xhr, textStatus, errorThrown) {
                                                                                toastr.error('Thêm vào danh sách yêu thích thất bại!');

                                                                            }).complete(function () {
                                                                                $("button.btn-active-${product.id}").css("background-color", "#3575d4").css("cursor","default");
                                                                                $("#wish-gender-list-active-${product.id}").css("fill", "#ffffff");
                                                                                $("#wish-list-active-${product.id}").css("fill", "#ffffff");

                                                                                $("button.btn-wish-list-${product.id}").removeClass("btn-wish-list-${product.id}").addClass("out-to-wish-list");
                                                                                $("button.add-to-wish-list.btn-wish-list-gender-${product.id}").removeClass("add-to-wish-list btn-wish-list-gender-${product.id}").addClass("out-to-wish-list");
                                                                                $("button.out-to-wish-list").prop("disabled", true);

                                                                                toastr.success('Thêm vào danh sách yêu thích thành công!');


                                                                            });

                                                                        });
                                                                    });
                                                                </script>
                                                            </div>
                                                            </sec:authorize>
                                                            <sec:authorize access="!hasAnyRole('ROLE_USER')">
                                                                <div class="ec-pro-actions">
                                                                    <f:form method="post" action="/ekka/cart/create/${product.id}" modelAttribute="urlDto">
                                                                        <f:input type="text" path="url"
                                                                                 value="${urlDto.url}"
                                                                                 cssClass="d-none" id="one"/>
                                                                        <button type="submit" title="Thêm vào giỏ hàng"
                                                                                class="btn-active-cart-${product.id} add-to-cart btn-save-${product.id}"><img
                                                                                src="/user/assets/images/icons/cart.svg"
                                                                                class="svg_img pro_svg" id="cart-active-${product.id}"
                                                                                alt=""/> Thêm vào giỏ hàng
                                                                        </button>
                                                                    </f:form>

                                                                    <f:form method="post" action="/ekka/wish-list/create/${product.id}" modelAttribute="urlDto">
                                                                        <f:input type="text" path="url"
                                                                                 value="${urlDto.url}"
                                                                                 cssClass="d-none" id="one"/>
                                                                        <button type="submit" class="ec-btn-group wishlist btn-active-${product.id} add-to-wish-list btn-wish-list-${product.id}"
                                                                                title="Wishlist"><img id="wish-list-active-${product.id}"
                                                                                                      src="/user/assets/images/icons/wishlist.svg"
                                                                                                      class="svg_img pro_svg" alt=""/></button>
                                                                    </f:form>

                                                                </div>
                                                            </sec:authorize>
                                                        </div>
                                                    </div>
                                                    <div class="ec-pro-content">
                                                        <h5 class="ec-pro-title"><a
                                                                href="product-detail.html">${product.productName}</a>
                                                        </h5>
                                                        <div class="ec-pro-rating">
                                                            <c:if test="${product.rating <= 0}">
                                                                <i class="ecicon eci-star"></i>
                                                                <i class="ecicon eci-star"></i>
                                                                <i class="ecicon eci-star"></i>
                                                                <i class="ecicon eci-star"></i>
                                                                <i class="ecicon eci-star"></i>
                                                            </c:if>
                                                            <c:if test="${product.rating > 0 && product.rating < 1}">
                                                                <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                            </c:if>
                                                            <c:if test="${product.rating > 1 && product.rating < 2}">
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                            </c:if>
                                                            <c:if test="${product.rating > 2 && product.rating < 3}">
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                            </c:if>
                                                            <c:if test="${product.rating > 3 && product.rating < 4}">
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                            </c:if>
                                                            <c:if test="${product.rating > 4 && product.rating < 5}">
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                            </c:if>

                                                            <c:if test="${product.rating == 1}">
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                            </c:if>

                                                            <c:if test="${product.rating == 2}">
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                            </c:if>

                                                            <c:if test="${product.rating == 3}">
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                            </c:if>
                                                            <c:if test="${product.rating == 4}">
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star-o"></i>
                                                            </c:if>
                                                            <c:if test="${product.rating == 5}">
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                                <i class="ecicon eci-star fill"></i>
                                                            </c:if>
                                                        </div>
                                                        <span class="ec-price">
                                                <span class="old-price">$${product.priceProduct}</span>
                                                <span class="new-price">$<fmt:formatNumber maxFractionDigits="2"
                                                                                           value="${product.priceProduct * ((100 - product.discount)/100)}"></fmt:formatNumber></span>
                                            </span>
                                                        <div class="ec-pro-option">
                                                            <div class="ec-pro-color">
                                                                <span class="ec-pro-opt-label">Màu</span>
                                                                <ul class="ec-opt-swatch ec-change-img">
                                                                    <c:forEach items="${listProductColor}"
                                                                               var="productColor">
                                                                        <c:if test="${productColor.product.id == product.id}">
                                                                            <li style="border: 1px solid darkgray;"><a href="#" class="ec-opt-clr-img"
                                                                                                                       data-src="${product.productImage}"
                                                                                                                       data-src-hover="${product.productImage}"
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
                                                                        <c:if test="${productSize.product.id == product.id}">
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
                                        </c:if>
                                    </c:forEach>
                                    <%@include file="/WEB-INF/jsp/layout/user/paging.jsp" %>
<%--                                    <div class="col-sm-12 shop-all-btn"><a href="shop-left-sidebar-col-3.html">Shop All--%>
<%--                                        Collection</a></div>--%>
                                </c:if>

                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ec Product tab Area End -->

<!--  services Section Start -->
<section class="section ec-services-section section-space-p" id="services">
    <h2 class="d-none">Dịch vụ</h2>
    <div class="container">
        <div class="row">
            <div class="ec_ser_content ec_ser_content_1 col-sm-12 col-md-6 col-lg-3" data-animation="zoomIn">
                <div class="ec_ser_inner">
                    <div class="ec-service-image">
                        <img src="/user/assets/images/icons/service_1.svg" class="svg_img" alt=""/>
                    </div>
                    <div class="ec-service-desc">
                        <h2>Miễn phí vận chuyển</h2>
                        <p>Giao hàng miễn phí cho tất cả đơn hàng tại Việt Nam</p>
                    </div>
                </div>
            </div>
            <div class="ec_ser_content ec_ser_content_2 col-sm-12 col-md-6 col-lg-3" data-animation="zoomIn">
                <div class="ec_ser_inner">
                    <div class="ec-service-image">
                        <img src="/user/assets/images/icons/service_2.svg" class="svg_img" alt=""/>
                    </div>
                    <div class="ec-service-desc">
                        <h2>Hỗ trợ 24X7</h2>
                        <p>Liên hệ với chúng tôi 24 giờ một ngày, 7 ngày một tuần</p>
                    </div>
                </div>
            </div>
            <div class="ec_ser_content ec_ser_content_3 col-sm-12 col-md-6 col-lg-3" data-animation="zoomIn">
                <div class="ec_ser_inner">
                    <div class="ec-service-image">
                        <img src="/user/assets/images/icons/service_3.svg" class="svg_img" alt=""/>
                    </div>
                    <div class="ec-service-desc">
                        <h2>30 ngày trở lại</h2>
                        <p>Chỉ cần trả lại trong vòng 30 ngày để trao đổi</p>
                    </div>
                </div>
            </div>
            <div class="ec_ser_content ec_ser_content_4 col-sm-12 col-md-6 col-lg-3" data-animation="zoomIn">
                <div class="ec_ser_inner">
                    <div class="ec-service-image">
                        <img src="/user/assets/images/icons/service_4.svg" class="svg_img" alt=""/>
                    </div>
                    <div class="ec-service-desc">
                        <h2>Thanh toán an toàn</h2>
                        <p>Liên hệ với chúng tôi 24 giờ một ngày, 7 ngày một tuần</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--services Section End -->

<!--  offer Section Start -->
<section class="section ec-offer-section section-space-p section-space-m">
    <h2 class="d-none">Ưu đãi</h2>
    <div class="container">
        <div class="row justify-content-end">
            <div class="col-xl-6 col-lg-7 col-md-7 col-sm-7 align-self-center ec-offer-content">
                <h2 class="ec-offer-title">Kính râm</h2>
                <h3 class="ec-offer-stitle" data-animation="slideInDown">siêu ưu đãi</h3>
                <span class="ec-offer-img" data-animation="zoomIn"><img src="/user/assets/images/offer-image/1.png"
                                                                        alt="offer image"/></span>
                <span class="ec-offer-desc">Kính râm khung Acetate</span>
                <span class="ec-offer-price">Chỉ $40,00</span>
                <a class="btn btn-primary" href="/ekka/product" data-animation="zoomIn">Mua ngay</a>
            </div>
        </div>
    </div>
</section>
<!-- offer Section End -->

<!-- ec testmonial Start -->
<section class="section ec-test-section section-space-ptb-100 section-space-m" id="rejsp">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="section-title mb-0">
                    <h2 class="ec-bg-title">Testimonial</h2>
                    <h2 class="ec-title">Đánh giá khách hàng</h2>
                    <p class="sub-title mb-3">Khách hàng nói gì về chúng tôi</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="ec-test-outer">
                <ul id="ec-testimonial-slider">
                    <li class="ec-test-item">
                        <img src="/user/assets/images/testimonial/top-quotes.svg" class="svg_img test_svg top" alt=""/>
                        <div class="ec-test-inner">
                            <div class="ec-test-img"><img alt="testimonial" title="testimonial"
                                                          src="/user/assets/images/testimonial/1.jpg"/></div>
                            <div class="ec-test-content">
                                <div class="ec-test-desc">Lorem Ipsum is simply dummy text of the printing and
                                    typesetting industry. Lorem Ipsum has been the industry's standard dummy text
                                    ever since the 1500s, when an unknown printer took a galley of type and
                                    scrambled it to make a type specimen
                                </div>
                                <div class="ec-test-name">John Doe</div>
                                <div class="ec-test-designation">General Manager</div>
                                <div class="ec-test-rating">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                </div>
                            </div>
                        </div>
                        <img src="/user/assets/images/testimonial/bottom-quotes.svg" class="svg_img test_svg bottom"
                             alt=""/>
                    </li>
                    <li class="ec-test-item ">
                        <img src="/user/assets/images/testimonial/top-quotes.svg" class="svg_img test_svg top" alt=""/>
                        <div class="ec-test-inner">
                            <div class="ec-test-img"><img alt="testimonial" title="testimonial"
                                                          src="/user/assets/images/testimonial/2.jpg"/></div>
                            <div class="ec-test-content">
                                <div class="ec-test-desc">Lorem Ipsum is simply dummy text of the printing and
                                    typesetting industry. Lorem Ipsum has been the industry's standard dummy text
                                    ever since the 1500s, when an unknown printer took a galley of type and
                                    scrambled it to make a type specimen
                                </div>
                                <div class="ec-test-name">John Doe</div>
                                <div class="ec-test-designation">General Manager</div>
                                <div class="ec-test-rating">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                </div>
                            </div>
                        </div>
                        <img src="/user/assets/images/testimonial/bottom-quotes.svg" class="svg_img test_svg bottom"
                             alt=""/>
                    </li>
                    <li class="ec-test-item">
                        <img src="/user/assets/images/testimonial/top-quotes.svg" class="svg_img test_svg top" alt=""/>
                        <div class="ec-test-inner">
                            <div class="ec-test-img"><img alt="testimonial" title="testimonial"
                                                          src="/user/assets/images/testimonial/3.jpg"/></div>
                            <div class="ec-test-content">
                                <div class="ec-test-desc">Lorem Ipsum is simply dummy text of the printing and
                                    typesetting industry. Lorem Ipsum has been the industry's standard dummy text
                                    ever since the 1500s, when an unknown printer took a galley of type and
                                    scrambled it to make a type specimen
                                </div>
                                <div class="ec-test-name">John Doe</div>
                                <div class="ec-test-designation">General Manager</div>
                                <div class="ec-test-rating">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                </div>
                            </div>
                        </div>
                        <img src="/user/assets/images/testimonial/bottom-quotes.svg" class="svg_img test_svg bottom"
                             alt=""/>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- ec testmonial end -->

<!-- Ec Brand Section Start -->
<section class="section ec-brand-area section-space-p">
    <h2 class="d-none">Brand</h2>
    <div class="container">
        <div class="row">
            <div class="ec-brand-outer">
                <ul id="ec-brand-slider">
                    <c:forEach items="${listBrand}" var="brand">
                    <li class="ec-brand-item" data-animation="zoomIn">
                        <div class="ec-brand-img"><a href="/ekka/product?page=0&perpage=12&key=&category=&genderCategory=&brand=${brand.nameBrand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}">
                            <img style="height: 110px; object-fit: cover;" alt="brand" title="brand" src="${brand.logo}"/></a>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- Ec Brand Section End -->

<!-- Ec Instagram Start -->
<section class="section ec-instagram-section module section-space-p" id="insta">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="section-title">
                    <h2 class="ec-bg-title">Nguồn cấp dữ liệu Instagram</h2>
                    <h2 class="ec-title">Nguồn cấp dữ liệu Instagram</h2>
                    <p class="sub-title">Chia sẻ sản phẩm của bạn với chúng tôi</p>
                </div>
            </div>
        </div>
    </div>
    <div class="ec-insta-wrapper">
        <div class="ec-insta-outer">
            <div class="container" data-animation="fadeIn">
                <div class="insta-auto">
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/1.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/2.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/3.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/4.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/5.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/6.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/7.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Ec Instagram End -->

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
                                            <input class="ec-email" type="email" required title="Vui lòng nhập Email tại đây..."
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