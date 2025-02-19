package Controller;

import java.util.ArrayList;
import java.util.List;

import Model.studant;
import Model.teacher;

public class CursoController {
    //atributos
    private String nomeCurso;
    private Model.teacher teacher;
    private List<studant> studantslist;
    //construtor
    public CursoController(String nomeCurso, teacher teacher){
        this.nomeCurso = nomeCurso;
        this.teacher = teacher;
        this.studantslist = new ArrayList<>();
    }
    //adicionar alunos (crud/create)
    public void addStudant(studant studant){
        studantslist.add(studant);
    }
    //exibir informações (read)
    public void showInformations(){
        System.out.println("Nome do curso: " + nomeCurso);
        System.out.println("Professor: " + teacher.getName());
        System.out.println("=============================");
        int contador = 0;
        for(studant studant : studantslist){
            contador++;
            System.out.println(contador+" . "+studant.getName());
        }
        System.out.println("==========================");
    }

}
