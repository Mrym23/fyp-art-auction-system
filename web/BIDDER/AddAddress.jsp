<%-- 
    Document   : Add New Address
    Created on : Mar 27, 2022, 10:49:37 PM
    Author     : USER
--%>

<%@page import="DAO.bidderDAO"%>
<%@page import="DAOImpl.bidderDAOImpl"%>
<%@page import="Model.Bidder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Address</title>
    <meta name="description" content="Free open source Tailwind CSS Store template">
    <meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,store template, shop layout, minimal, monochrome, minimalistic, theme, nordic">
    
    <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
	
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
            bidderDAO bidderdao = new bidderDAOImpl();
            Bidder bidder = bidderdao.getOne(Integer.parseInt(bidder_ID));
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
                    <a class="flex tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-4xl" style="font-family:didot" href="Homepage.jsp?id=<%=bidder.getBidder_ID()%>">
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
                            <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="Dashboard.jsp?id=<%=bidder.getBidder_ID()%>">Dashboard</a></li>
                            <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="<%=request.getContextPath()%>/GENERAL PAGES/LandingPage.jsp">Log Out</a></li>
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
                            <li class=""><a class="rounded-t bg-gray-50 hover:bg-gray-100 py-2 px-4 block whitespace-nowrap" href="#">Cart</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </nav>

        <main class="flex h-screen">
            
            <aside class="w-56" aria-label="Sidebar">
                <div class="overflow-y-auto py-4 px-3 bg-white rounded dark:bg-gray-800">
                    <ul class="space-y-2">
                        <li>
                            <a href="myProfile.jsp?id=<%=bidder.getBidder_ID()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path></svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">My Profile</span>
                            </a>
                        </li>
                        <li>
                            <a href="Activity.jsp?id=<%=bidder.getBidder_ID()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10 2a4 4 0 00-4 4v1H5a1 1 0 00-.994.89l-1 9A1 1 0 004 18h12a1 1 0 00.994-1.11l-1-9A1 1 0 0015 7h-1V6a4 4 0 00-4-4zm2 5V6a2 2 0 10-4 0v1h4zm-6 3a1 1 0 112 0 1 1 0 01-2 0zm7-1a1 1 0 100 2 1 1 0 000-2z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Activity</span>
                            </a>
                        </li>
                        <li>
                            <a href="Orders.jsp?id=<%=bidder.getBidder_ID()%>" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0"></path>
                                </svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Orders</span>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/GENERAL PAGES/LandingPage.jsp" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 3a1 1 0 00-1 1v12a1 1 0 102 0V4a1 1 0 00-1-1zm10.293 9.293a1 1 0 001.414 1.414l3-3a1 1 0 000-1.414l-3-3a1 1 0 10-1.414 1.414L14.586 9H7a1 1 0 100 2h7.586l-1.293 1.293z" clip-rule="evenodd"></path></svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Log out</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="pt-4 mt-4 space-y-2 border-t border-yellow-200 dark:border-yellow-200">
                        <li>
                            <a href="#" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg transition duration-75 hover:bg-gray-100 dark:hover:bg-gray-700 dark:text-white group">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z"></path><path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd"></path></svg>
                                <span class="ml-3">Seller Center</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg transition duration-75 hover:bg-gray-100 dark:hover:bg-gray-700 dark:text-white group">
                                <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-2 0c0 .993-.241 1.929-.668 2.754l-1.524-1.525a3.997 3.997 0 00.078-2.183l1.562-1.562C15.802 8.249 16 9.1 16 10zm-5.165 3.913l1.58 1.58A5.98 5.98 0 0110 16a5.976 5.976 0 01-2.516-.552l1.562-1.562a4.006 4.006 0 001.789.027zm-4.677-2.796a4.002 4.002 0 01-.041-2.08l-.08.08-1.53-1.533A5.98 5.98 0 004 10c0 .954.223 1.856.619 2.657l1.54-1.54zm1.088-6.45A5.974 5.974 0 0110 4c.954 0 1.856.223 2.657.619l-1.54 1.54a4.002 4.002 0 00-2.346.033L7.246 4.668zM12 10a2 2 0 11-4 0 2 2 0 014 0z" clip-rule="evenodd"></path></svg>
                                <span class="ml-3">Support</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </aside>

            <div class="flex flex-col flex-1 w-full h-full overflow-y-auto bg-gray-300 bg-opacity-50">
                <div class="container mx-auto grid">
                    <div class="md:flex md:justify-center">

                        <div class="w-full lg:w-1/2 mt-2 mb-2 pl-0 lg:pl-2 items-center">
                            <div class="w-full leading-loose">
                                <form action="../bidderController">
                                 <div class="px-10 pt-4 pb-6 mt-4 bg-white rounded shadow-xl">
                                    <div class="flex justify-between mb-3">
                                        <div>
                                            <p class="text-xl pb-3 flex text-gray-900 items-center">
                                                <i class="fas fa-list mr-3"></i> Add New Address
                                            </p>
                                        </div>
                                        <div class=" flex justify-between">     
                                            <button type="submit" name="command" value="addNewAddress" class="px-4 py-1 text-gray-800 font-normal tracking-wider bg-yellow-300 rounded hover:bg-yellow-400">
                                                <i class="fas fa-edit mr-3"></i>
                                                Save
                                            </button>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <div>
                                            <input class="w-full border rounded" type="hidden" name="hidid" value="<%=bidder.getBidder_ID()%>">
                                        </div>
                                    </div>
                                    <div class="flex flex-wrap">
                                        <div class="md:w-1/2 md:mb-0 pr-3">
                                            <div>
                                                <label class="mt-3 block text-s text-gray-900" for="name">Name:</label>
                                                <input class="form-control block w-full px-4 text-l text-gray-900 bg-white bg-clip-padding border 
                                                rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-400 
                                                focus:outline-none" type="text" name="name" size="50" value="">
                                            </div>
                                        </div>
                                        <div class="md:w-1/2">
                                            <div>
                                                <label class="mt-3 block text-s text-gray-900" for="contactNo">Contact Number:</label>
                                                <input class="form-control block w-full px-4 text-l text-gray-900 bg-white bg-clip-padding border 
                                                rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-400 
                                                focus:outline-none" type="text" name="contactNo" size="50" value="">
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <label class="mt-4 block text-s text-gray-900" for="addr1">Address Line 1:</label>
                                            <input class="form-control block w-full px-4 text-l text-gray-900 bg-white bg-clip-padding border 
                                            rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-400 
                                            focus:outline-none" type="text" name="addr1" size="50" value="">
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <label class="mt-4 block text-s text-gray-900" for="addr2">Address Line 2:</label>
                                            <input class="form-control block w-full px-4 text-l text-gray-900 bg-white bg-clip-padding border 
                                            rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-400 
                                            focus:outline-none" type="text" name="addr2" size="50" value="">
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <label class="mt-4 block text-s text-gray-900" for="city">City:</label>
                                            <input class="form-control block w-full px-4 text-l text-gray-900 bg-white bg-clip-padding border 
                                            rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-400 
                                            focus:outline-none" type="text" name="city" size="50" value="">
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <label class="mt-4 block text-s text-gray-900" for="state">State:</label>
                                            <input class="form-control block w-full px-4 text-l text-gray-900 bg-white bg-clip-padding border 
                                            rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-400 
                                            focus:outline-none" type="text" name="state" size="50" value="">
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <label class="mt-4 block text-s text-gray-900" for="zipcode">Zip Code:</label>
                                            <input class="form-control block w-full px-4 text-l text-gray-900 bg-white bg-clip-padding border 
                                            rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-yellow-400 
                                            focus:outline-none" type="text" name="zipcode" size="50" value="">
                                        </div>
                                    </div>
                                 </div>
                                </form>
                            </div>
                            
                        </div>
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
    <script src="https://unpkg.com/@popperjs/core@2.9.1/dist/umd/popper.min.js" charset="utf-8"></script>
        <script type="text/javascript">
            var tooltipTriggerList = [].slice.call(
                document.querySelectorAll('[data-bs-toggle="tooltip"]')
            );
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new Tooltip(tooltipTriggerEl);
            });
    </script>
</body>

</html>
