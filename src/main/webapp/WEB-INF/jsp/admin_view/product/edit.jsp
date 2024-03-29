<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Ekka - Admin Dashboard eCommerce HTML Template.">

    <title>Ekka - Admin | Sửa sản phẩm | ${productDto.productName}.</title>

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
                <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                    <div>
                        <h1>Sửa sản phẩm | ${productDto.productName}</h1>
                        <p class="breadcrumbs"><span><a href="/ekka/admin">Trang chủ</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>Sản phẩm</p>
                    </div>
                    <div>
                        <a href="/ekka/admin/product" class="btn btn-primary"> Xem danh sách sản phẩm
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-header card-header-border-bottom">
                                <h2>Sửa sản phẩm</h2>
                            </div>

                            <div class="card-body">
                                <div class="ec-vendor-uploads">
                                    <f:form method="post" action="/ekka/admin/product/update"
                                            modelAttribute="productDto"
                                            enctype="multipart/form-data" cssClass="row">
                                        <div class="col-lg-4 row">
                                            <div class="col-md-12 mb-25">
                                                <label class="form-label">Màu sắc (<span style="color: red;">*</span>)</label>
                                                <div class="d-flex align-items-start">
                                                        <%--                                                    <c:forEach items="${listProductColor}" var="productColor">--%>
                                                        <%--                                                        <c:if test="${productColor.product.id == productDto.id}">--%>
                                                        <%--                                                            <f:checkbox path="color" class="checkbox-color1" value="${productColor.colorName}"/>--%>
                                                        <%--                                                            <input type="color"--%>
                                                        <%--                                                                   class="color1 form-control form-control-color mr-2"--%>
                                                        <%--                                                                   id="exampleColorInput1"--%>
                                                        <%--                                                                   value="${productColor.colorName}"--%>
                                                        <%--                                                                   oninput="ChangeValueColor(this,'.checkbox-color${productColor.id}')"--%>
                                                        <%--                                                                   title="Choose your color">--%>
                                                        <%--                                                        </c:if>--%>

                                                        <%--                                                    </c:forEach>--%>

                                                            <c:if test="${productDto.colorEdit1 == null}">
                                                                <f:checkbox path="color" class="checkbox-color1" value="#000000"/>
                                                            </c:if>
                                                            <c:if test="${productDto.colorEdit1 != null}">
                                                                <f:checkbox path="color" class="checkbox-color1" checked="checked"
                                                                            value="${productDto.colorEdit1}"/>
                                                            </c:if>
                                                    <input type="color"
                                                           class="color1 form-control form-control-color mr-2"
                                                           id="exampleColorInput1" value="${productDto.colorEdit1 == null ? '#000000' : productDto.colorEdit1}"
                                                           oninput="ChangeValueColor(this,'.checkbox-color1')"
                                                           title="Choose your color">
                                                            <c:if test="${productDto.colorEdit2 == null}">
                                                                <f:checkbox path="color" class="checkbox-color2" value="#000000"/>
                                                            </c:if>
                                                            <c:if test="${productDto.colorEdit2 != null}">
                                                                <f:checkbox path="color" class="checkbox-color2" checked="checked"
                                                                            value="${productDto.colorEdit2}"/>
                                                            </c:if>
                                                    <input type="color"
                                                           class="color2 form-control form-control-color mx-2"
                                                           id="exampleColorInput1" value="${productDto.colorEdit2 == null ? '#000000' : productDto.colorEdit2}"
                                                           oninput="ChangeValueColor(this,'.checkbox-color2')"
                                                           title="Choose your color">
                                                            <c:if test="${productDto.colorEdit3 == null}">
                                                                <f:checkbox path="color" class="checkbox-color3" value="#000000"/>
                                                            </c:if>
                                                            <c:if test="${productDto.colorEdit3 != null}">
                                                                <f:checkbox path="color" class="checkbox-color3" checked="checked"
                                                                            value="${productDto.colorEdit3}"/>
                                                            </c:if>
                                                    <input type="color"
                                                           class="color3 form-control form-control-color mx-2"
                                                           id="exampleColorInput3" value="${productDto.colorEdit3 == null ? '#000000' : productDto.colorEdit3}"
                                                           oninput="ChangeValueColor(this,'.checkbox-color3')"
                                                           title="Choose your color">
                                                            <c:if test="${productDto.colorEdit4 == null}">
                                                                <f:checkbox path="color" class="checkbox-color2" value="#000000"/>
                                                            </c:if>
                                                            <c:if test="${productDto.colorEdit4 != null}">
                                                                <f:checkbox path="color" class="checkbox-color4" checked="checked"
                                                                            value="${productDto.colorEdit4}"/>
                                                            </c:if>
                                                    <input type="color"
                                                           class="color4 form-control form-control-color ml-2"
                                                           id="exampleColorInput1" value="${productDto.colorEdit4 == null ? '#000000' : productDto.colorEdit4}"
                                                           oninput="ChangeValueColor(this,'.checkbox-color4')"
                                                           title="Choose your color">
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-25">
                                                <label class="form-label">Kích cỡ (<span style="color: red;">*</span>)</label>
                                                <div class="form-checkbox-box">
                                                    <div class="form-check form-check-inline pl-0">
                                                        <c:if test="${productDto.size1 == null}">
                                                            <f:checkbox path="size" value="S"/>
                                                        </c:if>
                                                        <c:if test="${productDto.size1 != null}">
                                                            <f:checkbox path="size" checked="checked" value="S"/>
                                                        </c:if>
                                                        <label>S</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <c:if test="${productDto.size2 == null}">
                                                            <f:checkbox path="size" value="M"/>
                                                        </c:if>
                                                        <c:if test="${productDto.size2 != null}">
                                                            <f:checkbox path="size" checked="checked" value="M"/>
                                                        </c:if>
                                                        <label>M</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <c:if test="${productDto.size3 == null}">
                                                            <f:checkbox path="size" value="L"/>
                                                        </c:if>
                                                        <c:if test="${productDto.size3 != null}">
                                                            <f:checkbox path="size" checked="checked" value="L"/>
                                                        </c:if>
                                                        <label>L</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <c:if test="${productDto.size4 == null}">
                                                            <f:checkbox path="size" value="XL"/>
                                                        </c:if>
                                                        <c:if test="${productDto.size4 != null}">
                                                            <f:checkbox path="size" checked="checked" value="XL"/>
                                                        </c:if>
                                                        <label>XL</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <c:if test="${productDto.size5 == null}">
                                                            <f:checkbox path="size" value="XXL"/>
                                                        </c:if>
                                                        <c:if test="${productDto.size5 != null}">
                                                            <f:checkbox path="size" checked="checked" value="XXL"/>
                                                        </c:if>
                                                        <label>XXL</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 ec-vendor-img-upload">
                                                <div class="ec-vendor-main-img">
                                                    <div class="avatar-upload">
                                                        <div class="avatar-edit">
                                                            <f:input type="file" accept="image/*" id="imageUpload"
                                                                     cssClass="ec-image-upload" path="fileImageEdit1"
                                                                     placeholder="Chọn file"
                                                                     aria-label="Ảnh đại diện"/>
                                                            <label for="imageUpload"><img
                                                                    src="/admin/assets/img/icons/edit.svg"
                                                                    class="svg_img header_svg" alt="edit"/></label>
                                                        </div>
                                                        <div class="avatar-preview ec-preview">
                                                            <div class="imagePreview ec-div-preview">
                                                                <img class="ec-image-preview"
                                                                     src="${productDto.imageEdit1}"
                                                                     alt="edit"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="thumb-upload-set colo-md-12">
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" accept="image/*" id="thumbUpload01"
                                                                         cssClass="ec-image-upload" path="fileImageEdit2"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="${productDto.imageEdit2}"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" accept="image/*" id="thumbUpload01"
                                                                         cssClass="ec-image-upload" path="fileImageEdit3"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="${productDto.imageEdit3}"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" accept="image/*" id="thumbUpload01"
                                                                         cssClass="ec-image-upload" path="fileImageEdit4"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="${productDto.imageEdit4}"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" accept="image/*" id="thumbUpload01"
                                                                         cssClass="ec-image-upload" path="fileImageEdit5"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="${productDto.imageEdit5}"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" accept="image/*" id="thumbUpload01"
                                                                         cssClass="ec-image-upload" path="fileImageEdit6"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="${productDto.imageEdit6}"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" accept="image/*" id="thumbUpload01"
                                                                         cssClass="ec-image-upload" path="fileImageEdit7"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="${productDto.imageEdit7}"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="ec-vendor-upload-detail">
                                                <div class="row g-3">
                                                    <div class="col-md-6 d-none">
                                                        <label for="inputEmail4" class="form-label">Product
                                                            Id (<span style="color: red;">*</span>)</label>
                                                        <f:input type="text" id="inputEmail4" path="id"
                                                                 class="form-control slug-title"
                                                                 placeholder="Enter your product name"
                                                                 aria-label="Enter your product name"
                                                                 required="required"/>
                                                    </div>
                                                    <div class="col-md-6 my-2">
                                                        <label for="inputEmail4" class="form-label">Tên sản phẩm (<span style="color: red;">*</span>)</label>
                                                        <f:input type="text" id="inputEmail4" path="productName"
                                                                 class="form-control slug-title"
                                                                 placeholder="Vui lòng nhập tên sản phẩm..."
                                                                 aria-label="Enter your product name"
                                                                 required="required"/>
                                                    </div>
                                                    <div class="col-md-6 my-2">
                                                        <label class="form-label">Chọn loại sản phẩm (<span style="color: red;">*</span>)</label>
                                                        <f:select path="categoryId" class="form-control"
                                                                  required="required">
                                                            <c:forEach items="${listCategory}" var="category">
                                                                <c:if test="${category.id == categoryDto.id}">
                                                                    <c:forEach items="${listGenderCategory}"
                                                                               var="genderCategory">
                                                                        <c:if test="${genderCategory.id == category.genderCategory.id}">
                                                                            <f:option class="form-control"
                                                                                      value="${category.id}">${genderCategory.genderCategoryName} - ${category.categoryName}</f:option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:forEach items="${listCategory}" var="category">
                                                                <c:if test="${category.id != categoryDto.id}">
                                                                    <c:forEach items="${listGenderCategory}"
                                                                               var="genderCategory">
                                                                        <c:if test="${genderCategory.id == category.genderCategory.id}">
                                                                            <f:option class="form-control"
                                                                                      value="${category.id}">${genderCategory.genderCategoryName} - ${category.categoryName}</f:option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </c:forEach>
                                                        </f:select>
                                                    </div>
                                                    <div class="col-md-12 my-2">
                                                        <label class="form-label">Chi tiết (<span style="color: red;">*</span>)</label>
                                                        <f:textarea path="details" rows="8" placeholder="Vui lòng nhập thông tin chi tiết sản phẩm..." cssClass="form-control" required="required"/>
                                                    </div>
                                                    <div class="col-md-6 my-2">
                                                        <label class="form-label">Giá cả <span>( In USD
																)</span> (<span style="color: red;">*</span>)</label>
                                                        <f:input type="number" id="price1" path="priceProduct"
                                                                 class="form-control"
                                                                 placeholder="Vui lòng nhập giá cả..."
                                                                 aria-label="Enter your product name"
                                                                 required="required"/>
                                                    </div>
                                                    <div class="col-md-6 my-2">
                                                        <label class="form-label">Số lượng (<span style="color: red;">*</span>)</label>
                                                        <f:input type="number" id="quantity1" path="totalProduct"
                                                                 class="form-control"
                                                                 placeholder="Vui lòng nhập số lượng sản phẩm..."
                                                                 aria-label="Enter your product name"
                                                                 required="required"/>
                                                    </div>
                                                    <div class="col-md-12 my-2">
                                                        <label class="form-label">Thông tin thêm (<span style="color: red;">*</span>)</label>
                                                        <f:textarea path="moreInformation" rows="8" placeholder="Vui lonhg nhập thêm thông tin sản phẩm..."
                                                                    cssClass="form-control" required="required"/>
                                                    </div>
                                                    <div class="col-md-6 my-2">
                                                        <label class="form-label">Chọn nhãn hiệu (<span style="color: red;">*</span>)</label>
                                                        <f:select path="brandId" class="form-control"
                                                                  required="required">
                                                            <c:forEach items="${listBrand}" var="brand">
                                                                <c:if test="${brand.id == brandDto.id}">
                                                                    <f:option class="form-control"
                                                                              value="${brand.id}">${brand.nameBrand}</f:option>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:forEach items="${listBrand}" var="brand">
                                                                <c:if test="${brand.id != brandDto.id}">
                                                                    <f:option class="form-control"
                                                                              value="${brand.id}">${brand.nameBrand}</f:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </f:select>
                                                    </div>
                                                    <div class="col-md-6 my-2">
                                                        <label class="form-label">Ưu đãi <span>( % )</span> (<span style="color: red;">*</span>)</label>
                                                        <f:input type="number" id="quantity1" path="discount"
                                                                 class="form-control"
                                                                 placeholder="Vui lòng nhập ưu đãi..."
                                                                 aria-label="Enter your product name"
                                                                 required="required"/>
                                                    </div>
                                                    <div class="col-md-12 my-2">
                                                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </f:form>
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
