document.addEventListener("turbolinks:load", function () {
    flatpickr('.datepicker', {
        static: true,
        dateFormat: 'Y-m-d',
    });

    flatpickr('.datetimepicker', {
        static: true,
        enableTime: true,
        minuteIncrement: 1,
        dateFormat: 'Y-m-d h:i K'
    });
});
