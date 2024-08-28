var user = localStorage.getItem("usuario");
var usuario = JSON.parse(user);
var cargo = [];
$("#usuarioNome").text(usuario.nome);

$(document).ready(function () {
  $.ajax({
    url: url_base + "/cargos",
    type: "GET",
    async: false,
  }).done(function (data) {
    $("#cargo").append(
      $("<option>", {
        value: "",
        text: "Selecione...",
      })
    );

    $.each(data, function (index, item) {
      $("#cargo").append(
        $("<option>", {
          value: item.idCargo,
          id: item.idCargo,
          text: item.cargo,
          name: item.cargo,
        })
      );
    });
  });
  $("#alteraSen").removeClass("none");
  $("#senha, #confirmarSenha").attr("disabled", "disabled");
  $("#senha, #confirmarSenha").attr("type", "hidden");
  $("#labelSenha, #confirmarSenhaLabel").addClass("none");

  $.ajax({
    url: url_base + "/funcionarios/" + usuario.id,
    type: "GET",
    async: false,
  })
    .done(function (data) {
      $("#cargo")
        .find(`option[id=${data.cargo.idCargo}]`)
        .attr("selected", "selected"),
        $("#cpf").val(
          data.cpf.replace(/^(\d{3})(\d{3})(\d{3})(\d{2})$/, "$1.$2.$3-$4")
        ),
        $("#email").val(data.email),
        $("#senha").val(data.senha),
        $("#confirmarSenha").val(data.senha);
      $("#nome").val(data.nome);
    })
    .fail(function (jqXHR, textStatus, errorThrown) {
      console.log("erro ao buscar dados.");
      console.error("Erro na solicitação AJAX:", textStatus, errorThrown);
    });

  $.ajax({
    url: url_base + "/telefones/funcionario/" + usuario.id,
    type: "GET",
    async: false,
  }).done(function (data) {
    $("#telefone").val(
      data[0].telefone.replace(/^(\d{2})(\d{5})(\d{4})$/, "($1)$2-$3")
    );
  });
});

function removeObjeto() {
  localStorage.removeItem("usuario");
}

function alteraSenha() {
  $("#senha, #confirmarSenha").removeAttr("disabled");
  $("#labelSenha, #confirmarSenhaLabel").removeClass("none");
  $("#alteraSen").addClass("none");
  $("#alteraSenhaNao").removeClass("none");
  $("#senha, #confirmarSenha").attr("type", "password")
  $("#senha").val("");
  $("#confirmarSenha").val("");
}

function alteraSenhaNao() {
	$("#alteraSen").removeClass("none");
	$("#alteraSenhaNao").addClass("none");
	$("#senha").val("");
	$("#confirmarSenha").val("");
	$("#senha, #confirmarSenha").attr("disabled", "disabled");
	$("#senha, #confirmarSenha").attr("type", "hidden");
	$("#labelSenha, #confirmarSenhaLabel").addClass("none");
  }

function editar() {
  var objetoEdit = {
    idFuncionario: usuario.id,
    cargoId: $("#cargo option:selected").attr("id"),
    cpf: $("#cpf")
      .val()
      .replace(/[^a-zA-Z0-9 ]/g, ""),
    email: $("#email").val(),
    senha: $("#senha").val(),
    lojistaId: usuario.lojistaId,
    nome: $("#nome").val(),
  };

  $.ajax({
    url: url_base + "/funcionarios",
    type: "PUT",
    data: JSON.stringify(objetoEdit),
    contentType: "application/json; charset=utf-8",
    beforeSend: function () {
      Swal.showLoading();
    },
    error: function (e) {
      Swal.close();
      console.log(e.responseJSON);
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "Não foi possível editar os dados pessoais, confira os dados e tente novamente",
      });
    },
  })
    .done(function (data) {
      Swal.close();
      Swal.fire({
        title: "Editado com sucesso",
        icon: "success",
      }).then((done) => {
        window.location.href = "listarFuncionarioLojista";
      });
    })
    .fail(function (jqXHR, textStatus, errorThrown) {
      console.error("Erro na solicitação AJAX:", textStatus, errorThrown);
    });
}

$("#form-funcionario").on("submit", function (e) {
  e.preventDefault();

  const senhaInput = document.getElementById("senha");
  const confirmarSenhaInput = document.getElementById("confirmarSenha");

  function requerimentoSenha() {
    if (senhaInput.value != confirmarSenhaInput.value) {
      $("#senha").val("");
      $("#confirmarSenha").val("");

      Swal.fire({
        title: "As senhas não coincidem!",
        icon: "info",
      });
    } else {
      editar();
    }
  }

  requerimentoSenha();
});
