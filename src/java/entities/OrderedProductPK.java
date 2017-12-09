/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author james
 */
@Embeddable
public class OrderedProductPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "customer_order_orderid")
    private int customerOrderOrderid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "product_productid")
    private int productProductid;

    public OrderedProductPK() {
    }

    public OrderedProductPK(int customerOrderOrderid, int productProductid) {
        this.customerOrderOrderid = customerOrderOrderid;
        this.productProductid = productProductid;
    }

    public int getCustomerOrderOrderid() {
        return customerOrderOrderid;
    }

    public void setCustomerOrderOrderid(int customerOrderOrderid) {
        this.customerOrderOrderid = customerOrderOrderid;
    }

    public int getProductProductid() {
        return productProductid;
    }

    public void setProductProductid(int productProductid) {
        this.productProductid = productProductid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) customerOrderOrderid;
        hash += (int) productProductid;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderedProductPK)) {
            return false;
        }
        OrderedProductPK other = (OrderedProductPK) object;
        if (this.customerOrderOrderid != other.customerOrderOrderid) {
            return false;
        }
        if (this.productProductid != other.productProductid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.OrderedProductPK[ customerOrderOrderid=" + customerOrderOrderid + ", productProductid=" + productProductid + " ]";
    }
    
}
