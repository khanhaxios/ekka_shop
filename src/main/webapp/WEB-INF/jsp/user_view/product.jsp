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
    <title>Ekka | Sản phẩm.</title>

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
<div class="sticky-header-next-sec ec-breadcrumb section-space-mb" style="margin-bottom: 20px!important;">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row ec_breadcrumb_inner">
                    <div class="col-md-6 col-sm-12">
                        <c:if test="${list.brand == null || list.brand == ''}">
                            <c:if test="${list.genderCategory == null || list.genderCategory == '' && list.category == null || list.category == ''}">
                                <h2 class="ec-breadcrumb-title">Shop (${list.total})</h2>
                            </c:if>
                            <c:if test="${list.genderCategory != null && list.genderCategory != '' && list.category != null && list.category != ''}">
                                <h2 class="ec-breadcrumb-title">Shop | ${list.genderCategory} | ${list.category} (${list.total})</h2>
                            </c:if>
                        </c:if>
                        <c:if test="${list.brand != null && list.brand != ''}">
                            <h2 class="ec-breadcrumb-title">Sản phẩm | ${list.brand} (${list.total})</h2>
                        </c:if>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="/ekka">Trang chủ</a></li>
                            <li class="ec-breadcrumb-item active">Sản phẩm</li>
                        </ul>
                        <!-- ec-breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ec breadcrumb end -->

