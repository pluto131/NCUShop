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
        where += " AND shangjia='" + request.getSession().getAttribute("username") + "' "; //  设置shangjia为当前登录用户


// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


        if (request.getParameter("dingdanhao") != null && !"".equals(request.getParameter("dingdanhao"))) {
            where += " AND dingdanhao LIKE '%" + request.getParameter("dingdanhao") + "%'";
        }
        if (request.getParameter("dingdanxinxi") != null && !"".equals(request.getParameter("dingdanxinxi"))) {
            where += " AND dingdanxinxi LIKE '%" + request.getParameter("dingdanxinxi") + "%'";
        }
        List<HashMap> list = Query.make("shangpindingdan").where(where).order(orderby + " " + sort).page(15);

    %>


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            商品订单        </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" action="?"><!-- form 标签开始 -->

                    <div class="form-group">


                        <i class="glyphicon glyphicon-search"></i>

                    </div>
                    <div class="form-group">
                        订单号

                        <input type="text" class="form-control" style="" name="dingdanhao"
                               value="<%= request.getParameter("dingdanhao") !=null ? request.getParameter("dingdanhao") : "" %>"/>
                    </div>

                    <button type="submit" class="btn btn-default">
                        搜索
                    </button>


                    <!--form标签结束--></form>
            </div>


            <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th> 订单号</th>
                        <th> 订单信息</th>
                        <th> 订单金额</th>
                        <th> 收货地址</th>
                        <th> 联系电话</th>
                        <th> 收货人</th>

                        <th> 订单状态</th>
                        <th> 商家</th>
                        <th> 下单人</th>
                        <th width="80" data-field="iszf">是否支付</th>
                        <th width="120" data-field="addtime">添加时间</th>
                        <th width="120" data-field="handler">操作</th>
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
                        <td><%= map.get("dingdanhao") %>
                        </td>
                        <td><%= map.get("dingdanxinxi") %>
                        </td>
                        <td><%= map.get("dingdanjine") %>
                        </td>
                        <td><%= map.get("shouhuodizhi") %>
                        </td>
                        <td><%= map.get("lianxidianhua") %>
                        </td>
                        <td><%= map.get("shouhuoren") %>
                        </td>

                        <td><%= map.get("dingdanzhuangtai") %>
                        </td>
                        <td><%= map.get("shangjia") %>
                        </td>
                        <td><%= map.get("xiadanren") %>
                        </td>
                        <td>
                            <%= map.get("iszf") %>
                            <% if ("否".equals(map.get("iszf"))) { %>

                            <% } %>
                        </td>
                        <td align="center"><%= map.get("addtime") %>
                        </td>
                        <td align="center">
                            <%
                                if(map.get("dingdanzhuangtai").equals("已支付"))
                                {
                            %>
                            <a href="fahuo_add.jsp?id=<%= map.get("id") %>">发货</a>
                            <%
                                }
                            %>


                            <a href="shangpindingdan_detail.jsp?id=<%= map.get("id") %>">
                                详细
                            </a>


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
