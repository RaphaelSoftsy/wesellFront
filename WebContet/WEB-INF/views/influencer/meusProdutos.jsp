<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String contextPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="robots" content="noindex" />

<title>Centro Universitário Sumaré</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet" />
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />

<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/2476720ce5.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<%=contextPath%>/resources/assets/css/meusProdutos.css" />

<!-- Animation-css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
</head>

<body>
	<div class="bg-loading">
		<div class="spinner">
			<div class="rect1"></div>
			<div class="rect2"></div>
			<div class="rect3"></div>
			<div class="rect4"></div>
		</div>
	</div>
	
	<header class="d-flex flex-column menu w-100  ">
	
	<div class="d-flex justify-content-between align-items-center shadowNovo menu-alto">
	
		<img alt="logo" src="<%=contextPath%>/resources/assets/img/logo.svg" class="logo-menu">
		<div class="p-4 d-flex gap-3">
			
			<a href="#"><i class="fa-solid fa-bell icone-menu"></i></a>
			<a href="#"><i class="fa-solid fa-user icone-menu"></i></a>
			
		</div>
	
	</div>
	
	<div class="p-3 d-flex flex-column justify-content-between align-items-start shadowNovo h-100 menu-baixo ">
	
		<div class="d-flex flex-column gap-3">
		
			<a href="meusProdutos" class="d-flex align-items-center gap-3 text-decoration-none"><i class="fa-solid fa-cube icone-menu"></i>Meus Produtos</a>
			<a href="mercadoDeAfiliacao" class="d-flex align-items-center gap-3 text-decoration-none"><i class="fa-solid fa-cubes-stacked icone-menu"></i>Mercado de Afiliação</a>
			<a href="minhasVendas" class="d-flex align-items-center gap-3 text-decoration-none"><i class="fa-solid fa-chart-simple icone-menu"></i>Minhas Vendas</a>
		
		</div>
		
		<a href="#" class="d-flex align-items-center gap-3 text-decoration-none"><i class="fa-solid fa-arrow-left icone-menu"></i>Sair</a>
	
	</div>
	
	</header>
	
<main class="main">

	<h1 style='    font-weight: 300;' class="mt-2">Meus Produtos</h1>
	<div style='margin-bottom: 35px;' class='row'>
		<div class='col-md-3'>
			<div class="input-group">
				<input id="inputBusca" type="text" class="form-control inputForm"
				placeholder="Buscar Produtos" /> <span
				class="input-group-text icone-pesquisa"><i
				class="fas fa-search"></i></span>
			</div>
		</div>
	
		<div class='col-md-3'>
			<select class='filtros'>
				<option>Filtre por Loja</option>
				<option>Loja</option>
			</select>
		</div>
		
		<div class='col-md-3'>
			<select  class='filtros'>
				<option>Categoria</option>
			</select>
		</div>
		
		<div class='col-md-3'>
			<select  class='filtros'>
				<option>SubCategoria</option>
			</select>
		</div>
	</div>
	
	
	

	
	
	
	
	<div class="mb-3">
	
	<div class="card-group d-flex gap-3">
  
 <div class="card">
  	<div class='nomeLoja'>KABUM</div>
    <img class="card-img-top" src="<%=contextPath%>/resources/assets/img/oleo.jpg" alt="Lubrificante">
    <div class="card-body">
       <h5 class="card-title">Óleo Lubrificante Automotivo</h5>
      <p class="card-text">
      Comissão de até: <span class='spanPreco'>R$03.99 </span>
      Valor do Produto: R$32.94</p>
     <button type="button" class="btn btn-success">Link de Divulgação</button>
     <button type="button" class="btn btn-outline-danger">Desativar</button>
    </div>
  </div>
  
  <div class="card">
  	<div class='nomeLoja'>Americanas</div>
    <img class="card-img-top" src="<%=contextPath%>/resources/assets/img/oleo.jpg" alt="Lubrificante">
    <div class="card-body">
       <h5 class="card-title">Óleo Lubrificante Automotivo</h5>
      <p class="card-text">
      Comissão de até: <span class='spanPreco'>R$03.99 </span>
      Valor do Produto: R$32.94</p>
     <button type="button" class="btn btn-success">Link de Divulgação</button>
     <button type="button" class="btn btn-outline-danger">Desativar</button>
    </div>
  </div>
  
  <div class="card">
  	<div class='nomeLoja'>CombatBrothers</div>
    <img class="card-img-top" src="<%=contextPath%>/resources/assets/img/oleo.jpg" alt="Lubrificante">
    <div class="card-body">
       <h5 class="card-title">Bola de Basquete Wilson</h5>
      <p class="card-text">
      Comissão de até: <span class='spanPreco'>R$03.99 </span>
      Valor do Produto: R$32.94</p>
     <button type="button" class="btn btn-success">Link de Divulgação</button>
     <button type="button" class="btn btn-outline-danger">Desativar</button>
    </div>
  </div>
  
  <div class="card">
  	<div class='nomeLoja'>Mercado Livre</div>
    <img class="card-img-top" src="<%=contextPath%>/resources/assets/img/oleo.jpg" alt="Lubrificante">
    <div class="card-body">
       <h5 class="card-title">Óleo Lubrificante Automotivo</h5>
      <p class="card-text">
      Comissão de até: <span class='spanPreco'>R$03.99 </span>
      Valor do Produto: R$32.94</p>
     <button type="button" class="btn btn-success">Link de Divulgação</button>
     <button type="button" class="btn btn-outline-danger">Desativar</button>
    </div>
  </div>
  
</div>

	</div>
	
</main>
	
	
	
	
	
	
	<!--  	<footer >Copyright @ 2000-2024 - Todos os direitos reservados - Desenvolvido pela Softsy</footer> -->
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
	<script src="<%=contextPath%>/resources/assets/js/comum.js"></script>
	<script
		src="<%=contextPath%>/resources//assets/js/perguntaInfluencer.js"></script>
</body>
</html>
