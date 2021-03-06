<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head lang="en">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name='apple-mobile-web-app-capable' content='yes' />
	<title>互动时间轴</title>
</head>
<body>
	<input id="userId" type="hidden" name="userId" value="${userId}">
	<c:forEach varStatus="s" items="${pages.pages.list}" var="question">
		<section>
			<div class="left">
				<c:if
					test="${question.user.headImgUrl =='' || question.user.headImgUrl ==null}">
					<img class="my" src="${contextPath}/image/sye-headImg.png">
				</c:if>
				<c:if
					test="${question.user.headImgUrl !='' && question.user.headImgUrl !=null}">
					<img class="my" src="${question.user.headImgUrl}">
				</c:if>
				<c:if test="${question.user.role==0}">
					<img class="myrole" src="${contextPath}/image/mycenter-chuang.png">
				</c:if>
				<c:if test="${question.user.role==1}">
					<img class="myrole" src="${contextPath}/image/mycenter-dao.png">
				</c:if>
				<c:if test="${question.user.role==3}">
					<img class="myrole" src="${contextPath}/image/mycenter-chuangH.png">
				</c:if>
				<c:if test="${question.user.role==4}">
					<img class="myrole" src="${contextPath}/image/mycenter-daoH.png">
				</c:if>
			</div>
			<div class="right">
				<div class="introduce">
					<div class="introduce-left">
						<c:if test="${question.user.nickName =='' || question.user.nickName ==null}">
							<span class="name">SYE创业四川</span>
						</c:if>
						<c:if test="${question.user.nickName !=''}">
							<span class="name">${question.user.nickName}</span>
						</c:if>

						<c:if test="${question.user.level =='1'}">
							<img src="${contextPath}/image/v1.png">
						</c:if>
						<c:if test="${question.user.level =='2'}">
							<img src="${contextPath}/image/v2.png">
						</c:if>
						<c:if test="${question.user.level =='3'}">
							<img src="${contextPath}/image/v3.png">
						</c:if>
						<c:if test="${question.user.level =='4'}">
							<img src="${contextPath}/image/v4.png">
						</c:if>
						<c:if test="${question.user.level =='5'}">
							<img src="${contextPath}/image/v5.png">
						</c:if>
						<c:if test="${question.user.level =='6'}">
							<img src="${contextPath}/image/v6.png">
						</c:if>

						<c:if
							test="${question.user.role =='0' || question.user.role =='1' }">
							<img src="${contextPath}/image/SYE.png">
						</c:if>

						<c:if test="${question.user.certification !=''}">
							<img src="${contextPath}/image/realname.png">
						</c:if>
					</div>
 					<div class="introduce-right">
						<span class="place">${question.questionArea}</span> <img
							class="coord" src="${contextPath}/image/interaction-where.png">
					</div> 
				</div>
				 <div class="industry">        
				 <c:if test="${question.questionBusiness !=null && question.questionBusiness !=''}">
            		<span>${question.questionBusiness}</span>
            	 </c:if>            	
					<c:if test="${question.standbyTwo.length() ==2}">
					
						<label>${question.standbyTwo.substring(0,2)}</label>
					</c:if>
					<c:if test="${question.standbyTwo.length() ==5}">
						<label>${question.standbyTwo.substring(0,2)}</label>
						<label>${question.standbyTwo.substring(3,5)}</label>
					</c:if>
				</div>
				 <p class="word wrap-line">${question.questionContent}</p>
				<div class='infoImg'>
					<c:if
						test="${question.imgOne !='' && question.imgOne !=null}">
						<img src="${question.imgOne}"
							onclick="previewImg('${question.imgOne}','${question.imgTwo}','${question.imgThree}','${question.imgFour}',0)">
					</c:if>
					<c:if
						test="${question.imgTwo !='' && question.imgTwo !=null}">
						<img src="${question.imgTwo}"
							onclick="previewImg('${question.imgOne}','${question.imgTwo}','${question.imgThree}','${question.imgFour}',1)">
					</c:if>
					<c:if
						test="${question.imgThree !='' && question.imgThree !=null}">
						<img src="${question.imgThree}"
							onclick="previewImg('${question.imgOne}','${question.imgTwo}','${question.imgThree}','${question.imgFour}',2)">
					</c:if>
					<c:if
						test="${question.imgFour !=''  && question.imgFour !=null}">
						<img src="${question.imgFour}"
							onclick="previewImg('${question.imgOne}','${question.imgTwo}','${question.imgThree}','${question.imgFour}',3)">
					</c:if>
				</div>
				<div class="interact">
					<span><fmt:formatDate value="${question.questionTime}"
							pattern='yyyy-MM-dd' /></span> <label>${question.thumbUpCount}</label>
					<c:if test="${question.userName == user.id}">
            		<a href="javascript:void(0);" onclick="deleteActivity(this,'${question.questionId}')" class="deleteActivity" id="deleteActivity">删除</a>
				</c:if>		
					<img class="${question.questionId}"
						onclick="syeReplyThumbUp(this,'${question.questionId}','${user.id}');return false"
						src="${contextPath}/image/interaction-good.png"> <img
						onclick="addSyeQuestionReply('${question.questionId}','${user.id}','0');return false"
						src="${contextPath}/image/interaction-world.png">
				</div>
				<!--  点赞人 -->
				<div class='peopel'>
					<p class='peopleList${question.questionId }'>
						<c:if
							test="${question.syeReplyThumbUp.size() >0 && question.syeReplyThumbUp.size() <10}">
							<img src="${contextPath}/image/doVoteUp.png">
							<c:forEach varStatus="s"
								items="${question.syeReplyThumbUp}" var="syeReplyThumbUp">
								<c:if test="${s.index+1<question.syeReplyThumbUp.size()}">

									<a href="javascript:void()"
										onclick="goToVoterPage('${syeReplyThumbUp.standbyOne}');return false">${syeReplyThumbUp.standbyTwo}、</a>
								</c:if>
								<c:if
									test="${s.index+1==question.syeReplyThumbUp.size()}">
									<a href="javascript:void()"
										onclick="goToVoterPage('${syeReplyThumbUp.standbyOne}');return false">${syeReplyThumbUp.standbyTwo}</a>
								</c:if>
							</c:forEach>
							<a
								 href="${contextPath}/communication/thumbUpDetailList?questionId=${question.questionId}&userId=${user.id}"
								onclick="setPageStart()" >觉得很赞</a>
						</c:if>
						<c:if test="${question.syeReplyThumbUp.size() ==10}">
							<c:forEach varStatus="s"
								items="${question.syeReplyThumbUp}" var="syeReplyThumbUp">
								<c:if test="${s.index+1<question.syeReplyThumbUp.size()}">
									<a href="javascript:void()"
										onclick="goToVoterPage('${syeReplyThumbUp.standbyOne}');return false">${syeReplyThumbUp.standbyTwo}、</a>
								</c:if>
								<c:if test="${s.index+1==10}">
									<a href="javascript:void()"
										onclick="goToVoterPage('${syeReplyThumbUp.standbyOne}');return false">${syeReplyThumbUp.standbyTwo}</a>
								</c:if>
							</c:forEach>
							<a
								href="${contextPath}/communication/thumbUpDetailList?questionId=${question.questionId}&userId=${user.id}"
								onclick="setPageStart()">等${question.thumbUpCount}人觉得很赞</a>
						</c:if>
					</p>
				</div>
				<!-- 	 回复展示 -->				
				<div class="word-list" id="${question.questionId}">
					<script>
						var temp='${question.questionReply}';
						if(temp=="" || temp=='[]'){
							$("#${question.questionId}").hide();
						}
					</script>					
					<c:forEach varStatus="s"
						items="${question.questionReply}" var="questionReply">					
						<c:if test="${questionReply.standbyThree !=''}">
							<a href="javascript:void(0);" onclick ="addSyeQuestionReply('${question.questionId}','${user.id}','${questionReply.syeReplyId}')">${questionReply.syeReplyUserName}		
							</a>					
							<span>回复</span>
							<a>${questionReply.standbyThree}:</a>
							<span>${questionReply.syeReplyContent}</span>
							<br>
						</c:if>
						<c:if test="${questionReply.standbyThree ==''} ">
							<a href="javascript:void(0);" onclick ="addSyeQuestionReply('${question.questionId}','${user.id}','${questionReply.syeReplyId}')">${questionReply.syeReplyUserName}
								</a>
							<span>回复:</span>
							<span>${questionReply.syeReplyContent}</span>
							<br>
						</c:if>
					</c:forEach>
				
				</div> 
			</div>
			<div class=""></div>
		</section>
	</c:forEach>  
