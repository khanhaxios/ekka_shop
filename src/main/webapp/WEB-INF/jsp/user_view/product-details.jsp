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
    <title>Ekka | Sản phẩm | ${productDto.productName}.</title>

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
                        <h2 class="ec-breadcrumb-title">Chi tiết sản phẩm</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="index.html">Trang chủ</a></li>
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

<!-- Sart Single product -->
<section class="ec-page-content section-space-p" style="padding-top: 0!important;">
    <div class="container">
        <div class="row">
            <div class="ec-pro-rightside ec-common-rightside col-lg-12 col-md-12">

                <!-- Single product content Start -->
                <div class="single-pro-block">
                    <div class="single-pro-inner">
                        <div class="row">
                            <div class="single-pro-img single-pro-img-no-sidebar">
                                <div class="single-product-scroll">
                                    <div class="single-product-cover">
                                        <c:forEach items="${listProductImage}" var="productImage">
                                            <c:if test="${productDto.id == productImage.product.id}">
                                                <div class="single-slide zoom-image-hover">
                                                    <img class="img-responsive" src="${productImage.image}"
                                                         alt="">
                                                </div>
                                            </c:if>

                                        </c:forEach>

                                    </div>
                                    <div class="single-nav-thumb">
                                        <c:forEach items="${listProductImage}" var="productImage">
                                            <c:if test="${productDto.id == productImage.product.id}">
                                                <div class="single-slide">
                                                    <img class="img-responsive" src="${productImage.image}"
                                                         alt="">
                                                </div>
                                            </c:if>

                                        </c:forEach>


                                    </div>
                                </div>
                            </div>
                            <div class="single-pro-desc single-pro-desc-no-sidebar">
                                <div class="single-pro-content">
                                    <h5 class="ec-single-title">${productDto.productName}</h5>
                                    <div class="ec-single-rating-wrap">
                                        <div class="ec-single-rating">
                                            <c:if test="${review_rating <= 0}">
                                                <i class="ecicon eci-star"></i>
                                                <i class="ecicon eci-star"></i>
                                                <i class="ecicon eci-star"></i>
                                                <i class="ecicon eci-star"></i>
                                                <i class="ecicon eci-star"></i>
                                            </c:if>
                                            <c:if test="${review_rating > 0 && review_rating < 1}">
                                                <i style="color: #ff6262;opacity: 0.7;"
                                                   class="ecicon eci-star-half-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                            </c:if>
                                            <c:if test="${review_rating > 1 && review_rating < 2}">
                                                <i class="ecicon eci-star fill"></i>
                                                <i style="color: #ff6262;opacity: 0.7;"
                                                   class="ecicon eci-star-half-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                            </c:if>
                                            <c:if test="${review_rating > 2 && review_rating < 3}">
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i style="color: #ff6262;opacity: 0.7;"
                                                   class="ecicon eci-star-half-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                            </c:if>
                                            <c:if test="${review_rating > 3 && review_rating < 4}">
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i style="color: #ff6262;opacity: 0.7;"
                                                   class="ecicon eci-star-half-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                            </c:if>
                                            <c:if test="${review_rating > 4 && review_rating < 5}">
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i style="color: #ff6262;opacity: 0.7;"
                                                   class="ecicon eci-star-half-o"></i>
                                            </c:if>

                                            <c:if test="${review_rating == 1}">
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                            </c:if>

                                            <c:if test="${review_rating == 2}">
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                            </c:if>

                                            <c:if test="${review_rating == 3}">
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star-o"></i>
                                                <i class="ecicon eci-star-o"></i>
                                            </c:if>
                                            <c:if test="${review_rating == 4}">
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star-o"></i>
                                            </c:if>
                                            <c:if test="${review_rating == 5}">
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                                <i class="ecicon eci-star fill"></i>
                                            </c:if>
                                        </div>
                                        (${review_rating} <i class="ecicon eci-star fill"></i>) (${countReviewProduct}
                                        đánh giá)
                                    </div>
                                    <div class="ec-single-desc">${productDto.details}</div>
                                    <div class="ec-single-price-stoke">
                                        <div class="ec-single-price">
                                            <c:if test="${productDto.discount == null || productDto.discount <= 0}">
                                                <p class="product-price pb-0">Giá cả: <span
                                                        style="font-size:20px!important; font-weight: bold!important; color: #1d8a5b!important">$${productDto.priceProduct}</span>
                                                </p>
                                            </c:if>
                                            <c:if test="${productDto.discount > 0}">
                                                <p class="product-price text-decoration-line-through pb-0"
                                                   style="color: #f64400!important;">Giá ban đầu:
                                                    $${productDto.priceProduct}<span class="badge"
                                                                                     style="color: #ffffff; background-color: #76b6be; top: -7px; position: relative ; padding: 0.2em 0.3em;">-${productDto.discount}%</span>
                                                </p>
                                                <p class="product-price new-price">Sau khi giảm giá: <span
                                                        style="font-size:20px!important; font-weight: bold!important; color: #1d8a5b!important">$<fmt:formatNumber
                                                        maxFractionDigits="2"
                                                        value="${productDto.priceProduct * ((100 - productDto.discount)/100)}"></fmt:formatNumber></span>
                                                </p>
                                            </c:if>
                                        </div>
                                        <c:if test="${productDto.totalProduct <= 0}">
                                            <div class="ec-single-stoke">
                                                <p class="product-sku pb-1">( <span style="color: red;">Hết hàng</span> )</p>

                                            </div>
                                        </c:if>
                                        <c:if test="${productDto.totalProduct > 0}">
                                            <div class="ec-single-stoke">
                                                <p class="product-sku pb-1">Số lượng: ${productDto.totalProduct}</p>

                                            </div>
                                        </c:if>

                                    </div>


                                    <div class="ec-pro-variation">
                                        <div class="ec-pro-variation-inner ec-pro-variation-size">
                                            <span>Kích cỡ</span>
                                            <div id="size" class="ec-pro-variation-content">
                                                <ul>
                                                    <c:forEach items="${listProductSize}" var="productSize">
                                                        <c:if test="${productDto.id == productSize.product.id}">
                                                            <li class="size"><span>${productSize.sizeName}</span></li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="ec-pro-variation-inner ec-pro-variation-color">
                                            <span>Màu sắc</span>
                                            <div id="color" class="ec-pro-variation-content">
                                                <ul>
                                                    <c:forEach items="${listProductColor}" var="productColor">
                                                        <c:if test="${productDto.id == productColor.product.id}">
                                                            <li class="color"><span
                                                                    style="background-color:${productColor.colorName};"></span>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ec-single-qty">
                                        <div class="form-group">
                                            <input id="item" class="form-control px-3 py-0"
                                                   style="height: 40px!important;min-height: 40px!important; width: 75px;"
                                                   type="number" min="1" max="${productDto.totalProduct}" value="1"/>
                                        </div>
                                        <sec:authorize access="hasAnyRole('ROLE_USER')">
                                            <c:if test="${productDto.totalProduct <= 0}">
                                                <div class="ec-single-cart ">
                                                    <button type="button" class="btn btn-dark">Hết hàng</button>
                                                </div>
                                            </c:if>
                                            <c:if test="${productDto.totalProduct > 0}">
                                                <div class="ec-single-cart ">
                                                    <c:if test="${listCartProductIdAndUserId != []}">
                                                        <c:forEach items="${listCartUserId}" var="cartUser">

                                                            <c:if test="${productDto.id == cartUser.product.id && UserId == cartUser.user.id}">
                                                                <f:form method="post"
                                                                        action="/ekka/cart/delete/${cartUser.id}"
                                                                        modelAttribute="urlDto">
                                                                    <f:input type="text" path="url"
                                                                             value="${urlDto.url}"
                                                                             cssClass="d-none"/>

                                                                    <button type="submit" class="btn btn-dark"> Xóa khỏi giỏ hàng</button>

                                                                </f:form>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>


                                                    <c:if test="${listCartProductIdAndUserId == []}">
                                                        <f:form method="post"
                                                                action="/ekka/cart/create-cart-detail/${productDto.id}"
                                                                modelAttribute="addCartDto">
                                                            <f:input id="inputColor" type="text" path="color_product"
                                                                     cssClass="d-none"/>
                                                            <f:input id="inputSize" type="text" path="size_product"
                                                                     cssClass="d-none"/>
                                                            <f:input id="inputItem" type="number" path="item" value="1"
                                                                     cssClass="d-none"/>

                                                            <button type="submit" class="btn btn-primary">Thêm vào giỏ hàng
                                                            </button>
                                                        </f:form>
                                                    </c:if>
                                                </div>
                                            </c:if>
                                            <div class="ec-single-wishlist">
                                                <c:if test="${listWishListProductIdAndUserId != []}">
                                                    <c:forEach items="${listWishListUserId}" var="wishListUser">
                                                        <c:if test="${productDto.id == wishListUser.product.id && UserId == wishListUser.user.id}">
                                                            <f:form method="post"
                                                                    action="/ekka/wish-list/delete/${wishListUser.id}"
                                                                    modelAttribute="urlDto">
                                                                <f:input type="text" path="url" value="${urlDto.url}"
                                                                         cssClass="d-none"/>

                                                                <button type="submit"
                                                                        class="ec-btn-group wishlist"
                                                                        style="color: #ffffff; background-color: #3474d4; border-color: #3474d4;"
                                                                        title="Wishlist"><img
                                                                        src="/user/assets/images/icons/wishlist.svg"
                                                                        class="svg_img pro_svg" style="fill: #FFFFFF"
                                                                        alt=""/></button>
                                                            </f:form>

                                                        </c:if>

                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${listWishListProductIdAndUserId == []}">
                                                    <f:form method="post"
                                                            action="/ekka/wish-list/create/${productDto.id}"
                                                            modelAttribute="urlDto">
                                                        <f:input type="text" path="url" value="${urlDto.url}"
                                                                 cssClass="d-none"/>

                                                        <button type="submit"
                                                                class="ec-btn-group wishlist"
                                                                title="Wishlist"><img
                                                                src="/user/assets/images/icons/wishlist.svg"
                                                                class="svg_img pro_svg" alt=""/></button>
                                                    </f:form>

                                                </c:if>
                                            </div>
                                        </sec:authorize>
                                        <sec:authorize access="hasAnyRole('ROLE_ANONYMOUS')">
                                            <c:if test="${productDto.totalProduct <= 0}">
                                                <div class="ec-single-cart ">
                                                    <button type="button" class="btn btn-dark">Hết hàng</button>
                                                </div>
                                            </c:if>
                                            <c:if test="${productDto.totalProduct > 0}">
                                                <div class="ec-single-cart ">
                                                    <f:form method="post"
                                                            action="/ekka/cart/create-cart-detail/${productDto.id}"
                                                            modelAttribute="addCartDto">
                                                        <f:input id="inputColor" type="text" path="color_product"
                                                                 cssClass="d-none"/>
                                                        <f:input id="inputSize" type="text" path="size_product"
                                                                 cssClass="d-none"/>
                                                        <f:input id="inputItem" type="number" path="item" value="1"
                                                                 cssClass="d-none"/>

                                                        <button type="submit" class="btn btn-primary">Thêm vào giỏ hàng
                                                        </button>
                                                    </f:form>
                                                </div>
                                            </c:if>
                                            <div class="ec-single-wishlist">
                                                <f:form method="post"
                                                        action="/ekka/wish-list/create/${productDto.id}"
                                                        modelAttribute="urlDto">
                                                    <f:input type="text" path="url" value="${urlDto.url}"
                                                             cssClass="d-none"/>

                                                    <button type="submit"
                                                            class="ec-btn-group wishlist"
                                                            title="Wishlist"><img
                                                            src="/user/assets/images/icons/wishlist.svg"
                                                            class="svg_img pro_svg" alt=""/></button>
                                                </f:form>
                                            </div>
                                        </sec:authorize>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Single product content End -->
                <!-- Single product tab start -->
                <div class="ec-single-pro-tab">
                    <div class="ec-single-pro-tab-wrapper">
                        <div class="ec-single-pro-tab-nav">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-bs-toggle="tab"
                                       data-bs-target="#ec-spt-nav-details" role="tablist">Chi tiết sản phẩm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" data-bs-target="#ec-spt-nav-info"
                                       role="tablist">Thông tin thêm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" data-bs-target="#ec-spt-nav-review"
                                       role="tablist">Đánh giá của khách hàng <span>(${review_rating} <i class="ecicon eci-star fill" style="display: contents;"></i>) (${countReviewProduct} đánh giá)</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content  ec-single-pro-tab-content">
                            <div id="ec-spt-nav-details" class="tab-pane fade show active">
                                <div class="ec-single-pro-tab-desc">
                                    <p>${productDto.details}
                                    </p>
                                </div>
                            </div>
                            <div id="ec-spt-nav-info" class="tab-pane fade">
                                <div class="ec-single-pro-tab-moreinfo">
                                    ${productDto.moreInformation}
                                </div>
                            </div>

                            <div id="ec-spt-nav-review" class="tab-pane fade">
                                <div class="row">
                                    <div class="ec-t-review-wrapper">
                                        <c:if test="${listReview == []}">
                                            <div class="ec-t-review-item">
                                                <h6>Hãy là người đầu tiên đánh giá sản phẩm này!</h6>
                                            </div>
                                        </c:if>
                                        <c:if test="${listReview != []}">
                                            <c:forEach items="${listReview}" var="review">
                                                <div class="ec-t-review-item">
                                                    <div class="ec-t-review-avtar">
                                                        <img style="border-radius: 50%;" src="${review.user.avatar}"
                                                             alt=""/>
                                                    </div>
                                                    <div class="ec-t-review-content">
                                                        <div class="ec-t-review-top">
                                                            <div class="ec-t-review-name"><i class="ecicon eci-clock-o mr-1"></i><fmt:formatDate pattern = "kk:mm"
                                                                                                                                                 value = "${review.created_at}"/><i class="ecicon eci-calendar ml-2 mr-1"></i><fmt:formatDate pattern = "dd/MM/yyyy"
                                                                                                                                                                     value = "${review.created_at}"/></div>
                                                            <div class="ec-t-review-name">${review.user.fullName}</div>
                                                            <div class="ec-t-review-rating">
                                                                <c:if test="${review.rating == 1}">
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star-o"></i>
                                                                    <i class="ecicon eci-star-o"></i>
                                                                    <i class="ecicon eci-star-o"></i>
                                                                    <i class="ecicon eci-star-o"></i>
                                                                </c:if>
                                                                <c:if test="${review.rating == 2}">
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star-o"></i>
                                                                    <i class="ecicon eci-star-o"></i>
                                                                    <i class="ecicon eci-star-o"></i>
                                                                </c:if>
                                                                <c:if test="${review.rating == 3}">
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star-o"></i>
                                                                    <i class="ecicon eci-star-o"></i>
                                                                </c:if>
                                                                <c:if test="${review.rating == 4}">
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star-o"></i>
                                                                </c:if>
                                                                <c:if test="${review.rating == 5}">
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star fill"></i>
                                                                    <i class="ecicon eci-star fill"></i>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                        <div class="ec-t-review-bottom">
                                                            <p>
                                                                    ${review.comment}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="ec-ratting-content">
                                        <h3>Đánh giá sản phẩm</h3>
                                        <div class="ec-ratting-form">
                                            <sec:authorize access="hasAnyRole('ROLE_USER')">
                                                <c:if test="${listReviewProductAndUser != []}">
                                                    <div class="ec-ratting-star">
                                                        <h6>Bạn đã đánh giá sản phẩm này!</h6>
                                                    </div>
                                                </c:if>
                                                <c:if test="${listReviewProductAndUser == []}">
                                                    <f:form action="/ekka/review/create/${productDto.id}" method="post"
                                                            modelAttribute="reviewDto">

                                                        <div class="ec-ratting-star">
                                                            <span>Đánh giá của bạn:</span>
                                                            <div class="review">
                                                                <i class="ecicon eci-star fill" id="st1"></i>
                                                                <i class="ecicon eci-star fill" id="st2"></i>
                                                                <i class="ecicon eci-star fill" id="st3"></i>
                                                                <i class="ecicon eci-star fill" id="st4"></i>
                                                                <i class="ecicon eci-star fill" id="st5"></i>
                                                            </div>
                                                        </div>
                                                        <div class="ec-ratting-input form-submit">
                                                            <f:input cssClass="d-none" id="ratingInput" type="text"
                                                                     path="rating" value="5"
                                                                     required="required"></f:input>
                                                            <f:textarea path="comment" placeholder="Nhập bình luận của bạn..."
                                                                        required="required"></f:textarea>
                                                            <button class="btn btn-primary" type="submit"
                                                                    value="Submit">Đánh giá ngay
                                                            </button>
                                                        </div>
                                                    </f:form>

                                                </c:if>
                                            </sec:authorize>
                                            <sec:authorize access="hasAnyRole('ROLE_ANONYMOUS')">
                                                <f:form action="/ekka/review/create/${productDto.id}" method="post"
                                                        modelAttribute="reviewDto">

                                                    <div class="ec-ratting-star">
                                                        <span>Đánh giá của bạn:</span>
                                                        <div class="review">
                                                            <i class="ecicon eci-star fill" id="st1"></i>
                                                            <i class="ecicon eci-star fill" id="st2"></i>
                                                            <i class="ecicon eci-star fill" id="st3"></i>
                                                            <i class="ecicon eci-star fill" id="st4"></i>
                                                            <i class="ecicon eci-star fill" id="st5"></i>
                                                        </div>
                                                    </div>
                                                    <div class="ec-ratting-input form-submit">
                                                        <f:input cssClass="d-none" id="ratingInput" type="text"
                                                                 path="rating" value="5" required="required"></f:input>
                                                        <f:textarea path="comment" placeholder="Nhập bình luận của bạn..."
                                                                    required="required"></f:textarea>
                                                        <button class="btn btn-primary" type="submit"
                                                                value="Submit">Đánh giá ngay
                                                        </button>
                                                    </div>
                                                </f:form>
                                            </sec:authorize>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- product details description area end -->
            </div>

        </div>
    </div>
