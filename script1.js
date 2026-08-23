
$(document).ready(function () {

    function filterProducts() {
        const searchText = $("#searchInput").val().toLowerCase().trim();
        const selectedCategory = $("#categorySelect").val().toLowerCase();

        let foundProducts = 0;

        $(".product-card").each(function () {

            const productName = $(this).find("h3").text().toLowerCase();
            const productCategory = $(this).data("category").toLowerCase();

            const matchesSearch =
                searchText === "" ||
                productName.includes(searchText);

            const matchesCategory =
                selectedCategory === "all categories" ||
                productCategory === selectedCategory;

            if (matchesSearch && matchesCategory) {
                $(this).stop(true, true).fadeIn(300);
                foundProducts++;
            } else {
                $(this).stop(true, true).fadeOut(200);
            }

        });

        if (foundProducts === 0) {
            $("#noProducts").fadeIn(300);
        } else {
            $("#noProducts").hide();
        }
    }

    $("#searchButton").click(function () {
        filterProducts();
    });

    $("#searchInput").on("keypress", function (event) {

        if (event.which === 13) {
            filterProducts();
        }

    });

    $("#categorySelect").change(function () {
        filterProducts();
    });

    $(".category-card").click(function () {

        const category = $(this).data("category");

        $(".category-card").removeClass("selected-category");

        $(this).addClass("selected-category");

        $("#categorySelect").val(category);

        filterProducts();

        $("html, body").animate(
            {
                scrollTop: $(".products-section").offset().top - 80
            },
            600
        );

    });

    $(".view-product").click(function () {

        const productCard = $(this).closest(".product-card");

        const productName = productCard.find("h3").text();

        const productPrice = productCard
            .find(".product-bottom strong")
            .text();

        alert(
            "Product Selected!\n\n" +
            "Product: " + productName +
            "\nPrice: " + productPrice
        );

    });

    $("#marketButton").click(function (event) {

        event.preventDefault();

        $("html, body").animate(
            {
                scrollTop: $(".price-table").offset().top - 100
            },
            700
        );

    });

    $(".farmer-btn, .secondary-btn").click(function (event) {

        event.preventDefault();

        alert(
            "Farmer Registration\n\n" +
            "This feature will be available soon!"
        );

    });

    $(".login-btn").click(function (event) {

        event.preventDefault();

        alert(
            "Login Feature\n\n" +
            "Login functionality will be added soon!"
        );

    });

    $(".register-btn").click(function (event) {

        event.preventDefault();

        alert(
            "Registration Feature\n\n" +
            "Registration functionality will be added soon!"
        );

    });

    $(".nav-links a").click(function () {

        $(".nav-links a").removeClass("active");

        $(this).addClass("active");

    });

    $(".product-card").hover(
        function () {

            $(this).stop(true, false).animate(
                {
                    opacity: 0.85
                },
                200
            );

        },
        function () {

            $(this).stop(true, false).animate(
                {
                    opacity: 1
                },
                200
            );

        }
    );

    $("#categorySelect").change(function () {

        if ($(this).val() === "All Categories") {
            $(".category-card").removeClass("selected-category");
        }

    });

});