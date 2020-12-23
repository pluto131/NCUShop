<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">
<%
//------------------------------------------------
String orderby = util.Request.get("order" , "id");  // 获取搜索框中的排序字段、默认为发布时间
String sort  = util.Request.get("sort" , "desc");   // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误



// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


         if(request.getParameter("shangpinxinxiid") != null && !"".equals( request.getParameter("shangpinxinxiid") )){ 
    where += " AND shangpinxinxiid='"+request.getParameter("shangpinxinxiid")+"' ";

    }
             if(request.getParameter("dianpubianhao") != null && !"".equals( request.getParameter("dianpubianhao") )){ where+=" AND dianpubianhao LIKE '%"+request.getParameter("dianpubianhao")+"%'"; } 
                 if(request.getParameter("dianpumingcheng") != null && !"".equals( request.getParameter("dianpumingcheng") )){ where+=" AND dianpumingcheng LIKE '%"+request.getParameter("dianpumingcheng")+"%'"; } 
                 if(request.getParameter("shangpinbianhao") != null && !"".equals( request.getParameter("shangpinbianhao") )){ where+=" AND shangpinbianhao LIKE '%"+request.getParameter("shangpinbianhao")+"%'"; } 
                 if(request.getParameter("shangpinmingcheng") != null && !"".equals( request.getParameter("shangpinmingcheng") )){ where+=" AND shangpinmingcheng LIKE '%"+request.getParameter("shangpinmingcheng")+"%'"; } 
                 if(request.getParameter("fenlei") != null && !"".equals( request.getParameter("fenlei") )){ 
where+=" AND fenlei ='"+request.getParameter("fenlei")+"'"; } 
                             if(request.getParameter("rukushuliang_start") != null && !"".equals( request.getParameter("rukushuliang_start") )){ where+= " AND rukushuliang >='"+request.getParameter("rukushuliang_start")+"' "; }      
 if(request.getParameter("rukushuliang_end") != null && !"".equals( request.getParameter("rukushuliang_end") )){ where+= " AND rukushuliang <='"+request.getParameter("rukushuliang_end")+"' "; }                 if(request.getParameter("rukujiage_start") != null && !"".equals( request.getParameter("rukujiage_start") )){ where+= " AND rukujiage >='"+request.getParameter("rukujiage_start")+"' "; }      
 if(request.getParameter("rukujiage_end") != null && !"".equals( request.getParameter("rukujiage_end") )){ where+= " AND rukujiage <='"+request.getParameter("rukujiage_end")+"' "; }            List<HashMap> list = Query.make("shangpinruku").where(where).order(orderby+" "+sort).page(15);

        %>

        



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="module-name">
            商品入库        </span>
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
    
                            <input type="text" class="form-control" style="" name="dianpubianhao" value="<%= request.getParameter("dianpubianhao") !=null ? request.getParameter("dianpubianhao") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    店铺名称
    
                            <input type="text" class="form-control" style="" name="dianpumingcheng" value="<%= request.getParameter("dianpumingcheng") !=null ? request.getParameter("dianpumingcheng") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    商品编号
    
                            <input type="text" class="form-control" style="" name="shangpinbianhao" value="<%= request.getParameter("shangpinbianhao") !=null ? request.getParameter("shangpinbianhao") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    商品名称
    
                            <input type="text" class="form-control" style="" name="shangpinmingcheng" value="<%= request.getParameter("shangpinmingcheng") !=null ? request.getParameter("shangpinmingcheng") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    分类
    
                            <select class="form-control class_fenlei15" data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" id="fenlei" name="fenlei">
<option value="">请选择</option><% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM shangpinfenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenlei") %></option>
<% } %>

</select>
<script>
$(".class_fenlei15").val($(".class_fenlei15").attr("data-value"))</script>
                        
</div>
                                                                                                                            <div class="form-group">
    入库数量
    
                            <input type="text" class="form-control" style="width:80px;" name="rukushuliang_start" value="<%= request.getParameter("rukushuliang_start") !=null ? request.getParameter("rukushuliang_start") : "" %>"/>-
<input type="text" class="form-control" style="width:80px;" name="rukushuliang_end" value="<%= request.getParameter("rukushuliang_end") !=null ? request.getParameter("rukushuliang_end") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    入库价格
    
                            <input type="text" class="form-control" style="width:80px;" name="rukujiage_start" value="<%= request.getParameter("rukujiage_start") !=null ? request.getParameter("rukujiage_start") : "" %>"/>-<input type="text" class="form-control" style="width:80px;" name="rukujiage_end" value="<%= request.getParameter("rukujiage_end") !=null ? request.getParameter("rukujiage_end") : "" %>"/>                        
</div>
                                                                            <select class="form-control" name="order" id="orderby">

                    <option value="id">按发布时间</option>
                                                <option value="shangpinjiage">
                                按商品价格                            </option>
                                                    <option value="shangpinkucun">
                                按商品库存                            </option>
                                                    <option value="rukushuliang">
                                按入库数量                            </option>
                                                    <option value="rukujiage">
                                按入库价格                            </option>
                                        
</select>
                <select class="form-control" name="sort" id="sort">

                    <option value="desc">倒序</option>
                    <option value="asc">升序</option>
                
</select>
                <script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>");</script>
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
                        <th> 店铺编号 </th>
<th> 店铺名称 </th>
<th> 商品编号 </th>
<th> 商品名称 </th>
<th> 分类 </th>
<th> 商品图片 </th>
<th> 商品价格 </th>
<th> 商品库存 </th>
<th> 入库数量 </th>
<th> 入库价格 </th>
<th> 入库备注 </th>
<th> 操作人 </th>
                                                                        <th width="180" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% 
                int i= 0;
                for(HashMap map:list){
                i++;
                 %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                                                <%= i %>
                            </label>
                        </td>
                        <td> <%= map.get("dianpubianhao") %> </td>
<td> <%= map.get("dianpumingcheng") %> </td>
<td> <%= map.get("shangpinbianhao") %> </td>
<td> <%= map.get("shangpinmingcheng") %> </td>
<td> <% 
 HashMap mapshangpinfenlei17 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='"+map.get("fenlei")+"'"); 
 %><%= mapshangpinfenlei17.get("fenlei") %> </td>
<td> <% if( "".equals( map.get("shangpintupian") ) ){ %>-<% } else { %><img width="100" src="<%= Info.images(map.get("shangpintupian")) %>"/><% } %> </td>
<td> <%= map.get("shangpinjiage") %> </td>
<td> <%= map.get("shangpinkucun") %> </td>
<td> <%= map.get("rukushuliang") %> </td>
<td> <%= map.get("rukujiage") %> </td>
<td> <%= map.get("rukubeizhu") %> </td>
<td> <%= map.get("caozuoren") %> </td>
                                                                        <td align="center"><%= map.get("addtime") %></td>
                        <td align="center">
                            
                                                                                        <a href="shangpinruku_detail.jsp?id=<%= map.get("id") %>">
                                    详细
                                </a>
                                                        <a href="shangpinruku_updt.jsp?id=<%= map.get("id") %>">修改</a>
                            <a href="shangpinruku.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('真的要删除？')">删除</a>
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
