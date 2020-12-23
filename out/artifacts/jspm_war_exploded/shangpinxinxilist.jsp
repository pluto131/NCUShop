<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
    //------------------------------------------------
    String orderby = util.Request.get("order", "id");  // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序

    String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误


    where += " AND issh='是' "; // 设置必须审核才可以显示


// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


    if (request.getParameter("dianpuxinxiid") != null && !"".equals(request.getParameter("dianpuxinxiid"))) {
        where += " AND dianpuxinxiid='" + request.getParameter("dianpuxinxiid") + "' ";

    }
    if (request.getParameter("dianpubianhao") != null && !"".equals(request.getParameter("dianpubianhao"))) {
        where += " AND dianpubianhao LIKE '%" + request.getParameter("dianpubianhao") + "%'";
    }
    if (request.getParameter("dianpumingcheng") != null && !"".equals(request.getParameter("dianpumingcheng"))) {
        where += " AND dianpumingcheng LIKE '%" + request.getParameter("dianpumingcheng") + "%'";
    }
    if (request.getParameter("shangpinbianhao") != null && !"".equals(request.getParameter("shangpinbianhao"))) {
        where += " AND shangpinbianhao LIKE '%" + request.getParameter("shangpinbianhao") + "%'";
    }
    if (request.getParameter("shangpinmingcheng") != null && !"".equals(request.getParameter("shangpinmingcheng"))) {
        where += " AND shangpinmingcheng LIKE '%" + request.getParameter("shangpinmingcheng") + "%'";
    }
    if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
        where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
    }
    List<HashMap> list = Query.make("shangpinxinxi").where(where).order(orderby + " " + sort).page(15);

%>

<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>


<div class="" style="">

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


    <div class="swiper-container" id="banner4">
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
        var mySwiper = new Swiper('#banner4', {
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

                        </div>
                        <span>
                商品列表            </span>
                    </div>
                    <div class="sn-content">
                        <div class="pa10 bg-warning">
                            <form class="form-inline" action="?"><!-- form 标签开始 -->

                                <div class="form-group">


                                    <i class="glyphicon glyphicon-search"></i>

                                </div>

                                <div class="form-group">
                                    店铺名称

                                    <input type="text" class="form-control" style="" name="dianpumingcheng"
                                           value="<%= request.getParameter("dianpumingcheng") !=null ? request.getParameter("dianpumingcheng") : "" %>"/>
                                </div>

                                <div class="form-group">
                                    商品名称

                                    <input type="text" class="form-control" style="" name="shangpinmingcheng"
                                           value="<%= request.getParameter("shangpinmingcheng") !=null ? request.getParameter("shangpinmingcheng") : "" %>"/>
                                </div>
                                <div class="form-group">
                                    分类

                                    <select class="form-control class_fenlei1"
                                            data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>"
                                            data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei">
                                        <option value="">请选择</option>
                                        <%
                                            List<HashMap> select = new CommDAO().select("SELECT * FROM shangpinfenlei ORDER BY id desc");
                                        %>
                                        <% for (HashMap m : select) { %>
                                        <option value="<%= m.get("id") %>"><%= m.get("fenlei") %>
                                        </option>
                                        <% } %>

                                    </select>
                                    <script>
                                        $(".class_fenlei1").val($(".class_fenlei1").attr("data-value"))</script>


                                    <button type="submit" class="btn btn-default">
                                        搜索
                                    </button>
                                </div>

                                <!--form标签结束--></form>

                        </div>

                        <div class="module-products clearfix">
                            <div class="products clearfix">
                                <% for (HashMap r : list) { %>
                                <div class="products-col" style="width: 25%">
                                    <article>
                                        <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>"
                                           class="pro-btn pro-btn-add">
                                            查看
                                        </a>
                                        <div class="figure-grid">
                                            <div class="image">
                                                <div class="img-box pb100 img-scale">
                                                    <a class="img" href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>"
                                                       style="background-image: url('<%= Info.images(r.get("shangpintupian")) %>')"></a>
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h2 class="title h4">
                                                    <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>">
                                                        <%= r.get("shangpinmingcheng") %>
                                                    </a>
                                                </h2>
                                                <sup>￥ <%= r.get("shangpinjiage") %>
                                                </sup>
                                                <span class="description clearfix">
                                <%= Info.subStr(r.get("shangpinxiaoliang"), 12) %>
                            </span>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <% } %>
                            </div>
                            ${page.info}
                        </div>


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>