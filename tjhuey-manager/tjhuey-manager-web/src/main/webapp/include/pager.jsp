<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<!-- 没有记录 -->
	<c:if test="${pager.pageCount==0 }">
		<div style="margin-bottom:10px; margin-top:10px;">没有记录。</div>
	</c:if>

	<!-- 在URL里加了个keyword，用不上的没关系 -->
	<div class="row show-grid ">
		
		<!-- 有记录 -->
		<c:if test="${pager.pageCount!=0 }">
			<div class="col-sm-8 col-sm-offset-2" >
				<center>
					<ul class="pagination" style=" margin-top: 5px; margin-bottom: 5px; ">
					 
						<!-- 如果传进来的页码小于1，置为1 -->
						<c:if test="${pager.pageNum < 1 }">
							<c:set var="pageNum" value="1"></c:set>
						</c:if>
						<!-- 如果传进来的页码大于总页数，置为总页数 -->
						<c:if test="${pager.pageNum > pager.pageCount}">
							<c:set var="pageNum" value="${pager.pageCount }"></c:set>
						</c:if>
						<!-- 显示样式 -->
						<li><a style="color:#777777;">页码：${pager.pageNum }/${pager.pageCount}</a></li>
						<c:if test="${pager.pageNum==1}">
							<li><a style="color:#777777;">首页</a></li>
						</c:if>
						<c:if test="${pager.pageNum!=1}">
							<li><a href="?pageNum=1&pageSize=${pager.pageSize }">首页</a></li>
						</c:if>
						<c:if test="${pager.pageNum==1}">
							<li><a style="color:#777777;">上页</a></li>
						</c:if>
						<c:if test="${pager.pageNum!=1}">
							<li><a href="?pageNum=${pager.pageNum-1 }&pageSize=${pager.pageSize }">上页</a></li>
						</c:if>
						
						<!-- 记录n小于等于5页 显示前n页-->
						<c:if test="${pager.pageCount<=5 }">
							<c:forEach begin="1" end="${pager.pageCount }" var="i">
								<!-- 选中背景蓝色 -->
								<c:if test="${pager.pageNum==i }">
									<li><a href="#" style="background: #7094FF; color: white;">${i}</a></li>
								</c:if>
								<!-- 未被选中背景  -->
								<c:if test="${pager.pageNum!=i }">
									<li><a href="?pageNum=${i}&pageSize=${pager.pageSize }">${i}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
						<!-- 记录n大于于5页 显示前5页-->
						<c:if test="${pager.pageCount>5 }">
							<c:if test="${pager.pageNum+2<=pager.pageCount && pager.pageNum >=3}">
								<li><a href="?pageNum=${pager.pageNum-2 }&pageSize=${pager.pageSize }">${pager.pageNum-2 }</a></li>
								<li><a href="?pageNum=${pager.pageNum-1 }&pageSize=${pager.pageSize }">${pager.pageNum-1 }</a></li>
								<li><a style="background: #7094FF; color: white;">${pager.pageNum }</a></li>
								<li><a href="?pageNum=${pager.pageNum+1 }&pageSize=${pager.pageSize }">${pager.pageNum+1 }</a></li>
								<li><a href="?pageNum=${pager.pageNum+2 }&pageSize=${pager.pageSize }">${pager.pageNum+2 }</a></li>
							</c:if>
							<c:if test="${pager.pageNum <3}">
								<c:forEach begin="1" end="5" var="i">
									<c:if test="${pager.pageNum==i }">
										<li><a style="background: #7094FF; color: white;">${i}</a></li>
									</c:if>
									<c:if test="${pager.pageNum!=i }">
										<li><a href="?pageNum=${i}&pageSize=${pager.pageSize }">${i}</a></li>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${pager.pageNum+2>pager.pageCount }">
								<c:forEach begin="${pager.pageCount-4 }" end="${pager.pageCount }" var="i">
									<c:if test="${pager.pageNum==i }">
										<li><a style="background: #7094FF; color: white;">${i}</a></li>
									</c:if>
									<c:if test="${pager.pageNum!=i }">
										<li><a href="?pageNum=${i}&pageSize=${pager.pageSize }">${i}</a></li>
									</c:if>
								</c:forEach>
							</c:if>
						</c:if>
						
						<c:if test="${pager.pageNum==pager.pageCount}">
							<li><a style="color:#777777;">下页</a></li>
						</c:if>
						<c:if test="${pager.pageNum!=pager.pageCount}">
							<li><a href="?pageNum=${pager.pageNum+1 }&pageSize=${pager.pageSize }">下页</a></li>
						</c:if>
						<c:if test="${pager.pageNum==pager.pageCount}">
							<li><a style="color:#777777;">末页</a></li>
						</c:if>
						<c:if test="${pager.pageNum!=pager.pageCount}">
							<li><a href="?pageNum=${pager.pageCount }&pageSize=${pager.pageSize }">末页</a></li>
						</c:if>
					</ul>
					
					<ul class="pagination" style=" margin-top: 5px; margin-bottom: 5px; ">
						<li><a style="color:#777777;">总记录数：${pager.recordCount }</a></li>
						<li>
							<a style="padding-bottom: 3px; padding-top: 3px; color:#777777;">每页
							<input type="number" id="pageSize" name="pageSize" style="width: 40px;" value="${pager.pageSize }">条
							</a>
						</li>
						<li>
							<a style="color:#7094FF; cursor: pointer;" href="javascript:void(0)" onclick="changeSize(${pager.pageSize }, ${pager.recordCount })">
								Go
							</a>
						</li>
					</ul>
				</center>
			</div>
		</c:if>
		
	</div>	
	
	<!-- 非法页数 -->
	<script type="text/javascript">
		function changeSize(defaultSize, recordCount){
			var pageSize = $("#pageSize").val();
			if(pageSize<1 || pageSize>50){
				alert("请输入1~50之间的数字！");
				if(pageSize > recordCount){
					$("#pageSize").val(recordCount);
				}else{
					$("#pageSize").val(defaultSize);
				}
			}else{
				location.href='?pageSize='+pageSize;
			}
		}
		
	</script>

