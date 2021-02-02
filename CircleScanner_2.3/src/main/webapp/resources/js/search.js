/* 결과화면 좌측 아코디언 메뉴 토글 */

$(".filter__title").on('click',function(){
    $(this).next(".filter__con").slideToggle(100);
});


/*  */
$( function() {
        //   날짜 선택기
        $( "#depart, #return" ).datepicker({
            language: "ko",
            orientation: "bottom auto",
            autoclose: true
        });

        $(".filter__button-wrap button").on("click",function () {
            $(this).css({'background-color':'var(--main-color)','color':'white'});
            $(".filter__button-wrap button").not(this).css({'background-color':'white','color':'black'});
        });

        $("#slider-range1").slider({
            range: true,
            min: 0,
            max: 1440,
            step: 15,
            values: [0, 1440],
            slide: function (e, ui) {
                var hours1 = Math.floor(ui.values[0] / 60);
                var minutes1 = ui.values[0] - (hours1 * 60);

                if (hours1.length == 1) hours1 = '0' + hours1;
                if (minutes1.length == 1) minutes1 = '0' + minutes1;
                if (minutes1 == 0) minutes1 = '00';
                if (hours1 >= 12) {
                    if (hours1 == 12) {
                        hours1 = "오후 " + hours1;
                        minutes1 = minutes1;
                    } else {
                        hours1 = "오후 " + (hours1 - 12);
                        minutes1 = minutes1;
                    }
                } else {
                    hours1 = "오전 " + hours1;
                    minutes1 = minutes1;
                }
                if (hours1 == 0) {
                    hours1 = 12;
                    minutes1 = minutes1;
                }
                $('.slider-time').html(hours1 + ':' + minutes1);

                var hours2 = Math.floor(ui.values[1] / 60);
                var minutes2 = ui.values[1] - (hours2 * 60);

                if (hours2.length == 1) hours2 = '0' + hours2;
                if (minutes2.length == 1) minutes2 = '0' + minutes2;
                if (minutes2 == 0) minutes2 = '00';
                if (hours2 >= 12) {
                    if (hours2 == 12) {
                        hours2 = "오후 " + hours2;
                        minutes2 = minutes2;
                    } else if (hours2 == 24) {
                        hours2 = "오후 " + 11;
                        minutes2 = "59";
                    } else {
                        hours2 = "오후 " + (hours2 - 12);
                        minutes2 = minutes2;
                    }
                } else {
                    hours2 = "오전 " + hours2;
                    minutes2 = minutes2;
                }
                $('.slider-time2').html(hours2 + ':' + minutes2);
            }
        });

        $("#slider-range2").slider({
            range: true,
            min: 0,
            max: 1440,
            step: 15,
            values: [0, 1440],
            slide: function (e, ui) {
                var hours1 = Math.floor(ui.values[0] / 60);
                var minutes1 = ui.values[0] - (hours1 * 60);

                if (hours1.length == 1) hours1 = '0' + hours1;
                if (minutes1.length == 1) minutes1 = '0' + minutes1;
                if (minutes1 == 0) minutes1 = '00';
                if (hours1 >= 12) {
                    if (hours1 == 12) {
                        hours1 = "오후 " + hours1;
                        minutes1 = minutes1;
                    } else {
                        hours1 = "오후 " + (hours1 - 12);
                        minutes1 = minutes1;
                    }
                } else {
                    hours1 = "오전 " + hours1;
                    minutes1 = minutes1;
                }
                if (hours1 == 0) {
                    hours1 = 12;
                    minutes1 = minutes1;
                }
                $('.slider-time3').html(hours1 + ':' + minutes1);

                var hours2 = Math.floor(ui.values[1] / 60);
                var minutes2 = ui.values[1] - (hours2 * 60);

                if (hours2.length == 1) hours2 = '0' + hours2;
                if (minutes2.length == 1) minutes2 = '0' + minutes2;
                if (minutes2 == 0) minutes2 = '00';
                if (hours2 >= 12) {
                    if (hours2 == 12) {
                        hours2 = "오후 " + hours2;
                        minutes2 = minutes2;
                    } else if (hours2 == 24) {
                        hours2 = "오후 " + 11;
                        minutes2 = "59";
                    } else {
                        hours2 = "오후 " + (hours2 - 12);
                        minutes2 = minutes2;
                    }
                } else {
                    hours2 = "오전 " + hours2;
                    minutes2 = minutes2;
                }
                $('.slider-time4').html(hours2 + ':' + minutes2);
            }
        });

        $("#slider-range3").slider({
            range: true,
            min: 0,
            max: 1440,
            step: 15,
            values: [0, 1440],
            slide: function (e, ui) {
                var hours1 = Math.floor(ui.values[0] / 60);
                var minutes1 = ui.values[0] - (hours1 * 60);

                if (hours1.length == 1) hours1 = '0' + hours1;
                if (minutes1.length == 1) minutes1 = '0' + minutes1;
                if (minutes1 == 0) minutes1 = '00';
                if (hours1 >= 12) {
                    if (hours1 == 12) {
                        hours1 = "오후 " + hours1;
                        minutes1 = minutes1;
                    } else {
                        hours1 = "오후 " + (hours1 - 12);
                        minutes1 = minutes1;
                    }
                } else {
                    hours1 = "오전 " + hours1;
                    minutes1 = minutes1;
                }
                if (hours1 == 0) {
                    hours1 = 12;
                    minutes1 = minutes1;
                }
                $('.slider-time5').html(hours1 + ':' + minutes1);

                var hours2 = Math.floor(ui.values[1] / 60);
                var minutes2 = ui.values[1] - (hours2 * 60);

                if (hours2.length == 1) hours2 = '0' + hours2;
                if (minutes2.length == 1) minutes2 = '0' + minutes2;
                if (minutes2 == 0) minutes2 = '00';
                if (hours2 >= 12) {
                    if (hours2 == 12) {
                        hours2 = "오후 " + hours2;
                        minutes2 = minutes2;
                    } else if (hours2 == 24) {
                        hours2 = "오후 " + 11;
                        minutes2 = "59";
                    } else {
                        hours2 = "오후 " + (hours2 - 12);
                        minutes2 = minutes2;
                    }
                } else {
                    hours2 = "오전 " + hours2;
                    minutes2 = minutes2;
                }
                $('.slider-time6').html(hours2 + ':' + minutes2);
            }
        });
    });