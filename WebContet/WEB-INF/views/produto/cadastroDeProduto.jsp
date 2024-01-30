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
	href="<%=contextPath%>/resources/assets/css/style.css" />
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
	<header>
		<section id="modalMenu" class="abracaMenu modalMenu">
			<img class="logoSumare"
				src="<%=contextPath%>/resources/assets/img/logo.svg"
				alt="Logo Sumare" />
			<button id="teste" type="button" class="btn botaoDesativaMenu "><i class="fa-solid fa-arrow-right" style="color: #ffffff;"></i></button>
			<hr />
			<p>
				<i class="fa-solid fa-user me-2" style="width: 28px;"></i> <span>${funcionario.nome}</span>
			</p>
			<hr />
			<nav class="nav-sidebar">

				
			         <a href="listarCargos" class="mb-1"><i class="fa-regular fa-address-card"></i> 
				<span>Cargos</span> 
			    </a> <a href="listarCategoria" class="mb-1"> <i class="fa-solid fa-clipboard"></i> 
				<span>Categorias</span>
				</a> <a href="listarSubCategoria" class="mb-1"> <i class="fa-solid fa-paste"></i>
				<span>Sub-Categoria</span>
				</a> <a href="listarLojista" class="mb-1"> <i class="fa-solid fa-shop"></i> 
				<span>Lojistas</span>
				</a> <a href="listarColaboradores" class="mb-1"> <i class="fa-regular fa-handshake"></i>
				<span>Colaboradores</span>
				</a> <a href="listarFuncionarios" class="mb-1"> <i class="fa-solid fa-user-group"></i> 
				<span>Funcionários</span>
				</a> <a href="listarProduto" class="mb-1"> <i class="fa-solid fa-barcode"></i> 
				<span>Produtos</span>
				</a> <a href="logoff" id="sair"> <i class="fa-solid fa-right-from-bracket"></i> 
				<span>Sair</span>
				</a>
				
			</nav>
		</section>
	</header>
	
	<button type="button" class="btn botaoAtivaMenu "><i class="fa-solid fa-bars"></i></button>
	<main class="py-4 container-res">
		<section class="mb-5">
			<div class="card">
				<div class="card-body title">
					<i class="fa-solid fa-barcode"></i> <span>Cadastro
						de Produto</span>
				</div>
			</div>
		</section>
		<section class="pt-4">
			<form id="form-funcionario" class="card form p-5 col-8 mx-auto">
				<h1 class="text-center mb-5">Cadastrar Produto</h1>
				<input type="text" id="usuarioCadastro" hidden
					value="${funcionario.idUsuario}" />

				<div class="row mb-2">
					<div class="col-md-6">
						<label for="nomeProduto" class="form-label">Nome do
							produto:</label> <input type="text" id="nomeProduto" required
							autocomplete="off" name="nomeProduto"
							class="form-control inputForm" maxlength="255" />
					</div>
					<div class="col-md-2">
						<label for="ativo" class="form-label">Ativo:</label>
						<div class="form-control border-0 p-0">
							<input type="checkbox" name="ativo" checked data-toggle="toggle"
								data-onstyle="secondary" data-offstyle="dark" data-on="Sim"
								data-off="Não" data-width="100%" data-height="40" data-size="sm" />
						</div>
					</div>
				</div>

				<div class="row mb-2">
					<div class="col-md-6">
						<label for="descricao" class="form-label">Descrição:</label> <input
							required autocomplete="off" type="text" id="descricao"
							name="descricao" class="form-control inputForm" maxlength="2000" />
					</div>
					<div class="col-md-6">
						<label for="categoria" class="form-label">Categoria:</label> <select
							id="categoria" required autocomplete="off"
							class="form-control inputForm" maxlength="8">
							<option></option>
							<option>Desenvolvedor</option>
							<option>Recursos Humanos</option>
							<option>Jovem Aprediz</option>
						</select>
					</div>
				</div>


				<div class="row mb-2">
					<div class="col-md-6">
						<label for="subCategoria" class="form-label">Sub-Categoria:</label>
						<select type="text" id="subCategoria" required autocomplete="off"
							name="subCategoria" class="form-control inputForm" maxlength="8">
							<option></option>
							<option>Desenvolvedor</option>
							<option>Recursos Humanos</option>
							<option>Jovem Aprediz</option>
						</select>
					</div>
					<div class="col-md-6">
						<label for="precoDeVenda" class="form-label">Preço de
							Venda:</label> <input type="number" id="precoDeVenda" required
							autocomplete="off" name="precoDeVenda" step="0.010"
							class="form-control inputForm" data-mask="00.00000000" maxlength="10" />
					</div>
				</div>

				<div class="row mb-2">
					<div class="col-md-6">
						<label for="comissao" class="form-label">Comissão:</label> <input
							required autocomplete="off" type="number" id="comissao"
							name="comissao" step="0.010" class="form-control inputForm" maxlength="10"
							data-mask="00.00000000" />
					</div>
					<div class="col-md-6">
						<label for="lojista" class="form-label">Lojista:</label> <input
							id="lojista" required autocomplete="off" name="lojista"
							class="form-control inputForm" type="text" maxlength="8" />

					</div>
				</div>

					<div class="row mb-2">
					<div class="col-md-6">
						<label for="file" class="form-label">Imagem do Produto:</label> <input
							required autocomplete="off" type="file" id="file"
							name="file" class="form-control inputForm" />
					</div>
					</div>

				<div class="row mb-2">
					<div class="col-md-12 text-center">
						<button type="submit" id="btn-submit"
							class="btn confirm btn-primary btn-register">Cadastrar</button>
					</div>
				</div>
				<!-- Button modal de cadastro  -->
				<button type="button" style="display: none;" class="btn btn-primary"
					id="openModalBtn" data-bs-toggle="modal"
					data-bs-target="#exampleModal">Launch demo modal</button>

				<!-- Modal de cadastro -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<i id="icone-modal" class="fa-solid fa-check circulo-border"></i>
								<h1 class="modal-title fs-5 titulo-modal" id="exampleModalLabel">Seu
									Cadastro Foi Realizado!</h1>
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>
	</main>
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
		src="<%=contextPath%>/resources//assets/js/cadastroDeProduto.js"></script>
</body>
</html>