</body>
<script type="text/javascript">showClickMore('${pages.hasMore}');</script>
<script>
/*跳转到点赞人的页面*/
function goToVoterPage(userId){
	$.ajax({
		//判断用户角色
		url:"${contextPath}/pubUser/getVoterRoleByUserId",
		type:"post",
		dataType:'json',
		data:{"userId":userId},
		success:function(data){
			if(data.exceptionCode){
				Box.autoClose(data.exceptionMsg);
			}else{
				//如果是游客
				if(data.result=="you"){
					Box.autoClose("该用户还未成为导师或创业者");
					return;
					
				}else if(data.result=="chuang"){//如果是创业者					
					$.ajax({
						//判断创业者是否有项目，如果有项目取最新一个项目
						url:"${contextPath}/pubUser/getVoterProjectByUserId",
						type:"post",
						dataType:'json',
						data:{"userId":userId},
						success:function(data){
							//为0表示没有项目
							if(data.result=="0"){
								Box.autoClose("该创业者暂时没有创业项目");
								return;
							}else{
								location.href="${contextPath}/ground/projectDetail?projectId="+data.result+"&userId="+userId;
							}
						}
					});
				}else{//如果是导师
					location.href="${contextPath}/pubUser/tutorDetails?userId="+data.result;
				}
			}
		}
	})
}
/* 添加回复  */
 function addSyeQuestionReply(questionId,syeReplyUserId ,syeQuestionReplyId){
	$.ajax({
		url:"${contextPath}/communication/judgeUser",
		data:{"id":syeReplyUserId},
        type:"post",
        dataType:"json",
        success:function(data){  
        	if(data==null){
        		Box.prompt("您还没登录，请先登录！","${contextPath}/pub/login");
        		return;
        	}
        	if(data.certification==""){             		
        		Box.prompt("请完善信息！","${contextPath}/user/homecenter?userId="+userId);
        	    }else{
	        		Box.replyMessage(questionId,syeReplyUserId,syeQuestionReplyId);
	            	$("#${question.questionId}").show();
        	}
        },
        error:function(){
        	alert("error");
        }
    });	    	
} 

