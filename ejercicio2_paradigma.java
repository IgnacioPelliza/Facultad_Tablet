public class ejercicio2_paradigma {
    public static class frecuente {
      private Integer num;
      private String dni;
      private String nom;
      private String apellido;
      private Integer millas;
      
      public frecuente(Integer num, String dni, String nom, String apellido, Integer millas) {
        this.num = num;
        this.dni = dni;
        this.nom = nom;
        this.apellido = apellido;
        this.millas = millas;
      }
      public Integer getMillas() {return millas;}
      public Integer getNum() {return num;}
      public String getDNI() {return dni;}
      public String getNom() {return nom;}
      public String getApellido() {return apellido;}
      
    } 
    public static void main(String[] args) {
        System.out.println("Probando ejercicio2_paradigma");
    }
}
