package Aril.Model;

public class Order {
    private int id;
    private String nota;
    private String customerName;
    private int total;
    private String status;

    private String paymentMethod;
    private Integer amountPaid;
    private String receiverName;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNota() { return nota; }
    public void setNota(String nota) { this.nota = nota; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public int getTotal() { return total; }
    public void setTotal(int total) { this.total = total; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public Integer getAmountPaid() { return amountPaid; }
    public void setAmountPaid(Integer amountPaid) { this.amountPaid = amountPaid; }

    public String getReceiverName() { return receiverName; }
    public void setReceiverName(String receiverName) { this.receiverName = receiverName; }
}
