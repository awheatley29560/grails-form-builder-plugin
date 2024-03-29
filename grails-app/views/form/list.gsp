<%@ page import="grails.converters.JSON" %>
<%@ page import="org.grails.formbuilder.FormBuilderConstants" %>
<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<g:set var="locale" value="${RequestContextUtils.getLocale(request)}" />
<% String language = locale.language == 'en' ? 'en' : "${locale.language}_${locale.country}" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="formDesigner" />
        <g:set var="entityName" value="${message(code: 'form.label', default: 'Form')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <style type="text/css">
        .list {
          width: 640px; 
          margin-left: auto; 
          margin-right: auto;
        }  
        .col1 {
          width: 460px;
          font-size: 16px;
			    font-weight: bold;
			    line-height: 17px;
        }
        .col1 a {
          text-decoration: none;
          color: #666;
          padding: 0 3px 0 3px
        }
        </style>
    </head>
    <body>
        <content tag="nav">
          <div class="title"><h1><g:message code="default.list.label" args="[entityName]" /></h1></div>
          <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
          <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </content>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table style="border: 0">
                    <thead>
                        <tr>
                            <td class="col1" style="border: 0"></td>
                            <g:sortableColumn property="dateCreated" title="${message(code: 'form.dateCreated.label', default: 'Creation Date')}" />                        
                        </tr>
                    </thead>
                 </table>
                 <table>
                    <tbody>
                    <g:each in="${formInstanceList}" status="i" var="formInstance">
				                        <% 
										   name = JSON.parse(formInstance.settings)."${language}".name 
										   rowCount = grailsApplication.getDomainClass(formInstance.domainClass.name).clazz.count()
										%>
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                           <td class="col1"><g:link action="show" id="${formInstance.id}">${name}</g:link></td>
                           <td>
                             <span class="menuButton"><g:link class="list" controller="${FormBuilderConstants.FORM_VIEWER_CONTROLLER}" action="list" params="[formId:formInstance.id]">List (${rowCount})</g:link></span>
                             <span class="menuButton"><g:link class="create" controller="${FormBuilderConstants.FORM_VIEWER_CONTROLLER}" action="create" params="[formId:formInstance.id]">New</g:link></span>
                           </td>                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="paginateButtons">
                  <g:paginate total="${formInstanceTotal}" />
                </div>
            </div>
            
        </div>
    </body>
</html>
