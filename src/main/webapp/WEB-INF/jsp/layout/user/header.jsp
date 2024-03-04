<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="ec-header">
    <!--Ec Header Top Start -->
    <div class="header-top">
        <div class="container">
            <div class="row align-items-center">
                <!-- Header Top social Start -->
                <div class="col text-left header-top-left d-none d-lg-block">
                    <div class="header-top-social">
                        <span class="social-text text-upper">Follow us on:</span>
                        <ul class="mb-0">
                            <li class="list-inline-item"><a class="hdr-facebook" href="#"><i
                                    class="ecicon eci-facebook"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-twitter" href="#"><i
                                    class="ecicon eci-twitter"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-instagram" href="#"><i
                                    class="ecicon eci-instagram"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-linkedin" href="#"><i
                                    class="ecicon eci-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!-- Header Top social End -->
                <!-- Header Top Message Start -->
                <div class="col text-center header-top-center">
                    <div class="header-top-message text-upper">
                        <span>Giao hàng miễn phí</span>
                    </div>
                </div>
                <!-- Header Top Message End -->
                <!-- Header Top Language Currency -->
                <div class="col header-top-right d-none d-lg-block">
                    <div class="header-top-lan-curr d-flex justify-content-end">
                        <!-- Currency Start -->
                        <div class="header-top-curr dropdown">
                            <button class="dropdown-toggle text-upper" data-bs-toggle="dropdown">Tiền tệ <i
                                    class="ecicon eci-caret-down" aria-hidden="true"></i></button>
                            <ul class="dropdown-menu">
                                <li class="active"><a class="dropdown-item" href="#">USD $</a></li>
                            </ul>
                        </div>
                        <!-- Currency End -->
                        <!-- Language Start -->
                        <div class="header-top-lan dropdown">
                            <button class="dropdown-toggle text-upper" data-bs-toggle="dropdown">Ngôn ngữ <i
                                    class="ecicon eci-caret-down" aria-hidden="true"></i></button>
                            <ul class="dropdown-menu">
                                <li class="active"><a class="dropdown-item" href="#">Tiếng Việt</a></li>
                            </ul>
                        </div>
                        <!-- Language End -->

                    </div>
                </div>
                <!-- Header Top Language Currency -->
                <!-- Header Top responsive Action -->
                <div class="col d-lg-none ">
                    <div class="ec-header-bottons">
                        <!-- Header User Start -->
                        <sec:authorize access="hasAnyRole('ROLE_USER')">
                            <div class="ec-header-user dropdown">
                                <button class="dropdown-toggle" data-bs-toggle="dropdown"><img
                                        src="<sec:authentication property="principal.avatar"></sec:authentication>"
                                        style="border-radius: 50%; border: 1px solid black; object-fit: cover"
                                        class="svg_img header_svg" alt=""/></button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a class="dropdown-item" href="#"><sec:authentication
                                            property="principal.fullName"></sec:authentication></a></li>
                                    <li><a class="dropdown-item" href="/ekka/profile">Hồ sơ</a></li>
                                    <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                                </ul>
                            </div>

                            <!-- Header User End -->
                            <!-- Header Cart Start -->
                            <a href="/ekka/wish-list" class="ec-header-btn ec-header-wishlist">
                                <div class="header-icon"><img src="/user/assets/images/icons/wishlist.svg"
                                                              class="svg_img header_svg" alt=""/></div>
                                <span class="ec-header-count wish-list-count-lable">${countWishList}</span>
                            </a>
                            <!-- Header Cart End -->
                            <!-- Header Cart Start -->
                            <a href="/ekka/cart" class="ec-header-btn">
                                <div class="header-icon"><img src="/user/assets/images/icons/cart.svg"
                                                              class="svg_img header_svg" alt=""/></div>
                                <span class="ec-header-count cart-count-lable">${countCart}</span>
                            </a>
                        </sec:authorize>
                        <sec:authorize access="!hasAnyRole('ROLE_USER')">
                            <div class="ec-header-user dropdown">
                                <button class="dropdown-toggle" data-bs-toggle="dropdown"><img
                                        src="/user/assets/images/icons/user.svg" class="svg_img header_svg" alt=""/>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a class="dropdown-item" href="/ekka/register">Đăng ký</a></li>
                                    <li><a class="dropdown-item" href="/ekka/login">Đăng nhập</a></li>
                                </ul>
                            </div>
                        </sec:authorize>
                        <!-- Header Cart End -->
