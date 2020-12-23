<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>

<div style="padding: 10px">
                
<% HashMap map = Query.make("shangpinruku").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                店铺编号            </td>
            <td><%= map.get("dianpubianhao") %></td>
            
                                    <td width="180">
                店铺名称            </td>
            <td><%= map.get("dianpumingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                商品编号            </td>
            <td><%= map.get("shangpinbianhao") %></td>
            
                                    <td width="180">
                商品名称            </td>
            <td><%= map.get("shangpinmingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                分类            </td>
            <td><% 
 HashMap mapshangpinfenlei20 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='"+map.get("fenlei")+"'"); 
 %><%= mapshangpinfenlei20.get("fenlei") %></td>
            
                                    <td width="180">
                商品图片            </td>
            <td><fieldset class="images_box"><div id="gellay_images" class="imagesList"><script>
            var images = "<%= map.get("shangpintupian") %>".split(',');
            for(var i=0;i<images.length;i++){
                var image = images[i];
                var uploadImage = '<div class="uploadImage">' +
                '<span class="thumb thumbnail"><img src="'+image+'"/></span>'+
                '</div>';
                document.writeln(uploadImage);
            }
            
</script></div></fieldset></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                商品价格            </td>
            <td><%= map.get("shangpinjiage") %></td>
            
                                    <td width="180">
                商品库存            </td>
            <td><%= map.get("shangpinkucun") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                入库数量            </td>
            <td><%= map.get("rukushuliang") %></td>
            
                                    <td width="180">
                入库价格            </td>
            <td><%= map.get("rukujiage") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                入库备注            </td>
            <td><%= map.get("rukubeizhu") %></td>
            
                                    <td width="180">
                操作人            </td>
            <td><%= map.get("caozuoren") %></td>
                    </tr>
        <tr>
            
                    </tr>
    </table>
</div>


<div class="button-list">
    <div class="">
        <button onclick="history.go(-1);"
                style="background: #07de19; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">返回
        </button>
        <button onclick="window.print()"
                style="background: #4961de; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">打印本页
        </button>
    </div>
</div>
</div>
<%@ include file="foot.jsp" %>
