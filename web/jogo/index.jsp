<%@page import="modelo.Jogo"%>
<%@page import="dao.JogoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Console"%>
<%@page import="dao.ConsoleDAO"%>
<%@include file="../cabecalho.jsp" %>

<% 
    JogoDAO dao = new JogoDAO();
    List<Jogo> lista = dao.listar();
 
    
    

%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Consoles

        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> listagem de registros
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">

        <div class="panel-body">

            <a  href="add.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>
            
        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="txtFiltro" placeholder="digite...">
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                            </div>
        </form>
        <div class="panel-body">
           
        
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>C�digo</th>
                        <th>Nome</th>
                        <th>Consoles</th>
                        <th >A��es</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Jogo obj : lista) {
                            
                        
                    %>
                    <tr>
                        <td><%=obj.getId()%></td>
                        <td><%=obj.getNome()%></td>
                        <td>
                            <%
                            for (Console c : obj.getConsoleList()) {
                               out.print(c.getNome() + " - ");
                            }
                            %></td>
                        <td><a href="upd.jsp?codigo=<%%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo=<%%>">Excluir</button>  
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
           
                <!-- /.table-responsive -->
            </div>

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
        </div>
                
                
    <%@include file="../modalExcluir.jsp" %>
    <%@include file="../rodape.jsp" %>