<%--                        <a href="javascript:void(0)" class="ec-header-btn ec-sidebar-toggle">--%>
<%--                            <img src="/user/assets/images/icons/category-icon.svg" class="svg_img header_svg"--%>
<%--                                 alt="icon"/>--%>
<%--                        </a>--%>
                        <!-- Header menu Start -->
                        <a href="#ec-mobile-menu" class="ec-header-btn ec-side-toggle d-lg-none">
                            <img src="/user/assets/images/icons/menu.svg" class="svg_img header_svg" alt="icon"/>
                        </a>
                        <!-- Header menu End -->
                    </div>
                </div>
                <!-- Header Top responsive Action -->
            </div>
        </div>
    </div>
    <!-- Ec Header Top  End -->
    <!-- Ec Header Bottom  Start -->
    <div class="ec-header-bottom d-none d-lg-block">
        <div class="container position-relative">
            <div class="row">
                <div class="ec-flex">
                    <!-- Ec Header Logo Start -->
                    <div class="align-self-center">
                        <div class="header-logo">
                            <a href="/ekka"><img src="/user/assets/images/logo/logo.png" alt="Site Logo"/><img
                                    class="dark-logo" src="/user/assets/images/logo/dark-logo.png" alt="Site Logo"
                                    style="display: none;"/></a>
                        </div>
                    </div>
                    <!-- Ec Header Logo End -->

                    <!-- Ec Header Search Start -->
                    <div class="align-self-center">
                        <div class="header-search" id="myDropdown">
                                <input class="form-control ec-search-bar" id="search1" value="${list.key}" placeholder="Tìm kiếm sản phẩm..." onkeyup="filterFunction()" type="text">
                                <button class="submit" onclick="search1()" type="submit"><img src="/user/assets/images/icons/search.svg"
                                                                                              class="svg_img header_svg" alt=""/></button>
                            <div class="ec-sidebar-block d-none" style="max-height: 300px;position: absolute;border: 1px solid;width: inherit;overflow: auto;background: #eaeaea;color: white;z-index: 99;">
                                <div class="ec-sb-block-content">
                                    <ul class="list-group">
                                        <c:forEach items="${listProductByState}" var="product">
                                            <a class="list-group-item d-flex" href="/ekka/product-details/${product.id}"><img style="width: 50px; height: 50px;" src="${product.productImage}"/><span>${product.productName}</span></a>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Ec Header Search End -->

                    <!-- Ec Header Button Start -->
                    <div class="align-self-center">
                        <div class="ec-header-bottons">

                            <!-- Header User Start -->
                            <sec:authorize access="hasAnyRole('ROLE_USER')">
                                <div class="ec-header-user dropdown">
                                    <button class="dropdown-toggle" data-bs-toggle="dropdown"><img
                                            src="<sec:authentication property="principal.avatar"></sec:authentication>"
                                            style="border-radius: 50%; border: 1px solid black; object-fit: cover"
                                            class="svg_img header_svg" alt=""/></button>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a class="dropdown-item" href="#"><sec:authentication
                                                property="principal.fullName"></sec:authentication></a></li>
                                        <li><a class="dropdown-item" href="/ekka/profile">Hồ sơ</a></li>
                                        <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                                    </ul>
                                </div>
                                <!-- Header wishlist Start -->
                                <a href="/ekka/wish-list" class="ec-header-btn ec-header-wishlist">
                                    <div class="header-icon"><img src="/user/assets/images/icons/wishlist.svg"
                                                                  class="svg_img header_svg" alt=""/></div>
                                    <span class="ec-header-count wish-list-count-lable">${countWishList}</span>
                                </a>
                                <!-- Header wishlist End -->
                                <!-- Header Cart Start -->
                                <a href="/ekka/cart" class="ec-header-btn">
                                    <div class="header-icon"><img src="/user/assets/images/icons/cart.svg"
                                                                  class="svg_img header_svg" alt=""/></div>
                                    <span class="ec-header-count cart-count-lable">${countCart}</span>
                                </a>
                                <!-- Header Cart End -->
                            </sec:authorize>
                            <sec:authorize access="!hasAnyRole('ROLE_USER')">

                                <div class="ec-header-user dropdown">
                                    <button class="dropdown-toggle" data-bs-toggle="dropdown"><img
                                            src="/user/assets/images/icons/user.svg" class="svg_img header_svg" alt=""/>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a class="dropdown-item" href="/ekka/register">Đăng ký</a></li>
                                        <li><a class="dropdown-item" href="/ekka/login">Đăng nhập</a></li>
                                    </ul>
                                </div>
                            </sec:authorize>

                            <!-- Header User End -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Ec Header Button End -->
    <!-- Header responsive Bottom  Start -->
    <div class="ec-header-bottom d-lg-none">
        <div class="container position-relative">
            <div class="row ">

                <!-- Ec Header Logo Start -->
                <div class="col">
                    <div class="header-logo">
                        <a href="/ekka"><img src="/user/assets/images/logo/logo.png" alt="Site Logo"/><img
                                class="dark-logo" src="/user/assets/images/logo/dark-logo.png" alt="Site Logo"
                                style="display: none;"/></a>
                    </div>
                </div>
                <!-- Ec Header Logo End -->
                <!-- Ec Header Search Start -->
                <div class="col">
                    <div id="the-basics" class="header-search">
