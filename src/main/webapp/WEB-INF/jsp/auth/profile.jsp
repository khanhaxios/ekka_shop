<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Ekka | Hồ sơ.</title>

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
                        <h2 class="ec-breadcrumb-title">Hồ sơ</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="/ekka">Trang chủ</a></li>
                            <li class="ec-breadcrumb-item active">Hồ sơ</li>
                        </ul>
                        <!-- ec-breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ec breadcrumb end -->

<!-- User profile section -->
<section class="ec-page-content ec-vendor-uploads ec-user-account section-space-p">
    <div class="container">
        <div class="row">
            <!-- Sidebar Area Start -->
            <div class="ec-shop-leftside ec-vendor-sidebar col-lg-3 col-md-12">
                <div class="ec-sidebar-wrap">
                    <!-- Sidebar Category Block -->
                    <div class="ec-sidebar-block">
                        <div class="ec-vendor-block">
                            <!-- <div class="ec-vendor-block-bg"></div>
                            <div class="ec-vendor-block-detail">
                                <img class="v-img" src="/user/assets/images/user/1.jpg" alt="vendor image">
                                <h5>Mariana Johns</h5>
                            </div> -->
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
                <div class="ec-vendor-dashboard-card ec-vendor-setting-card">
                    <div class="ec-vendor-card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="ec-vendor-block-profile">
                                    <div class="ec-vendor-block-img space-bottom-30">
                                        <div class="ec-vendor-block-bg" style="--image-url:url(<sec:authentication property="principal.background_profile"></sec:authentication>)!important;">
                                            <a href="#" class="btn btn-lg btn-primary"
                                               data-link-action="editmodal" title="Edit Detail"
                                               data-bs-toggle="modal" data-bs-target="#edit_modal">Chỉnh sửa chi tiết</a>
                                        </div>
                                        <div class="ec-vendor-block-detail">
                                            <img class="v-img" style="object-fit: cover;" src="<sec:authentication property="principal.avatar"></sec:authentication>" alt="vendor image">
                                            <h5 class="name"><sec:authentication
                                                    property="principal.fullName"></sec:authentication></h5>
                                            <p>( Khách hàng )</p>
                                        </div>
                                        <p>Xin chào <span><sec:authentication
                                                property="principal.fullName"></sec:authentication>!</span></p>
                                        <p>Từ tài khoản của bạn, bạn có thể dễ dàng xem và theo dõi các đơn đặt hàng. Bạn có thể quản lý và thay đổi thông tin tài khoản của mình như địa chỉ, thông tin liên hệ và lịch sử đặt hàng.</p>
                                    </div>
                                    <h5>thông tin tài khoản</h5>

                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="ec-vendor-detail-block ec-vendor-block-email space-bottom-30">
                                                <h6>Địa chỉ Email <a href="javasript:void(0)"
                                                                      data-link-action="editmodal" title="Edit Detail"
                                                                      data-bs-toggle="modal"
                                                                      data-bs-target="#edit_modal"><img
                                                        src="/user/assets/images/icons/edit.svg"
                                                        class="svg_img pro_svg" alt="edit"/></a></h6>
                                                <ul>
                                                    <li><strong>Email: <sec:authentication
                                                            property="principal.email"></sec:authentication></strong>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="ec-vendor-detail-block ec-vendor-block-contact space-bottom-30">
                                                <h6>Số liên lạc <a href="javasript:void(0)"
                                                                     data-link-action="editmodal" title="Edit Detail"
                                                                     data-bs-toggle="modal"
                                                                     data-bs-target="#edit_modal"><img
                                                        src="/user/assets/images/icons/edit.svg"
                                                        class="svg_img pro_svg" alt="edit"/></a></h6>
                                                <ul><strong>Số điện thoại: </strong>
                                                    <%--                                                        <sec:authentication var="principal" property="principal"/>--%>
                                                    <%--                                                            <%=principal.getUsername() == null ? "": principal.getUsername()%></li>--%>
                                                    <sec:authentication
                                                            property="principal.phone"></sec:authentication>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="ec-vendor-detail-block ec-vendor-block-address mar-b-30">
                                                <h6>Địa chỉ nhà <a href="javasript:void(0)" data-link-action="editmodal"
                                                              title="Edit Detail" data-bs-toggle="modal"
                                                              data-bs-target="#edit_modal"><img
                                                        src="/user/assets/images/icons/edit.svg"
                                                        class="svg_img pro_svg" alt="edit"/></a></h6>
                                                <ul>
                                                    <li><strong>Địa chỉ: </strong><sec:authentication
                                                            property="principal.address"></sec:authentication>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <%--                                        <div class="col-md-6 col-sm-12">--%>
                                        <%--                                            <div class="ec-vendor-detail-block ec-vendor-block-address">--%>
                                        <%--                                                <h6>Shipping Address<a href="javasript:void(0)"--%>
                                        <%--                                                                       data-link-action="editmodal" title="Edit Detail"--%>
                                        <%--                                                                       data-bs-toggle="modal"--%>
                                        <%--                                                                       data-bs-target="#edit_modal"><img--%>
                                        <%--                                                        src="/user/assets/images/icons/edit.svg"--%>
                                        <%--                                                        class="svg_img pro_svg" alt="edit"/></a></h6>--%>
                                        <%--                                                <ul>--%>
                                        <%--                                                    <li><strong>Office : </strong>123, 2150 Sycamore Street, dummy text--%>
                                        <%--                                                        of--%>
                                        <%--                                                        the, San Jose, California - 95131.--%>
                                        <%--                                                    </li>--%>
                                        <%--                                                </ul>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End User profile section -->

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
<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <p style="color: red">${message}</p>
                    <f:form method="post" action="/ekka/update" cssClass="row g-3" modelAttribute="userDto" enctype="multipart/form-data">
                        <div class="ec-vendor-block-img space-bottom-30">
                            <div class="ec-vendor-block-bg cover-upload">
                                <div class="thumb-upload">
                                    <div class="thumb-edit">
                                        <f:input type="file" accept="image/*" id="thumbUpload01" cssClass="ec-image-upload" path="fileImageBackground" placeholder="Chọn file" aria-label="Ảnh đại diện"/>

                                    <%--                                        <input type='file' id="thumbUpload01" class="ec-image-upload"--%>