</section>
<!-- End Single product -->

<!-- Related Product Start -->
<section class="section ec-releted-product section-space-p">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="section-title">
                    <h2 class="ec-bg-title">Những sản phẩm liên quan</h2>
                    <h2 class="ec-title">Những sản phẩm liên quan</h2>
                    <p class="sub-title">Duyệt bộ sưu tập các sản phẩm hàng đầu</p>
                </div>
            </div>
        </div>
        <div class="row margin-minus-b-30 owl-carousel">

            <!-- Related Product Content -->
            <c:forEach items="${listProductCategory}" var="productCategory">
                <div class="pro-gl-content">
                    <div class="ec-product-inner">
                        <div class="ec-pro-image-outer">
                            <div class="ec-pro-image">
                                <a href="product-detail.html" class="image">
                                    <img class="main-image"
                                         src="${productCategory.productImage}" alt="Product"
                                         style="height: 335px; width: 100%; object-fit: cover;"/>
                                    <img class="hover-image"
                                         src="${productCategory.productImage}" alt="Product"
                                         style="height: 335px; width: 100%; object-fit: cover;"/>
                                </a>
                                <c:if test="${productCategory.discount > 0}">
                                    <span class="percentage">${productCategory.discount}%</span>
                                </c:if>
                            </div>
                        </div>
                        <div class="ec-pro-content">
                            <h5 class="ec-pro-title"><a
                                    href="/ekka/product-details/${productCategory.id}">${productCategory.productName}</a>
                            </h5>
                            <div class="ec-pro-rating">
                                <c:if test="${productCategory.rating <= 0}">
                                    <i class="ecicon eci-star"></i>
                                    <i class="ecicon eci-star"></i>
                                    <i class="ecicon eci-star"></i>
                                    <i class="ecicon eci-star"></i>
                                    <i class="ecicon eci-star"></i>
                                </c:if>
                                <c:if test="${productCategory.rating > 0 && productCategory.rating < 1}">
                                    <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                </c:if>
                                <c:if test="${productCategory.rating > 1 && productCategory.rating < 2}">
                                    <i class="ecicon eci-star fill"></i>
                                    <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                </c:if>
                                <c:if test="${productCategory.rating > 2 && productCategory.rating < 3}">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                </c:if>
                                <c:if test="${productCategory.rating > 3 && productCategory.rating < 4}">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                </c:if>
                                <c:if test="${productCategory.rating > 4 && productCategory.rating < 5}">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                </c:if>

                                <c:if test="${productCategory.rating == 1}">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                </c:if>

                                <c:if test="${productCategory.rating == 2}">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                </c:if>

                                <c:if test="${productCategory.rating == 3}">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star-o"></i>
                                    <i class="ecicon eci-star-o"></i>
                                </c:if>
                                <c:if test="${productCategory.rating == 4}">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star-o"></i>
                                </c:if>
                                <c:if test="${productCategory.rating == 5}">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                </c:if>
                            </div>
                            <div class="ec-pro-list-desc"
                                 style="margin-left: 0!important;">${productCategory.details}</div>
                            <span class="ec-price">
                                            <c:if test="${productCategory.discount > 0}">
                                                <span class="old-price">$${productCategory.priceProduct}</span>
                                            </c:if>
                                                <span class="new-price">$<fmt:formatNumber maxFractionDigits="2"
                                                                                           value="${productCategory.priceProduct * ((100 - productCategory.discount)/100)}"></fmt:formatNumber></span>
                                            </span>
                            <div class="ec-pro-option">
                                <div class="ec-pro-color">
                                    <span class="ec-pro-opt-label">Color</span>
                                    <ul class="ec-opt-swatch ec-change-img">
                                        <c:forEach items="${listProductColor}" var="productColor">
                                            <c:if test="${productColor.product.id == productCategory.id}">
                                                <li><a href="#" class="ec-opt-clr-img"
                                                       data-src="${productCategory.productImage}"
                                                       data-src-hover="${productCategory.productImage}"
                                                       data-tooltip="Gray"><span
                                                        style="background-color:${productColor.colorName};"></span></a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="ec-pro-size">
                                    <span class="ec-pro-opt-label">Size</span>
                                    <ul class="ec-opt-size">
                                        <c:forEach items="${listProductSize}" var="productSize">
                                            <c:if test="${productSize.product.id == productCategory.id}">
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
</section>
<!-- Related Product end -->

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