<%--                            <input class="typeahead" class="form-control ec-search-bar" id="search" value="${list.key}" placeholder="Tìm kiếm sản phẩm..." type="text">--%>
<%--                            <button class="submit" onclick="search()" type="submit"><img src="/user/assets/images/icons/search.svg"--%>
<%--                                                                      class="svg_img header_svg" alt="icon"/></button>--%>
                        <div class="header-search" id="myDropdown-mobi">
                            <input class="typeahead form-control ec-search-bar" id="search" value="${list.key}" placeholder="Tìm kiếm sản phẩm..." onkeyup="filterFunctionMobi()" type="text">
                            <button class="submit" onclick="search()" type="submit"><img src="/user/assets/images/icons/search.svg"
                                                                                          class="svg_img header_svg" alt=""/></button>
                            <div class="ec-sidebar-block d-none" style="max-height: 300px;position: absolute;border: 1px solid;width: inherit;overflow: auto;background: #eaeaea;color: white;z-index: 99;">
                                <div class="ec-sb-block-content">
                                    <ul class="list-group">
                                        <c:forEach items="${listProductByState}" var="product">
                                            <a class="list-group-item d-flex" href="/ekka/product-details/${product.id}"><img style="width: 50px; height: 50px;" src="${product.productImage}"/><span>${product.productName}</span></a>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Ec Header Search End -->
            </div>
        </div>
    </div>
    <!-- Header responsive Bottom  End -->
    <!-- EC Main Menu Start -->
    <div id="ec-main-menu-desk" class="d-none d-lg-block sticky-nav">
        <div class="container position-relative">
            <div class="row">
                <div class="col-md-12 align-self-center">
                    <div class="ec-main-menu">
                        <ul>
                            <li><a href="/ekka">Trang chủ</a></li>
                            <li><a href="/ekka/product">Sản phẩm</a></li>
                            <li><a href="/ekka/about-us">Về chúng tôi</a></li>
                            <li><a href="/ekka/contact-us">Liên hệ</a></li>
                            <li><a href="/ekka/faq">Câu hỏi thường gặp</a></li>

                            <li class="dropdown scroll-to d-none"><a href="javascript:void(0)"><img
                                    src="/user/assets/images/icons/scroll.svg" class="svg_img header_svg scroll"
                                    alt=""/></a>
                                <ul class="sub-menu">
                                    <li class="menu_title">Scroll To Section</li>
                                    <li><a href="javascript:void(0)" data-scroll="collection" class="nav-scroll">Top
                                        Collection</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="categories" class="nav-scroll">Categories</a>
                                    </li>
                                    </li>
                                    <li><a href="javascript:void(0)" data-scroll="vendors" class="nav-scroll">Top
                                        Vendors</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="services"
                                           class="nav-scroll">Services</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="arrivals" class="nav-scroll">New
                                        Arrivals</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="reviews" class="nav-scroll">Client
                                        Review</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="insta" class="nav-scroll">Instagram
                                        Feed</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Ec Main Menu End -->
    <!-- ekka Mobile Menu Start -->
    <div id="ec-mobile-menu" class="ec-side-cart ec-mobile-menu">
        <div class="ec-menu-title">
            <span class="menu_title">Bảng chọn</span>
            <button class="ec-close">×</button>
        </div>
        <div class="ec-menu-inner">
            <div class="ec-menu-content">
                <ul>
                    <li><a href="/ekka">Trang chủ</a></li>
                    <li><a href="/ekka/product">Sản phẩm</a></li>
                    <li><a href="/ekka/about-us">Về chúng tôi</a></li>
                    <li><a href="/ekka/contact-us">Liên hệ</a></li>
                    <li><a href="/ekka/faq">Câu hỏi thường gặp</a></li>
                </ul>
            </div>
            <div class="header-res-lan-curr">
                <div class="header-top-lan-curr">
                    <!-- Language Start -->
                    <div class="header-top-lan dropdown">
                        <button class="dropdown-toggle text-upper" data-bs-toggle="dropdown">Ngôn ngữ <i
                                class="ecicon eci-caret-down" aria-hidden="true"></i></button>
                        <ul class="dropdown-menu">
                            <li class="active"><a class="dropdown-item" href="#">Tiếng Việt</a></li>
                        </ul>
                    </div>
                    <!-- Language End -->
                    <!-- Currency Start -->
                    <div class="header-top-curr dropdown">
                        <button class="dropdown-toggle text-upper" data-bs-toggle="dropdown">Tiền tệ <i
                                class="ecicon eci-caret-down" aria-hidden="true"></i></button>
                        <ul class="dropdown-menu">
                            <li class="active"><a class="dropdown-item" href="#">USD $</a></li>
                        </ul>
                    </div>
                    <!-- Currency End -->
                </div>
                <!-- Social Start -->
                <div class="header-res-social">
                    <div class="header-top-social">
                        <ul class="mb-0">
                            <li class="list-inline-item"><a class="hdr-facebook" href="#"><i
                                    class="ecicon eci-facebook"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-twitter" href="#"><i
                                    class="ecicon eci-twitter"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-instagram" href="#"><i
                                    class="ecicon eci-instagram"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-linkedin" href="#"><i
                                    class="ecicon eci-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!-- Social End -->
            </div>
        </div>
    </div>
    <!-- ekka mobile Menu End -->
</header>
<script>
    let elList = [];
    const IT = setInterval(()=>{
        elList = document.querySelectorAll('#ec-direct-run');
        if (elList.length > 0){
            elList.forEach((val)=>{val.remove()});
            clearInterval(IT);
        }
    },100)
</script>


