package br.edu.fateczl.cursoresSpringMVC.CursoresSpringMVC.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Disciplina 
{
	private  int cod_Curso;
	private String nome_Curso;
	private String cod_Disc;
	private String nome_Disc;
	private int carga_horaria;
	
	
}
