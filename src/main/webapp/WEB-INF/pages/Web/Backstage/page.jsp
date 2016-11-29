<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/15
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int totalPage=(Integer) request.getAttribute("totalPage");
  int currentPage=(Integer) request.getAttribute("currentPage");
  int lastPage=1;
  int nextPage=currentPage+1;
  String url=request.getParameter("url");
  System.out.print(url);
%>
<section class="archive-pages">
  <ul>
    <li class="first"><a href="<%=url%>pn=1" title="first page">first page</a></li>
    <li class="previous"><a href="<%=url%>pn=<%=lastPage%>" title="previous page">previous page</a></li>
    <%
      for(int i=1;i<=totalPage;i++){
        if(i==currentPage){
    %>
    <li><a href="<%=url%>pn=<%=i%>" style="background-color: #428bca"><%=i%></a></li>
    <%
      }else{
    %>
    <li><a href="<%=url%>pn=<%=i%>"><%=i%></a></li>
    <%
      }
    %>
    <%
      }
    if(nextPage>totalPage)
      nextPage=totalPage;
    %>
    <li class="next"><a href="<%=url%>pn=<%=nextPage%>">next page</a></li>
    <li class="last"><a href="<%=url%>pn=<%=totalPage%>">last page</a></li>
  </ul>
</section>
