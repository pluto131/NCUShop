<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">


    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <%
        return;
    } %>


<%
        // 获取需要编辑的数据
    String updtself="0"; // 设置更新
    HashMap map = new CommDAO().getmap(request.getParameter("id") , "shangpinruku");
    %>








<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            编辑商品入库:
        </div>
        <div class="panel-body">
            <form action="shangpinruku.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">店铺编号</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("dianpubianhao") %><input type="hidden" id="dianpubianhao" name="dianpubianhao" value="<%= Info.html(map.get("dianpubianhao")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">店铺名称</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("dianpumingcheng") %><input type="hidden" id="dianpumingcheng" name="dianpumingcheng" value="<%= Info.html(map.get("dianpumingcheng")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品编号</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("shangpinbianhao") %><input type="hidden" id="shangpinbianhao" name="shangpinbianhao" value="<%= Info.html(map.get("shangpinbianhao")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品名称</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("shangpinmingcheng") %><input type="hidden" id="shangpinmingcheng" name="shangpinmingcheng" value="<%= Info.html(map.get("shangpinmingcheng")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">分类</label>
        <div class="col-sm-8">
            
                                                    <% 
 HashMap mapshangpinfenlei22 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='"+map.get("fenlei")+"'");
 %><%= mapshangpinfenlei22.get("fenlei") %><input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(map.get("fenlei")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品图片</label>
        <div class="col-sm-8">
            
                                                    <% if( "".equals( map.get("shangpintupian") ) ){ %>-<% } else { %><img width="100" src="<%= Info.images(map.get("shangpintupian")) %>"/><% } %><input type="hidden" id="shangpintupian" name="shangpintupian" value="<%= Info.html(map.get("shangpintupian")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品价格</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("shangpinjiage") %><input type="hidden" id="shangpinjiage" name="shangpinjiage" value="<%= Info.html(map.get("shangpinjiage")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品库存</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("shangpinkucun") %><input type="hidden" id="shangpinkucun" name="shangpinkucun" value="<%= Info.html(map.get("shangpinkucun")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">入库数量<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写入库数量" number="true" data-msg-number="输入一个有效数字" id="rukushuliang" name="rukushuliang" value="<%= Info.html(map.get("rukushuliang")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">入库价格<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写入库价格" number="true" data-msg-number="输入一个有效数字" id="rukujiage" name="rukujiage" value="<%= Info.html(map.get("rukujiage")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">入库备注</label>
        <div class="col-sm-8">
            
                                                    <textarea style="width: 80%;height: 120px" class="form-control" id="rukubeizhu" name="rukubeizhu"><%= Info.html(map.get("rukubeizhu")) %></textarea>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">操作人</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="caozuoren" name="caozuoren" value="<%= map.get("caozuoren") %>"/>
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                            <input name="id" value="<%= map.get("id") %>" type="hidden"/>
                                                <input name="shangpinxinxiid" value="<%= map.get("shangpinxinxiid") %>" type="hidden"/>
                                                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                        <input name="updtself" value="<%= updtself %>" type="hidden"/>
                                        
                    
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
