<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    a.disabled {
        pointer-events: none;
        cursor: default;
    }
</style>
<div class="ec-pro-pagination justify-content-center">
    <%--                        <span>Showing 1-12 of 21 item(s)</span>--%>
    <ul class="ec-pro-pagination-inner">
        <li>
            <a class="<c:if test="${list.page == 1}">disabled</c:if>"
               href="/ekka/${list.path}?page=${list.page>2? list.page- 1: 1}&perpage=${list.perpage}&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${list.sort}"
               tabindex="-1" aria-disabled="true"><i class="fa-solid fa-backward"></i></a>
        </li>
        <c:forEach begin="1" end="${list.numberPage}" step="1" var="p">
            <li>
                <a class="<c:if test="${p==list.page}">active</c:if>"
                   href="/ekka/${list.path}?page=${p}&perpage=${list.perpage}&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${list.sort}">${p}</a>
            </li>
        </c:forEach>
        <li>
            <a class="<c:if test="${list.page == list.numberPage}">disabled</c:if>"
               href="/ekka/${list.path}?page=${list.page < list.numberPage ? list.page + 1 : list.page}&perpage=${list.perpage}&key=${list.key}&category=${list.category}&genderCategory=${list.genderCategory}&brand=${list.brand}&firstPrice=${list.firstPrice}&lastPrice=${list.lastPrice}&sort=${list.sort}"><i class="fa-solid fa-forward"></i></a>
        </li>
    </ul>
</div>