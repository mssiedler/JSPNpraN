<%@page import="util.Upload"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Jogo"%>
<%@page import="dao.JogoDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.ConsoleDAO"%>
<%@page import="modelo.Console"%>
<%@page import="java.util.List"%>

<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    List<Console> listaC;
    ConsoleDAO cDAO = new ConsoleDAO();

    listaC = cDAO.listar();
    if (request.getMethod().equals("POST")) {
        JogoDAO dao = new JogoDAO();
        Jogo obj = new Jogo();
        Upload up = new Upload();
        up.setFolderUpload("imagem");
        //Processo meu formulário
        if (up.formProcess(getServletContext(), request)) {
            obj.setNome(up.getForm().get("txtNome").toString());
            //N PRA N
            String cS = up.getForm().get("selConsole").toString();
            String[] consolesS = cS.split(";");
            
            if (consolesS.length > 0) {
                List<Console> listaSelecionados = new ArrayList<>();
                for (String con : consolesS) {
                    Console objc = cDAO.buscarPorChavePrimaria(Integer.parseInt(con));
                    listaSelecionados.add(objc);
                }
                obj.setConsoleList(listaSelecionados);
            }
            //upload de imagem
            if(up.getFiles().size()>0)
            {
                obj.setImagem(up.getFiles().get(0));
            }

            Boolean resultado = dao.incluir(obj);
            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-success";
            } else {
                msg = "Não foi possível cadastrar";
                classe = "alert-danger";
            }
        }
        else{
            msg = "Não foi possível fazer o upload. Contate o administrador";
        }

    }


%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação 
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Consoles
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post" enctype="multipart/form-data">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text"  name="txtNome"  required />
                    </div>
                    <div class="form-group">
                        <label>Imagem</label>
                        <input class="form-control" type="file"  name="filImagem"  required />
                    </div>
                    <div class="form-group">
                        <label>Consoles</label>
                        <select multiple name="selConsole" class="form-control">
                            <%for (Console c : listaC) {%>
                            <option value="<%=c.getNumSerie()%>"><%=c.getNome()%></option>   
                            <%    }
                            %>


                        </select>
                    </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>