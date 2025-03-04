<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 论坛中心 -->
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
		.forum-container {
			margin: 0 auto !important;
			box-sizing: border-box;
		}
		.forum-container .btn-container {
			display: flex;
			    align-items: center;
			    box-sizing: border-box;
			    width: 100%;
			    flex-wrap: wrap;
		}
		.forum-container .btn-container button i {
			margin-right: 4px;
		}
		.forum-container .layui-form-item {
			display: flex;
			align-items: center;
		}
		.forum-container .layui-input-block {
			margin: 0;
			flex: 1;
		}
		.forum-container .input .layui-input {
			padding: 0 12px;
			height: 40px;
			font-size: 14px;
			color: #333;
			border-radius: 0;
			border-width: 2px;
			border-style: solid;
			border-color: rgba(145, 143, 132, 1);
			background-color: #fff;
			box-shadow: 0 0 0px rgba(110,22,64,.8);
			text-align: left;
		}
	</style>
	<body>

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

			<div class="forum-container" :style='{"padding":"20px","boxShadow":"0px 0px 0px rgba(110,22,64,.8)","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","borderStyle":"solid"}'>
				<form class="layui-form login-form" lay-filter="myForm">
					<input type="hidden" name="id" />
					<div  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0 0 10px 0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0 0 0px 0","borderStyle":"solid"}' class="layui-form-item layui-form-text">
						<label :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"16px","color":"rgba(0, 0, 0, 1)","textAlign":"right"}' class="layui-form-label">标题：</label>
						<div class="layui-input-block input">
							<input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0 0 10px 0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0 0 0px 0","borderStyle":"solid"}' class="layui-form-item layui-form-text">
						<label :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"16px","color":"rgba(0, 0, 0, 1)","textAlign":"right"}' class="layui-form-label">类型：</label>
						<div class="layui-input-block" style="text-align: left;">
							<input type="radio" name="isdone" value="开放" title="公开" checked>
							<input type="radio" name="isdone" value="关闭" title="私人">
						</div>
					</div>
					<div  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0 0 10px 0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0 0 0px 0","borderStyle":"solid"}' class="layui-form-item layui-form-text">
						<label :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"16px","color":"rgba(0, 0, 0, 1)","textAlign":"right"}' class="layui-form-label">内容：</label>
						<div class="layui-input-block" style="text-align: left;">
							<textarea name="content" id="content">请输入内容</textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block" style="text-align: right;margin-right: 30px;">
							<button style="outline:none" :style='{"padding":"0 10px","boxShadow":"0 8px 0px rgba(0,0,0,1)","margin":"10px auto 0","borderColor":"rgba(0, 0, 0, 1)","backgroundColor":"rgba(202, 219, 225, 1)","color":"rgba(0, 0, 0, 1)","borderRadius":"27px","borderWidth":"1px","width":"10%","fontSize":"14px","borderStyle":"solid","height":"44px"}' class="layui-btn btn-submit" lay-submit lay-filter="*">修改</button>
							<button style="outline:none":style='{"padding":"0 10px","boxShadow":"0 8px 0px rgba(0,0,0,1)","margin":"10px auto","borderColor":"rgba(0, 0, 0, 1)","backgroundColor":"rgba(220, 220, 220, 1)","color":"rgba(0, 0, 0, 1)","borderRadius":"27px","borderWidth":"1px","width":"10%","fontSize":"14px","borderStyle":"solid","height":"44px"}' type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
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
						}]
					},
					methods: {
						jump(url) {
							jump(url)
						}
					}
				})

				layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'tinymce'], function() {
					var layer = layui.layer;
					var element = layui.element;
					var carousel = layui.carousel;
					var http = layui.http;
					var form = layui.form;
					var jquery = layui.jquery;
					var tinymce = layui.tinymce

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
										'<img style="width: 100%;height: 100%;object-fit:cover;" class="swiper-item" src="' + http.baseurl+item.value + '">' +
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

					// 初始化编辑器
					var edit = tinymce.render({
						elem: "#content",
						height: 600,
						images_upload_handler: function(blobInfo, succFun, failFun) {
							var xhr, formData;
							var file = blobInfo.blob(); //转化为易于理解的file对象
							xhr = new XMLHttpRequest();
							xhr.withCredentials = false;
							xhr.open('POST', http.baseurl + 'file/upload');
							xhr.setRequestHeader("Token", localStorage.getItem('Token')); //设置请求头
							xhr.onload = function() {
								var json;
								if (xhr.status != 200) {
									failFun('HTTP Error: ' + xhr.status);
									return;
								}
								json = JSON.parse(xhr.responseText);
								// if (!json || typeof json.location != 'string') {
								// 	failFun('Invalid JSON: ' + xhr.responseText);
								// 	return;
								// }
								if (!json || typeof json.file != 'string') {
									failFun('Invalid JSON: ' + xhr.responseText);
									return;
								}
								succFun(http.baseurl + '/upload/' + json.file);
							};
							formData = new FormData();
							formData.append('file', file, file.name); //此处与源文档不一样
							xhr.send(formData);
						}
					}, (opt) => {

					});
					
					//
					var id = http.getParam("id");
					http.request('forum/list/' + id, 'get', {}, function(res) {
						form.val("myForm", res.data);
						tinymce.get('#content').setContent(res.data.content)
					});
					
					
					form.on('submit(*)', function(data) {
						// 获取富文本的内容
						var content = tinymce.get('#content').getContent()
						data = data.field;
						data.content = content;
						data.username = localStorage.getItem('adminName');
						data.userid = localStorage.getItem('userid');
						data.parentid = 0;
						http.requestJson('forum/update', 'post', data, function(res) {
							layer.msg('发表成功', {
								time: 2000,
								icon: 6
							}, function() {
								back();
							});
						});
						return false;
					});

				});
			</script>
	</body>
</html>
