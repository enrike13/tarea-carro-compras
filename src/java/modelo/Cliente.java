
package modelo;

public class Cliente {
    private int id; 
    private String nombres;
    private String apellidos;
    private String direccion;
    private String ciudad;
    private String pais;
    private int cpostal;
    private int telefono;
    private String tcredito;
    private String fecha;

    public Cliente() {
    }

    public Cliente(int id, String nombres, String apellidos, String direccion, String ciudad, String pais, int cpostal, int telefono, String tcredito, String fecha) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.pais = pais;
        this.cpostal = cpostal;
        this.telefono = telefono;
        this.tcredito = tcredito;
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "Cliente{" + "id=" + id + ", nombres=" + nombres + ", apellidos=" + apellidos + ", direccion=" + direccion + ", ciudad=" + ciudad + ", pais=" + pais + ", cpostal=" + cpostal + ", telefono=" + telefono + ", tcredito=" + tcredito + ", fecha=" + fecha + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public int getCpostal() {
        return cpostal;
    }

    public void setCpostal(int cpostal) {
        this.cpostal = cpostal;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getTcredito() {
        return tcredito;
    }

    public void setTcredito(String tcredito) {
        this.tcredito = tcredito;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
    
}
