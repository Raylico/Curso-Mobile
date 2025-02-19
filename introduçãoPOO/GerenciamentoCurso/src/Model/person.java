package Model;
//classe abstrata

public abstract class person {
    //atributos(encapsulamento)

    private String name;
    private String cpf;  
    //metódos

    public person(String name, String cpf){
        this.name = name;
        this.cpf = cpf;
    }
//getters e setters
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name = name;
    }
    public String getCpf(){
        return cpf;
    }
    public void setCpf(String cpf){
        this.cpf = cpf;
    }
    //exibir informações
    public void exibirinformações(){
        System.out.println("Nome: " + name);
        System.out.println("CPF: " + cpf);
    }
}