//互动点赞
function syeReplyThumbUp(thumb,questionId,userId){
	if(userId == null || userId ==""){
		Box.prompt("您还没登录，请先登录！","${contextPath}/pub/login");
		return;
	}
	if('${user.certification}' == ""){
		Box.prompt("请完善信息！","${contextPath}/user/homecenter?userId="+userId);
	}else{
		//获取当前节点的点赞数 ,并加1
		var thumbCount = parseInt($(thumb).parent().find("label").text());
		if(isNaN(thumbCount)){
			thumbCount = 0;
		}
		thumbCount = thumbCount+1;
		$.ajax({
			url:'${contextPath}/communication/judgeIfThumbUp',
			data:{'userId':userId,'questionId':questionId,'thumbCount':thumbCount},
			type:'post',
			dayaType:'json',
			success:function(data){
				if(data.message == "suc"){
					Box.autoClose("点赞成功！每天都可以点赞噢！ ");	
				 	var syeReplyThumbUpElement=document.getElementsByClassName(questionId);
		        	var newText = document.createTextNode(thumbCount);	
		        	var div=syeReplyThumbUpElement[0].parentNode;
		        	var label=div.getElementsByTagName("label")[0];
		        	syeReplyThumbUpElement[0].style.opacity = "0.5";/*投票之后换颜色*/
		        	if(label.hasChildNodes()){
		        		label.removeChild(label.childNodes[0]);
		        	}		        	
		        	label.appendChild(newText);        			       	
		        	var a=document.createElement('a');
		        	var img=document.createElement('img');
		        	img.setAttribute("src","${contextPath}/image/doVoteUp.png");
		        	var peopleList=document.getElementsByClassName('peopleList'+questionId)[0];
		        	if(thumbCount == 1){
		        		a.innerHTML=data.syeReplyThumbUps[0].standbyTwo+" 觉得很赞";
		        		a.onclick=function(){
		        			goToVoterPage(data.syeReplyThumbUps[0].standbyOne);
		        		};
		        		peopleList.appendChild(img);
		        		peopleList.appendChild(a);
		        		
		        	}else{
		        		a.innerHTML=data.syeReplyThumbUps[0].standbyTwo+"、";
		        		a.onclick=function(){
		        			goToVoterPage(data.syeReplyThumbUps[0].standbyOne);
		        		};

		        		peopleList.insertBefore(a,peopleList.childNodes[2]); 
		        	}    
				} else if(data.message == "err"){
					Box.autoClose("点赞失败 ");
					return;
				} else {
					Box.autoClose("您已经点过赞了");
					return;
				}		
			},
			error:function(data){
				Box.autoClose("系统繁忙，请稍候在试");
				return;
			}
		}); 
	}
}
	/** 互动回复*/
	function interactionReply(questionId, userId) {
		if ("${user}" == null || "${user}" == undefined || "${user}" == "") {
			Box.alert('您尚未登录，点击确定登录', function() {
				window.location.href = "${contextPath}/pub/login";
			});
		} else {
			if ("${user.role}" == 1 || "${user.role}" == 0) {
				Box.autoClose('请联系管理员，进行身份升级');
			} else {
				window.location.href = "${contextPath}/communication/interactionReply?questionId="
						+ questionId + "&userId=" + userId + "&url="+url;
			}
		}
	}		
