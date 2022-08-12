package org.apache.jsp.GENERAL_0020PAGES;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n");
      out.write("        <title>Login</title>\n");
      out.write("        <meta name=\"description\" content=\"Free open source Tailwind CSS Store template\">\n");
      out.write("        <meta name=\"keywords\" content=\"tailwind,tailwindcss,tailwind css,css,starter template,free template,store template, shop layout, minimal, monochrome, minimalistic, theme, nordic\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css\"/>\n");
      out.write("\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap\" rel=\"stylesheet\">\n");
      out.write("        \n");
      out.write("        <style>\n");
      out.write("            .work-sans {\n");
      out.write("                font-family: 'Work Sans', sans-serif;\n");
      out.write("            }\n");
      out.write("            .dropdown:hover .dropdown-menu {\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body class=\"work-sans leading-normal text-base tracking-normal\">\n");
      out.write("        \n");
      out.write("        <div class=\"flex flex-col\">\n");
      out.write("            <!--Nav-->\n");
      out.write("            <nav id=\"header\" class=\"w-full sticky z-30 top-0\">\n");
      out.write("                <div class=\"w-full container mx-auto flex flex-wrap bg-white border-b border-yellow-200 items-center justify-between mt-0 px-4 py-2\">\n");
      out.write("\n");
      out.write("                    <label for=\"menu-toggle\" class=\"cursor-pointer md:hidden block\">\n");
      out.write("                        <svg class=\"fill-current text-gray-900\" xmlns=\"http://www.w3.org/2000/svg\" width=\"20\" height=\"20\" viewBox=\"0 0 20 20\">\n");
      out.write("                            <title>menu</title>\n");
      out.write("                            <path d=\"M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z\"></path>\n");
      out.write("                        </svg>\n");
      out.write("                    </label>\n");
      out.write("                    <input class=\"hidden\" type=\"checkbox\" id=\"menu-toggle\" />\n");
      out.write("\n");
      out.write("                    <div class=\"hidden md:flex md:items-center md:w-auto w-full order-3 md:order-1\" id=\"menu\">\n");
      out.write("\n");
      out.write("                            <ul class=\"md:flex items-center justify-between text-base text-gray-700 pt-4 md:pt-0\">\n");
      out.write("                                <li>\n");
      out.write("                                    <div class=\"dropdown group inline-block relative\">\n");
      out.write("                                        <button class=\"bg-white text-gray-800 py-2 px-4 inline-flex items-center\">\n");
      out.write("                                          <span class=\"mr-1\">Category</span>\n");
      out.write("                                          <svg class=\"fill-current h-4 w-4\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\"><path d=\"M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z\"/> </svg>\n");
      out.write("                                        </button>\n");
      out.write("                                        <ul class=\"dropdown-menu absolute hidden text-gray-700 pt-1\" style=\"z-index:10;\">\n");
      out.write("                                          <li class=\"\"><a class=\"rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap\" href=\"#\">One n</a></li>\n");
      out.write("                                          <li class=\"\"><a class=\"bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap\" href=\"#\">Two</a></li>\n");
      out.write("                                          <li class=\"\"><a class=\"rounded-b bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap\" href=\"#\">Three</a></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <div class=\"dropdown group inline-block relative\">\n");
      out.write("                                        <button class=\"bg-white text-gray-800 py-2 px-4 inline-flex items-center\">\n");
      out.write("                                          <span class=\"mr-1\">Pages</span>\n");
      out.write("                                          <svg class=\"fill-current h-4 w-4\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\"><path d=\"M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z\"/> </svg>\n");
      out.write("                                        </button>\n");
      out.write("                                        <ul class=\"dropdown-menu absolute hidden text-gray-700 pt-1\" style=\"z-index:10;\">\n");
      out.write("                                          <li><a class=\"rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap\" href=\"AboutUs.jsp\">About Us</a></li>\n");
      out.write("                                          <li><a class=\"bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap\" href=\"Blog.jsp\">Blog</a></li>\n");
      out.write("                                          <li><a class=\"bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap\" href=\"ContactUs.jsp\">Contact Us</a></li>\n");
      out.write("                                          <li><a class=\"rounded-b bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap\" href=\"Faq.jsp\">FAQ's</a></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"order-1 w-64 md:order-2\">\n");
      out.write("                        <a class=\"flex tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-4xl\" style=\"font-family:didot\" href=\"LandingPage.jsp\">\n");
      out.write("                            UNICUS\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"order-2 md:order-3 flex items-center\" id=\"nav-content\">\n");
      out.write("\n");
      out.write("                        <div class=\"dropdown group inline-block relative\">    \n");
      out.write("                            <button class=\"inline-block ml-6 no-underline hover:text-black\">\n");
      out.write("                                <svg class=\"fill-current hover:text-black\" xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n");
      out.write("                                    <circle fill=\"none\" cx=\"12\" cy=\"7\" r=\"3\" />\n");
      out.write("                                    <path d=\"M12 2C9.243 2 7 4.243 7 7s2.243 5 5 5 5-2.243 5-5S14.757 2 12 2zM12 10c-1.654 0-3-1.346-3-3s1.346-3 3-3 3 1.346 3 3S13.654 10 12 10zM21 21v-1c0-3.859-3.141-7-7-7h-4c-3.86 0-7 3.141-7 7v1h2v-1c0-2.757 2.243-5 5-5h4c2.757 0 5 2.243 5 5v1H21z\" />\n");
      out.write("                                </svg>\n");
      out.write("                            </button>\n");
      out.write("                            <ul class=\"dropdown-menu absolute hidden text-gray-700 pt-1\" style=\"z-index:10;\">\n");
      out.write("                                <li class=\"\"><a class=\"rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-no-wrap\" href=\"Login.jsp\">Login</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"dropdown group inline-block relative\">    \n");
      out.write("                            <button class=\"pl-3 inline-block ml-4 no-underline hover:text-black\">\n");
      out.write("                                <svg class=\"fill-current hover:text-black\" xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n");
      out.write("                                    <path d=\"M21,7H7.462L5.91,3.586C5.748,3.229,5.392,3,5,3H2v2h2.356L9.09,15.414C9.252,15.771,9.608,16,10,16h8 c0.4,0,0.762-0.238,0.919-0.606l3-7c0.133-0.309,0.101-0.663-0.084-0.944C21.649,7.169,21.336,7,21,7z M17.341,14h-6.697L8.371,9 h11.112L17.341,14z\" />\n");
      out.write("                                    <circle cx=\"10.5\" cy=\"18.5\" r=\"1.5\" />\n");
      out.write("                                    <circle cx=\"17.5\" cy=\"18.5\" r=\"1.5\" />\n");
      out.write("                                </svg>\n");
      out.write("                            </button>\n");
      out.write("                            <ul class=\"dropdown-menu absolute hidden text-gray-700 pt-1\" style=\"z-index:10;\">\n");
      out.write("                                <li class=\"\"><a class=\"rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-no-wrap\" href=\"#\">Cart</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("            <main>\n");
      out.write("                <div class=\"p-20 h-screen w-screen flex flex-col md:flex-row items-center justify-center bg-gradient-to-b from-gray-100 to-gray-200\">\n");
      out.write("                    <div class=\"content text-3xl text-center md:text-left px-8 mb-4\">\n");
      out.write("                        <h1 class=\"text-5xl text-gray-800 font-bold\" style=\"font-family:didot\">UNICUS</h1>\n");
      out.write("                        <p>Color your world. Say yes to new adventure!</p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"container mx-auto flex flex-col items-center\">\n");
      out.write("                        <form class=\"shadow-xl w-80 p-6 flex flex-col bg-white rounded-lg\" action=\"");
      out.print(request.getContextPath());
      out.write("/bidderController\" method=\"POST\">\n");
      out.write("                            <div class=\"flex flex-col\">\n");
      out.write("                                <input id=\"email-address\" name=\"email\" type=\"email\" placeholder=\"Email\" required class=\"mb-3 py-3 px-4 border border-gray-400 focus:outline-none rounded-md focus:ring-1 ring-gray-500\" />\n");
      out.write("                                <input id=\"password\" name=\"password\" type=\"password\" autocomplete=\"current-password\" placeholder=\"Password\" required class=\"mb-3 py-3 px-4 border border-gray-400 focus:outline-none rounded-md focus:ring-1 ring-gray-500\" />\n");
      out.write("                                <button type=\"submit\" name=\"command\" value=\"signin\" class=\"w-full bg-gray-600 hover:bg-gray-800 text-white p-3 rounded-lg font-semibold text-lg\">Login</button>\n");
      out.write("                                <a class=\"text-blue-400 text-center mt-2 mb-3\" href=\"#\">Forgot Password?</a>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"text-center text-md\">\n");
      out.write("                                <span style=\"color:red\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span>\n");
      out.write("                            </div>\n");
      out.write("                            <hr />\n");
      out.write("                            <p class=\"text-center text-sm mt-6 mb-1\">\n");
      out.write("                                <span class=\"text-gray-800 text-center font-semibold\">Don't have an account?</span> Register NOW!\n");
      out.write("                            </p>\n");
      out.write("                            <button class=\"w-full bg-yellow-500 hover:bg-yellow-600 mb-2 text-white p-3 rounded-lg font-semibold text-lg\"><a href=\"Signup.jsp\">Create New Account</a></button>\n");
      out.write("                        </form>\n");
      out.write("                        <div class=\"w-80 px-6 mt-4 flex flex-col\">\n");
      out.write("                            <p class=\"text-center text-sm text-gray-600\">\n");
      out.write("                                <a href=\"TermsCondition.jsp\" class=\"font-medium text-indigo-600 hover:text-indigo-500\">\n");
      out.write("                                    Terms of Service\n");
      out.write("                                </a> \n");
      out.write("                                and\n");
      out.write("                                <a href=\"PrivacyPolicy.jsp\" class=\"font-medium text-indigo-600 hover:text-indigo-500\">\n");
      out.write("                                    Privacy Policy\n");
      out.write("                                </a> \n");
      out.write("                            </p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </main>\n");
      out.write("\n");
      out.write("            <footer class=\"container relative mx-auto bg-gray-800 py-1 border-t border-gray-800\">\n");
      out.write("                <div class=\"container flex px-2 py-2\">\n");
      out.write("                    <div class=\"w-full mx-auto items-center flex flex-wrap\">\n");
      out.write("\n");
      out.write("                        <div class=\"flex w-full lg:w-1/2 lg:justify-start lg:text-left\">\n");
      out.write("                            <div class=\"px-3 md:px-0\">\n");
      out.write("                                <a class=\"no-underline text-yellow-200 hover:text-yellow-300 hover:underline py-2 px-3\" href=\"AboutUs.jsp\">About Us</a>\n");
      out.write("                                <a class=\"no-underline text-yellow-200 hover:text-yellow-300 hover:underline py-2 px-3\" href=\"Blog.jsp\">Blog</a>\n");
      out.write("                                <a class=\"no-underline text-yellow-200 hover:text-yellow-300 hover:underline py-2 px-3\" href=\"ContactUs.jsp\">Contact Us</a>\n");
      out.write("                                <a class=\"no-underline text-yellow-200 hover:text-yellow-300 hover:underline py-2 px-3\" href=\"Faq.jsp\">FAQ's</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"flex w-full lg:w-1/2 lg:justify-end lg:text-right\">\n");
      out.write("                            <div class=\"px-3 md:px-0\">\n");
      out.write("                                <a class=\"no-underline text-yellow-200 hover:text-yellow-300 hover:underline py-2 px-3\" href=\"#\">Social</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </footer>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
