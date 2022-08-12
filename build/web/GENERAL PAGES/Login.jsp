<%-- 
    Document   : Login
    Created on : Apr 5, 2022, 4:55:56 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login</title>
        <meta name="description" content="Free open source Tailwind CSS Store template">
        <meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,store template, shop layout, minimal, monochrome, minimalistic, theme, nordic">

        <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>

        <link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">
        
        <style>
            .work-sans {
                font-family: 'Work Sans', sans-serif;
            }
            .dropdown:hover .dropdown-menu {
                display: block;
            }
        </style>

    </head>

    <body class="work-sans leading-normal text-base tracking-normal">
        
        <div class="flex flex-col">
            <!--Nav-->
            <nav id="header" class="w-full sticky z-30 top-0">
                <div class="w-full container mx-auto flex flex-wrap bg-white border-b border-yellow-200 items-center justify-between mt-0 px-4 py-2">

                    <label for="menu-toggle" class="cursor-pointer md:hidden block">
                        <svg class="fill-current text-gray-900" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                            <title>menu</title>
                            <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"></path>
                        </svg>
                    </label>
                    <input class="hidden" type="checkbox" id="menu-toggle" />

                    <div class="hidden md:flex md:items-center md:w-auto w-full order-3 md:order-1" id="menu">

                            <ul class="md:flex items-center justify-between text-base text-gray-700 pt-4 md:pt-0">
                                <li>
                                    <div class="dropdown group inline-block relative">
                                        <button class="bg-white text-gray-800 py-2 px-4 inline-flex items-center">
                                          <span class="mr-1">Category</span>
                                          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/> </svg>
                                        </button>
                                        <ul class="dropdown-menu absolute hidden text-gray-700 pt-1" style="z-index:10;">
                                          <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap" href="#">One n</a></li>
                                          <li class=""><a class="bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap" href="#">Two</a></li>
                                          <li class=""><a class="rounded-b bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap" href="#">Three</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <div class="dropdown group inline-block relative">
                                        <button class="bg-white text-gray-800 py-2 px-4 inline-flex items-center">
                                          <span class="mr-1">Pages</span>
                                          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/> </svg>
                                        </button>
                                        <ul class="dropdown-menu absolute hidden text-gray-700 pt-1" style="z-index:10;">
                                          <li><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="AboutUs.jsp">About Us</a></li>
                                          <li><a class="bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="Blog.jsp">Blog</a></li>
                                          <li><a class="bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="ContactUs.jsp">Contact Us</a></li>
                                          <li><a class="rounded-b bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="Faq.jsp">FAQ's</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>

                    </div>

                    <div class="order-1 w-64 md:order-2">
                        <a class="flex tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-4xl" style="font-family:didot" href="LandingPage.jsp">
                            UNICUS
                        </a>
                    </div>

                    <div class="order-2 md:order-3 flex items-center" id="nav-content">

                        <div class="dropdown group inline-block relative">    
                            <button class="inline-block ml-6 no-underline hover:text-black">
                                <svg class="fill-current hover:text-black" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                    <circle fill="none" cx="12" cy="7" r="3" />
                                    <path d="M12 2C9.243 2 7 4.243 7 7s2.243 5 5 5 5-2.243 5-5S14.757 2 12 2zM12 10c-1.654 0-3-1.346-3-3s1.346-3 3-3 3 1.346 3 3S13.654 10 12 10zM21 21v-1c0-3.859-3.141-7-7-7h-4c-3.86 0-7 3.141-7 7v1h2v-1c0-2.757 2.243-5 5-5h4c2.757 0 5 2.243 5 5v1H21z" />
                                </svg>
                            </button>
                            <ul class="dropdown-menu absolute hidden text-gray-700 pt-1" style="z-index:10;">
                                <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-no-wrap" href="Login.jsp">Login</a></li>
                            </ul>
                        </div>

                        <div class="dropdown group inline-block relative">    
                            <button class="pl-3 inline-block ml-4 no-underline hover:text-black">
                                <svg class="fill-current hover:text-black" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                    <path d="M21,7H7.462L5.91,3.586C5.748,3.229,5.392,3,5,3H2v2h2.356L9.09,15.414C9.252,15.771,9.608,16,10,16h8 c0.4,0,0.762-0.238,0.919-0.606l3-7c0.133-0.309,0.101-0.663-0.084-0.944C21.649,7.169,21.336,7,21,7z M17.341,14h-6.697L8.371,9 h11.112L17.341,14z" />
                                    <circle cx="10.5" cy="18.5" r="1.5" />
                                    <circle cx="17.5" cy="18.5" r="1.5" />
                                </svg>
                            </button>
                            <ul class="dropdown-menu absolute hidden text-gray-700 pt-1" style="z-index:10;">
                                <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-no-wrap" href="#">Cart</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </nav>

            <main>
                <div class="p-20 h-screen w-screen flex flex-col md:flex-row items-center justify-center bg-gradient-to-b from-gray-100 to-gray-200">
                    <div class="content text-3xl text-center md:text-left px-8 mb-4">
                        <h1 class="text-5xl text-gray-800 font-bold" style="font-family:didot">UNICUS</h1>
                        <p>Color your world. Say yes to new adventure!</p>
                    </div>
                    <div class="container mx-auto flex flex-col items-center">
                        <form class="shadow-xl w-80 p-6 flex flex-col bg-white rounded-lg" action="<%=request.getContextPath()%>/bidderController" method="POST">
                            <div class="flex flex-col">
                                <input id="email-address" name="email" type="email" placeholder="Email" required class="mb-3 py-3 px-4 border border-gray-400 focus:outline-none rounded-md focus:ring-1 ring-gray-500" />
                                <input id="password" name="password" type="password" autocomplete="current-password" placeholder="Password" required class="mb-3 py-3 px-4 border border-gray-400 focus:outline-none rounded-md focus:ring-1 ring-gray-500" />
                                <button type="submit" name="command" value="signin" class="w-full bg-gray-600 hover:bg-gray-800 text-white p-3 rounded-lg font-semibold text-lg">Login</button>
                                <a class="text-blue-400 text-center mt-2 mb-3" href="#">Forgot Password?</a>
                            </div>
                            <div class="text-center text-md">
                                <span style="color:red">${error}</span>
                            </div>
                            <hr />
                            <p class="text-center text-sm mt-6 mb-1">
                                <span class="text-gray-800 text-center font-semibold">Don't have an account?</span> Register NOW!
                            </p>
                            <button class="w-full bg-yellow-500 hover:bg-yellow-600 mb-2 text-white p-3 rounded-lg font-semibold text-lg"><a href="Signup.jsp">Create New Account</a></button>
                        </form>
                        <div class="w-80 px-6 mt-4 flex flex-col">
                            <p class="text-center text-sm text-gray-600">
                                <a href="TermsCondition.jsp" class="font-medium text-indigo-600 hover:text-indigo-500">
                                    Terms of Service
                                </a> 
                                and
                                <a href="PrivacyPolicy.jsp" class="font-medium text-indigo-600 hover:text-indigo-500">
                                    Privacy Policy
                                </a> 
                            </p>
                        </div>
                    </div>
                </div>
            </main>

            <footer class="container relative mx-auto bg-gray-800 py-1 border-t border-gray-800">
                <div class="container flex px-2 py-2">
                    <div class="w-full mx-auto items-center flex flex-wrap">

                        <div class="flex w-full lg:w-1/2 lg:justify-start lg:text-left">
                            <div class="px-3 md:px-0">
                                <a class="no-underline text-yellow-200 hover:text-yellow-300 hover:underline py-2 px-3" href="AboutUs.jsp">About Us</a>
                                <a class="no-underline text-yellow-200 hover:text-yellow-300 hover:underline py-2 px-3" href="Blog.jsp">Blog</a>
                                <a class="no-underline text-yellow-200 hover:text-yellow-300 hover:underline py-2 px-3" href="ContactUs.jsp">Contact Us</a>
                                <a class="no-underline text-yellow-200 hover:text-yellow-300 hover:underline py-2 px-3" href="Faq.jsp">FAQ's</a>
                            </div>
                        </div>

                        <div class="flex w-full lg:w-1/2 lg:justify-end lg:text-right">
                            <div class="px-3 md:px-0">
                                <a class="no-underline text-yellow-200 hover:text-yellow-300 hover:underline py-2 px-3" href="#">Social</a>
                            </div>
                        </div>

                    </div>
                </div>
            </footer>
        </div>
        
    </body>
</html>