<!-- Ec Shop page -->
<section class="ec-page-content section-space-p" style="padding-top: 0!important;">
    <div class="container">
        <div class="row">
            <c:if test="${list.key != '' && list.key != null}">
                <div class="ec-shop-rightside col-lg-12 col-md-12 my-3">
                    <h4>Kết quả tìm kiếm: <span class="text-info">${list.key}</span> (${list.total})</h4>
                </div>
            </c:if>
            <div class="ec-shop-rightside col-lg-12 col-md-12">
                <!-- Shop Top Start -->
                <div class="ec-pro-list-top d-flex">
                    <div class="col-md-6 ec-grid-list">
                        <div class="ec-gl-btn">
                            <button class="btn sidebar-toggle-icon"><img src="/user/assets/images/icons/filter.svg"
                                                                         class="svg_img gl_svg" alt="filter"/></button>
                            <button class="btn btn-grid-50 active"><img src="/user/assets/images/icons/grid.svg"
                                                                        class="svg_img gl_svg" alt="grid"/></button>
                            <button class="btn btn-list-50"><img src="/user/assets/images/icons/list.svg"
                                                                 class="svg_img gl_svg" alt="list"/></button>
                        </div>
                    </div>
                    <div class="col-md-6 ec-sort-select">
                        <span class="sort-by"></span>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle mr-1" type="button" id="pages" aria-haspopup="true" data-toggle="dropdown"
                                    aria-expanded="false">
                                Số sản phẩm / trang
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="pages">
                                <a class="dropdown-item"
                                   href="/ekka/product?page=1&perpage=4&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${list.sort}" style="${list.perpage == 4 ? "color: #3474d4" : ""}">4</a>
                                <a class="dropdown-item"
                                   href="/ekka/product?page=1&perpage=12&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${list.sort}" style="${list.perpage == 12 ? "color: #3474d4" : ""}">12</a>
                                <a class="dropdown-item"
                                   href="/ekka/product?page=1&perpage=32&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${list.sort}" style="${list.perpage == 32 ? "color: #3474d4" : ""}">32</a>
                                <a class="dropdown-item"
                                   href="/ekka/product?page=1&perpage=48&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${list.sort}" style="${list.perpage == 48 ? "color: #3474d4" : ""}">48</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle ml-1" type="button" id="sort" aria-haspopup="true" data-toggle="dropdown"
                                    aria-expanded="false">
                                Sắp xếp theo
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="sort">
                                <a class="dropdown-item"
                                   href="/ekka/product?page=1&perpage=${list.perpage}&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=AtoZ" style="${list.sort == "AtoZ" ? "color: #3474d4" : ""}">Tên sản phẩm,
                                    A đến Z</a>
                                <a class="dropdown-item"
                                   href="/ekka/product?page=1&perpage=${list.perpage}&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=ZtoA" style="${list.sort == "ZtoA" ? "color: #3474d4" : ""}">Tên sản phẩm,
                                    Z đến A</a>
                                <a class="dropdown-item"
                                   href="/ekka/product?page=1&perpage=${list.perpage}&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=LowToHigh" style="${list.sort == "LowToHigh" ? "color: #3474d4" : ""}">Giá tiền,
                                    Thấp đến Cao</a>
                                <a class="dropdown-item"
                                   href="/ekka/product?page=1&perpage=${list.perpage}&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=HighToLow" style="${list.sort == "HighToLow" ? "color: #3474d4" : ""}">Giá tiền,
                                    Cao đến Thấp</a>
                            </div>
                        </div>
                    </div>

                    <%--                        <div class="ec-select-inner">--%>
                    <%--                            <select name="ec-select" id="ec-select">--%>
                    <%--                                <option selected disabled>Position</option>--%>
                    <%--                                <option value="1">Name, A to Z</option>--%>
                    <%--                                <option value="2"><a href="/ekka/product?page=0&perpage=12&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${ZtoA}">Name, Z to A</a></option>--%>
                    <%--                                <option value="3"><a href="/ekka/product?page=0&perpage=12&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${LowToHigh}">Price, low to high</a></option>--%>
                    <%--                                <option value="4"><a href="/ekka/product?page=0&perpage=12&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${HighToLow}">Price, high to low</a></option>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                </div>
            </div>
            <!-- Shop Top End -->

            <!-- Shop content Start -->
            <div class="shop-pro-content">
                <c:if test="${list.data == []}">
                    <div class="shop-pro-inner">
                        <div class="row">
                            <div class="ec-wish-rightside col-lg-12 col-md-12"><p class="emp-wishlist-msg">Sản phẩm trống!</p></div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${list.data != []}">
                    <div class="shop-pro-inner">
                        <div class="row">


                            <c:forEach items="${list.data}" var="product">
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 mb-6 pro-gl-content">
                                    <div class="ec-product-inner">
                                        <div class="ec-pro-image-outer">
                                            <div class="ec-pro-image">
                                                <a href="product-detail.html" class="image">
                                                    <img class="main-image"
                                                         src="${product.productImage}" alt="Product"
                                                         style="height: 335px; width: 100%; object-fit: cover;"/>
                                                    <img class="hover-image"
                                                         src="${product.productImage}" alt="Product"
                                                         style="height: 335px; width: 100%; object-fit: cover;"/>
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
                                                        <button disabled="disabled" style="background-color: #555555;" type="button"
                                                                title="Thêm vào giỏ hàng" class="add-to-cart">
                                                            <img style="fill: #FFFFFF;"
                                                                 src="/user/assets/images/icons/cart.svg"
                                                                 class="svg_img pro_svg"
                                                                 alt=""/> Thêm vào giỏ hàng
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${product.totalProduct > 0}">

                                                        <button title="Thêm vào giỏ hàng"
                                                                class="add-to-cart btn-save-${product.id}"><img
                                                                src="/user/assets/images/icons/cart.svg"
                                                                id="cart-active-${product.id}"
                                                                class="svg_img pro_svg"
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
                                                                        toastr.error('Thêm sản phẩm vào giỏ hàng thất bại');

                                                                    }).complete(function () {
                                                                        $("button.btn-save-${product.id}").css("background-color", "#3575d4");
                                                                        $("#cart-active-${product.id}").css("fill", "#ffffff");

                                                                        $("button.add-to-cart.btn-save-${product.id}").removeClass("add-to-cart btn-save-${product.id}").addClass("out-to-cart");
                                                                        $("button.out-to-cart").prop("disabled", true);

                                                                        toastr.success('Thêm sản phẩm vào giỏ hàng thành công');


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
                                                                    toastr.error('Thêm sản phẩm yêu thích thất bại');

                                                                }).complete(function () {
                                                                    $("button.btn-active-${product.id}").css("background-color", "#3575d4").css("cursor","default");
                                                                    $("#wish-gender-list-active-${product.id}").css("fill", "#ffffff");
                                                                    $("#wish-list-active-${product.id}").css("fill", "#ffffff");

                                                                    $("button.btn-wish-list-${product.id}").removeClass("btn-wish-list-${product.id}").addClass("out-to-wish-list");
                                                                    $("button.add-to-wish-list.btn-wish-list-gender-${product.id}").removeClass("add-to-wish-list btn-wish-list-gender-${product.id}").addClass("out-to-wish-list");
                                                                    $("button.out-to-wish-list").prop("disabled", true);

                                                                    toastr.success('Thêm sản phẩm yêu thích thành công');


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
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${product.rating > 1 && product.rating < 2}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${product.rating > 2 && product.rating < 3}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${product.rating > 3 && product.rating < 4}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${product.rating > 4 && product.rating < 5}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
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
                                            <div class="ec-pro-list-desc"
                                                 style="margin-left: 0!important;">${product.details}</div>
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
                                                                <li style="border: 1px solid darkgray;"><a href="#"
                                                                                                           class="ec-opt-clr-img"
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

                        </div>
                    </div>
                    <!-- Ec Pagination Start -->
                    <%@include file="/WEB-INF/jsp/layout/user/pagingProduct.jsp" %>
                    <!-- Ec Pagination End -->
                </c:if>
            </div>
            <!--Shop content End -->
        </div>
        <!-- Sidebar Area Start -->
        <div class="filter-sidebar-overlay"></div>
        <div class="ec-shop-leftside filter-sidebar">
            <div class="ec-sidebar-heading">
                <h1>Lọc sản phẩm</h1>
                <a class="filter-cls-btn" href="javascript:void(0)">×</a>
            </div>
            <div class="ec-sidebar-wrap">
                <!-- Sidebar Category Block -->
                <div class="ec-sidebar-block">
                    <div class="ec-sb-title">
                        <h3 class="ec-sidebar-title">Danh mục</h3>
                    </div>
                    <div class="ec-sidebar-block">
                        <div class="ec-sb-block-content">
                            <ul>
                                <li>
                                    <div class="d-flex justify-content-between"><a class="m-0" href="/ekka/product"><img
                                            src="https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/1-all.png?alt=media&token=60e0d390-ad16-4500-879c-9b66ec7c331c"
                                            class="svg_img"
                                            style="width: 25px; border: 1px solid white; padding: 1px;"
                                            alt="drink"/>Tất cả</a>
                                        <p>(${countProduct == null ? 0 : countProduct})</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <c:forEach items="${listGenderCategory}" var="genderCategory">
                            <div class="ec-sb-block-content">
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-block-item d-flex justify-content-between">
                                            <div>
                                            <img src="${genderCategory.genderCategoryLogo}" class="svg_img"
                                                style="width: 25px; border: 1px solid white; padding: 1px;"
                                                 alt="drink">${genderCategory.genderCategoryName}</div>
                                                <div>(${genderCategory.item == null ? 0 : genderCategory.item})</div>

                                        </div>
                                        <ul style="display: none;" class="ec-cat-sub-dropdown">
                                            <c:forEach items="${listCategory}" var="category">
                                                <c:if test="${category.genderCategory.id == genderCategory.id}">
                                                    <li class="py-2 d-flex justify-content-between">
                                                        <div class="ec-sidebar-sub-item"><a
                                                                href="/ekka/product?page=0&perpage=${list.perpage}&key=&category=${category.categoryName}&genderCategory=${genderCategory.genderCategoryName}&brand=&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${list.sort}">${category.categoryName}
                                                            <span
                                                                    title="Available Stock"></span></a>
                                                        </div>
                                                        <div>(${category.item == null ? 0 : category.item})</div>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="ec-sidebar-block">
                    <div class="ec-sb-title">
                        <h3 class="ec-sidebar-title">Nhãn hiệu</h3>
                    </div>
                    <div class="ec-sidebar-block">
                        <div class="ec-sb-block-content">
                            <ul>
                                <c:forEach items="${listBrand}" var="brand">
                                <li>
                                    <div class="d-flex justify-content-between"><a class="m-0" href="/ekka/product?page=0&perpage=${list.perpage}&key=&category=&genderCategory=&brand=${brand.nameBrand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${list.sort}"><img
                                            src="${brand.logo}"
                                            class="svg_img"
                                            style="width: 25px; border: 1px solid white; padding: 1px;"
                                            alt="drink"/>${brand.nameBrand}</a>
                                        <p>(${brand.item == null ? 0 : brand.item})</p>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Sidebar Price Block -->
                <div class="ec-sidebar-block">
                    <div class="ec-sb-title">
                        <h3 class="ec-sidebar-title">Giá tiền</h3>
                    </div>
                    <form action="/ekka/product" method="get">
                        <div class="ec-sb-block-content es-price-slider">
                            <div class="ec-price-filter">
                                <div class="ec-price-input mb-2">
                                    <input class="d-none" name="page" value="${list.page}">
                                    <input class="d-none" name="perpage" value="${list.perpage}">
                                    <input class="d-none" name="key" value="${list.key}">
                                    <input class="d-none" name="category" value="${list.category}">
                                    <input class="d-none" name="genderCategory" value="${list.genderCategory}">
                                    <input class="d-none" name="brand" value="${list.brand}">
                                    <label class="filter__label">$<input type="number" value="<fmt:formatNumber
                                                            maxFractionDigits="0"
                                                            value="${list.firstPrice}"></fmt:formatNumber>"
                                                                         name="firstPrice" id="minVal" min="0"
                                                                         class="filter__input firstPrice"></label>
                                    <span class="ec-price-divider"></span>
                                    <label class="filter__label">$<input type="number" value="<fmt:formatNumber
                                                            maxFractionDigits="0"
                                                            value="${list.lastPrice}"></fmt:formatNumber>"
                                                                         name="lastPrice" id="maxVal" max="999"
                                                                         class="filter__input lastPrice"></label>
                                </div>
                                <button class="btn btn-info py-0 font-weight-bold text-white">Lọc</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
    </div>
</section>
<!-- End Shop page -->

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

<!-- Modal -->
<div class="modal fade" id="ec_quickview_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close qty_close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-5 col-sm-12 col-xs-12">
                        <!-- Swiper -->
                        <div class="qty-product-cover">
                            <div class="qty-slide">
                                <img class="img-responsive" src="/user/assets/images/product-image/3_1.jpg" alt="">
                            </div>
                            <div class="qty-slide">
                                <img class="img-responsive" src="/user/assets/images/product-image/3_2.jpg" alt="">
                            </div>
                            <div class="qty-slide">
                                <img class="img-responsive" src="/user/assets/images/product-image/3_3.jpg" alt="">
                            </div>
                            <div class="qty-slide">
                                <img class="img-responsive" src="/user/assets/images/product-image/3_4.jpg" alt="">
                            </div>
                            <div class="qty-slide">
                                <img class="img-responsive" src="/user/assets/images/product-image/3_5.jpg" alt="">
                            </div>
                        </div>
                        <div class="qty-nav-thumb">
                            <div class="qty-slide">
                                <img class="img-responsive" src="/user/assets/images/product-image/3_1.jpg" alt="">
                            </div>
                            <div class="qty-slide">
                                <img class="img-responsive" src="/user/assets/images/product-image/3_2.jpg" alt="">
                            </div>
                            <div class="qty-slide">
                                <img class="img-responsive" src="/user/assets/images/product-image/3_3.jpg" alt="">
                            </div>
                            <div class="qty-slide">
                                <img class="img-responsive" src="/user/assets/images/product-image/3_4.jpg" alt="">
                            </div>
                            <div class="qty-slide">
                                <img class="img-responsive" src="/user/assets/images/product-image/3_5.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-12 col-xs-12">
                        <div class="quickview-pro-content">
                            <h5 class="ec-quick-title"><a href="product-detail.html">Handbag leather purse for women</a>
                            </h5>
                            <div class="ec-quickview-rating">
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star"></i>
                            </div>

                            <div class="ec-quickview-desc">Lorem Ipsum is simply dummy text of the printing and
                                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever
                                since the 1500s,
                            </div>
                            <div class="ec-quickview-price">
                                <span class="old-price">$100.00</span>
                                <span class="new-price">$80.00</span>
                            </div>

                            <div class="ec-pro-variation">
                                <div class="ec-pro-variation-inner ec-pro-variation-color">
                                    <span>Color</span>
                                    <div class="ec-pro-color">
                                        <ul class="ec-opt-swatch">
                                            <li><span style="background-color:#696d62;"></span></li>
                                            <li><span style="background-color:#d73808;"></span></li>
                                            <li><span style="background-color:#577023;"></span></li>
                                            <li><span style="background-color:#2ea1cd;"></span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="ec-pro-variation-inner ec-pro-variation-size ec-pro-size">
                                    <span>Size</span>
                                    <div class="ec-pro-variation-content">
                                        <ul class="ec-opt-size">
                                            <li class="active"><a href="#" class="ec-opt-sz"
                                                                  data-tooltip="Small">S</a></li>
                                            <li><a href="#" class="ec-opt-sz" data-tooltip="Medium">M</a></li>
                                            <li><a href="#" class="ec-opt-sz" data-tooltip="Large">X</a></li>
                                            <li><a href="#" class="ec-opt-sz" data-tooltip="Extra Large">XL</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="ec-quickview-qty">
                                <div class="qty-plus-minus">
                                    <input class="qty-input" type="text" name="ec_qtybtn" value="1"/>
                                </div>
                                <div class="ec-quickview-cart ">
                                    <button class="btn btn-primary"><img src="/user/assets/images/icons/cart.svg"
                                                                         class="svg_img pro_svg" alt=""/> Thêm vào giỏ hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal end -->

<!-- Footer navigation panel for responsive display -->
<%@include file="/WEB-INF/jsp/layout/user/footer.jsp" %>
<!-- Footer navigation panel for responsive display end -->

<!-- Vendor JS -->
<%@include file="/WEB-INF/jsp/layout/user/scripts.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

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
<%--<script>--%>
<%--    $("input.firstPrice").change(function (element) {--%>
<%--        var el = $(this).val();--%>
<%--            console.log(el);--%>
<%--        window.location = "/ekka/${list.path}?page=1&perpage=${list.perpage}&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&firstPrice="+el+"&lastPrice=${list.lastPrice}";--%>
<%--    });--%>
<%--    $("input.lastPrice").change(function (element) {--%>
<%--        var el = $(this).val();--%>
<%--            console.log(el);--%>
<%--        window.location = "/ekka/${list.path}?page=1&perpage=${list.perpage}&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&firstPrice=${list.firstPrice}&lastPrice="+el+"";--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>