<%--                                               accept=".png, .jpg, .jpeg"/>--%>
                                        <label><img src="/user/assets/images/icons/edit.svg"
                                                    class="svg_img header_svg" alt="edit"/></label>
                                    </div>
                                    <div class="thumb-preview ec-preview">
                                        <div class="image-thumb-preview">
                                            <img class="image-thumb-preview ec-image-preview v-img"
                                                 src="<sec:authentication property="principal.background_profile"></sec:authentication>" alt="edit"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ec-vendor-block-detail">
                                <div class="thumb-upload">
                                    <div class="thumb-edit">
                                        <f:input type="file" accept="image/*" id="thumbUpload02" cssClass="ec-image-upload" path="fileImage" placeholder="Chọn file" aria-label="Ảnh đại diện"/>
<%--                                        <input type='file' id="thumbUpload02" class="ec-image-upload"--%>
<%--                                               accept=".png, .jpg, .jpeg"/>--%>
                                        <label><img src="/user/assets/images/icons/edit.svg"
                                                    class="svg_img header_svg" alt="edit"/></label>
                                    </div>
                                    <div class="thumb-preview ec-preview">
                                        <div class="image-thumb-preview">
                                                <%--                                        <f:input type="text" path="avater" id="inputImage" class="form-control"--%>
                                                <%--                                                 placeholder="Enter your first name" aria-label="Enter your first name"--%>
                                                <%--                                                 required="required"/>--%>
                                            <img id="fileImage" style="object-fit: cover;" class="image-thumb-preview ec-image-preview v-img"
                                                 src="<sec:authentication property="principal.avatar"></sec:authentication>"
                                                 alt="edit"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ec-vendor-upload-detail">
                                <div class="col-md-12 space-t-15">
                                    <label class="form-label">Tên người dùng (<span class="text-danger">*</span>)</label>
                                    <f:input type="text" path="fullName" class="form-control"
                                             placeholder="Vui lòng nhập tên người dùng..." aria-label="Enter your full name"
                                             required="required"/>
                                </div>
                                <div class="col-md-12 space-t-15">
                                    <label class="form-label">Địa chỉ Email (<span class="text-danger">*</span>)</label>
                                    <f:input type="text" path="email" class="form-control"
                                             placeholder="Vui lòng nhập địa chỉ Email..." aria-label="Enter your Email"
                                             required="required" readonly="true"/>
                                </div>
                                <div class="col-md-12 space-t-15">
                                    <label class="form-label">Số điện thoại (<span class="text-danger">*</span>)</label>
                                    <f:input type="text" path="phone" class="form-control"
                                             placeholder="Vui lòng nhập số điện thoại..." aria-label="Enter your phone" maxlength="15" pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b"
                                             required="required"/>
                                </div>
                                <div class="col-md-12 space-t-15">
                                    <label class="form-label">Địa chỉ nhà (<span class="text-danger">*</span>)</label>
                                    <f:input type="text" path="address" class="form-control"
                                             placeholder="Vui lòng nhập địa chỉ nhà..." aria-label="Enter your address"
                                             required="required"/>
                                </div>
                                <div class="col-md-12 space-t-15">
                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                    <a href="#" class="btn btn-lg btn-secondary qty_close" data-bs-dismiss="modal"
                                       aria-label="Close">Đóng</a>
                                </div>
                            </div>
                        </div>
                    </f:form>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal end -->

<!-- Footer navigation panel for responsive display -->
<%@include file="/WEB-INF/jsp/layout/user/footer.jsp" %>
<!-- Footer navigation panel for responsive display end -->

<%--script start--%>

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

<%--script end--%>

</body>
<%--body end--%>
</html>