var dados = [];
var sortOrder = {};
var dadosOriginais = [];
var rows = 12;
var currentPage = 1;
var pagesToShow = 5;

const botaoDesativa = document.querySelector('#teste');
const botaoAtiva = document.querySelector('.botaoAtivaMenu');
const elemento = document.querySelector('#modalMenu');

botaoDesativa.addEventListener('click', () => {
	elemento.classList.add('animar-sair');
	elemento.classList.remove('animar-entrar');

});

botaoAtiva.addEventListener('click', () => {
	elemento.classList.add('animar-entrar');
	elemento.classList.remove('animar-sair');
});

var lojistas = []

$(document).ready(function() {

	$.ajax({
		url: url_base + "/lojistas",
		type: "GET",
		async: false,
		beforeSend: function() {
			Swal.showLoading()
		},
		error: function(e) {
			Swal.close();
			console.log(e.responseJSON);
			Swal.fire({
				icon: "error",
				title: e.responseJSON.message
			});
		}
	}).done(function(data) {
		Swal.close();

		$('#exportar-excel').click(function() {
			var planilha = XLSX.utils.json_to_sheet(data);
			var livro = XLSX.utils.book_new();
			XLSX.utils.book_append_sheet(livro, planilha, "Planilha1");
			XLSX.writeFile(livro, "Lojistas.xlsx");
		});

		lojistas = data;
		renderizarLojistas(data);
	})

	function renderizarLojistas(funcionarios) {
		var html = lojistas.map(function(item) {
			var buttonClass = item.ativo === "S" ? "btn-success" : "btn-danger";

			var inscricao

			if (item.inscrEstadual.length == 0) {
				inscricao = "Vazio"
			} else { inscricao = item.inscrEstadual }


			return (
				"<tr>" +
				"<td>" +
				'<button type="button" class="btn btn-status btn-sm ' +
				buttonClass +
				'" style="width: 63px; height: 31px; padding: 2px; display: flex; align-items: center; justify-content: center;" disabled>' +
				(item.ativo === "S"
					? "<i class='fa-solid fa-check fa-xl'></i>"
					: '<i class="fa-solid fa-xmark fa-xl"></i>') +
				"</button>" +
				"</td>" +
				"<td>" +
				item.razaoSocial +
				"</td>" +
				"<td>" +
				item.nomeFantasia +
				"</td>" +
				"<td>" +
				item.cnpj.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$/, "$1.$2.$3/$4-$5") +
				"</td>" +
				"<td>" +
				inscricao +
				"</td>" +
				"<td>" +
				item.endereco +
				"</td>" +
				"<td>" +
				item.numero +
				"</td>" +
				"<td>" +
				item.bairro +
				"</td>" +
				"<td>" +
				item.cidade +
				"</td>" +
				"<td>" +
				item.estado +
				"</td>" +
				"<td>" +
				item.cep.replace(/^(\d{5})(\d{3})$/, "$1-$2") +
				"</td>" +
				"<td>" +
				item.site +
				"</td>" +
				'<td class="d-flex"><span style="width: 63px; margin-right: 5px; height: 31px; padding: 8px; display: flex; align-items: center; justify-content: center;" class="btn btn-warning btn-sm" data-value="' +
				item.idLojista +
				'" onclick="editar(this)"><i class="fa-solid fa-pen fa-lg"></i></span> <input type="checkbox" data-status="' +
				item.ativo +
				'" data-id="' +
				item.idLojista +
				'" onChange="alteraStatus(this)" checked data-toggle="toggle" data-onstyle="success" data-offstyle="danger" data-width="63" class="checkbox-toggle" data-size="sm"></td>' +
				"</tr>"
			);
		}).join("");

		$("#colaTabela").html(html);
	}


	$('.checkbox-toggle').each(function() {
		var status = $(this).data('status');
		if (status !== 'S') {
			$(this).prop('checked', false);
		}
	});

	showPage(currentPage);
	updatePagination();
});

function editar(user) {
	var idLojista = user.getAttribute("data-value");
	window.location.href = "cadastroDeLojista?id=" + idLojista;
}

function alteraStatus(element) {
	var id = element.getAttribute("data-id");
	var status = element.getAttribute("data-status");

	const button = $(element).closest("tr").find(".btn-status");
	if (status === "S") {
		button.removeClass("btn-success").addClass("btn-danger");
		button.find("i").removeClass("fa-check").addClass("fa-xmark");
		element.setAttribute("data-status", "N");
	} else {
		button.removeClass("btn-danger").addClass("btn-success");
		button.find("i").removeClass("fa-xmark").addClass("fa-check");
		element.setAttribute("data-status", "S");
	}

	$.ajax({
		url: url_base + `/lojistas/${id}${status === "S" ? '/desativar' : '/ativar'}`,
		type: "put",
		error: function(e) {
			Swal.fire({
				title: e.responseJSON.error,
				icon: "error"
			})
			console.log(e.responseJSON)
		}
	});

}
