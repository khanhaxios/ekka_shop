<%@page pageEncoding="UTF-8" %>

<!-- Footer -->
<footer class="footer mt-auto">
    <div class="copyright bg-white">
        <p>
            Bản quyền &copy; <span id="ec-year"></span><a class="text-primary"
                                                          href="#" target="_blank"> Bảng điều khiển quản trị Ekka</a>.
        </p>
    </div>
</footer>
<script>
    const copyRightEls = document.querySelectorAll('#ec-direct-run');
    copyRightEls.forEach((val) => {
        val.remove();
    })
</script>