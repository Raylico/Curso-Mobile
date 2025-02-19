package Model;

public class teacher extends person{
    private double salary;

    public teacher(String name, String cpf, double salary){
        super(name, cpf);
        this.salary = salary;
    }
    public double getSalary(){
        return salary;
    }
    public void setSalary(double salary){
        this.salary = salary;
    }
    @Override
    public void exibirinformações(){
        super.exibirinformações();
        System.out.println("Salary: " + salary);
    }
}
