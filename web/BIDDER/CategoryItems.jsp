<%-- 
    Document   : BidderCategoryItems
    Created on : Jun 16, 2022, 3:58:07 AM
    Author     : USER
--%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Model.Items"%>
<%@page import="java.util.List"%>
<%@page import="DAOImpl.ItemsDAOImpl"%>
<%@page import="DAO.ItemsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>UNICUS</title>
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

            .dropdown:hover .dropdown-menu {
                display: block;
            }
        </style>
    </head>

    <body class="bg-white text-gray-600 work-sans leading-normal text-base tracking-normal">

        <div class="flex flex-col">
            <%
                String bidder_ID = request.getParameter("id");
                String Ctg = request.getParameter("item");
            %>
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
                                          <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap" href="CategoryItems.jsp?id=<%=bidder_ID%>&item=All">All</a></li>
                                          <li class=""><a class="bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap" href="CategoryItems.jsp?id=<%=bidder_ID%>&item=Paintings">Paintings</a></li>
                                          <li class=""><a class="bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap" href="CategoryItems.jsp?id=<%=bidder_ID%>&item=Drawings">Drawings</a></li>
                                          <li class=""><a class="bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap" href="CategoryItems.jsp?id=<%=bidder_ID%>&item=Digital Art">Digital Art</a></li>
                                          <li class=""><a class="bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap" href="CategoryItems.jsp?id=<%=bidder_ID%>&item=Decor">Decor</a></li>
                                          <li class=""><a class="bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap" href="CategoryItems.jsp?id=<%=bidder_ID%>&item=Jewelry">Jewelry</a></li>
                                          <li class=""><a class="rounded-b bg-gray-50 hover:bg-gray-100 py-2 px-10 block whitespace-nowrap" href="CategoryItems.jsp?id=<%=bidder_ID%>&item=Ceramics">Ceramics</a></li>
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
                        <a class="flex justify-start mx-auto tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-4xl" style="font-family:didot" href="Homepage.jsp">
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
                                <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="Dashboard.jsp">Dashboard</a></li>
                                <li class=""><a class="rounded-b bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="<%=request.getContextPath()%>/GENERAL PAGES/LandingPage.jsp">Log Out</a></li>
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
                                <li class=""><a class="rounded bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-no-wrap" href="#">Cart</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </nav>

            <main>    
                
                <section class="bg-gray-100 py-4">

                    <div class="container mx-auto flex items-center flex-wrap pb-2">

                        <nav id="store" class="w-full top-0 px-6 py-1">
                            <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-2 py-3">

                                <a class="tracking-wide no-underline hover:no-underline text-gray-900 hover:text-black text-xl " href="#">
                                            Home
                                    </a>

                                <%--<div class="flex items-center" id="store-nav-content">
                                    <a class="pl-3 inline-block no-underline hover:text-black" href="#">
                                        <svg class="fill-current text-black hover:text-yellow-600" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24">
                                            <path d="M7 11H17V13H7zM4 7H20V9H4zM10 15H14V17H10z" />
                                        </svg>
                                    </a>

                                </div>--%>
                            </div>
                        </nav>

                        <%
                            ItemsDAO itemsdao = new ItemsDAOImpl();
                            List<Items> itemsList = itemsdao.retrieveAllItems();
                            LocalDate today = LocalDate.now();
                            Date tod = Date.valueOf(today);
                            for (Items items : itemsList){
                                Date startDate = items.getStartDate();
                                Date endDate = items.getEndDate();
                                if (!startDate.after(tod) && endDate.after(tod)){
                                    if (Ctg.equals("All")){
                        %>
                        <div class="md:w-1/2 xl:w-1/4 p-4 flex flex-col ">    
                            <div class="max-w-sm bg-white rounded-lg border border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700 hover:grow">
                                <a href="#">
                                    <img class="rounded-t-lg" src="../img/ItemsImage.jsp?id=<%=items.getItemsId()%>" alt="" />
                                </a>
                                <div class="px-5 pt-5">
                                    <a href="#">
                                        <h5 class="mb-3 text-xl font-bold tracking-tight text-gray-900 dark:text-white"><%=items.getItemsName()%></h5>
                                    </a>
                                </div>
                                <div class="px-5">
                                    <p class="mb-1 inline-flex text-sm font-normal text-gray-700 dark:text-gray-400">Current Price (RM):</p>
                                    <p class="mb-1 inline-flex font-normal text-gray-700 dark:text-gray-400"><%=items.getPrice()%></p> 
                                </div>
                                <div class="px-5 mb-3">
                                    <p class="inline-flex text-xs font-normal text-gray-700 dark:text-gray-400">End Date:</p>
                                    <p class="inline-flex text-sm font-normal text-gray-700 dark:text-gray-400"><%=items.getEndDate()%></p> 
                                </div>
                                <div class="px-5 mb-3 text-right hover:text-gray-900">
                                    <a href="ItemsDetails.jsp?id=<%=bidder_ID%>&itemsid=<%=items.getItemsId()%>&backid=2&item=<%=Ctg%>" class="">
                                        <span class="flex-1 whitespace-nowrap inline-flex hover:underline">Details
                                        <svg xmlns="http://www.w3.org/2000/svg" class=" ml-1 inline-flex h-5 w-5 " viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 1.414L10.586 9H7a1 1 0 100 2h3.586l-1.293 1.293a1 1 0 101.414 1.414l3-3a1 1 0 000-1.414z" clip-rule="evenodd" />
                                        </svg></span>
                                    </a>
                                </div>
                                <div  x-data="{ modelOpen: false }" class="px-2 text-center justify-between flex flex-col md:flex-row items-center ">
                                    <button @click="modelOpen =!modelOpen" class="focus:outline-none w-full text-center text-white bg-yellow-400 hover:bg-yellow-500 hover:text-gray-900 focus:ring-4 focus:ring-yellow-300 font-semibold rounded-lg text-base px-3 py-1.5 mb-2 dark:focus:ring-yellow-900">
                                        Bid
                                    </button>
                                    <div x-show="modelOpen" class="fixed inset-0 z-50 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
                                        <div class="flex items-end justify-center min-h-screen px-4 text-center md:items-center sm:block sm:p-0">
                                            <div x-cloak @click="modelOpen = false" x-show="modelOpen" 
                                                x-transition:enter="transition ease-out duration-300 transform"
                                                x-transition:enter-start="opacity-0" 
                                                x-transition:enter-end="opacity-100"
                                                x-transition:leave="transition ease-in duration-200 transform"
                                                x-transition:leave-start="opacity-100" 
                                                x-transition:leave-end="opacity-0"
                                                class="fixed inset-0 transition-opacity bg-gray-500 bg-opacity-40" aria-hidden="true"
                                            ></div>

                                            <div x-cloak x-show="modelOpen" 
                                                x-transition:enter="transition ease-out duration-300 transform"
                                                x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95" 
                                                x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100"
                                                x-transition:leave="transition ease-in duration-200 transform"
                                                x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100" 
                                                x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                                                class="inline-block w-full max-w-xl p-8 my-20 overflow-hidden text-left transition-all transform bg-white rounded-lg shadow-xl 2xl:max-w-2xl"
                                            >
                                                <div class="flex items-center justify-between space-x-4">
                                                    <h1 class="text-xl font-medium text-gray-800 ">Bid Price</h1>

                                                    <button @click="modelOpen = false" class="text-gray-600 focus:outline-none hover:text-gray-700">
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                                        </svg>
                                                    </button>
                                                </div>

                                                <p class="mt-2 text-sm text-gray-500 ">
                                                    Bid Your Best Price!
                                                </p>

                                                <form class="mt-3" action="../BiddingController" method="POST">
                                                    <div>
                                                        <input type="hidden" name="hidid" value="<%=bidder_ID%>" class="w-full px-4 border rounded-md focus:outline-none ">
                                                        <input type="hidden" name="item" value="<%=Ctg%>" class="w-full px-4border rounded-md focus:outline-none ">
                                                        <input type="hidden" name="backid" value="2" class="w-full px-4 border rounded-md focus:outline-none ">
                                                        <input type="hidden" name="hiditemid" value="<%=items.getItemsId()%>" class="w-full px-4 border rounded-md focus:outline-none ">
                                                        <input type="hidden" name="bidDate" value="<%=tod%>" class="w-full px-4 border rounded-md focus:outline-none ">
                                                        <label for="price" class="block text-sm text-gray-700 capitalize dark:text-gray-200">Price</label>
                                                        <input type="text" name="price" placeholder="<%=items.getPrice()%>" required class="block w-full px-3 text-gray-600 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:border-indigo-400 focus:outline-none focus:ring focus:ring-indigo-300 focus:ring-opacity-40">
                                                    </div>
                                                    <div class="flex justify-end mt-6">
                                                        <button type="submit" name="command" value="addBid" class="px-3 py-2 text-sm tracking-wide text-white capitalize transition-colors duration-200 transform bg-indigo-500 rounded-md dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:bg-indigo-700 hover:bg-indigo-600 focus:outline-none focus:bg-indigo-500 focus:ring focus:ring-indigo-300 focus:ring-opacity-50">
                                                            Confirm Bid
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                    
                        <%
                                }
                                if (items.getItemsCtg().equals(Ctg) && !items.getItemsCtg().equals("All")){
                        %>
                        <div class="md:w-1/2 xl:w-1/4 p-4 flex flex-col ">    
                            <div class="max-w-sm bg-white rounded-lg border border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700 hover:grow">
                                <a href="#">
                                    <img class="rounded-t-lg" src="../img/ItemsImage.jsp?id=<%=items.getItemsId()%>" alt="" />
                                </a>
                                <div class="px-5 pt-5">
                                    <a href="#">
                                        <h5 class="mb-3 text-xl font-bold tracking-tight text-gray-900 dark:text-white"><%=items.getItemsName()%></h5>
                                    </a>
                                </div>
                                <div class="px-5">
                                    <p class="mb-1 inline-flex text-sm font-normal text-gray-700 dark:text-gray-400">Current Price (RM):</p>
                                    <p class="mb-1 inline-flex font-normal text-gray-700 dark:text-gray-400"><%=items.getPrice()%></p> 
                                </div>
                                <div class="px-5 mb-3">
                                    <p class="inline-flex text-xs font-normal text-gray-700 dark:text-gray-400">End Date:</p>
                                    <p class="inline-flex text-sm font-normal text-gray-700 dark:text-gray-400"><%=items.getEndDate()%></p> 
                                </div>
                                <div class="px-5 mb-3 text-right hover:text-gray-900">
                                    <a href="ItemsDetails.jsp?id=<%=bidder_ID%>&itemsid=<%=items.getItemsId()%>&backid=2&item=<%=Ctg%>" class="">
                                        <span class="flex-1 whitespace-nowrap inline-flex hover:underline">Details
                                        <svg xmlns="http://www.w3.org/2000/svg" class=" ml-1 inline-flex h-5 w-5 " viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 1.414L10.586 9H7a1 1 0 100 2h3.586l-1.293 1.293a1 1 0 101.414 1.414l3-3a1 1 0 000-1.414z" clip-rule="evenodd" />
                                        </svg></span>
                                    </a>
                                </div>
                                <div  x-data="{ modelOpen: false }" class="px-2 text-center justify-between flex flex-col md:flex-row items-center ">
                                    <button @click="modelOpen =!modelOpen" class="focus:outline-none w-full text-center text-white bg-yellow-400 hover:bg-yellow-500 hover:text-gray-900 focus:ring-4 focus:ring-yellow-300 font-semibold rounded-lg text-base px-3 py-1.5 mb-2 dark:focus:ring-yellow-900">
                                        Bid
                                    </button>
                                    <div x-show="modelOpen" class="fixed inset-0 z-50 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
                                        <div class="flex items-end justify-center min-h-screen px-4 text-center md:items-center sm:block sm:p-0">
                                            <div x-cloak @click="modelOpen = false" x-show="modelOpen" 
                                                x-transition:enter="transition ease-out duration-300 transform"
                                                x-transition:enter-start="opacity-0" 
                                                x-transition:enter-end="opacity-100"
                                                x-transition:leave="transition ease-in duration-200 transform"
                                                x-transition:leave-start="opacity-100" 
                                                x-transition:leave-end="opacity-0"
                                                class="fixed inset-0 transition-opacity bg-gray-500 bg-opacity-40" aria-hidden="true"
                                            ></div>

                                            <div x-cloak x-show="modelOpen" 
                                                x-transition:enter="transition ease-out duration-300 transform"
                                                x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95" 
                                                x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100"
                                                x-transition:leave="transition ease-in duration-200 transform"
                                                x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100" 
                                                x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                                                class="inline-block w-full max-w-xl p-8 my-20 overflow-hidden text-left transition-all transform bg-white rounded-lg shadow-xl 2xl:max-w-2xl"
                                            >
                                                <div class="flex items-center justify-between space-x-4">
                                                    <h1 class="text-xl font-medium text-gray-800 ">Bid Price</h1>

                                                    <button @click="modelOpen = false" class="text-gray-600 focus:outline-none hover:text-gray-700">
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                                        </svg>
                                                    </button>
                                                </div>

                                                <p class="mt-2 text-sm text-gray-500 ">
                                                    Bid Your Best Price!
                                                </p>

                                                <form class="mt-3">
                                                    <div>
                                                        <label for="price" class="block text-sm text-gray-700 capitalize dark:text-gray-200">Price</label>
                                                        <input placeholder="" type="text" class="block w-full px-3 py-2 mt-2 text-gray-600 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:border-indigo-400 focus:outline-none focus:ring focus:ring-indigo-300 focus:ring-opacity-40">
                                                    </div>
                                                    <div class="flex justify-end mt-6">
                                                        <button type="button" class="px-3 py-2 text-sm tracking-wide text-white capitalize transition-colors duration-200 transform bg-indigo-500 rounded-md dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:bg-indigo-700 hover:bg-indigo-600 focus:outline-none focus:bg-indigo-500 focus:ring focus:ring-indigo-300 focus:ring-opacity-50">
                                                            Confirm Bid
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                
                        <%
                            }}}
                        %>
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
        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" integrity="sha256-KzZiKy0DWYsnwMF+X1DvQngQ2/FxF7MF3Ff72XcpuPs=" crossorigin="anonymous"></script>
    </body>

</html>

