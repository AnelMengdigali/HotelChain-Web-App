<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dubai Resort</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <nav class="nav">
                <a href="index.jsp" class="logo">
                    
                </a>
                <div class="hamburger-menu">
                    <i class="fas fa-bars"></i>
                    <i class="fas fa-times"></i>
                </div>
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link active">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="#services" class="nav-link">Services</a>
                    </li>
                    
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link">Hotels</a>
                    </li>
                    <!--  <li class="nav-item">
                        <a href="./login.html" class="nav-link">Login | Join</a>
                    </li> -->
                </ul>
            </nav>
        </div>
    </header>

    <main>
        <div class="hero-dubai" id="hero">
            <div class="container">
                <div class="main-heading">
                    <h1 class="title">Dubai resort</h1>
                </div>
                <a href="<% if (session.getAttribute("username") == null) {out.print("./login.html");} else {out.print("./reservation.jsp");} %>" class="btn btn-gradient">Make a reservation
                    <span class="dots"><i class="fas fa-ellipsis-h"></i></span>
                </a>
            </div>
        </div>

        

        <section class="rooms" id="reser">
            <div class="container">
                <h5 class="section-head">
                    <span class="heading">Luxurious</span>
                    <span class="sub-heading">Affordable rooms</span>
                </h5>
                <div class="grid rooms-grid">
                    <div class="grid-item featured-rooms">
                        <div class="image-wrap">
                            <img class="room-image" src="./images/room_1.jpg" alt="">
                            <h5 class="room-name">Single</h5>
                        </div>
                        <div class="room-info-wrap">
                            <span class="room-price">$200 <span class="per-night">Per night</span></span>
                            <p class="paragraph">
                                One hotel-quality orthopedic queen-size beds. 
                                A large private bathroom with a hot water shower. 
                                A telephone with free unlimited international calls. 
                                Free high-speed Wi-Fi. 
                                Air-conditioning and a ceiling fan.
                                Hair dryer.
                                Laundry service.
                                Daily maid service.
                            </p>
                            <a href="#" class="btn rooms-btn">Book now</a>
                        </div>
                    </div>
                    <div class="grid-item featured-rooms">
                        <div class="image-wrap">
                            <img class="room-image" src="./images/room_2.jpg" alt="">
                            <h5 class="room-name">Double</h5>
                        </div>
                        <div class="room-info-wrap">
                            <span class="room-price">$300 <span class="per-night">Per night</span></span>
                            <p class="paragraph">   
                                One hotel-quality orthopedic king-size beds.
                                A large private bathroom with a hot water shower.
                                A telephone with free unlimited international calls.
                                Free high-speed Wi-Fi.
                                Air-conditioning and a ceiling fan.
                                Coffee Maker with free coffee.
                                Hair dryer.
                                Laundry service.
                                Daily maid service.
                            </p>
                            <a href="#" class="btn rooms-btn">Book now</a>
                        </div>
                    </div>
                    <div class="grid-item featured-rooms">
                        <div class="image-wrap">
                            <img class="room-image" src="./images/room_4.jpg" alt="">
                            <h5 class="room-name">VIP</h5>
                        </div>
                        <div class="room-info-wrap">
                            <span class="room-price">$600 <span class="per-night">Per night</span></span>
                            <p class="paragraph">
                                Two hotel-quality orthopedic king-size beds.
                                A large private bathroom with a hot water shower.
                                A telephone with free unlimited international calls.
                                Free high-speed Wi-Fi.
                                Air-conditioning and a ceiling fan.
                                Coffee Maker with free coffee.
                                Cable television with over 80 channels in English/Spanish.
                                Hair dryer.
                                In-room safety deposit box (optional $1 per day).
                                Room service from restaurant.
                                Writing table and chairs.
                                Laundry service.
                                Daily maid service.                            </p>
                            <a href="#" class="btn rooms-btn">Book now</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="offer">
            <div class="container">
                <div class="offer-content">
                    <h5 class="hotel-name">Contact Info</h5>
                    <i class="fa fa-address-book" aria-hidden="true"></i>
                    <p class="paragraph">
                        Tel. Number: +971 4 399 50 00, +971 4 399 45 47, +971 4 408 41 17, 0800 62 77 46 88
                    </p>
                    <p class="paragraph">
                        Addres: United Arab Emirates, Dubai, Al Falea Street, Jumeirah Beach
                    </p>
                </div>
            </div>
        </section>
        
        <section class="rooms" id="services">
            <div class="container">
                <h5 class="section-head">
                    <span class="heading">Our services</span>
                    <span class="sub-heading">Best experience</span>
                </h5>
                <div class="grid rooms-grid">
                    <div class="grid-item featured-rooms">
                        <div class="image-wrap">
                            <img class="room-image" src="./images/pool.jpg" alt="">
                            <h5 class="room-name">Pool</h5>
                        </div>
                        <div class="room-info-wrap">
                            <p class="paragraph">
                                The swimming pool is the ideal place to unwind in the sunshine while savoring a selection of drinks and snacks from the poolside bar service. 
                            </p>
                        </div>
                    </div>
                    <div class="grid-item featured-rooms">
                        <div class="image-wrap">
                            <img class="room-image" src="./images/215.jpg" alt="">
                            <h5 class="room-name">Spa</h5>
                        </div>
                        <div class="room-info-wrap">
                            <p class="paragraph">
                                The Legendary Dubai Resort spa offers an extensive menu of treatments for those seeking relaxation and the rejuvenation of mind, body and soul.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </main>

    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-content-brand">
                    <div class="paragraph">
                        A legendary welcome, every time.
                    </div>
                </div>
                <div class="social-media-wrap">
                    <h4 class="footer-heading">Follow us</h4>
                     <div class="social-media">
                        <a href="#" class="sm-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="sm-link"><i class="fab fa-facebook-square"></i></a>
                        <a href="#" class="sm-link"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="sm-link"><i class="fab fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="main.js"></script>
</body>
</html>