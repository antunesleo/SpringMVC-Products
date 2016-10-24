<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>Lista de produtos</title>
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
	<c:import url="../resources/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col s12 m12">
				<br />
				<a href="newProduct" class="waves-effect waves-light btn"><i class="material-icons left">input</i>Nova tarefa</a>
			</div>
		</div>
		<div class="row">
			<div class="col s12 m12">
				<table class="bordered striped responsive-table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Descri��o</th>
							<th>Nome</th>
							<th>Und. por pallet</th>
							<th>Dias de garantia</th>
							<th>Und. de medida</th>
							<th>Vendido</th>
							<th>Discontinuado</th>
							<th>Manufaturado</th>
							<th>Active</th>
							<th>Pre�o</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${products}" var="product">
						<tr>
							<td>${product.id}</td>
							<td>${product.description}</td>
							<td>${product.name}</td>
							<td>${product.untPerPallet}</td>
							<td>${product.guaranteeDays}</td>
							<td>${product.uom}</td>
							<c:if test="${product.sold eq false}">
								<td>N�o</td>
							</c:if>
							<c:if test="${product.sold eq true }">
								<td>Sim</td>
							</c:if>
							<c:if test="${product.discontinued eq false}">
								<td>N�o</td>
							</c:if>
							<c:if test="${product.discontinued eq true }">
								<td>Sim</td>
							</c:if>
							<c:if test="${product.manufactured eq false}">
								<td>N�o</td>
							</c:if>
							<c:if test="${product.manufactured eq true }">
								<td>Sim</td>
							</c:if>
							<c:if test="${product.active eq false}">
								<td>N�o</td>
							</c:if>
							<c:if test="${product.active eq true }">
								<td>Sim</td>
							</c:if>
							
							<td>${product.price}</td>
							<td><a href="showProduct?id=${product.id}"><i class="material-icons left">edit</i></a></td>
							<td><a href="removeProduct?id=${product.id}"><i class="material-icons left">delete</i></a></td>
						</tr>	
					</c:forEach>
					</tbody>
			
				</table>
			</div>
		</div>
	</div>
	<c:import url="../resources/footer.jsp"></c:import>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
</body>
</html>