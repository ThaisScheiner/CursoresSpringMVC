<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Disciplina</title>
	<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/styles.css" />'>
</head>
<body>
	<form action="/" method = "POST">
		<input type="number" min="0" id="txtCodCurso" name="txtCodCurso" placeholder="Código do curso">
		<input type="submit" id="btn" name="btn" value="Pesquisar">
	</form>
	<c:if test="${not empty disciplinas}">
		<div>
			<table border = "1">
				<thead>
					<tr>
						<th>
							Código Disciplina
						</th>
						<th>
							Nome Disciplina
						</th>
						<th>
							Carga Horária
						</th>
						<th>
							Nome do Curso
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${disciplinas}" var="d">
						<tr>
							<td class="coluna">
								${d.codigoDisciplina}
							</td>
							<td class="coluna">
								${d.nomeDisciplina}
							</td>
							<td class="coluna">
								${d.cargaHorariaDisciplina}
							</td>
							<td class="coluna">
								${d.nomeCurso}
							</td>
						</tr>	
					</c:forEach>				
				</tbody>
			</table>
		</div>
	</c:if>
	<c:if test="${not empty erro}">
		<p>${erro}</p>
	</c:if>
</body>
</html>