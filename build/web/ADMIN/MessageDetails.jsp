<%@page import="Model.Message"%>
<%@page import="java.util.List"%>
<%@page import="DAOImpl.MessageDAOImpl"%>
<%@page import="DAO.MessageDAO"%>
<%@page import="Model.Admin"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en" class="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Message Details || Admin</title>

        <!-- Tailwind is included -->
        <link rel="stylesheet" href="CSS/main.css?v=1628755089081">

        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());
            gtag('config', 'UA-130795909-1');
        </script>

    </head>
    <body>

        <div id="app">

        <nav id="navbar-main" class="navbar is-fixed-top">

            <div class="navbar-brand is-right">
                <a class="navbar-item --jb-navbar-menu-toggle" data-target="navbar-menu">
                    <span class="icon"><i class="mdi mdi-dots-vertical mdi-24px"></i></span>
                </a>
            </div>
            <div class="navbar-menu" id="navbar-menu">
                <div class="navbar-end">
                    <div class="navbar-item dropdown has-divider has-user-avatar">
                        <a class="navbar-link">
                            <div class="is-user-name"><span>Admin</span></div>
                            <span class="icon"><i class="mdi mdi-chevron-down"></i></span>
                        </a>
                        <div class="navbar-dropdown">
                            <a href="AdminMessage.jsp" class="navbar-item">
                                <span class="icon"><i class="mdi mdi-email"></i></span>
                                <span>Messages</span>
                            </a>
                            <a href="AdminSettings.jsp" class="navbar-item">
                                <span class="icon"><i class="mdi mdi-settings"></i></span>
                                <span>Settings</span>
                            </a>
                            <hr class="navbar-divider">
                            <a href="<%=request.getContextPath()%>/bidderController?command=signout" class="navbar-item">
                                <span class="icon"><i class="mdi mdi-logout"></i></span>
                                <span>Log Out</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <aside class="aside is-placed-left is-expanded">
            <div class="aside-tools">
              <div>
                ADMIN
              </div>
            </div>
            <div class="menu is-menu-main">
                <ul class="menu-list">
                    <li class="--set-active-index-html">
                        <a href="AdminDashboard.jsp">
                            <span class="icon"><i class="mdi mdi-desktop-mac"></i></span>
                            <span class="menu-item-label">DASHBOARD</span>
                        </a>
                    </li>
                </ul>
                <ul class="menu-list">
                    <li class="active">
                        <a href="AdminMessage.jsp">
                            <span class="icon"><i class="mdi mdi-email"></i></span>
                            <span class="menu-item-label">MESSAGES</span>
                        </a>
                    </li>
                    <li class="--set-active-profile-html">
                        <a href="AdminSettings.jsp">
                            <span class="icon"><i class="mdi mdi-settings"></i></span>
                            <span class="menu-item-label">SETTINGS</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>

        <section class="is-title-bar">
            <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
                <ul>
                    <li>ADMIN</li>
                    <li>MESSAGES</li>
                    <li>MESSAGE DETAILS</li>
                </ul>
            </div>
        </section>

        <section class="section main-section">
            <div class="card mb-6">
                <header class="card-header">
                  <p class="card-header-title">
                    <span class="icon"><i class="mdi mdi-email"></i></span>
                    Message Details
                  </p>
                </header>
                <%
                    String messageid = request.getParameter("id");
                    MessageDAO messagedao = new MessageDAOImpl();
                    Message message = messagedao.retrieveMessageByMessageId(Integer.parseInt(messageid));
                %>
                <div class="card-content">
                    <form action="../MessageServlet">
                        <div class="field">
                            <div class="field-body">
                                <div class="field">
                                    <label class="label">Name</label>
                                    <div class="control icons-left">
                                        <input class="input" name="name" readonly type="text" placeholder="Name" value="<%=message.getMessageName()%>">
                                        <span class="icon left"><i class="mdi mdi-account"></i></span>
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="label">Email</label>
                                    <div class="control icons-left icons-right">
                                        <input class="input" name="email" readonly type="email" placeholder="Email" value="<%=message.getMessageEmail()%>">
                                        <span class="icon left"><i class="mdi mdi-mail"></i></span>
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="label">Subject</label>
                                    <div class="control icons-left icons-right">
                                        <input class="input" name="subject" readonly type="text" placeholder="Subject" value="<%=message.getMessageSubject()%>">
                                        <span class="icon left"><i class="mdi mdi-comment"></i></span>
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="label">Description</label>
                                    <div class="control">
                                        <textarea class="textarea" readonly name="description" placeholder="Type a description..."><%=message.getMessageDescription()%></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                    </form>
                </div>
            </div>
        </section>
                                
        <footer class="footer">
            <div class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0">
                <div class="flex items-center justify-start space-x-3">
                    <div>
                        ?? 2022
                    </div>
                </div>
            </div>
        </footer>

        <!-- Scripts below are for demo only -->
        <script type="text/javascript" src="JS/main.min.js?v=1628755089081"></script>
        <script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>

        <script>
            !function(f,b,e,v,n,t,s)
            {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
              n.callMethod.apply(n,arguments):n.queue.push(arguments)};
              if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
              n.queue=[];t=b.createElement(e);t.async=!0;
              t.src=v;s=b.getElementsByTagName(e)[0];
              s.parentNode.insertBefore(t,s)}(window, document,'script',
              'https://connect.facebook.net/en_US/fbevents.js');
            fbq('init', '658339141622648');
            fbq('track', 'PageView');
        </script>
        <noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1"/></noscript>

        <!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

    </body>
</html>
