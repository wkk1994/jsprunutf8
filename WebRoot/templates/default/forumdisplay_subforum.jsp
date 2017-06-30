<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<div class="mainbox forumlist">
<span class="headactions"><img id="subforum_${forum.fid}_img" src="${styles.IMGDIR}/${collapseimg.subforum}" title="<bean:message key="spread" />" alt="<bean:message key="spread" />" onclick="toggle_collapse('subforum_${forum.fid}');" /> </span>
<h3><bean:message key="sub_forums" /></h3>
<table id="subforum_${forum.fid}" summary="subform" cellspacing="0" cellpadding="0" style="${collapse.subforum}"><c:choose><c:when test="${forum.forumcolumns>0}">
<tbody><tr><c:forEach items="${subforums}" var="sub" varStatus="index">
<th width="${forumcolwidth}" ${sub.folder}><h2><a href="forumdisplay.jsp?fid=${sub.fid}">${sub.name}</a><c:if test="${sub.todayposts>0}"><em> (<bean:message key="forum_todayposts" />: ${sub.todayposts})</em></c:if></h2><p><bean:message key="thread" />: ${sub.threads}, <bean:message key="forum_posts" />: ${sub.posts}</p><p><c:choose><c:when test="${sub.permission == 1}"><bean:message key="private_forum" /></c:when><c:otherwise><bean:message key="a_post_threads_lastpost" />:	<c:set var="lastpost" value="${lastposts[sub.fid]}"	scope="page" /><c:choose><c:when test="${lastpost.tid>0}"><a href="redirect.jsp?tid=${lastpost.tid}&goto=lastpost#lastpost">${lastpost.dateline}</a> by  <c:choose><c:when test="${lastpost.author!=''}">${lastpost.author}</c:when><c:otherwise><bean:message key="anonymous" /></c:otherwise></c:choose></c:when><c:otherwise><bean:message key="never" /></c:otherwise></c:choose></c:otherwise></c:choose></p></th>${(index.count%(forum.forumcolumns))==0?"</tr></tbody><tbody><tr>":""}</c:forEach>${endrows}
</tr></tbody></c:when><c:otherwise>
<thead class="category"><tr><th><bean:message key="forum_name" /></th><td class="nums"><bean:message key="thread" /></td><td class="nums"><bean:message key="forum_posts" /></td><td class="lastpost"><bean:message key="a_post_threads_lastpost" /></td></tr></thead>
<tbody><c:forEach items="${subforums}" var="sub">
<tr><th ${sub.folder}>${sub.icon} <h2><a href="forumdisplay.jsp?fid=${sub.fid}">${sub.name}</a><c:if test="${sub.todayposts>0&&empty sub.redirect}"> <em>(<bean:message key="forum_todayposts" />: ${sub.todayposts})</em></c:if></h2><c:if test="${sub.description!=''}"> <p>${sub.description}</p></c:if><c:if test="${sub.moderators!=''}"> <c:choose><c:when test="${settings.moddisplay == 'flat'}"><p class="moderators"><bean:message key="usergroups_system_3" />: ${sub.moderators}</p></c:when><c:otherwise><span class="dropmenu" id="mod${sub.fid}" onmouseover="showMenu(this.id)"><bean:message key="usergroups_system_3" /></span><ul class="moderators popupmenu_popup" id="mod${sub.fid}_menu" style="display: none">${sub.moderators}</ul></c:otherwise></c:choose></c:if></th><td class="nums">${empty sub.redirect ? sub.threads : "--"}</td><td class="nums">${empty sub.redirect ? sub.posts : "--"}</td><td class="lastpost"><c:choose><c:when test="${sub.permission == 1}"><bean:message key="private_forum" /></c:when><c:otherwise><c:set var="lastpost" value="${lastposts[sub.fid]}" scope="page" /><c:choose><c:when test="${!empty sub.redirect}">--</c:when><c:when test="${lastpost.tid>0}"><a href="redirect.jsp?tid=${lastpost.tid}&goto=lastpost#lastpost">${lastpost.subject}</a><cite>by <c:choose><c:when test="${lastpost.author!=''}">${lastpost.author}</c:when><c:otherwise><bean:message key="anonymous" /></c:otherwise></c:choose> - ${lastpost.dateline}</cite></c:when><c:otherwise><bean:message key="never" /></c:otherwise></c:choose></c:otherwise></c:choose></td></tr></c:forEach>
</tbody></c:otherwise></c:choose>
</table>
</div>