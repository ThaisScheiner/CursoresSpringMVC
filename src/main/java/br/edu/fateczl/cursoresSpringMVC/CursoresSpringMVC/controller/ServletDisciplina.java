package br.edu.fateczl.cursoresSpringMVC.CursoresSpringMVC.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.cursoresSpringMVC.CursoresSpringMVC.model.Disciplina;
import br.edu.fateczl.cursoresSpringMVC.CursoresSpringMVC.persistence.disciplinaDao;

@Controller
public class ServletDisciplina 
{
	@Autowired
	disciplinaDao dDao;
	
	List<Disciplina> disciplinas = new ArrayList<>();
	String erro = "";
	@RequestMapping(name = "obterPrimeiroCurso", value = "/index", method = RequestMethod.GET)
    public ModelAndView init(ModelMap model) throws ServletException, IOException 
	{
		disciplinas = obterCurso(0);
    	return retorno(model,"index");
	}
	
	@RequestMapping(name = "obterCurso", value = "/", method = RequestMethod.POST)
	public ModelAndView doPost(@RequestParam Map<String, String> params,ModelMap model) throws ServletException, IOException 
	{
		String cod = params.get("txtCodCurso");
		int codigo = Integer.parseInt(cod);
		disciplinas = obterCurso(codigo);
    	return retorno(model,"index");
	}
	
	protected ModelAndView retorno(ModelMap model,String pagina) throws ServletException, IOException
	{
		model.addAttribute("disciplinas", disciplinas);
		model.addAttribute("erro",erro);
		return new ModelAndView(pagina);
	}
	
	private List<Disciplina> obterCurso(int cod)
	{
		List<Disciplina> c = new ArrayList<>();
		disciplinaDao dDao = new disciplinaDao();
		try 
		{
			if(cod == 0) 
			{
				c = dDao.getDisciplinas();
			}
			else 
			{
				c = dDao.getDisciplinas(cod);
			}			
		} 
		
		catch (SQLException e) 
		{
			erro = e.getMessage();
		} 
		catch (Exception e) 
		{
			erro = e.getMessage();
		}
		return c;
	}
}

