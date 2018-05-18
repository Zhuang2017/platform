 <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!--底部导航-->
<div class="weui-tabbar footer">
    <a href="index.html" class="weui-tabbar__item">
      <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">8</span>
      <div class="weui-tabbar__icon">
        <img src="${ctxStatic }/moblieLogin/img/home.png" alt="">
      </div>
      <p class="weui-tabbar__label">首页</p>
    </a>
    
    <a href="applicant.html" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="${ctxStatic }/moblieLogin/img/icon_bg_bm.png" alt="">
      </div>
      <p class="weui-tabbar__label">留言</p>
    </a>
    <a href="activities.html" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="${ctxStatic }/moblieLogin/img/icon_bg_hd.png" alt="">
      </div>
      <p class="weui-tabbar__label">活动</p>
    </a>
  </div>
<!--底部导航-->
</div>


<script type="text/javascript" src="${ctxStatic }/moblieLogin/js/jquery-2.1.4.js" ></script>
<script type="text/javascript" src="${ctxStatic }/moblieLogin/js/jquery-weui.min.js" ></script>
<script type="text/javascript" src="${ctxStatic }/moblieLogin/js/swiper.js" ></script>

	<script>
        var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        autoplay: 2500
    });
    </script>