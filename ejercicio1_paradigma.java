import java.util.Arrays;
import java.util.List;


public class ejercicio1_paradigma {
    public static class Producto {
      private String nombre;
      private Float precio;
      private Integer stock;
      
      public Producto(String nombre, Float precio, Integer stock){
        this.nombre = nombre;
        this.precio = precio;
        this.stock = stock;
      }
      
        public String getNombre() {return nombre;}
        public Integer getStock() {return stock;}
        public Float getPrecio() {return precio;}
      
    }
  
    public static void main(String[] args) {
        List <Producto> lista = Arrays.asList(
        new Producto("Azucar Negra", 500f, 20),
        new Producto("Azucar", 400f, 80),
        new Producto("Cafe Tostado", 1500f, 50),
        new Producto("Yerba Mate", 1800f, 150),
        new Producto("Cafe Torrado", 2100f, 40)); 
        lista.stream().filter(x -> x.getStock() > 10).findFirst().ifPresent(x -> 
        System.out.println(x.getNombre()));
        System.out.println( lista.stream().count() );
        System.out.println(lista.stream().filter(x -> x.getStock() == 0).count());
        System.out.println(lista.stream().filter(x -> x.getNombre().contains("Cafe")) .count());
        lista.stream().map(x -> x.getPrecio()).reduce(Float::min).ifPresent(System.out::println);
    }
}
