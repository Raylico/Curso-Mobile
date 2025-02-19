package Model;
//ha a necessidade de dizer de qual pasta ele esta "puxando"
public class studant extends person {
    //atributos
    private String registration;
    private double grade;
    //metódos
    //construtor
    public studant(String name, String cpf, String registration){
        super(name, cpf);
        this.registration = registration;
    }
    //getters e setters
    public String getRegistration(){
        return registration;
    }
    public void setRegistration(String registration){
        this.registration = registration;
    }
    public double getgrade(){
        return grade;
    }
    public void setgrade(double grade){
        this.grade = grade;
    }

    @Override
    public void exibirinformações(){
        super.exibirinformações();
        System.out.println("Matricula: " + registration);
        System.out.println("Nota: " + grade);
    }
}