<!-- 360 Modal -->
<div class="modal fade" id="ec_360_view_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row ec-product-360">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="ec-360-panel ec-360-panel-default">
                            <a class="btn btn-default ec-360-btn qty_close" data-bs-dismiss="modal"
                               aria-label="Close">×</a>
                            <div class="ec-360-panel-body">
                                <div id="circlr" class="ec-circlr">
                                    <img data-src="/user/assets/images/product-360/00.jpg"
                                         src="/user/assets/images/product-360/00.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/01.jpg"
                                         src="/user/assets/images/product-360/01.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/02.jpg"
                                         src="/user/assets/images/product-360/02.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/03.jpg"
                                         src="/user/assets/images/product-360/03.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/04.jpg"
                                         src="/user/assets/images/product-360/04.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/05.jpg"
                                         src="/user/assets/images/product-360/05.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/06.jpg"
                                         src="/user/assets/images/product-360/06.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/07.jpg"
                                         src="/user/assets/images/product-360/07.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/08.jpg"
                                         src="/user/assets/images/product-360/08.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/09.jpg"
                                         src="/user/assets/images/product-360/09.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/10.jpg"
                                         src="/user/assets/images/product-360/10.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/11.jpg"
                                         src="/user/assets/images/product-360/11.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/12.jpg"
                                         src="/user/assets/images/product-360/12.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/13.jpg"
                                         src="/user/assets/images/product-360/13.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/14.jpg"
                                         src="/user/assets/images/product-360/14.jpg" alt="product image">
                                    <img data-src="/user/assets/images/product-360/15.jpg"
                                         src="/user/assets/images/product-360/15.jpg" alt="product image">
                                    <div id="loader" class="ec-img-loader"></div>
                                </div>
                            </div>
                            <p class="ec-tool-play">
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.play(); return false;"><img src="/user/assets/images/icons/play.svg"
                                                                            class="svg_img pro_svg"
                                                                            alt="play image"/></a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.stop(); return false;"><img src="/user/assets/images/icons/stop.svg"
                                                                            class="svg_img pro_svg"
                                                                            alt="stop image"/></a>
                            </p>
                        </div>
                    </div>

                    <div class="ec-tool-box-sec">
                        <div class="ec-tool-box space-b-15">
                            <h4>Cycle</h4>
                            <label class="ec-switch">
                                <input class="ec-cycle" type="checkbox">
                                <span class="ec-slider"></span>
                            </label>
                        </div>

                        <div class="ec-tool-box space-b-15">
                            <h4>Reverse</h4>
                            <label class="ec-switch">
                                <input class="ec-reverse" type="checkbox">
                                <span class="ec-slider"></span>
                            </label>
                        </div>

                        <div class="ec-tool-box space-b-15">
                            <h4>Vertical</h4>
                            <label class="ec-switch">
                                <input class="ec-vertical" type="checkbox">
                                <span class="ec-slider"></span>
                            </label>
                        </div>

                        <div class="ec-tool-box-2 space-b-15">
                            <h4>Rotation</h4>
                            <p>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.turn(9); return false;">9</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.turn(8); return false;">8</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.turn(7); return false;">7</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.turn(6); return false;">6</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.turn(5); return false;">5</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.turn(4); return false;">4</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.turn(3); return false;">3</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.turn(2); return false;">2</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.turn(1); return false;">1</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.turn(0); return false;">0</a>
                            </p>
                        </div>

                        <div class="ec-tool-box-2">
                            <h4>Goto n frame</h4>
                            <p>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.go(9); return false;">9</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.go(8); return false;">8</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.go(7); return false;">7</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.go(6); return false;">6</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.go(5); return false;">5</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.go(4); return false;">4</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.go(3); return false;">3</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.go(2); return false;">2</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.go(1); return false;">1</a>
                                <a href="#" class="btn btn-default ec-360-btn"
                                   onclick="crl.go(0); return false;">0</a>
                            </p>
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

