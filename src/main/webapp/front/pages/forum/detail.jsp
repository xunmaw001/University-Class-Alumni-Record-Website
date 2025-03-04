<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 论坛详情 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>班级论坛</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		#swiper {
			overflow: hidden;
		}
		#swiper .layui-carousel-ind li {
			width: 16px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 3px;
			background-color: #f7f7f7;
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
		#swiper .layui-carousel-ind li.layui-this {
			width: 24px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 0;
			background-color: rgba(110,22,64,1);
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
		
		.index-title {
		    text-align: center;
		    box-sizing: border-box;
		    width: 980px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		}
		.forum-container .btn-container {
			display: flex;
			    align-items: center;
			    box-sizing: border-box;
			    width: 100%;
			    flex-wrap: wrap; 
				justify-content: space-between !important;
		}
		.forum-container .btn-container button i {
			margin-right: 4px;
		}
	</style>
	<body style="padding-bottom: 20px">

		<div id="app">
			<!-- 轮播图 -->
			<div class="layui-carousel" id="swiper" :style='{"boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
			  <div carousel-item id="swiper-item">
				<div v-for="(item,index) in swiperList" :key="index">
					<img style="width: 100%;height: 100%;object-fit:cover;" :src="item.img" />
				</div>
			  </div>
			</div>
			<!-- 轮播图 -->

			<!-- 标题 -->
			<div class="index-title" :style='{"padding":"10px","boxShadow":"0 8px 0px rgba(0,0,0,1)","margin":"10px auto 20px","borderColor":"rgba(0, 0, 0, 1)","backgroundColor":"rgba(202, 219, 225, 1)","color":"rgba(0, 0, 0, 1)","borderRadius":"44px","borderWidth":"1px","fontSize":"20px","borderStyle":"solid","height":"auto"}'>
			  <span>FORUM / INFORMATION</span><span>班级论坛</span>
			</div>
			<!-- 标题 -->

			<div class="forum-container">
				<h1 class="title">{{detail.title}}</h1>
				<div class="auth-container">
					发布人：{{detail.username}} 时间：{{detail.addtime}}
				</div>
				<div class="content" v-html="detail.content">
				</div>

				<div class="btn-container" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"10px 0 10px 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"4px","borderWidth":"0","borderStyle":"solid","justifyContent":"flex-end","height":"64px"}'>
					<div class="title" style="color:#666;font-size: 18px;">
						评论列表
					</div>
					<button :style='{"padding":"0 15px","boxShadow":"0 6px 0px rgba(0,0,0,1)","margin":"0 0 0 10px","borderColor":"rgba(0, 0, 0, 1)","backgroundColor":"rgba(202, 219, 225, 1)","color":"rgba(0, 0, 0, 1)","borderRadius":"27px","borderWidth":"1px","width":"auto","fontSize":"14px","borderStyle":"solid","height":"40px"}' id="btn-add-win" class="layui-btn layui-btn-lg btn-theme">
						<i v-if="true" class="layui-icon">&#xe654;</i> 点击评论
					</button>
				</div>

				<div class="message-list" v-if="dataList&&dataList.length" :style='{"padding":"0 20px 20px","boxShadow":"0 0 6px #558998","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0","borderStyle":"solid"}'>
					<div :style='{"padding":"20px 0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(85, 137, 152, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'  class="message-item" v-for="(item,index) in dataList" v-bind:key="index" >
						<div class="username-container" style="display: flex;align-items: center;">
							<img :style='{"boxShadow":"0 0 6px #558998","margin":"0 10px 0 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"100%","borderWidth":"0","width":"40px","borderStyle":"solid","height":"40px"}' class="avator" src="../../img/avator.png">
							<span style="display: inline-block;" :style='{"padding":"0 10px","boxShadow":"0 0 6px #558998","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"28px","fontSize":"14px","borderStyle":"solid"}' class="username">用户：{{item.username}}</span>
						</div>
						<div class="content" class="content" style="margin: 0;flex: 1;">
							<span style="display: inline-block;" :style='{"padding":"12px 24px","boxShadow":"0 0 0px rgba(110,22,64,.3)","margin":"8px 0 0 50px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(85, 137, 152, 1)","color":"#fff","borderRadius":"4px","borderWidth":"0","fontSize":"14px","borderStyle":"solid"}' class="message">
								{{item.content}}
							</span>
						</div>
					</div>
				</div>
				<div class="pager" id="pager"></div>
			</div>
		</div>

		<!-- layui -->
		<script src="../../layui/layui.js"></script>
		<!-- vue -->
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>

		<script>
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					detail: {},
					dataList: []
				},
				methods: {
					jump(url) {
						jump(url)
					}
				}
			})

			layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var laypage = layui.laypage;
				var http = layui.http;
				var jquery = layui.jquery;

				var id = http.getParam('id');

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						var swiperItemHtml = '';
						for (let item of res.data.list) {
							if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
								swiperItemHtml +=
									'<div>' +
									'<img class="swiper-item" src="' + http.baseurl+item.value + '">' +
									'</div>';
							}
						}
						jquery('#swiper-item').html(swiperItemHtml);
						// 轮播图
						vue.$nextTick(() => {
						  carousel.render({
						  	elem: '#swiper',
							width: '100%',
						  	height: '250px',
						  	arrow: 'hover',
						  	anim: 'default',
						  	autoplay: 'true',
						  	interval: '3000',
						  	indicator: 'none'
						  });
						
						})
					}
				});

				// 详情信息
				http.request('forum/list/' + id, 'get', {}, function(res) {
					vue.detail = res.data
					vue.dataList = res.data.childs
				});

				// 添加评论
				jquery('#btn-add-win').click(function(e) {
					layer.open({
						type: 2,
						title: '添加评论',
						area: ['600px', '300px'],
						content: './add-comment.jsp?pid=' + vue.detail.id
					});
				})

			});
		</script>
	</body>
</html>