/*
 * 图片预览
 */ 
	function previewImg(img1,img2,img3,img4,i) {
		var imgsArray = [];
		if(img1&&img1.length>1){
			imgsArray.push(img1);
		}
		if(img2&&img2.length>1){
			imgsArray.push(img2);
		}
		if(img3&&img3.length>1){
			imgsArray.push(img3);
		}
		if(img4&&img4.length>1){
			imgsArray.push(img4);
		}
		if(imgsArray.length<1){
			return;
		}
	wx.previewImage({
	    current: imgsArray[i], // 当前显示图片的http链接
	    urls: imgsArray // 需要预览的图片http链接列表
	});
};	

$(function(){
	$(".wrap-line").each(function(){
	    $(this).html($(this).html().replace(/\n/g,'<br/>'));
	});
});
//删除自己的话题
function deleteActivity(vote,id){
	Box.confirm("是否删除该话题！",0,function(){
		$.ajax({
			url:'${contextPath}/communication/deleteActivity',
			type:"get",
			dataType:'json',
			data:{questionId:id},
			success:function(data){
				if(data){
					$(vote).parent().parent().parent().remove();
				} else{
					
					Box.autoClose('删除失败！');
				}
			},
			error:function(data){
				Box.autoClose('系统错误10000！');				}						
		});
		
	});
}
	</script>
</html>