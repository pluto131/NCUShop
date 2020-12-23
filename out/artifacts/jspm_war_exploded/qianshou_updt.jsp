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
    HashMap map = new CommDAO().getmap(request.getParameter("id") , "qianshou");
    %>








<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            编辑签收:
        </div>
        <div class="panel-body">
            <form action="qianshou.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单号</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("dingdanhao") %><input type="hidden" id="dingdanhao" name="dingdanhao" value="<%= Info.html(map.get("dingdanhao")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单信息</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("dingdanxinxi") %><input type="hidden" id="dingdanxinxi" name="dingdanxinxi" value="<%= Info.html(map.get("dingdanxinxi")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单金额</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("dingdanjine") %><input type="hidden" id="dingdanjine" name="dingdanjine" value="<%= Info.html(map.get("dingdanjine")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">收货地址</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("shouhuodizhi") %><input type="hidden" id="shouhuodizhi" name="shouhuodizhi" value="<%= Info.html(map.get("shouhuodizhi")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">联系电话</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("lianxidianhua") %><input type="hidden" id="lianxidianhua" name="lianxidianhua" value="<%= Info.html(map.get("lianxidianhua")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">收货人</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("shouhuoren") %><input type="hidden" id="shouhuoren" name="shouhuoren" value="<%= Info.html(map.get("shouhuoren")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">物流公司</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("wuliugongsi") %><input type="hidden" id="wuliugongsi" name="wuliugongsi" value="<%= Info.html(map.get("wuliugongsi")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">物流单号</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("wuliudanhao") %><input type="hidden" id="wuliudanhao" name="wuliudanhao" value="<%= Info.html(map.get("wuliudanhao")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">发货商家</label>
        <div class="col-sm-8">
            
                                                    <%= map.get("fahuoshangjia") %><input type="hidden" id="fahuoshangjia" name="fahuoshangjia" value="<%= Info.html(map.get("fahuoshangjia")) %>"/>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">签收备注</label>
        <div class="col-sm-8">
            
                                                    <textarea style="width: 80%;height: 120px" class="form-control" id="qianshoubeizhu" name="qianshoubeizhu"><%= Info.html(map.get("qianshoubeizhu")) %></textarea>
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">签收用户</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="qianshouyonghu" name="qianshouyonghu" value="<%= map.get("qianshouyonghu") %>"/>
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                            <input name="id" value="<%= map.get("id") %>" type="hidden"/>
                                                <input name="fahuoid" value="<%= map.get("fahuoid") %>" type="hidden"/>
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
