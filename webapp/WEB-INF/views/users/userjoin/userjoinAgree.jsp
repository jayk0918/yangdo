<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/includes/userHeaderFooter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/users/loginjoin.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<body>
<div class="layer_fix pop_login pop_mem_reserve">
    <section>
        <div class="fix_title">
            <strong>양도어때 약관 동의</strong>
        </div>

        <div class="terms_agree">
            <p class="all_check">
                <label><input type="checkbox" id="checkAll" class="inp_chk_02 chk_default">전체 동의</label>
            </p>
            <p>
                <input type="checkbox" id="terms" value="N" class="inp_chk_02 chk_default terms_checkbox" require="">
                <a href="https://www.goodchoice.kr/more/terms/terms" target="_blank">이용약관 동의</a> <span>(필수)</span>
            </p>
			<p>
				<input type="checkbox" id="teenager" value="N" class="inp_chk_02 chk_default terms_checkbox" require="">
				<a href="https://www.goodchoice.kr/more/over14yearsOldAgree " id="fourteen" target="_blank">만 14세 이상 확인 </a><span> (필수)</span>
			</p>
            <p>
                <input type="checkbox" id="privacy" value="N" class="inp_chk_02 chk_default terms_checkbox" require="">
                <a href="https://www.goodchoice.kr/more/privacyRequire" target="_blank">개인정보 수집 및 이용 동의 </a><span> (필수)</span>
            </p>
			<p>
				<input type="checkbox" id="privacy_auxiliary_policy" value="N" class="inp_chk_02 chk_default terms_checkbox">
				<a href="https://www.goodchoice.kr/more/privacySelect" target="_blank">개인정보 수집 및 이용 동의</a> (선택)
			</p>
            <p>
				<input type="checkbox" id="marketing" value="N" class="inp_chk_02 chk_default terms_checkbox">
				<a href="http://api3.goodchoice.kr/more/marketingAgree" target="_blank">마케팅 알림 수신동의</a> (선택)
			</p>
            <p>
                <input type="checkbox" id="location" value="N" class="inp_chk_02 chk_default terms_checkbox">
                <a href="https://www.goodchoice.kr/more/terms/location" target="_blank">위치기반 서비스 이용약관 동의</a> (선택)
            </p>

            <button type="button" class="btn_link gra_left_right_red" disabled="disabled" id="terms_agree_btn" onclick ="location.href='${pageContext.request.contextPath}/join/userJoinForm';"><span>다음</span></button>
        </div>
    </section>



</div>
</body>

