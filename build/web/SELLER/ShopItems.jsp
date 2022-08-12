<%-- 
    Document   : ShopItems
    Created on : Jun 13, 2022, 12:57:09 AM
    Author     : USER
--%>

<%@page import="Model.Orders"%>
<%@page import="DAOImpl.BiddingDAOImpl"%>
<%@page import="DAO.BiddingDAO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Model.Items"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ItemsDAO"%>
<%@page import="DAOImpl.ItemsDAOImpl"%>
<%@page import="DAOImpl.sellerDAOImpl"%>
<%@page import="Model.Seller"%>
<%@page import="DAO.sellerDAO"%>
<%@page import="Model.Bidder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dashboard</title>
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

    <%
        String seller_ID = request.getParameter("id");
        sellerDAO sellerdao = new sellerDAOImpl();
        Seller seller = sellerdao.getOne(Integer.parseInt(seller_ID));
    %>
    <div class="flex flex-col">
        <!--Nav-->
        <nav id="header" class="w-full sticky z-30 top-0">
            <div class="w-full container mx-auto flex flex-wrap bg-white border-b border-yellow-200 items-center justify-between mt-0 px-4 py-2">

                <div class="md:flex md:items-center md:w-auto w-full order-3 md:order-1">
                    <div class=" font-bold text-gray-800 text-3xl text-center" style="font-family:didot">
                        <p> My Shop |</p>
                    </div>
                </div>

                <div class="order-1 w-64 md:order-2">
                    
                </div>

                <div class="order-2 md:order-3 flex items-center" id="nav-content">

                    <div class="dropdown group inline-block relative">    
                        <button class="inline-block ml-6 px-1 py-1 no-underline rounded-lg bg-yellow-300 hover:text-black">
                            <svg class="fill-current text-gray-800 hover:text-black" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24">
                                <circle fill="none" cx="12" cy="7" r="3" />
                                <path d="M12 2C9.243 2 7 4.243 7 7s2.243 5 5 5 5-2.243 5-5S14.757 2 12 2zM12 10c-1.654 0-3-1.346-3-3s1.346-3 3-3 3 1.346 3 3S13.654 10 12 10zM21 21v-1c0-3.859-3.141-7-7-7h-4c-3.86 0-7 3.141-7 7v1h2v-1c0-2.757 2.243-5 5-5h4c2.757 0 5 2.243 5 5v1H21z" />
                            </svg>
                        </button>
                        <ul class="dropdown-menu absolute hidden text-gray-700 pt-1" style="z-index:10;">
                            <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="../BIDDER/MyProfile.jsp?id=<%=seller.getBidderId()%>">My Account</a></li>
                            <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="<%=request.getContextPath()%>/GENERAL PAGES/LandingPage.jsp">Log Out</a></li>
                        </ul>
                    </div>

                    <div class="dropdown ml-6 pl-3 group inline-block relative">    
                        
                    </div>

                </div>
            </div>
        </nav>

        <main class="flex h-screen relative">
            <aside class="w-56" aria-label="Sidebar">
                <div class="overflow-y-auto py-4 px-3 bg-white rounded dark:bg-gray-800">
                    <ul class="space-y-2">
                        <li>
                            <a href="Dashboard.jsp?id=<%=seller.getSellerId()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
                                </svg>
                                <span class="ml-3">Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="ShopProfile.jsp?id=<%=seller.getSellerId()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path></svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Shop Profile</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg xmlns="http://www.w3.org/2000/svg" class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M2 11a1 1 0 011-1h2a1 1 0 011 1v5a1 1 0 01-1 1H3a1 1 0 01-1-1v-5zM8 7a1 1 0 011-1h2a1 1 0 011 1v9a1 1 0 01-1 1H9a1 1 0 01-1-1V7zM14 4a1 1 0 011-1h2a1 1 0 011 1v12a1 1 0 01-1 1h-2a1 1 0 01-1-1V4z" />
                                </svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Sales</span>
                            </a>
                        </li>
                        <li>
                            <a href="ShopItems.jsp?id=<%=seller.getSellerId()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10 2a4 4 0 00-4 4v1H5a1 1 0 00-.994.89l-1 9A1 1 0 004 18h12a1 1 0 00.994-1.11l-1-9A1 1 0 0015 7h-1V6a4 4 0 00-4-4zm2 5V6a2 2 0 10-4 0v1h4zm-6 3a1 1 0 112 0 1 1 0 01-2 0zm7-1a1 1 0 100 2 1 1 0 000-2z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Items</span>
                            </a>
                        </li>
                        <li>
                            <a href="Orders.jsp?id=<%=seller.getSellerId()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0"></path>
                                </svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Orders</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="pt-4 mt-4 space-y-2 border-t border-yellow-200 dark:border-yellow-200">
                        <li>
                            <a href="../BIDDER/MyProfile.jsp?id=<%=seller.getBidderId()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 3a1 1 0 00-1 1v12a1 1 0 102 0V4a1 1 0 00-1-1zm10.293 9.293a1 1 0 001.414 1.414l3-3a1 1 0 000-1.414l-3-3a1 1 0 10-1.414 1.414L14.586 9H7a1 1 0 100 2h7.586l-1.293 1.293z" clip-rule="evenodd"></path></svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">My Account</span>
                            </a>
                        </li>
                        <li>
                            <a href="../GENERAL PAGES/LandingPage.jsp" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 3a1 1 0 00-1 1v12a1 1 0 102 0V4a1 1 0 00-1-1zm10.293 9.293a1 1 0 001.414 1.414l3-3a1 1 0 000-1.414l-3-3a1 1 0 10-1.414 1.414L14.586 9H7a1 1 0 100 2h7.586l-1.293 1.293z" clip-rule="evenodd"></path></svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Log out</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </aside>

            <div class="flex flex-col flex-1 w-full h-full overflow-y-auto bg-gray-300 bg-opacity-50 relative">
                <div class="container mx-auto flex items-center flex-wrap pt-3 pl-4">
                    <div class="justify-between inline-block flex flex-col md:flex-row items-center ">
                        <p class="text-2xl pb-3 mr-7 text-gray-900 flex ">
                            Items &nbsp;&nbsp;|&nbsp;
                        </p>
                        <button type="button" class="focus:outline-none mr-3 inline-flex item-center text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:focus:ring-yellow-900">
                            <svg xmlns="http://www.w3.org/2000/svg" class="flex-shrink-0 w-5 h-5 text-white transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd"></path>
                            </svg>
                            <span class="flex-1 ml-3 whitespace-nowrap"><a href="NewItems.jsp?id=<%=seller_ID%>">New Item</a></span>
                        </button>
                        <div class="dropdown group inline-block relative">
                            <button class="focus:outline-none inline-flex item-center text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:focus:ring-yellow-900">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                                </svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Status</span>
                            </button>
                            <ul class="dropdown-menu absolute hidden text-gray-700 pt-1" style="z-index:10;">
                                <li><a class="rounded-t-lg bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="ShopItems.jsp?id=<%=seller.getSellerId()%>">All</a></li>
                                <li><a class="bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="ShopItemsNotStarted.jsp?id=<%=seller.getSellerId()%>">Not Started</a></li>
                                <li><a class="bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="ShopItemsOngoing.jsp?id=<%=seller.getSellerId()%>">Ongoing</a></li>
                                <li><a class="rounded-b-lg bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="ShopItemsEnded.jsp?id=<%=seller.getSellerId()%>">Ended</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="container mx-auto flex items-center flex-wrap pt-0 pb-4">
                    <%
                        ItemsDAO itemsdao = new ItemsDAOImpl();
                        List<Items> itemsList = itemsdao.retrieveAllItemsBySellerId(Integer.parseInt(seller_ID));
                        LocalDate today = LocalDate.now();
                        Date tod = Date.valueOf(today);
                        for (Items items : itemsList){
                            Date startDate = items.getStartDate();
                            Date endDate = items.getEndDate();
                            if (startDate.after(tod)){
                    %>
                    <div class="md:w-1/2 xl:w-1/4 p-2 flex flex-col ">    
                        <div class="max-w-sm bg-white rounded-lg border hover:grow border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700">
                            <a href="#">
                                <img class="rounded-t-lg object-contain" src="../img/ItemsImage.jsp?id=<%=items.getItemsId()%>" alt="" />
                            </a>
                            <div class="px-5 pt-5">
                                <a href="#">
                                    <h5 class="mb-3 text-xl font-bold tracking-tight text-gray-900 dark:text-white"><%=items.getItemsName()%></h5>
                                </a>
                            </div>
                            <div class="px-5">
                                <p class="mb-1 inline-flex text-sm font-normal text-gray-700 dark:text-gray-400">Current Price (RM):</p>
                                <p class="mb-1 inline-flex font-normal text-gray-700 dark:text-gray-400"><%=items.getPrice()%>0</p> 
                            </div>
                            <div class="px-5 mb-3">
                                <p class="inline-flex text-sm font-normal text-gray-700 dark:text-gray-400">Status:</p>
                                <p class="inline-flex text-sm font-normal text-gray-700 dark:text-gray-400"><%=items.getStatus()%></p> 
                            </div>
                            <div class="px-5 mb-3 text-right hover:text-gray-900">
                                <a href="EditItems.jsp?id=<%=items.getItemsId()%>" class="">
                                    <span class="flex-1 whitespace-nowrap inline-flex hover:underline">Details
                                    <svg xmlns="http://www.w3.org/2000/svg" class=" ml-1 inline-flex h-5 w-5 " viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 1.414L10.586 9H7a1 1 0 100 2h3.586l-1.293 1.293a1 1 0 101.414 1.414l3-3a1 1 0 000-1.414z" clip-rule="evenodd" />
                                    </svg></span>
                                </a>
                            </div>
                            <form action="../ItemsController" method="POST">
                                <div class="px-5">
                                    <input type="hidden" name="hidid" value="<%=items.getSellerId()%>" class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:border-yellow-100 focus:ring-yellow-300">
                                    <input type="hidden" name="hiditemsid" value="<%=items.getItemsId()%>" class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:border-yellow-100 focus:ring-yellow-300">
                                    <input type="hidden" name="startDate" value="<%=tod%>" class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:border-yellow-100 focus:ring-yellow-300">
                                    <input type="hidden" name="status" value="Ongoing" class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:border-yellow-100 focus:ring-yellow-300">
                                </div>
                                <div class="px-2 text-center justify-between flex flex-col md:flex-row items-center ">
                                    <button type="submit" name="command" value="updateSD" class="focus:outline-none w-full text-center text-white bg-yellow-400 hover:bg-yellow-500 hover:text-gray-900 focus:ring-4 focus:ring-yellow-300 font-semibold rounded-lg text-base px-3 py-1.5 mb-2 dark:focus:ring-yellow-900">
                                        Start Bid
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%
                            } else if (!startDate.after(tod) && endDate.after(tod)){
                                String status = "Ongoing";
                                int itemsId = items.getItemsId();
                                Items newitems = new Items();
                                
                                newitems.setStatus(status);
                                newitems.setItemsId(itemsId);

                                itemsdao.updateStatus(newitems);
                    %>
                    <div class="md:w-1/2 xl:w-1/4 p-2 flex flex-col ">    
                        <div class="max-w-sm bg-white rounded-lg border hover:grow border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700">
                            <a href="#">
                                <img class="rounded-t-lg object-contain" src="../img/ItemsImage.jsp?id=<%=items.getItemsId()%>" alt="" />
                            </a>
                            <div class="px-5 pt-5">
                                <a href="#">
                                    <h5 class="mb-3 text-xl font-bold tracking-tight text-gray-900 dark:text-white"><%=items.getItemsName()%></h5>
                                </a>
                            </div>
                            <div class="px-5">
                                <p class="mb-1 inline-flex text-sm font-normal text-gray-700 dark:text-gray-400">Current Price (RM):</p>
                                <p class="mb-1 inline-flex font-normal text-gray-700 dark:text-gray-400"><%=items.getPrice()%>0</p> 
                            </div>
                            <div class="px-5 mb-3">
                                <p class="inline-flex text-sm font-normal text-gray-700 dark:text-gray-400">Status:</p>
                                <p class="inline-flex text-sm font-normal text-gray-700 dark:text-gray-400">Ongoing</p> 
                            </div>
                            <div class="px-5 mb-3 text-right hover:text-gray-900">
                                <a href="EditItems.jsp?id=<%=items.getItemsId()%>" class="">
                                    <span class="flex-1 whitespace-nowrap inline-flex hover:underline">Details
                                    <svg xmlns="http://www.w3.org/2000/svg" class=" ml-1 inline-flex h-5 w-5 " viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 1.414L10.586 9H7a1 1 0 100 2h3.586l-1.293 1.293a1 1 0 101.414 1.414l3-3a1 1 0 000-1.414z" clip-rule="evenodd" />
                                    </svg></span>
                                </a>
                            </div>
                            <form action="../ItemsController" method="POST">
                                <div class="px-5">
                                    <input type="hidden" name="hidid" value="<%=items.getSellerId()%>" class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:border-yellow-100 focus:ring-yellow-300">
                                    <input type="hidden" name="hiditemsid" value="<%=items.getItemsId()%>" class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:border-yellow-100 focus:ring-yellow-300">
                                    <input type="hidden" name="endDate" value="<%=tod%>" class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:border-yellow-100 focus:ring-yellow-300">
                                    <input type="hidden" name="status" value="Ended" class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:border-yellow-100 focus:ring-yellow-300">
                                </div>
                                <div class="px-2 text-center justify-between flex flex-col md:flex-row items-center ">
                                    <button type="submit" name="command" value="updateED" class="focus:outline-none w-full text-center text-white bg-yellow-400 hover:bg-yellow-500 hover:text-gray-900 focus:ring-4 focus:ring-yellow-300 font-semibold rounded-lg text-base px-3 py-1.5 mb-2 dark:focus:ring-yellow-900">
                                        End Bid
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%
                            } else {
                                String status = items.getStatus();
                                if (!status.equals("Ordered")){

                                    status = "Ended";
                                    int itemsId = items.getItemsId();
                                    Items newitems = new Items();
                                
                                    newitems.setStatus(status);
                                    newitems.setItemsId(itemsId);

                                    itemsdao.updateStatus(newitems);
                    %>
                    <div class="md:w-1/2 xl:w-1/4 p-2 flex flex-col ">    
                        <div class="max-w-sm bg-white rounded-lg border hover:grow border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700">
                            <a href="#">
                                <img class="rounded-t-lg object-contain" src="../img/ItemsImage.jsp?id=<%=items.getItemsId()%>" alt="" />
                            </a>
                            <div class="px-5 pt-5">
                                <a href="#">
                                    <h5 class="mb-3 text-xl font-bold tracking-tight text-gray-900 dark:text-white"><%=items.getItemsName()%></h5>
                                </a>
                            </div>
                            <div class="px-5">
                                <p class="mb-1 inline-flex text-sm font-normal text-gray-700 dark:text-gray-400">Current Price (RM):</p>
                                <p class="mb-1 inline-flex font-normal text-gray-700 dark:text-gray-400"><%=items.getPrice()%>0</p> 
                            </div>
                            <div class="px-5 mb-3">
                                <p class="inline-flex text-sm font-normal text-gray-700 dark:text-gray-400">Status:</p>
                                <p class="inline-flex text-sm font-normal text-gray-700 dark:text-gray-400">Ended</p> 
                            </div>
                            <div class="px-5 mb-3 text-right hover:text-gray-900">
                                <a href="EditItems.jsp?id=<%=items.getItemsId()%>" class="">
                                    <span class="flex-1 whitespace-nowrap inline-flex hover:underline">Details
                                    <svg xmlns="http://www.w3.org/2000/svg" class=" ml-1 inline-flex h-5 w-5 " viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 1.414L10.586 9H7a1 1 0 100 2h3.586l-1.293 1.293a1 1 0 101.414 1.414l3-3a1 1 0 000-1.414z" clip-rule="evenodd" />
                                    </svg></span>
                                </a>
                            </div>
                            <div class="px-2 text-center justify-between flex flex-col md:flex-row items-center ">
                                <button type="button" class="focus:outline-none w-full text-center text-white bg-yellow-400 hover:bg-yellow-500 hover:text-gray-900 focus:ring-4 focus:ring-yellow-300 font-semibold rounded-lg text-base px-3 py-1.5 mb-2 dark:focus:ring-yellow-900">
                                    <a href="ViewResult.jsp?id=<%=items.getItemsId()%>">View Result</a>
                                </button>
                            </div>
                        </div>
                    </div>
                    <%
                                
                        }}}
                    %>
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

