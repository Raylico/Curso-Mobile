package View;

import java.util.Scanner;

import Controller.CursoController;
import Model.teacher;
import Model.studant;

public class cursoView {
    // atributos
    teacher jp = new teacher("João Paulo", "123.456.789-10", 1000.00);
    CursoController cursoJava = new CursoController("programação em Java", jp);
    private int operacao;
    private boolean continuar = true;
    Scanner sc = new Scanner(System.in);

    // metódos
    public void menu() {
        while (continuar) {
            System.out.println("==Gerenciamento Curso==");
            System.out.println("|1. Cadastrar Aluno");
            System.out.println("|2. Informações o curso");
            System.out.println("|3. Lançar nota dos alunos");
            System.out.println("|4. Status da turma");
            System.out.println("|5. Sair");
            System.out.println("==Escolha a opção desejada==");
            operacao = sc.nextInt();
            switch (operacao) {
                case 1:
                    studant studant = cadastrarStudant();
                    cursoJava.addStudant(studant);
                    break;
                case 2:
                    cursoJava.showInformations();
                    break;
                case 3:
                    break;
                case 4:
                    break;
                case 5: 
                    System.out.println("Saindo....");
                    continuar = false;
                    break;
                default:
                    System.out.println("Informe uma opção válida");
                    break;

            }
        }
    }
    public studant cadastrarStudant(){
        System.out.println("Digite o nome do aluno: ");
        String nome = sc.next();
        System.out.println("Digite o cpf do aluno: ");
        String cpf = sc.next();
        System.out.println("Digite a matricula do aluno: ");
        String matricula = sc.next();
        return new studant(nome, cpf, matricula);

        
    }

}
