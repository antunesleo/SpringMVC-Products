<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Nova tarefa</title>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="theme-color" content="#37474f" />
</head>
<body>
	<c:import url="../resources/header.jsp"></c:import>
	<div class="container">
		<h4>Alterar tarefa ID = ${product.id}</h4>
		<div class="row">
	    <form class="col s12" method="post" action="updateProduct">
	    	<input type="hidden" name="id" value="${product.id}" />
	      <div class="row">
	        <div class="input-field col s6">
	          <input id="name" name="name" type="text" class="validate" value="${product.name}">
	          <label for="name">Nome</label>
	        </div>

	      </div>
	      <div class="row">
          	<div class="input-field col s12">
         		<textarea id="description" name="description" class="materialize-textarea">
         			${product.description}
         		</textarea>
         	    <label for="description">Descri��o</label>
            </div>
          </div>
          <div class="row">
	          <c:choose>
	          	<c:when test="${product.active==true}">
	          		<div class="input-field col s6	 m3">
	      				<input type="checkbox" class="filled-in" id="active" name="active" checked/>
	     				<label for="active">Ativo</label>
					</div>
	          	</c:when>
	          	<c:otherwise>
	          	    <div class="input-field col s6	 m3">
	      				<input type="checkbox" class="filled-in" id="active" name="active"/>
	     				<label for="active">Ativo</label>
					</div>
	          	</c:otherwise>
	          </c:choose>
	          
          </div>
          <div class="row">
	        <div class="input-field col s6 m6">
	          <input id="price" name="price"type="number" step="any" class="validate" value="${product.price}">
	          <label for="price">Pre�o</label>
	        </div>
	      </div>
	     <div class="row">
	     	<div class="input-field col s12">
	     	 <button class="btn waves-effect waves-light" type="submit" name="action">Enviar
    			<i class="material-icons right">send</i>
  			 </button>
	     	</div>
	     </div>
	    </form>
	  </div>
	</div>
	<c:import url="../resources/footer.jsp"></c:import>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myjs.js"></script>
</body>
</html>