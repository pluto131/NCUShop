<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

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
    HashMap map = new CommDAO().getmap(request.getParameter("id") , "shangpinxinxi");
    %>








<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            编辑商品信息:
        </div>
        <div class="panel-body">
            <form action="shangpinxinxi.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
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
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="shangpinbianhao" name="shangpinbianhao" value="<%= Info.html(map.get("shangpinbianhao")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品名称</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:250px;" id="shangpinmingcheng" name="shangpinmingcheng" value="<%= Info.html(map.get("shangpinmingcheng")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">分类<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <select class="form-control class_fenlei4" data-value="<%= Info.html(map.get("fenlei")) %>" data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei" style="width:250px">
<% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM shangpinfenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenlei") %></option>
<% } %>

</select>
<script>
$(".class_fenlei4").val($(".class_fenlei4").attr("data-value"))</script>
                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品图片<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="hidden" data-rule-required="true" data-msg-required="请填写商品图片" id="shangpintupian" name="shangpintupian" value="<%= Info.html(map.get("shangpintupian")) %>"/>
        <script>showUploadImages("#shangpintupian")</script>
                                                    
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品价格<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写商品价格" number="true" data-msg-number="输入一个有效数字" id="shangpinjiage" name="shangpinjiage" value="<%= Info.html(map.get("shangpinjiage")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品库存<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写商品库存" number="true" data-msg-number="输入一个有效数字" id="shangpinkucun" name="shangpinkucun" value="<%= Info.html(map.get("shangpinkucun")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品销量</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" id="shangpinxiaoliang" name="shangpinxiaoliang" value="<%= Info.html(map.get("shangpinxiaoliang")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品详情</label>
        <div class="col-sm-8">
            
                                                    <textarea id="shangpinxiangqing" name="shangpinxiangqing" style="max-width: 750px;width:100%; height: 300px;"><%= Info.html(map.get("shangpinxiangqing")) %></textarea><script>
            (function(){
                var um = UM.getEditor('shangpinxiangqing');
            })();
            </script>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商家</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="shangjia" name="shangjia" value="<%= map.get("shangjia") %>"/>
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                            <input name="id" value="<%= map.get("id") %>" type="hidden"/>
                                                <input name="dianpuxinxiid" value="<%= map.get("dianpuxinxiid") %>" type="hidden"/>
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