<script type="text/javascript">

	
	var nicknames = [];

	var privacy_auxiliary_policy = "N";
	var location_policy = "N";
	var marketing_acceptance = "N"

	$(function () {
	    if ($('.terms_agree').length > 0) {
	        $('#checkAll').on('click', function () {
	            var checked = false;

	            if($(this).is(':checked')){
	                checked = true;

	                $('#terms_agree_btn').addClass('gra_left_right_red').attr('disabled',false);
	            }else{
	                checked = false;

	                $('#terms_agree_btn').removeClass('gra_left_right_red').attr('disabled',true);
	            }

	            $('.terms_checkbox').each(function (k) {
	                $(this).prop("checked", checked);
	            });
	        });

	        $('.terms_checkbox').on('click', function () {
	            if ($('.terms_checkbox:checked').length > 4) {
	                $('#checkAll').prop("checked", true);
	            } else {
	                $('#checkAll').prop("checked", false);
	            }

	            if ($('.terms_checkbox[require]:checked').length > 2) {
	                $('#terms_agree_btn').addClass('gra_left_right_red').attr('disabled',false);
	            } else {
	                $('#terms_agree_btn').removeClass('gra_left_right_red').attr('disabled',true);
	            }
	        });

	        $('#terms_agree_btn[disabled]').on('click', function () {

				privacy_auxiliary_policy = $('#privacy_auxiliary_policy').is(':checked') ? "Y" : "N";
				location_policy = $('#location').is(':checked') ? "Y" : "N";
				marketing_acceptance = $('#marketing').is(':checked') ? "Y" : "N";

	            $('.pop_login section').html($('#verification_phone').html());
	            $('#verification_phone').remove();
	        });
	    }
	});

	function joinTemplate() {
	    
	    $('.layer_fix').addClass('fix_disable'); // 스크롤 가능하게
	    $('.pop_login section').html($('#joinFormTemplate').html());
	    $('#joinFormTemplate').remove();
	    $('#nicknameFormTemplate').remove();

	    var validate = $( "#joinForm" ).validate({
	        submitHandler:function (frm) {
	            var csrf_name = $('meta[name="csrf-name"]').attr('content');
	            var flag = false;

	            $.ajax({
	                url: '/user/joinNicknameCheck',
	                type: 'post',
	                data: {
	                    unick: frm.unick.value,
	                    token: $('input[name="'+ csrf_name +'"]').val()
	                },
	                dataType: 'json',
	                async: false,
	                cache: false,
	                success: function (result) {
	                    if (result.code != 200) {
	                        $( frm.unick ).parents( ".form-errors" )
	                            .addClass( "inp_error" )
	                            .removeClass( "has-success" );

	                        validate.showLabel(frm.unick, result.message);

	                        $('#unick-error').show();
	                    } else {
							flag = true;
						}
	                },
	                error:function(x,e){
	                    alert_Msg('정상적인 접근이 아닙니다.');
	                }
	            });

	            return flag;
	        }
	    });

		msg_key = 1;

		function joinFromSubmit(){
			if(!email_validate(true)) return;
			if(!new_pw_validate('red',true)) return;
			$('#new_pw_msg').empty();
			if(!new_pw_re_validate(true)) return;

			var csrf_name = $('meta[name="csrf-name"]').attr('content');
			var email = $('#gcuseremail').val();
			var unick = $('#unick').val();
			var flag = false;
			$.ajax({
				url: '/user/joinEmailCheck',
				type: 'post',
				data: {
					uid:email,
					token:$('input[name="'+ csrf_name +'"]').val()
				},
				dataType: 'json',
				async: false,
				cache: false,
				success: function (result) {
					if (result.code == 202) {
						$('#gcuseremail_msg').html('이미 등록된 이메일입니다.');
					} else {
						if (result.code != 200){
							alert_Msg(result.message);
							return;
						} else{
							flag = true;
						}
					}
				},
				error:function(x,e){
					alert_Msg('정상적인 접근이 아닙니다.');
					return;
				}
			});

			$.ajax({
				url: '/user/joinNicknameCheck',
				type: 'post',
				data: {
					unick: unick,
					token: $('input[name="'+ csrf_name +'"]').val()
				},
				dataType: 'json',
				async: false,
				cache: false,
				success: function (result) {
					if (result.code == 200) {
						flag = true;
					} else {
						alert_Msg(result.message);
					}
				},
				error:function(x,e){
					alert_Msg('정상적인 접근이 아닙니다.');
				}
			});

			if(flag){
				$('input[name=privacy_auxiliary_policy]').val(privacy_auxiliary_policy);
				$('input[name=location_policy]').val(location_policy);
				$('input[name=marketing_acceptance]').val(marketing_acceptance);

				$('#joinForm').submit();
			}

		}

		$('#joinBtn').on("click", function(){
			joinFromSubmit();
		});

		$('#gcuseremail').keyup(function () {
				email_validate(true);
				join_BtnDisabled_validate();
			}
		);

		$('#gcuseremail').focusout(function () {
				email_validate(true);
				join_BtnDisabled_validate();
			}
		);

		$('#new_pw').keyup(function () {
				new_pw_validate('gray',true);
				join_BtnDisabled_validate();
			}
		);

		$('#new_pw').focusout(function () {
			var color = $('#new_pw_msg').css('color');
			if(color != 'rgb(0, 0, 255)'){
				$('#new_pw_msg').css('color', 'red');
			} else {
				$('#new_pw_msg').empty();
			}
			join_BtnDisabled_validate();
		});

		$('#new_pw_re').keyup(function () {
				new_pw_re_validate(true);
				join_BtnDisabled_validate();
			}
		);


		join_BtnDisabled_validate();
	    recommendNicknames();
	    $('.wrap').removeClass('show');
	    spinner_show();
	}

	function recommendNicknames() {
	    $.post('/verification/recommendNicknames', function (result) {
	        if (result.code != 200) {
	            toastPop(result.message);
	            return false;
	        }

	        nicknames = result.data.nicknames;

	        nicknames = shuffle(nicknames);
	        nicknames = shuffle(nicknames);

	        var label = $('#unick').parent().find('label');

	        if (label.length > 0) {
	            label.addClass('default_label_txt icon-ic_downwards_arrow').html('추천 닉네임이에요!')
	        } else {
	            $('#unick').after('<label id="unick-error" ' +
	                'class="error help-block default_label_txt icon-ic_downwards_arrow" ' +
	                'for="unick">추천 닉네임이에요!</label>')
	        }

	        $('#unick').val(nicknames[0]);
	        spinner_hide();
	        $('.wrap').addClass('show');
	        spin_dimm_off();

	        $('#unick').on('input',function(){
	            if($(this).val() == ''){
	                return false;
	                console.log('1');
	            }else{
	                $('#unick-error').hide().removeClass('default_label_txt icon-ic_downwards_arrow');
	            }
	        });
	    });
	}

	function changeNickname() {
	    nicknames = shuffle(nicknames);

	    var label = $('#unick').parent().removeClass('inp_error').find('label');

	    if (label.length > 0) {
	        label.addClass('default_label_txt icon-ic_downwards_arrow').html('추천 닉네임이에요!')
	    } else {
	        $('#unick').after('<label id="unick-error" ' +
	            'class="error help-block default_label_txt icon-ic_downwards_arrow" ' +
	            'for="unick">추천 닉네임이에요!</label>')
	    }

	    $('#unick').val(nicknames[0]);
	    $('#unick-error').show();
	}

	function snsJoinProcess() {
	    var data = {
	        phone_number: $('#phone_number').val(),
	        digit: $('#digit').val()
	    };

	    if (data.phone_number.length == 0) {
	        spin_dimm_off();

	        toastPop('휴대폰 번호를 입력하세요.');

	        return false;
	    }

	    if (regExp.exec(data.phone_number) == null) {
	        spin_dimm_off();

	        toastPop('휴대폰 번호 형식이 아닙니다.');

	        return false;
	    }

	    $('.pop_login section').html($('#nicknameFormTemplate').html());
	    $('#nicknameFormTemplate').remove();
	    $('#joinFormTemplate').remove();

	    var validate = $( "#nicknameForm" ).validate({
	        lang: 'ko',
	        debug: true,
	        onkeyup: function(element) {
	            $(element).valid();
	        },
	        onblur: function(element) {
	            $(element).valid();
	        },
	        errorPlacement: function ( error, element ) {
	            // Add the `help-block` class to the error element
	            error.addClass( "help-block" );

	            if ( element.prop( "type" ) === "checkbox" ) {
	                error.insertAfter( element.parent( "label" ) );
	            } else {
	                error.insertAfter( element );
	            }
	        },
	        highlight: function ( element, errorClass, validClass ) {
	            if (! $( element ).parents( ".form-errors" ).hasClass( "form-password-rule" ))
	                $( element ).parents( ".form-errors" ).addClass( "inp_error" ).removeClass( "has-success" );
	        },
	        unhighlight: function (element, errorClass, validClass) {
	            if (! $( element ).parents( ".form-errors" ).hasClass( "form-password-rule" ))
	                $( element ).parents( ".form-errors" ).addClass( "has-success" ).removeClass( "inp_error" );
	        },
	        submitHandler:function (frm) {
	            var csrf_name = $('meta[name="csrf-name"]').attr('content');
	            var flag = false;

	            spin_dimm();
	            $.ajax({
	                url: '/user/joinNicknameCheck',
	                type: 'post',
	                data: {
	                    unick: frm.unick.value,
	                    token: $('input[name="'+ csrf_name +'"]').val()
	                },
	                dataType: 'json',
	                async: false,
	                cache: false,
	                success: function (result) {
	                    if (result.code != 200) {
	                        $( frm.unick ).parents( ".form-errors" )
	                            .addClass( "inp_error" )
	                            .removeClass( "has-success" );

	                        spin_dimm_off();

	                        validate.showLabel(frm.unick, result.message);
	                    } else {
							flag = true;
						}
	                },
	                error:function(x,e){
	                    alert_Msg('정상적인 접근이 아닙니다.');
	                    spin_dimm_off();
	                }
	            });

	            if (flag) {
	                data['unick'] = frm.unick.value;
					data['privacy_auxiliary_policy'] = privacy_auxiliary_policy;
					data['location_policy'] = location_policy;
					data['marketing_acceptance'] = marketing_acceptance;

	                $.post('/user/snsJoinProcess', data, function (result) {
	                    spin_dimm_off();

	                    if (result.code == 200) {
	                        window.location.href = result.data.url;
	                    } else {
	                        clearTimecount();
	                        cencelSend();
	                        alert_Msg(result.message, 1, result.data.url);
	                    }
	                });

	                $('#unick').on('input',function(){
	                    if($(this).val() == ''){
	                        return false;
	                        console.log('1');
	                    }else{
	                        $('#unick-error').hide().removeClass('default_label_txt icon-ic_downwards_arrow');
	                    }
	                });
	            }
	        }
	    });

	    spin_dimm();
	    recommendNicknames();
	}

</script>

</html>