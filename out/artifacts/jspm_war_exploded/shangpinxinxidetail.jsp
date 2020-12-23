<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
%>
<% HashMap map = Query.make("shangpinxinxi").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>


<div class="" style="">

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


    <div class="swiper-container" id="banner10">
        <div class="swiper-wrapper">
            <% for (HashMap bht : bhtList) { %>
            <div class="swiper-slide">
                <div class="decoimg_b2">
                    <a class="btn btn-" href="<%= bht.get("url") %>"
                       style="background-image: url('<%= bht.get("image") %>'); height: 400px"></a>
                </div>
            </div>
            <% } %>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>
        <!-- 如果需要导航按钮 -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>


    <script>
        var mySwiper = new Swiper('#banner10', {
            loop: true, // 循环模式选项
            autoplay: {
                delay: 3000,
                disableOnInteraction: false
            },
            // 如果需要分页器
            pagination: {
                el: '.swiper-pagination',
            },
            // 如果需要前进后退按钮
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            // 如果需要滚动条
            /*scrollbar: {
                el: '.swiper-scrollbar',
            },*/
        })
    </script>


</div>
<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-sn-title">
                    <div class="sn-title" :style="style">
                        <div class="more">
                            <a href="">
                                More
                            </a>
                        </div>
                        <span>
                商品详情            </span>
                    </div>
                    <div class="sn-content">


                        <div class="">
                            <div class="goods-info clearfix">
                                <div class="gallery-list">
                                    <div class="swiper-container gallery-top" id="shangpin-galler">
                                        <div class="swiper-wrapper">
                                        </div>
                                    </div>
                                    <div class="swiper-container gallery-thumbs" id="shangpin-thumb">
                                        <div class="swiper-wrapper">
                                        </div>
                                    </div>
                                </div>
                                <div class="goods-right-content">
                                    <h3 class="title"><%= map.get("shangpinmingcheng") %>
                                    </h3>
                                    <div class="descount">
                                        <div>
                        <span class="name">
                            店铺编号：
                        </span>
                                            <span class="val">
                            <%= map.get("dianpubianhao") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            店铺名称：
                        </span>
                                            <span class="val">
                            <%= map.get("dianpumingcheng") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            商品编号：
                        </span>
                                            <span class="val">
                            <%= map.get("shangpinbianhao") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            分类：
                        </span>
                                            <span class="val">
                            <%
                                HashMap mapshangpinfenlei7 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='" + map.get("fenlei") + "'");
                            %><%= mapshangpinfenlei7.get("fenlei") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            商品价格：
                        </span>
                                            <span class="val">
                            <%= map.get("shangpinjiage") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            商品库存：
                        </span>
                                            <span class="val">
                            <%= map.get("shangpinkucun") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            商品销量：
                        </span>
                                            <span class="val">
                            <%= map.get("shangpinxiaoliang") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            商家：
                        </span>
                                            <span class="val">
                            <%= map.get("shangjia") %>                        </span>
                                        </div>
                                    </div>

                                    <% HashMap readMap = Query.make("shangpinxinxi").where("id", request.getParameter("id")).find(); %>
                                    <form class="form-inline" action="gouwuche.jsp?a=insert" id="form1" method="post">
                                        <!-- form 标签开始 -->


                                        <div style="display: none">
                                            <input type="hidden" name="issh" value="否"/>

                                            <input type="hidden" id="dianpubianhao" name="dianpubianhao"
                                                   value="<%= Info.html(map.get("dianpubianhao")) %>"/>
                                            <input type="hidden" id="dianpumingcheng" name="dianpumingcheng"
                                                   value="<%= Info.html(map.get("dianpumingcheng")) %>"/>
                                            <input type="hidden" id="shangpinbianhao" name="shangpinbianhao"
                                                   value="<%= Info.html(map.get("shangpinbianhao")) %>"/>
                                            <input type="hidden" id="shangpinmingcheng" name="shangpinmingcheng"
                                                   value="<%= Info.html(map.get("shangpinmingcheng")) %>"/>
                                            <input type="hidden" id="fenlei" name="fenlei"
                                                   value="<%= Info.html(map.get("fenlei")) %>"/>
                                            <input type="hidden" id="shangpintupian" name="shangpintupian"
                                                   value="<%= Info.html(map.get("shangpintupian")) %>"/>
                                            <input type="hidden" id="shangpinjiage" name="shangpinjiage"
                                                   value="<%= Info.html(map.get("shangpinjiage")) %>"/>
                                            <input type="hidden" id="shangjia" name="shangjia"
                                                   value="<%= Info.html(map.get("shangjia")) %>"/>
                                            <input type="text" class="form-control" style="width:150px;"
                                                   readonly="readonly" id="goumaiyonghu" name="goumaiyonghu"
                                                   value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                                            <input type="hidden" name="shangpinxinxiid" value="<%= map.get("id") %>"/>
                                            <input name="referer" id="referer" value="" type="hidden"/>
                                            <script>
                                                $('#referer').val(location.href);
                                            </script>
                                        </div>

                                        <div class="mt10">
                                            <div class="spec-list">
                                            </div>

                                            <div class="mt10">
                                                <div class="form-group mt10">
                                                    购买数量：

                                                    <input type="number" class="form-control" style="width:150px;"
                                                           data-rule-required="true" data-msg-required="请填写购买数量"
                                                           number="true" data-msg-number="输入一个有效数字" id="goumaishuliang"
                                                           name="goumaishuliang" min="1" max="<%= map.get("shangpinkucun") %>" value=""/>
                                                </div>
                                            </div>
                                            <div class="mt10">
                                                <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
                                                <button type="button" class="btn btn-primary"
                                                        onclick="alert('你尚未登录，请登录后操作')">
                                                    加入购物车
                                                </button>
                                                <% } else { %>
                                                <button type="submit" class="btn btn-primary">
                                                    加入购物车
                                                </button>
                                                <% } %>

                                                <button type="button" class="btn btn-default"
                                                        onclick="location.href='jrsc.jsp?id=<%= map.get("id") %>&biao=shangpinxinxi&ziduan=shangpinmingcheng'">
                                                    收藏本页
                                                </button>
                                            </div>
                                        </div>

                                        <!--form标签结束--></form>
                                    <script>
                                        $(function () {
                                            $('#form1').validate();
                                        })
                                    </script>
                                </div>
                            </div>
                            <div class="goods-content">
                                <%= map.get("shangpinxiangqing") %>
                            </div>

                            <script>
                                (function () {
                                    var images = "<%= map.get("shangpintupian") %>".split(",");
                                    if (images.length > 0) {
                                        for (var i = 0; i < images.length; i++) {
                                            var path = images[i]
                                            var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url(' + path + ')"></div></div></div>';
                                            $('#shangpin-galler .swiper-wrapper').append(src);
                                            $('#shangpin-thumb .swiper-wrapper').append(src);
                                        }

                                        var thumbsSwiper = new Swiper('#shangpin-thumb', {
                                            spaceBetween: 10,
                                            slidesPerView: 4,
                                            watchSlidesVisibility: true,//防止不可点击
                                        })
                                        var gallerySwiper = new Swiper('#shangpin-galler', {
                                            spaceBetween: 10,
                                            thumbs: {
                                                swiper: thumbsSwiper,
                                            }
                                        })
                                    }

                                })();

                            </script>

                        </div>


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>