<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_property_owner_user_chat tsc inner join tbl_property_owners t on (tsc.to_property_owner_id=t.property_owners_id) or (tsc.from_property_owner_id=t.property_owners_id) where t.property_owners_id='" + request.getParameter("id") + "' order by chat_id";
    //System.out.println(selQry);
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {

        if (rs.getString("to_user_id").equals(session.getAttribute("uid"))) {


%>

<div class="chat-message is-received">
    <img src="../../Assets/Files/<%=rs.getString("property_owners_photo")%>" alt="">
    <div class="message-block">
        <span><%=rs.getString("property_owners_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
      
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%

} else if (rs.getString("from_user_id").equals(session.getAttribute("uid"))) {

    String sel = "select * from tbl_user where user_id='" + rs.getString("from_user_id") + "'";
   
    ResultSet z = con.selectCommand(sel);
    if (z.next()) {
%>
<div class="chat-message is-sent">
    <img src="../../Assets/Files/<%=z.getString("user_photo")%>" alt="">
    <div class="message-block">
        <span><%=z.getString("user_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
    <img style="width: 20px;height: 20px;margin-top: 30px" src="../../Assets/friendskit/assets/img/icons/feed/delete.svg" onclick="deleteChat(<%=rs.getString("chat_id")%>)">
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>
<%
            }

        }
    }


%>