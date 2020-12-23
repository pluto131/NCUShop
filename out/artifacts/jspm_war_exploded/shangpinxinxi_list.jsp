<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>

<div style="padding: 10px">
    <%
        //------------------------------------------------
        String orderby = util.Request.get("order", "id");  // 获取搜索框中的排序字段、默认为发布时间
        String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序

        String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误


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


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            商品信息        </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" action="?"><!-- form 标签开始 -->

                    <div class="form-group">


                        <i class="glyphicon glyphicon-search"></i>

                    </div>
                    <div class="form-group">
                        店铺编号

                        <input type="text" class="form-control" style="" name="dianpubianhao"
                               value="<%= request.getParameter("dianpubianhao") !=null ? request.getParameter("dianpubianhao") : "" %>"/>
                    </div>
                    <div class="form-group">
                        店铺名称

                        <input type="text" class="form-control" style="" name="dianpumingcheng"
                               value="<%= request.getParameter("dianpumingcheng") !=null ? request.getParameter("dianpumingcheng") : "" %>"/>
                    </div>
                    <div class="form-group">
                        商品编号

                        <input type="text" class="form-control" style="" name="shangpinbianhao"
                               value="<%= request.getParameter("shangpinbianhao") !=null ? request.getParameter("shangpinbianhao") : "" %>"/>
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


            <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th> 店铺编号</th>
                        <th> 店铺名称</th>
                        <th> 商品编号</th>
                        <th> 商品名称</th>
                        <th> 分类</th>
                        <th> 商品图片</th>
                        <th> 商品价格</th>
                        <th> 商品库存</th>
                        <th> 商品销量</th>
                        <th> 商家</th>
                        <th width="80" data-field="issh">审核状态</th>
                        <th width="120" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 0;
                        for (HashMap map : list) {
                            i++;
                    %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                <%= i %>
                            </label>
                        </td>
                        <td><%= map.get("dianpubianhao") %>
                        </td>
                        <td><%= map.get("dianpumingcheng") %>
                        </td>
                        <td><%= map.get("shangpinbianhao") %>
                        </td>
                        <td><%= map.get("shangpinmingcheng") %>
                        </td>
                        <td><%
                            HashMap mapshangpinfenlei3 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='" + map.get("fenlei") + "'");
                        %><%= mapshangpinfenlei3.get("fenlei") %>
                        </td>
                        <td><% if ("".equals(map.get("shangpintupian"))) { %>-<% } else { %><img width="100"
                                                                                                 src="<%= Info.images(map.get("shangpintupian")) %>"/><% } %>
                        </td>
                        <td><%= map.get("shangpinjiage") %>
                        </td>
                        <td><%= map.get("shangpinkucun") %>
                        </td>
                        <td><%= map.get("shangpinxiaoliang") %>
                        </td>
                        <td><%= map.get("shangjia") %>
                        </td>
                        <td>
                            <%= map.get("issh") %>
                            <a href="sh.jsp?id=<%= map.get("id") %>&yuan=<%= map.get("issh") %>&tablename=shangpinxinxi">
                                <% if (map.get("issh").equals("是")) { %>
                                取消审核
                                <% } else { %>
                                审核
                                <% } %>
                            </a>
                        </td>
                        <td align="center"><%= map.get("addtime") %>
                        </td>
                        <td align="center">


                            <a href="shangpinxinxi_detail.jsp?id=<%= map.get("id") %>">
                                详细
                            </a>
                            <a href="shangpinxinxi_updt.jsp?id=<%= map.get("id") %>">修改</a>
                            <a href="shangpinxinxi.jsp?a=delete&id=<%= map.get("id") %>"
                               onclick="return confirm('真的要删除？')">删除</a>
                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            ${page.info}


        </div>


    </div>


</div>
<%@ include file="foot.jsp" %>
