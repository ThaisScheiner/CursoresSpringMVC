package br.edu.fateczl.cursoresSpringMVC.CursoresSpringMVC;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/index")
public class IndexController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

    public IndexController() 
    {
        super();
    }
}
