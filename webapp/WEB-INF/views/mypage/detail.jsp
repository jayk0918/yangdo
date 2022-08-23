<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>여행할때 양도어때</title>

<!-- css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/includes/userHeaderFooter.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/mypage/mycommon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/mypage/my.css">

<!-- //css -->
</head>

<!-- js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<!-- //js -->
<body class="pc and">
	<!-- Wrap -->
	<div id="wrap" class="wrap show">

		<!-- Header// -->
		<c:import url="/WEB-INF/views/includes/userHeader.jsp"></c:import>
		<!-- //Header// -->

		<!-- Subtop -->
		<c:import url="/WEB-INF/views/mypage/includes/mysubtop.jsp"></c:import>
		<!-- //Subtop -->

		<!-- Content  -->
		<div id="content" class="sub_wrap my_wrap">

			<!-- Nav -->
			<c:import url="/WEB-INF/views/mypage/includes/mynav.jsp"></c:import>
			<!-- Nav -->

			<div class="align_rt">
				<div class="reserve_detail">
					<c:forEach var="myVo" items="${myVo}">
						<!-- 예약완료이면 -->
						<c:if test="${myVo.status==1}">
							<!-- info -->
							<div class="info">
								<div>
									<i>예약완료</i> <strong>${myVo.pName}</strong> <span>${myVo.rName}(기준
										${myVo.sPple}인 ㆍ 최대 ${myVo.mPple}인)</span>
								</div>
							</div>
							<!-- info -->

							<!-- detail -->
							<section class="detail">
								<div>
									<p>
										<strong>체크인</strong>${myVo.checkIn} ㆍ ${myVo.inTime}
									</p>
									<p>
										<strong>체크아웃</strong>${myVo.checkOut} ㆍ ${myVo.outTime}
									</p>
									<p>
										<strong>인원</strong>기준 ${myVo.sPple}인 ㆍ 최대 ${myVo.mPple}인
									</p>
								</div>
								<div>
									<p>
										<strong>예약번호</strong>${myVo.resNo}
									</p>
									<p>
										<strong>예약자 이름</strong>${myVo.name}
									</p>
									<p>
										<strong>휴대폰 번호</strong>${myVo.hp} <span class="safety_txt_2">휴대폰
											번호는 숙소에 전송되며, 퇴실 후 7일간 보관됩니다. </span>
									</p>
								</div>
								<div class="sub_total">
									<p>
										<strong>결제정보</strong>
									</p>
									<p>
										<strong class="sub_info"> 주문금액 </strong> <b>
											${myVo.tPrice}원</b>
									</p>
									<%-- <p>
			<strong class="sub_info"> 추가금액 </strong> <b> ${myVo.exPrice}원</b>
		</p>
		<p>
			<strong class="sub_info"> 할인금액 </strong> <b> ${myVo.dcPrice}원</b>
		</p> --%>
								</div>
								<div class="total">
									<p>
										<strong>총 결제금액</strong> <b> ${myVo.tPrice}원</b>
									</p>
								</div>
							</section>

							<a href="" class="btn_call">전화로 문의하기</a>

							<section>
								<div style="padding-top: 0; padding-bottom: 0">
									<div
										class="booking_detail_section_layout_wrap booking-cancel__section"
										style="border-bottom: none;">
										<div class="booking-detail-section-title__wrap">
											<div>
												<!---->
												<div class="sub-title">
													<div class="color-green">2022년 08월 28일 23:59까지 양도
														가능합니다.</div>
													<div class="color-red">2022년 08월 24일 23:59까지 무료 취소
														가능합니다.</div>
													<!---->
												</div>
											</div>
											<!---->
										</div>
										<a
											href="${pageContext.request.contextPath}/sale?no=${myVo.resNo}">
											<button type="button" id="btn_relist_confirm"
												class="btn_flat booking_detail_flat_button color-green"
												data-toggle="modal" data-target="#relist-modal">양도하기</button>
										</a>
										<button type="button" id="btn_cancel_confirm"
											class="btn_flat booking_detail_flat_button color-red btn-danger btn btn-primary"
											data-toggle="modal" data-target="#cancel_modal">예약취소
										</button>
										<!---->
									</div>
									<!---->
								</div>
								<!---->
							</section>
							<!-- detail -->
						</c:if>
						<c:if test="${myVo.status==3}">
							<div class="info" style="">
								<div>
									<i class="bg_w">이용완료</i> <strong>${myVo.pName}</strong> <span>${myVo.rName}(기준
										${myVo.sPple}인 / 최대 ${myVo.mPple}인)</span>
								</div>
							</div>
							<section class="detail">
								<div>
									<p>
										<strong>체크인</strong>${myVo.checkIn} ㆍ ${myVo.inTime}
									</p>
									<p>
										<strong>체크아웃</strong>${myVo.checkOut} ㆍ ${myVo.outTime}
									</p>
									<p>
										<strong>인원</strong>기준 ${myVo.sPple}인 ㆍ 최대 ${myVo.mPple}인
									</p>
								</div>
								<div>
									<p>
										<strong>예약번호</strong>${myVo.resNo}
									</p>
									<p>
										<strong>예약자 이름</strong>${myVo.name}
									</p>
									<p>
										<strong>휴대폰 번호</strong>${myVo.hp} <span class="safety_txt_2">휴대폰
											번호는 숙소에 전송되며, 퇴실 후 7일간 보관됩니다. </span>
									</p>
								</div>
								<div class="sub_total">
									<p>
										<strong>결제정보</strong>
									</p>
									<p>
										<strong class="sub_info"> 주문금액 </strong> <b>
											${myVo.tPrice}원</b>
									</p>
									<%-- <p>
			<strong class="sub_info"> 추가금액 </strong> <b> ${myVo.exPrice}원</b>
		</p>
		<p>
			<strong class="sub_info"> 할인금액 </strong> <b> ${myVo.dcPrice}원</b>
		</p> --%>
								</div>
								<div class="total">
									<p>
										<strong>총 결제금액</strong> <b> ${myVo.tPrice}원</b>
									</p>
								</div>
							</section>
							<section>
								<div style="padding-top: 0; padding-bottom: 0">
									<div
										class="booking_detail_section_layout_wrap booking-cancel__section"
										style="border-bottom: none;">
										<button type="button"
											class="btn_flat btn-green booking_detail_flat_button color-red-long">리뷰
											남기기</button>
									</div>
								</div>
							</section>
						</c:if>
						<c:if test="${myVo.status==4}">
							<div class="info" style="">
								<div>
									<i class="bg_w">예약취소</i> <strong>${myVo.pName}</strong> <span>${myVo.rName}(기준
										${myVo.sPple}인 / 최대 ${myVo.mPple}인)</span>
								</div>
							</div>

							<section class="detail">
								<div>
									<p>
										<strong>체크인</strong>${myVo.checkIn} ㆍ ${myVo.inTime}
									</p>
									<p>
										<strong>체크아웃</strong>${myVo.checkOut} ㆍ ${myVo.outTime}
									</p>
									<p>
										<strong>인원</strong>기준 ${myVo.sPple}인 ㆍ 최대 ${myVo.mPple}인
									</p>
								</div>
								<div>
									<p>
										<strong>예약번호</strong>${myVo.resNo}
									</p>
									<p>
										<strong>예약자 이름</strong>${myVo.name}
									</p>
									<p>
										<strong>휴대폰 번호</strong>${myVo.hp} <span class="safety_txt_2">휴대폰
											번호는 숙소에 전송되며, 퇴실 후 7일간 보관됩니다. </span>
									</p>
								</div>
								<div class="sub_total">
									<p>
										<strong>결제정보</strong>
									</p>
									<p>
										<strong class="sub_info"> 취소금액 </strong> <b>
											${myVo.tPrice}원</b>
									</p>
									<%-- <p>
			<strong class="sub_info"> 추가금액 </strong> <b> ${myVo.exPrice}원</b>
		</p>
		<p>
			<strong class="sub_info"> 할인금액 </strong> <b> ${myVo.dcPrice}원</b>
		</p> --%>
								</div>
								<div class="total">
									<p>
										<strong>총 결제금액</strong> <b> ${myVo.tPrice}원</b>
									</p>
								</div>
							</section>
							<section>
								<div style="padding-top: 0; padding-bottom: 0">
									<div
										class="booking_detail_section_layout_wrap booking-cancel__section"
										style="border-bottom: none;">
										<!---->
										<button type="button"
											class="btn_flat btn-green booking_detail_flat_button color-green-long">다시
											예약</button>
									</div>
									<!---->
									<!---->
								</div>
							</section>
						</c:if>
						<c:if test="${myVo.status==6}">
							<div class="info" style="">
								<div>
									<i>양도대기</i> <strong>${myVo.pName}</strong> <span>${myVo.rName}(기준
										${myVo.sPple}인 최대 ${myVo.mPple}인)</span>
								</div>
							</div>

							<section class="detail">
								<div>
									<p>
										<strong>체크인</strong>${myVo.checkIn} ㆍ ${myVo.inTime}
									</p>
									<p>
										<strong>체크아웃</strong>${myVo.checkOut} ㆍ ${myVo.outTime}
									</p>
									<p>
										<strong>인원</strong>기준 ${myVo.sPple}인 ㆍ 최대 ${myVo.mPple}인
									</p>
								</div>
								<div>
									<p>
										<strong>예약번호</strong>${myVo.resNo}
									</p>
									<p>
										<strong>예약자 이름</strong>${myVo.name}
									</p>
									<p>
										<strong>휴대폰 번호</strong>${myVo.hp} <span class="safety_txt_2">휴대폰
											번호는 숙소에 전송되며, 퇴실 후 7일간 보관됩니다. </span>
									</p>
								</div>
								<div class="sub_total">
									<p>
										<strong>결제정보</strong>
									</p>
									<p>
										<strong class="sub_info"> 주문금액 </strong> <b>
											${myVo.tPrice}원</b>
									</p>
									<%-- <p>
			<strong class="sub_info"> 추가금액 </strong> <b> ${myVo.exPrice}원</b>
		</p>
		<p>
			<strong class="sub_info"> 할인금액 </strong> <b> ${myVo.dcPrice}원</b>
		</p> --%>
								</div>
								<div class="total">
									<p>
										<strong>총 결제금액</strong> <b> ${myVo.tPrice}원</b>
									</p>
								</div>
							</section>

							<a href="" class="btn_call">전화로 문의하기</a>
							<section>
								<div style="padding-top: 0; padding-bottom: 0">
									<div
										class="booking_detail_section_layout_wrap booking-cancel__section"
										style="border-bottom: none;">
										<div class="booking-detail-section-title__wrap">
											<!---->
										</div>
										<button type="button"
											class="btn_flat btn-green booking_detail_flat_button color-green-long">양도내역
											확인하기</button>
										<!---->
										<!---->
									</div>
								</div>
								<!---->
							</section>
						</c:if>
						<c:if test="${myVo.status==5}">
							<div class="info" style="">
								<div>
									<i class="bg_w">양도완료</i> <strong>${myVo.pName}</strong> <span>${myVo.rName}(기준
										${myVo.sPple}인 최대 ${myVo.mPple}인)</span>
								</div>
							</div>
							<section class="detail">
								<div>
									<p>
										<strong>체크인</strong>${myVo.checkIn} ㆍ ${myVo.inTime}
									</p>
									<p>
										<strong>체크아웃</strong>${myVo.checkOut} ㆍ ${myVo.outTime}
									</p>
									<p>
										<strong>인원</strong>기준 ${myVo.sPple}인 ㆍ 최대 ${myVo.mPple}인
									</p>
								</div>
								<div>
									<p>
										<strong>예약번호</strong>${myVo.resNo}
									</p>
									<p>
										<strong>예약자 이름</strong>${myVo.name}
									</p>
									<p>
										<strong>휴대폰 번호</strong>${myVo.hp} <span class="safety_txt_2">휴대폰
											번호는 숙소에 전송되며, 퇴실 후 7일간 보관됩니다. </span>
									</p>
								</div>
								<div class="sub_total">
									<p>
										<strong>결제정보</strong>
									</p>
									<p>
										<strong class="sub_info"> 주문금액 </strong> <b>
											${myVo.tPrice}원</b>
									</p>
									<%-- <p>
			<strong class="sub_info"> 추가금액 </strong> <b> ${myVo.exPrice}원</b>
		</p>
		<p>
			<strong class="sub_info"> 할인금액 </strong> <b> ${myVo.dcPrice}원</b>
		</p> --%>
								</div>
								<div class="total">
									<p>
										<strong>총 결제금액</strong> <b> ${myVo.tPrice}원</b>
									</p>
								</div>
							</section>
							<a href="" class="btn_call">전화로 문의하기</a>
							<section>
								<div style="padding-top: 0; padding-bottom: 0">
									<div
										class="booking_detail_section_layout_wrap booking-cancel__section"
										style="border-bottom: none;">
										<div class="booking-detail-section-title__wrap">
											<!---->
										</div>
										<button type="button"
											class="btn_flat btn-green booking_detail_flat_button color-green-long">메인으로
											이동하기</button>
										<!---->
										<!---->
									</div>
								</div>
								<!---->
							</section>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div>
				<!---->
			</div>
			<!-- Footer -->
			<c:import url="/WEB-INF/views/includes/userFooter.jsp"></c:import>
			<!-- Footer -->
		</div>
	</div>

	<!----------------------------------삭제 모달---------------------------------------------->
	<!-- Modal -->
	<div class="modal fade" id="btnPop" tabindex="-1" role="dialog"
		aria-labelledby="btnPopLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="btnPopLabel">삭제하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">내역을 삭제하시겠습니까?</div>
				<form action="${pageContext.request.contextPath}/my/delete"
					method="get">
					<div class="modal-footer">
						<input type="hidden" name="no" value="${myVo.resNo}">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!----------------------------------//삭제 모달---------------------------------------------->

	<!----------------------------------//양도확인 모달---------------------------------------------->
	<div id="relist-modal" class="modal fade">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">양도하기</h4>
				</div>
				<div class="modal-body">
					<div class="con">
						양도하시겠습니까?
						<div class="con color-dan">
							가격: <span id="modalPrice" class="con color-dan"></span>원
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="no" value="${myVo.resNo}">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button id="relist" type="submit" class="btn btn-danger">확인</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!----------------------------------취소 환불 모달---------------------------------------------->
	<!-- 취소환불 프로세스 모달창 -->
	<div class="modal fade" id="cancel-modal" tabindex="-1" role="dialog"
		aria-labelledby="cancel-modalTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cancel-modalTitle">취소내역 확인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<h5>지금 예약 취소 시</h5>
						<h5>
							취소 수수료 <strong class="text-danger">0원</strong>이 발생합니다.
						</h5>
						<div class="row" name="collapseBody">
							<p>
								<a class="text" href="#" role="button" data-bs-toggle="collapse"
									data-bs-target="#collapse" aria-expanded="true"
									aria-controls="collapse">원 결제내역 펼치기</a>
							</p>
							<div class="collapse" id="collapse">
								<div class="row mx-2 my-2"
									style="background: coral; color: white;">
									<h6 class="my-3">
										<strong style="color: white;">환불 예정 정보</strong>
									</h6>
									<div class="col">
										<p>결제금액</p>
										<p>취소 수수료 발생</p>
										<p>ㄴ 상품권에서 차감</p>
										<p>ㄴ 포인트에서 차감</p>
										<p>ㄴ 현금에서 차감</p>
									</div>
									<div class="text-end col">
										<p>
											<fmt:formatNumber>${payment.paymentTotalPrice }</fmt:formatNumber>
											원
										</p>
										<p>0원</p>
										<p>0원</p>
										<p>0P</p>
										<p>0원</p>
									</div>
									<hr>
									<div class="col-8">
										<p>포인트 환금</p>
										<p>상품권 환금</p>
										<p>환불방법</p>
										<p></p>
										<p>
											<strong>최종 환불금액</strong>
										</p>
									</div>
									<div class="text-end col">
										<p>0P</p>
										<p>0원</p>
										<p>카카오페이 환불</p>
										<p>
											<fmt:formatNumber>${payment.paymentTotalPrice }</fmt:formatNumber>
											원
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row m-4" name="reason">
							<h6 class="my-3">
								<strong>취소사유</strong>
							</h6>
							<!-- 환불이유란 DB에 추가하기 -->
							<select id="reason" class="form-select"
								aria-label="Default select example">
								<option selected>[필수] 취소 사유를 선택해주세요</option>
								<option value="1">방문불가/여행취소</option>
								<option value="2">타 서비스에서 더 싼 상품발견</option>
								<option value="3">다시예약_같은숙소 일정/객실변경</option>
								<option value="4">다시예약_다른숙소로 변경</option>
								<option value="5">결제수단변경/쿠폰사용</option>
								<option value="6">업체요청</option>
								<option value="7">단순변심</option>
							</select>
							<ul>
								<li><small>취소수수료가 발생한 경우 포인트 -> 상품권 -> 현금 순으로
										차감됩니다. 실결제금액에서 현금에서 차감되는 취소수수료를 뺀 금액이 결제수단으로 환불 됩니다.</small></li>
								<li><small>취소수수료는 판매가(상품가격)기준으로 산정 됩니다</small></li>
								<li><small>예약/결제 당시에 적용된 <span class="text-danger">취소/환불
											규정</span>에 따라 취소수수료가 계산됩니다.
								</small></li>
								<li><small>예약/결제 당시에 적용된 예약/결제 시 사용한 포인트는 포인트로,
										상품권은 해당 상품권의 잔액으로 복원됩니다. 단, 취소 수수료를 차감한 금액으로 복원될 수 있습니다. 포인트나
										상품권 잔액은 취소에 의한 복원 여부에 상관없이 원 유효기간 등에 따라 잔액이 소멸될 수 있으니 주의 바랍니다.</small></li>
								<li><small>결제수단이 휴대폰결제인 경우 취소 시점에 다라 취소수수료가 재승인될 수
										있습니다</small></li>
								<li><small>휴대폰 전월 결제 건은 예약취소 후 예약자 본인 명의의 통장으로 환불처리
										됩니다.</small></li>
								<li><small>환불은 예약취소후 PG사 승인 취소 기간에 따라 주말, 공휴일을 제외한
										영업일 기준 최대 3~5일 소요됩니다.</small></li>
							</ul>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-toggle="modal" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary"
							id="cancel_confirm_btn">취소진행</button>
					</div>
				</div>
			</div>
		</div>
		<!----------------------------------//취소 환불 모달---------------------------------------------->
		<!-- 취소진행 모달 -->
		<div class="modal fade" id="cancel_confirm_modal" data-bs-backdrop="static"
			data-bs-keyboard="false" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body m-2">
						<p>환불 예정금액을 모두 확인하셨나요?</p>
						<p>예약을 정말 취소하시겠습니까 ?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light" data-bs-toggle="modal"
							data-bs-dismiss="modal">닫기</button>
						<button class="btn btn-success"
							data-bs-target="#cancelconfirmModal" data-bs-toggle="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 취소확인 모달 -->
		<div class="modal fade" id="cancelconfirmModal"
			data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true"
			tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body m-2">예약취소 되었습니다.</div>
					<div class="modal-footer">
						<form action="" id="reservationNoForm">
							<a class="btn btn-danger" data-bs-toggle="modal" role="button">확인</a> <input
								type="hidden" id="resNo" name="no"
								value="${myVo.resNo}">
						</form>
					</div>
				</div>
			</div>
		</div>
</body>

<script>
	$(document).ready(function() {
		$("#btn_relist_confirm").on("click", function() {
			$("#relist-modal").modal("show");
		});
	});
</script>

</html>