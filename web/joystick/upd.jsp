
<%@page import="java.util.List"%>
<%@page import="dao.ConsoleDAO"%>
<%@page import="modelo.Console"%>
<%@page import="modelo.Joystick"%>
<%@page import="dao.JoystickDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
String msg ="";
String classe = "";
    
    Joystick obj = new Joystick();
    JoystickDAO dao = new JoystickDAO();
    
    ConsoleDAO cdao = new ConsoleDAO();
    Console console = new Console();
    List<Console> clista = cdao.listar();
    
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no form
        obj.setId(Integer.parseInt(request.getParameter("txtId")));
        obj.setModelo(request.getParameter("txtModelo"));
        obj.setQuantidadeBotoes(Integer.parseInt(request.getParameter("txtQuantidade")));
        
      
        console.setNumSerie(Integer.parseInt(request.getParameter("selConsole")));
        obj.setNumSerie(console);
          

        Boolean resultado = dao.alterar(obj);
        
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }
        
    }else{
        //e GET
        if(request.getParameter("codigo") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        
        dao = new JoystickDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("index.jsp");
            return;
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
            Joystick
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Código</label>
                        <input class="form-control" type="text" name="txtId" readonly value="<%=obj.getId() %>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Modelo</label>
                        <input class="form-control" type="text" name="txtModelo" required value="<%=obj.getModelo()%>" />
                    </div>
                    <div class="form-group">
                        <label>Quantidade de Botões</label>
                        <input class="form-control" type="number" name="txtQuantidade" required value="<%=obj.getQuantidadeBotoes() %>" />
                    </div>
                    <label>Console:</label>
                        <select name="selConsole">
                            <option value="<%=obj.getNumSerie()%>"><%=obj.getNumSerie().getNome()%></option>
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
<!-- /.row -->
<%@include file="../rodape.jsp" %>