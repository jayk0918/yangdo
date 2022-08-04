<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./assets/css/includes/userHeaderFooter.css">
<link rel="stylesheet" type="text/css" href="./assets/css/mainList/mainLists.css">
<link>
<body>
	<!-- wrap -->
	<div id="wrap" class="wrap show">
		<!-- header -->
		<c:import url="/WEB-INF/views/includes/userHeader.jsp"></c:import>
		<!-- header -->
		
		<!-- header �������� -->
		<div class="sub_top_wrap">
			<div class="sub_top">
				<h2>���</h2>
				<div class="area">
					<div class="btn_area align_vertical">
						<span class="center-block">���/��õ</span>
						����/�빮
					</div>
				</div>
			</div>
		</div>
		<!-- header �������� -->
		
		<!-- content -->
		<div id="content" class="sub_wrap">
			<!-- fillter -->
			<div class="filter_wrap">
				<section class="date_wrap">
					<h3>��¥</h3>
					<div class="btn_date">
						<img id="calendar" src="./assets/image/mainList/ico_cal_2.png">
						<span class="date_view">
							<b>8.2 ~ 8.3</b>
							<em><em>��1��</em></em>
							
						</span>
					</div>
				</section>
				<h3>������</h3>
				<div class="btn_wrap">
					<button id="btn_child1" type="button">�ʱ�ȭ</button>
					<button id="btn_child2" type="submit">����</button>
				</div>
				<section>
					<ul>
						<li>
							<input type="checkbox" id="yangdo" name="reserve[]" class="inp_chk" value="">
							<label for="yangdo" class="label_chk">�絵 ��</label>
						</li>
					</ul>
				</section>
				<section>
					<input type="hidden" id="persons" name="persons">
					<strong>�ο�</strong>
					<div class="cnt_people">
						<button type="button" class="disable dn">-</button>
						<span>2</span>
						<button type="button" class="up">+</button>						
					</div>
				</section>
				<section>
					<strong>����ü�</strong>
					<ul class="hide_type half">
						<li>
							<input type="checkbox" id="swimming_pool" name="swimming_pool" class="inp_chk">
							<label for="swimming_pool" class="label_chk">������</label>
						</li>
						<li>
							<input type="checkbox" id="football" name="football" class="inp_chk">
							<label for="football" class="label_chk">������</label>
						</li>
						<li>
							<input type="checkbox" id="cafe" name="cafe" class="inp_chk">
							<label for="cafe" class="label_chk">ī��</label>
						</li>
						<li>
							<input type="checkbox" id="singroom" name="singroom" class="inp_chk">
							<label for="singroom" class="label_chk">�뷡��</label>
						</li>
						<li>
							<input type="checkbox" id="store" name="store" class="inp_chk">
							<label for="store" class="label_chk">������</label>
						</li>
						<li>
							<input type="checkbox" id="parking" name="parking" class="inp_chk">
							<label for="parking" class="label_chk">������</label>
						</li>
						<li>
							<input type="checkbox" id="bbq" name="bbq" class="inp_chk">
							<label for="bbq" class="label_chk">BBQ</label>
						</li>
						<li>
							<input type="checkbox" id="restaurant" name="restaurant" class="inp_chk">
							<label for="restaurant" class="label_chk">�ֹ�/�Ĵ�</label>
						</li>
						<li>
							<input type="checkbox" id="smoking_room" name="smoking_room" class="inp_chk">
							<label for="smoking_room" class="label_chk">���ν�</label>
						</li>
					</ul>
				</section>
				<section>
					<strong>���� �� �ü�</strong>
					<ul class="hide_type half">
						<li>
							<input type="checkbox" id="refrigerator" name="refrigerator" class="inp_chk">
							<label for="refrigerator" class="label_chk">�����</label>
						</li>
						<li>
							<input type="checkbox" id="aircon" name="aircon" class="inp_chk">
							<label for="aircon" class="label_chk">������</label>
						</li>
						<li>
							<input type="checkbox" id="tv" name="tv" class="inp_chk">
							<label for="tv" class="label_chk">TV</label>
						</li>
						<li>
							<input type="checkbox" id="wifi" name="wifi" class="inp_chk">
							<label for="wifi" class="label_chk">��������</label>
						</li>
						<li>
							<input type="checkbox" id="bathroom_ware" name="bathroom_ware" class="inp_chk">
							<label for="bathroom_ware" class="label_chk">��ǿ�ǰ</label>
						</li>
						<li>
							<input type="checkbox" id="washing_mu" name="washing_mu" class="inp_chk">
							<label for="washing_mu" class="label_chk">��Ź��</label>
						</li>
						<li>
							<input type="checkbox" id="dry_mu" name="dry_mu" class="inp_chk">
							<label for="dry_mu" class="label_chk">����̱�</label>
						</li>
						<li>
							<input type="checkbox" id="bathtub" name="bathtub" class="inp_chk">
							<label for="bathtub" class="label_chk">����</label>
						</li>
						<li>
							<input type="checkbox" id="cook_ok" name="cook_ok" class="inp_chk">
							<label for="cook_ok" class="label_chk">��簡��</label>
						</li>
						<li>
							<input type="checkbox" id="room_smoking" name="room_smoking" class="inp_chk">
							<label for="room_smoking" class="label_chk">���� �� ��</label>
						</li>
						<li>
							<input type="checkbox" id="dog" name="dog" class="inp_chk">
							<label for="dog" class="label_chk">�ݷ��� ����</label>
						</li>
					</ul>
				</section>
			</div>
			<!-- fillter -->
			<!-- List -->
			<div class="list_wrap">
				<div class="top_sort">
					<div class="pc">
						<div class="btn_wrap width_4">
							<button type="button" data-sort="HIT" class="on">
								<span>��õ ��</span>
							</button>
							<button type="button" data-sort="DISTANCE" class="">
								<span>�Ÿ� ��</span>
							</button>
							<button type="button" data-sort="LOWPRICE" class="">
								<span>���� ���� ��</span>
							</button>
							<button type="button" data-sort="HIGHPRICE" class="">
								<span>���� ���� ��</span>
							</button>
						</div>
						<button type="button" class="btn_map text-center" onclick="pop_map_pc();">
						����
						</button>
					</div>
				</div>
				<div id="poduct_list_area">
					<div class="title">
						<h3>����</h3>
					</div>
					<!-- �������� -->
					<ul>					
						<li class="list_2 adcno3">
							<a href="">
								<p class="pic">
									<img class="lazy align" src="./assets/image/mainList/62e1e83e21944.jpg" style="margin-top: -159px; display: block;">
								</p>
								<div class="stage gra_black_vertical clearfix">
									<div class="evt_info">
										<span>�絵��</span>
									</div>
									<div class="name">
										<strong>�׸��Ͽ콺���</strong>
										<p class="score">
											<em>4.5</em>
											<span>���ƿ� (13)</span>
										</p>
										<p>���� | �鵿������ ���� 10��</p>
									</div>
									<div class="price">
										<div class="map_html">
											<p>
												<b>350,000��</b>
											</p>	
										</div>
										<p>
											<b>350,000��</b>
										</p>
									</div>
								</div>
							</a>
						</li>
					</ul>	
					<!-- ���� ���� -->
					<!-- �������� -->
					<ul>					
						<li class="list_2 adcno3">
							<a href="">
								<p class="pic">
									<img class="lazy align" src="./assets/image/mainList/62e1e83e21944.jpg" style="margin-top: -159px; display: block;">
								</p>
								<div class="stage gra_black_vertical">
									<div class="evt_info">
										<span>�絵��</span>
									</div>
									<div class="name">
										<strong>�׸��Ͽ콺���</strong>
										<p class="score">
											<em>4.5</em>
											<span>���ƿ� (13)</span>
										</p>
										<p>���� | �鵿������ ���� 10��</p>
									</div>
									<div class="price">
										<div class="map_html">
											<p>
												<b>350,000��</b>
											</p>	
										</div>
										<p>
											<b>350,000��</b>
										</p>
									</div>
								</div>
							</a>
						</li>
					</ul>	
					<!-- ���� ���� -->
					<!-- �������� -->
					<ul>					
						<li class="list_2 adcno3">
							<a href="">
								<p class="pic">
									<img class="lazy align" src="./assets/image/mainList/62e1e83e21944.jpg" style="margin-top: -159px; display: block;">
								</p>
								<div class="stage gra_black_vertical">
									
									<div class="name">
										<strong>�׸��Ͽ콺���</strong>
										<p class="score">
											<em>4.5</em>
											<span>���ƿ� (13)</span>
										</p>
										<p>���� | �鵿������ ���� 10��</p>
									</div>
									<div class="price">
										<div class="map_html">
											<p>
												<b>350,000��</b>
											</p>	
										</div>
										<p>
											<b>350,000��</b>
										</p>
									</div>
								</div>
							</a>
						</li>
					</ul>	
					<!-- ���� ���� -->
				</div>
			</div>
			<!-- List -->
		</div>
		<!-- content -->
		
		<!-- footer -->
		<!-- //footer -->
		<footer>
			<div class="align">
				<ul class="link">
					<li><a href="">ȸ��Ұ�</a> <span>|</span></li>
					<li><a href="">�̿���</a> <span>|</span></li>
					<li><a href="">��������ó����ħ</a> <span>|</span></li>
					<li><a href="">�Һ��� �����ذ� ����</a> <span>|</span></li>
					<li><a href="">����� ����Ȯ��</a> <span>|</span></li>
					<li><a href="">�絵� �����ü���</a> <span>|</span></li>
					<li><a href="">��Ƽ��Ƽ ȣ��Ʈ����</a> <span>|</span></li>
					<li><a href="">��� �絵�</a> <span>|</span></li>
					<li><a href="">�������������������� ǥ��</a></li>
				</ul>
		
				<p>
					<b>�絵� ������ 1670-4215</b> <span>���� 9�� - ���� 3��</span>
				</p>
		
				<address>
					<span>(��) �絵����۴�</span> �ּ� : ����Ư���� ��õ�� ��õ��� 611, 648Ÿ�� 14�� | ��ǥ�̻� : ������ | ����ڵ�Ϲ�ȣ: 741-64-88541 <br> ����ǸŹ�ȣ : 2011-�����õ-75441 | ��������� ��Ϲ�ȣ: ��2011-74ȣ | ��ȭ��ȣ : 1670-4215 |
					���ڿ����ּ� : yangdo@goodchoice.kr <br> Copyright GC COMPANY Corp. All rights reserved.
				</address>
		
			</div>
		</footer>
		
		<!-- footer -->
	</div>
	<!-- wrap -->
	
</body>
</html>