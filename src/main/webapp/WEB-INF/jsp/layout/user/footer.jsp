<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="ec-nav-toolbar">
    <div class="container">
        <div class="ec-nav-panel">
            <sec:authorize access="hasAnyRole('ROLE_USER')">

                <div class="ec-nav-panel-icons">
                    <a href="#ec-mobile-menu" class="navbar-toggler-btn ec-header-btn ec-side-toggle"><img
                            src="/user/assets/images/icons/menu.svg" class="svg_img header_svg" alt="icon"/></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="/ekka/cart" class="ec-header-btn"><img
                            src="/user/assets/images/icons/cart.svg" class="svg_img header_svg" alt="icon"/><span
                            class="ec-cart-noti ec-header-count cart-count-lable">${countCart}</span></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="/ekka" class="ec-header-btn"><img src="/user/assets/images/icons/home.svg"
                                                               class="svg_img header_svg" alt="icon"/></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="/ekka/wish-list" class="ec-header-btn ec-header-wishlist"><img
                            src="/user/assets/images/icons/wishlist.svg"
                            class="svg_img header_svg" alt="icon"/><span
                            class="ec-cart-noti ec-header-count wish-list-count-lable">${countWishList}</span></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="/ekka/profile" class="ec-header-btn"><img
                            src="<sec:authentication property="principal.avatar"></sec:authentication>"
                            class="svg_img header_svg" style="border-radius: 50%; border: 1px solid;" alt="icon"/></a>
                </div>
            </sec:authorize>
            <sec:authorize access="!hasAnyRole('ROLE_USER')">

                <div class="ec-nav-panel-icons">
                    <a href="#ec-mobile-menu" class="navbar-toggler-btn ec-header-btn ec-side-toggle"><img
                            src="/user/assets/images/icons/menu.svg" class="svg_img header_svg" alt="icon"/></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="/ekka/cart" class="ec-header-btn"><img
                            src="/user/assets/images/icons/cart.svg" class="svg_img header_svg" alt="icon"/><span
                            class="ec-cart-noti ec-header-count cart-count-lable">0</span></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="/ekka" class="ec-header-btn"><img src="/user/assets/images/icons/home.svg"
                                                               class="svg_img header_svg" alt="icon"/></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="/ekka/wish-list" class="ec-header-btn ec-header-wishlist"><img
                            src="/user/assets/images/icons/wishlist.svg"
                            class="svg_img header_svg" alt="icon"/><span
                            class="ec-cart-noti ec-header-count wish-list-count-lable">0</span></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="/ekka/login" class="ec-header-btn"><img src="/user/assets/images/icons/user.svg"
                                                                     class="svg_img header_svg" alt="icon"/></a>
                </div>
            </sec:authorize>
        </div>
    </div>
</div>


<script>
    var search = function () {
        window.location.href = "/ekka/product?page=${list.page - 1}&perpage=${list.perpage}&key=" + document.getElementById("search").value;
    }
    var search1 = function () {
        window.location.href = "/ekka/product?page=${list.page - 1}&perpage=${list.perpage}&key=" + document.getElementById("search1").value;
    }

    var substringMatcher = function (strs) {
        return function findMatches(q, cb) {
            var matches, substringRegex;

            // an array that will be populated with substring matches
            matches = [];

            // regex used to determine if a string contains the substring `q`
            substrRegex = new RegExp(q, 'i');

            // iterate through the pool of strings and for any string that
            // contains the substring `q`, add it to the `matches` array
            $.each(strs, function (i, str) {
                if (substrRegex.test(str)) {
                    matches.push(str);
                }
            });

            cb(matches);
        };
    };

    var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
        'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
        'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
        'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
        'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
        'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
        'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
        'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
        'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
    ];

    $('#the-basics .typeahead').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
        {
            name: 'states',
            source: substringMatcher(states)
        });

</script>
<script>
    /* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */

    function filterFunction() {
        $("input.ec-search-bar").keyup(function () {
            $("div.header-search div.ec-sidebar-block").removeClass("d-none");
            var el = $(this).val();
            console.log(el)
        })
        $(document).click(function (e) {
            // Đối tượng container chứa popup
            var container = $("div.ec-sidebar-block");

            // Nếu click bên ngoài đối tượng container thì ẩn nó đi
            if (!container.is(e.target) && container.has(e.target).length === 0) {
                container.addClass("d-none");
            }
        });

        var input, filter, a, i;
        input = document.getElementById("search1");
        filter = input.value.toUpperCase();
        div = document.getElementById("myDropdown");
        a = div.getElementsByTagName("span");
        for (i = 0; i < a.length; i++) {
            txtValue = a[i].textContent || a[i].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                a[i].parentElement.className = "list-group-item d-flex";
            } else {
                console.log(a[i].parentElement)
                a[i].parentElement.className = "d-none";
            }
        }
    }

    function filterFunctionMobi() {
        $("input.typeahead").keyup(function () {
            $("div.header-search div.ec-sidebar-block").removeClass("d-none");
            var el = $(this).val();
            console.log(el)
        })
        $(document).click(function (e) {
            // Đối tượng container chứa popup
            var container = $("div.ec-sidebar-block");

            // Nếu click bên ngoài đối tượng container thì ẩn nó đi
            if (!container.is(e.target) && container.has(e.target).length === 0) {
                container.addClass("d-none");
            }
        });

        var input, filter, a, i;
        input = document.getElementById("search");
        filter = input.value.toUpperCase();
        div = document.getElementById("myDropdown-mobi");
        a = div.getElementsByTagName("span");
        for (i = 0; i < a.length; i++) {
            txtValue = a[i].textContent || a[i].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                a[i].parentElement.className = "list-group-item d-flex";
            } else {
                console.log(a[i].parentElement)
                a[i].parentElement.className = "d-none";
            }
        }
    }
</script>