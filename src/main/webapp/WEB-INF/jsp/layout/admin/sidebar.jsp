<%@page pageEncoding="UTF-8" %>

<!-- LEFT MAIN SIDEBAR -->
<div class="ec-left-sidebar ec-bg-sidebar">
    <div id="sidebar" class="sidebar ec-sidebar-footer">

        <div class="ec-brand">
            <a href="/ekka/admin" title="Ekka">
                <img class="ec-brand-icon" src="/admin/assets/img/logo/ec-site-logo.png" alt="" />
                <span class="ec-brand-name text-truncate">Ekka</span>
            </a>
        </div>

        <!-- begin sidebar scrollbar -->
        <div class="ec-navigation" data-simplebar>
            <!-- sidebar menu -->
            <ul class="nav sidebar-inner" id="sidebar-menu">
                <!-- Dashboard -->
                <li class="active">
                    <a class="sidenav-item-link" href="/ekka/admin">
                        <i class="mdi mdi-view-dashboard-outline"></i>
                        <span class="nav-text">Bảng điều khiển</span>
                    </a>
                    <hr>
                </li>
                
                <!-- Users -->
                <li>
                    <a class="sidenav-item-link" href="/ekka/admin/user/list">
                        <i class="mdi mdi-account-group"></i>
                        <span class="nav-text">Danh sách người dùng</span>
                    </a>
                </li>

                <!-- Brands -->
                <li>
                    <a class="sidenav-item-link" href="/ekka/admin/brand/list">
                        <i class="mdi mdi-tag-faces"></i>
                        <span class="nav-text">Nhãn hiệu</span>
                    </a>
                </li>

                <!-- Gender Categories -->
                <li>
                    <a class="sidenav-item-link" href="/ekka/admin/gender-category/list">
                        <i class="mdi mdi-ticket-account"></i>
                        <span class="nav-text">Danh mục giới tính</span>
                    </a>
                </li>

                <!-- Category -->
                <li>
                    <a class="sidenav-item-link" href="/ekka/admin/category/list">
                        <i class="mdi mdi-dns-outline"></i>
                        <span class="nav-text">Danh mục</span>
                    </a>
                </li>

                <!-- Products -->

                <li>
                    <a class="sidenav-item-link" href="/ekka/admin/product/list">
                        <i class="mdi mdi-palette-advanced"></i>
                        <span class="nav-text">Sản phẩm</span>
                    </a>
                </li>

                <!-- Orders -->
                <li class="has-sub">
                    <a class="sidenav-item-link" href="javascript:void(0)">
                        <i class="mdi mdi-cart"></i>
                        <span class="nav-text">Đơn hàng</span> <b class="caret"></b>
                    </a>
                    <div class="collapse">
                        <ul class="sub-menu" id="orders" data-parent="#sidebar-menu">
                            <li class="">
                                <a class="sidenav-item-link" href="/ekka/admin/order">
                                    <span class="nav-text">Đơn hàng mới</span>
                                </a>
                            </li>
                            <li class="">
                                <a class="sidenav-item-link" href="/ekka/admin/order/delivered">
                                    <span class="nav-text">Đơn hàng đã hoàn thành</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <!-- Reviews -->
                <li>
                    <a class="sidenav-item-link" href="/ekka/admin/review">
                        <i class="mdi mdi-star-half"></i>
                        <span class="nav-text">Đánh giá</span>
                    </a>
                </li>

                <!-- Contact -->
                <li>
                    <a class="sidenav-item-link" href="/ekka/admin/contact">
                        <i class="mdi mdi-contact-mail"></i>
                        <span class="nav-text">Liên hệ</span>
                    </a>
                </li>





            </ul>
        </div>
    </div>
</div>