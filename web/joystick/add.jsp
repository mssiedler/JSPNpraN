<%@page import="dao.JoystickDAO"%>
<%@page import="modelo.Joystick"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.ConsoleDAO"%>
<%@page import="modelo.Console"%>
<%@page import="java.util.List"%>

<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    Joystick obj = new Joystick();
    JoystickDAO dao = new JoystickDAO();
    
    ConsoleDAO cdao = new ConsoleDAO();
    List<Console> clista = cdao.listar();
    
    if (request.getParameter("txtModelo") != null && request.getParameter("txtQuantidade") != null) {
        obj.setModelo(request.getParameter("txtModelo"));
        obj.setQuantidadeBotoes(Integer.parseInt(request.getParameter("txtQuantidade")));
        
        Console console = new Console();
        console.setNumSerie(Integer.parseInt(request.getParameter("selConsole")));
        obj.setNumSerie(console);

        Boolean resultado = dao.incluir(obj);
        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-success";
        } else {
            msg = "N�o foi poss�vel cadastrar";
            classe = "alert-danger";
        }
    } 
    

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Com�rcio Eletr�nico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">�rea Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conte�do de apresenta��o 
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Joysticks
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Modelo</label>
                        <input class="form-control" type="text"  name="txtModelo"  required />
                    </div>
                    <div class="form-group">
                        <label>Quantidade de Bot�es</label>
                        <input class="form-control" type="number"  name="txtQuantidade"  required />
                    </div>
                    
                    <label>Console:</label>
                        <select name="selConsole">
                            <option value="">Selecione</option>
                            <% 
                                for(Console con: clista) {
                            %>
                            <option value="<%=con.getNumSerie()%>" ><%=con.getNome() %></option>
                            <% 
                                }
                            %>   
                        </select> <br />

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>