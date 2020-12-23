<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">


    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
    <script>
        alert('对不起,请您先登陆!');
        location.href = 'login.jsp';
    </script>
    <%
            return;
        } %>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">
                添加商品订单:
            </div>
            <div class="panel-body">
                <form action="shangpindingdan.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单号</label>
                            <div class="col-sm-8">

                                <input type="text" class="form-control" style="width:150px;" readonly="readonly"
                                       id="dingdanhao" name="dingdanhao" value="<%= Info.getID() %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单信息</label>
                            <div class="col-sm-8">

                                <%
                                    List<HashMap> dataListdingdanxinxi = new CommDAO().select("SELECT * FROM gouwuche WHERE goumaiyonghu='" + request.getSession().getAttribute("username") + "' AND shangjia='" + request.getParameter("shangjia") + "' ORDER BY id desc");
                                %>
                                <div id="dataListdingdanxinxi" style="text-align: left;">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <td>商品编号</td>
                                            <td>商品名称</td>
                                            <td>分类</td>
                                            <td>商品图片</td>
                                            <td>商品价格</td>
                                            <td>商家</td>
                                            <td>购买数量</td>
                                            <td>小计</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr><% for (HashMap dataMap : dataListdingdanxinxi) { %>
                                            <td><%= dataMap.get("shangpinbianhao") %>
                                            </td>
                                            <td><%= dataMap.get("shangpinmingcheng") %>
                                            </td>
                                            <td><%
                                                HashMap mapshangpinfenlei16 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='" + dataMap.get("fenlei") + "'");
                                            %><%= mapshangpinfenlei16.get("fenlei") %>
                                            </td>
                                            <td><% if ("".equals(dataMap.get("shangpintupian"))) { %>-<% } else { %><img
                                                    width="100"
                                                    src="<%= Info.images(dataMap.get("shangpintupian")) %>"/><% } %>
                                            </td>
                                            <td><%= dataMap.get("shangpinjiage") %>
                                            </td>
                                            <td><%= dataMap.get("shangjia") %>
                                            </td>
                                            <td><%= dataMap.get("goumaishuliang") %>
                                            </td>
                                            <td><%= dataMap.get("xiaoji") %>
                                            </td>
                                        </tr>
                                        </tbody>
                                        <% } %>
                                    </table>
                                </div>
                                <input type="hidden" name="dataset_shangjia"
                                       value="<%= request.getParameter("shangjia") !=null ? request.getParameter("shangjia") : "" %>"/><input
                                    id="dingdanxinxi" name="dingdanxinxi" type="hidden"/>
                                <script>$("#dingdanxinxi").val($("#dataListdingdanxinxi").html());</script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单金额<span
                                    style="color: red;">*</span></label>
                            <div class="col-sm-8">

                                <input style="width:150px;" readonly="readonly" id="dingdanjine" name="dingdanjine"
                                       value="<%= request.getParameter("xiaoji") %>"
                                       type="text"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">收货地址</label>
                            <div class="col-sm-8">

                                <input type="text" class="form-control" style="width:150px;" id="shouhuodizhi"
                                       name="shouhuodizhi" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">联系电话</label>
                            <div class="col-sm-8">

                                <input type="text" class="form-control" style="width:150px;" id="lianxidianhua"
                                       name="lianxidianhua" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">收货人</label>
                            <div class="col-sm-8">

                                <input type="text" class="form-control" style="width:150px;" id="shouhuoren"
                                       name="shouhuoren" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">备注</label>
                            <div class="col-sm-8">

                                <textarea style="width: 80%;height: 120px" class="form-control" id="beizhu"
                                          name="beizhu"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商家</label>
                            <div class="col-sm-8">

                                <input type="text" class="form-control" style="width:150px;" readonly="readonly"
                                       id="shangjia" name="shangjia"
                                       value="<%= request.getParameter("shangjia") %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">下单人</label>
                            <div class="col-sm-8">

                                <input type="text" class="form-control" style="width:150px;" readonly="readonly"
                                       id="xiadanren" name="xiadanren"
                                       value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
                            <div class="col-sm-8">


                                <input type="hidden" name="dingdanzhuangtai" id="dingdanzhuangtai" value="待支付"/>
                                <input type="hidden" name="iszf" value="否"/>

                                <button type="submit" class="btn btn-primary" name="Submit">
                                    提交
                                </button>
                                <button type="reset" class="btn btn-default" name="Submit2">
                                    重置
                                </button>


                            </div>
                        </div>
                    </div>

                    <!--form标签结束--></form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 --></div>


    <script>
        $(function () {
            $('#form1').validate();
        });
    </script>


</div>
<%@ include file="foot.jsp" %>
