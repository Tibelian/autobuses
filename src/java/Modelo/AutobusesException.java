
package Modelo;

public class AutobusesException extends Exception {
    
    private int code;
    
    public AutobusesException(int code, String message){
        super(message);
        this.code = code;
    }
    
    public void setCode(int code){
        this.code = code;
    }
    public int getCode(){
        return code;
    }
    
}
