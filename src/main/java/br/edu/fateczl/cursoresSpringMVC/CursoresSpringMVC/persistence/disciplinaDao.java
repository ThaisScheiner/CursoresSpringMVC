package br.edu.fateczl.cursoresSpringMVC.CursoresSpringMVC.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import br.edu.fateczl.cursoresSpringMVC.CursoresSpringMVC.model.Disciplina;

@Repository
public class disciplinaDao 
{
	private Connection c;
	
	public List<Disciplina> getDisciplinas() throws SQLException,Exception
	{
		return getDisciplinas(48);
	}
	
	public List<Disciplina> getDisciplinas(int codigo) throws SQLException,Exception
	{
		List<Disciplina> disciplinas = new ArrayList<>();
		GenericDao gDao = new GenericDao();
		Connection c = null;
		c = gDao.getConnection();
		
		String query = "SELECT * FROM fn_obterDisciplinasCurso(?)";
		PreparedStatement pstm = c.prepareStatement(query);
		pstm.setInt(1, codigo);
		ResultSet rs = pstm.executeQuery();
		while (rs.next()) 
		{
			Disciplina d = new Disciplina();
			d.setCod_Curso(codigo);
			d.setNome_Curso(rs.getString("nomeCurso"));
			d.setNome_Disc(rs.getString("nomeDisciplina"));
			d.setCod_Disc(rs.getString("codDisciplina"));
			d.setCarga_horaria(rs.getInt("carga_horaria"));
			disciplinas.add(d);
		}
		
		return disciplinas;
	}
}
