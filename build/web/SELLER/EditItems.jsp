<%-- 
    Document   : EditItems
    Created on : Jun 16, 2022, 6:59:41 PM
    Author     : USER
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<%@page import="DAOImpl.ItemsDAOImpl"%>
<%@page import="Model.Items"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ItemsDAO"%>
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
    <title>Item Details</title>
    <meta name="description" content="Free open source Tailwind CSS Store template">
    <meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,store template, shop layout, minimal, monochrome, minimalistic, theme, nordic">
    
    <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/js/bootstrap-datepicker.min.js"></script> 
	
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
            String items_id = request.getParameter("id");
            ItemsDAO itemsdao = new ItemsDAOImpl();
            Items items = itemsdao.retrieveItemsByItemsID(Integer.parseInt(items_id));
        %>
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
                            <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="../BIDDER/Dashboard.jsp">My Account</a></li>
                            <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="<%=request.getContextPath()%>/GENERAL PAGES/LandingPage.jsp">Log Out</a></li>
                        </ul>
                    </div>

                    <div class="dropdown ml-6 pl-3 group inline-block relative">    
                        
                    </div>

                </div>
            </div>
        </nav>

        <main class="flex h-screen">
            <aside class="w-64" aria-label="Sidebar">
                <div class="overflow-y-auto py-4 px-3 bg-white rounded dark:bg-gray-800">
                    <ul class="space-y-2">
                        <li>
                            <a href="Dashboard.jsp?id=<%=items.getSellerId()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
                                </svg>
                                <span class="ml-3">Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="ShopProfile.jsp?id=<%=items.getSellerId()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path></svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Shop Profile</span>
                            </a>
                        </li>
                        <li>
                            <a href="ShopItems.jsp?id=<%=items.getSellerId()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10 2a4 4 0 00-4 4v1H5a1 1 0 00-.994.89l-1 9A1 1 0 004 18h12a1 1 0 00.994-1.11l-1-9A1 1 0 0015 7h-1V6a4 4 0 00-4-4zm2 5V6a2 2 0 10-4 0v1h4zm-6 3a1 1 0 112 0 1 1 0 01-2 0zm7-1a1 1 0 100 2 1 1 0 000-2z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Items</span>
                            </a>
                        </li>
                        <li>
                            <a href="Orders.jsp?id=<%=items.getSellerId()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0"></path>
                                </svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Orders</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="pt-4 mt-4 space-y-2 border-t border-yellow-200 dark:border-yellow-200">
                        <li>
                            <a href="../BIDDER/Dashboard.jsp?id=<%=items.getSellerId()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
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
            
            
            <div class="flex flex-col flex-1 w-full h-full overflow-y-auto bg-gray-200 bg-opacity-50">
            <%
                LocalDate today = LocalDate.now();
                Date tod = Date.valueOf(today);
                    Date startDate = items.getStartDate();
                    Date endDate = items.getEndDate();
                    if (startDate.after(tod)){
            %>
                <div class="container mx-auto flex items-center flex-wrap pt-3">
                    <div class="container mx-auto mb-4 flex flex-col items-center">
                        <form class="flex flex-col bg-white rounded-lg shadow-xl w-1/2 md:w-9/20" action="../ItemsController" method="POST" enctype="multipart/form-data">
                            <div class="flex justify-center">
                                <div class="flex">
                                    <h1 class="text-gray-600 font-bold md:text-2xl text-xl pt-4">New Item</h1>
                                </div>
                            </div>
                            <div class="flex flex-col mx-7">
                                <input type="hidden" name="hidid" value="<%=items.getSellerId()%>" class="w-full px-4 py-2 mt-2">
                                <input type="hidden" name="hiditemsid" value="<%=items_id%>" class="w-full px-4 py-2">
                            </div>
                            <div class="flex flex-col mt-5 mx-7">
                                <label class="inline-block uppercase md:text-sm text-xs text-gray-500 text-light font-semibold">
                                    Image </label> 
                                <div class="flex items-center justify-center w-full">
                                    <label class="flex flex-col w-full h-48 border-4 border">
                                        <div class="relative flex flex-col w-full h-48 items-center justify-center pt-1">
                                            <img class="rounded-t-lg" style="height: 100%; width: 100%; object-fit: contain" src="../img/ItemsImage.jsp?id=<%=items.getItemsId()%>" alt="" />
                                        </div>
                                    </label>
                                </div>
                            </div>
                            <div class="flex flex-col mt-5 mx-7">
                                <label class="uppercase text-sm text-xs text-gray-500 text-light font-semibold">Item name</label>
                                <input class="py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" type="text" name="itemsName" value="<%=items.getItemsName()%>" />
                            </div>

                            <div class="flex flex-col mt-5 mx-7">
                                <label class="uppercase text-sm text-xs text-gray-500 text-light font-semibold" for="category" >Item Category</label>
                                <div class="flex justify-start">
                                    <div class="w-full">
                                        <select id="category" name="category" class="form-select appearance-none block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded-lg transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
                                            <option selected value="<%=items.getItemsCtg()%>"><%=items.getItemsCtg()%></option>
                                            <option value="All">All</option>
                                            <option value="Paintings">Paintings</option>
                                            <option value="Drawings">Drawings</option>
                                            <option value="Calligraphy">Calligraphy</option>
                                            <option value="Decor">Decor</option>
                                            <option value="Jewelry">Jewelry</option>
                                            <option value="Ceramics">Ceramics</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="flex flex-col mt-5 mx-7">
                                <label class="uppercase text-sm text-xs text-gray-500 text-light font-semibold">Starting Price</label>
                                <input class="py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" type="text" name="price" value="<%=items.getPrice()%>"/>
                            </div>

                            <div class="flex flex-col mt-5 mx-7">
                                <label class="uppercase text-sm text-gray-500 text-light font-semibold">Bidding Date</label>
                            </div>

                            <div class="inline-block flex flex-row justify-between items-center mx-7 relative">
                                <input type="date" name="startDate"  value="<%=startDate%>" class="py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" />
                                <div class="inline-block text-center text-lg pt-1">to</div>
                                <input type="date" name="endDate"  value="<%=endDate%>" class="py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" />
                            </div>

                            <div class="flex flex-col mt-5 mx-7">
                                <label class="uppercase text-sm text-gray-500 text-light font-semibold" for="itemsDesc" >Item Description</label>
                                <textarea class="py-5 px-3 hover:resize-y rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" type="textarea" name="itemsDesc" value="<%=items.getItemsDesc()%>" ><%=items.getItemsDesc()%></textarea>

                            </div>
                            <div class="flex flex-col mx-7">
                                <input type="hidden" name="status" value="<%=items.getStatus()%>" class="w-full">
                            </div>
                            <div class="justify-center inline-block flex flex-col py-3 md:flex-row items-center ">
                                <button type="button" class="focus:outline-none inline-flex item-center text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:focus:ring-yellow-900">
                                    <a href="ShopItems.jsp?id=<%=items.getSellerId()%>">Back</a>
                                </button>
                                <button type="submit" name="command" value="update" class="focus:outline-none inline-flex item-center text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:focus:ring-yellow-900">
                                    Save
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            <%
                    } else {
            %>
                <div class="container mx-auto flex items-center flex-wrap pt-3">
                        <div class="container mx-auto mb-4 flex flex-col items-center">
                            <form class="flex flex-col bg-white rounded-lg shadow-xl w-1/2 md:w-9/20" action="../ItemsController" method="POST" enctype="multipart/form-data">
                                <div class="flex justify-center">
                                    <div class="flex">
                                        <h1 class="text-gray-600 font-bold md:text-2xl text-xl pt-4"><%=items.getItemsName()%></h1>
                                    </div>
                                </div>
                                <div class="flex flex-col mx-7">
                                    <input type="hidden" name="hidid" value="<%=items.getSellerId()%>" class="w-full px-4 py-2 mt-2">
                                    <input type="hidden" name="hiditemsid" value="<%=items_id%>" class="w-full px-4 py-2">
                                </div>
                                <div class="flex flex-col mt-5 mx-7">
                                    <label class="inline-block uppercase md:text-sm text-xs text-gray-500 text-light font-semibold">
                                        Image </label> 
                                    <div class="flex items-center justify-center w-full">
                                        <label class="flex flex-col w-full h-48">
                                            <div class="relative flex flex-col w-full h-48 items-center justify-center pt-1">
                                                <img class="rounded-t-lg" style="height: 100%; width: 100%; object-fit: contain" src="../img/ItemsImage.jsp?id=<%=items.getItemsId()%>" alt="" />
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="flex flex-col mt-5 mx-7">
                                    <label class="uppercase text-sm text-xs text-gray-600 text-light font-semibold" for="category" >Item Category</label>
                                    <label class="pt-2 text-base text-gray-500 font-medium"><%=items.getItemsCtg()%></label>
                                </div>
                                
                                <div class="flex flex-col mt-5 mx-7">
                                    <label class="uppercase text-sm text-xs text-gray-600 text-light font-semibold">Price</label>
                                    <label class="pt-2 text-base text-gray-500 font-medium"><%=items.getPrice()%></label>
                                </div>
                                
                                <div class="flex flex-col mt-5 mx-7">
                                    <label class="uppercase text-sm text-gray-600 text-light font-semibold">Bidding Date</label>
                                    <label class="pt-2 text-base text-gray-500 font-medium"><%=startDate%> To <%=endDate%></label>
                                </div>

                                <div class="flex flex-col mt-5 mx-7">
                                    <label class="uppercase text-sm text-gray-600 text-light font-semibold" for="itemsDesc" >Item Description</label>
                                    <textarea readonly class="py-5 px-3 hover:resize-y rounded-lg border mt-1 focus:outline-none focus:border-transparent" type="textarea" name="itemsDesc"><%=items.getItemsDesc()%></textarea>
                                    
                                </div>
                                <div class="flex flex-col mx-7">
                                    <input type="hidden" name="status" value="<%=items.getStatus()%>" class="w-full">
                                </div>
                                <div class="justify-center inline-block flex flex-col py-3 md:flex-row items-center ">
                                    <button type="button" class="focus:outline-none inline-flex item-center text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:focus:ring-yellow-900">
                                        <a href="ShopItems.jsp?id=<%=items.getSellerId()%>">Back</a>
                                    </button>
                                </div>
                            </form>
                        </div>
                </div>
            </div>
            <%
                    } 
            %>
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
                               
    <script>
        function showImage() {
            return {
                showPreview(event) {
                    if (event.target.files.length > 0) {
                        var src = URL.createObjectURL(event.target.files[0]);
                        var preview = document.getElementById("preview");
                        preview.src = src;
                        preview.style.display = "block";
                    }
                }
            };
        }
    </script>
    <script> 
        $( document ).ready(function() {     
        $("#from-datepicker").datepicker({          
        format: 'yyyy-mm-dd' //can also use format: 'dd-mm-yyyy'     
        });      
        });  
    </script> 
    
    <!-- AlpineJS -->
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <!-- Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" integrity="sha256-KzZiKy0DWYsnwMF+X1DvQngQ2/FxF7MF3Ff72XcpuPs=" crossorigin="anonymous"></script>
</body>

</html>


