<%-- 
    Document   : Contact Us
    Created on : Mar 27, 2022, 10:49:37 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contact Us</title>
    <meta name="description" content="Free open source Tailwind CSS Store template">
    <meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,store template, shop layout, minimal, monochrome, minimalistic, theme, nordic">
    
    <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
	
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">

    <style>
        .work-sans {
            font-family: 'Work Sans', sans-serif;
        }
                
        #menu-toggle:checked + #menu {
            display: block;
        }
        
        .hover\:grow {
            transition: all 0.3s;
            transform: scale(1);
        }
        
        .hover\:grow:hover {
            transform: scale(1.02);
        }
        
        .carousel-open:checked + .carousel-item {
            position: static;
            opacity: 100;
        }
        
        .carousel-item {
            -webkit-transition: opacity 0.6s ease-out;
            transition: opacity 0.6s ease-out;
        }
        
        #carousel-1:checked ~ .control-1,
        #carousel-2:checked ~ .control-2,
        #carousel-3:checked ~ .control-3 {
            display: block;
        }
        
        .carousel-indicators {
            list-style: none;
            margin: 0;
            padding: 0;
            position: absolute;
            bottom: 2%;
            left: 0;
            right: 0;
            text-align: center;
            z-index: 10;
        }
        
        #carousel-1:checked ~ .control-1 ~ .carousel-indicators li:nth-child(1) .carousel-bullet,
        #carousel-2:checked ~ .control-2 ~ .carousel-indicators li:nth-child(2) .carousel-bullet,
        #carousel-3:checked ~ .control-3 ~ .carousel-indicators li:nth-child(3) .carousel-bullet {
            color: #000;
            /*Set to match the Tailwind colour you want the active one to be */
        }
        
        .dropdown:hover .dropdown-menu {
            display: block;
        }
        
    </style>

</head>

<body class="bg-white text-gray-600 work-sans leading-normal text-base tracking-normal">

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
            <section class="bg-gray-600 py-6">

                <div class="container py-6 px-6 mx-auto">
                    <p class="text-yellow-200 text-5xl text-center font-semibold" style="font-family:didot">Contact Us</p>
                </div>

            </section>

            <section class="py-8 px-64">

                <div class="container container-fluid">
                    
                    <div class="container mx-auto flex flex-wrap rounded-lg items-center justify-center bg-gray-300 bg-opacity-50 py-8">
                        
                        <h2 class="section-title px-5 mb-6 text-2xl text-gray-800"><span>- Contact For Any Queries -</span></h2>
                        
                        <form action="../MessageController" method="POST" class="w-full max-w-lg">
                            <div class="flex flex-wrap -mx-4 mb-6">
                              <div class="w-full px-3 mb-6 md:mb-0">
                                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
                                  Full Name
                                </label>
                                <input name="name" class="form-control relative flex-auto min-w-0 block w-full px-4 py-2.5 text-base font-normal text-gray-700 bg-gray-50 bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-200 focus:outline-none" id="grid-first-name" type="text" placeholder="Jane">
                              </div>
                            </div>
                            <div class="flex flex-wrap -mx-4 mb-6">
                              <div class="w-full px-3">
                                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-password">
                                  E-mail
                                </label>
                                <input name="email" class="form-control block relative flex-auto min-w-0 w-full px-4 py-2.5 mb-3 text-base font-normal text-gray-700 bg-gray-50 bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-200 focus:outline-none" id="email" type="email">
                              </div>
                            </div>
                            <div class="flex flex-wrap -mx-4 mb-6">
                              <div class="w-full px-3">
                                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-password">
                                  Subject
                                </label>
                                <input name="subject" class="form-control block relative flex-auto min-w-0 w-full px-4 py-2.5 mb-3 text-base font-normal text-gray-700 bg-gray-50 bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-200 focus:outline-none" id="subject" type="text">
                              </div>
                            </div>
                            <div class="flex flex-wrap -mx-4 mb-6">
                              <div class="w-full px-3">
                                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-password">
                                  Message
                                </label>
                                <textarea name="description" class=" no-resize appearance-none block w-full form-control relative flex-auto min-w-0 px-4 py-2.5 mb-3 text-base font-normal text-gray-700 bg-gray-50 bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-200 focus:outline-none h-48 resize-none" id="message"></textarea>
                              </div>
                            </div>
                                <button type="submit" name="command" value="send" onclick="alert('Your message has been recorded. We will contact you ASAP!');" class="btn w-full py-2.5 bg-yellow-100 text-gray-700 font-bold text-xs leading-tight uppercase rounded shadow-md hover:bg-yellow-200 hover:text-black hover:shadow-lg focus:bg-yellow-200  focus:shadow-lg focus:outline-none focus:ring-0 active:bg-yellow-300 active:shadow-lg transition duration-150 ease-in-out" type="button" id="">
                                  Send Message
                                </button>
                        </form>
                    </div> 

                </div>

            </section>
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