<script>
    $("#color ul li span").click(function (element) {
        var el = element.currentTarget.style.backgroundColor;
        console.log(el);
        $('#inputColor').val(el);
    });
    $("#size ul li span").click(function (element) {
        var el = element.currentTarget.innerHTML;
        console.log(el);
        $('#inputSize').val(el);
    });
    $("#item").change(function (element) {
        var el = $(this).val();
        console.log(el);
        $('#inputItem').val(el);
    });

</script>
<script>
    $(document).ready(function () {
        $("#st1").hover(function () {
            $(".review .eci-star").removeClass("eci-star fill").addClass("eci-star-o");
            $("#st1").removeClass("eci-star-o").addClass("eci-star fill");
            $("#ratingInput").val(1);
        });
        $("#st2").hover(function () {
            $(".review .eci-star").removeClass("eci-star fill").addClass("eci-star-o");
            $("#st1, #st2").removeClass("eci-star-o").addClass("eci-star fill");
            $("#ratingInput").val(2);
        });
        $("#st3").hover(function () {
            $(".review .eci-star").removeClass("eci-star fill").addClass("eci-star-o");
            $("#st1, #st2, #st3").removeClass("eci-star-o").addClass("eci-star fill");
            $("#ratingInput").val(3);
        });
        $("#st4").hover(function () {
            $(".review .eci-star").removeClass("eci-star fill").addClass("eci-star-o");
            $("#st1, #st2, #st3, #st4").removeClass("eci-star-o").addClass("eci-star fill");
            $("#ratingInput").val(4);
        });
        $("#st5").hover(function () {
            $(".review .eci-star").removeClass("eci-star fill").addClass("eci-star-o");
            $("#st1, #st2, #st3, #st4, #st5").removeClass("eci-star-o").addClass("eci-star fill");
            $("#ratingInput").val(5);
        });
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
<script>
    $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 10,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav: true
            },
            600: {
                items: 2,
                nav: false
            },
            1000: {
                items: 4,
                nav: true,
                loop: false
            }
        }
    })
</script>
</body>
</html>




