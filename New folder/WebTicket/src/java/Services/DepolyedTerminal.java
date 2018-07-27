/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

/**
 *
 * @author shimaa
 */
public class DepolyedTerminal {
    private int TID, MID, Sim1,Sim2, TerSerial;
    private String Merchant,op1,op2;

 

    /**
     * @return the TID
     */
    public int getTID() {
        return TID;
    }

    /**
     * @param TID the TID to set
     */
    public void setTID(int TID) {
        this.TID = TID;
    }

    /**
     * @return the MID
     */
    public int getMID() {
        return MID;
    }

    /**
     * @param MID the MID to set
     */
    public void setMID(int MID) {
        this.MID = MID;
    }

    /**
     * @return the Sim1
     */
    public int getSim1() {
        return Sim1;
    }

    /**
     * @param Sim1 the Sim1 to set
     */
    public void setSim1(int Sim1) {
        this.Sim1 = Sim1;
    }

    /**
     * @return the Sim2
     */
    public int getSim2() {
        return Sim2;
    }

    /**
     * @param Sim2 the Sim2 to set
     */
    public void setSim2(int Sim2) {
        this.Sim2 = Sim2;
    }

    /**
     * @return the TerSerial
     */
    public int getTerSerial() {
        return TerSerial;
    }

    /**
     * @param TerSerial the TerSerial to set
     */
    public void setTerSerial(int TerSerial) {
        this.TerSerial = TerSerial;
    }

    /**
     * @return the Merchant
     */
    public String getMerchant() {
        return Merchant;
    }

    /**
     * @param Merchant the Merchant to set
     */
    public void setMerchant(String Merchant) {
        this.Merchant = Merchant;
    }

    /**
     * @return the op1
     */
    public String getOp1() {
        return op1;
    }

    /**
     * @param op1 the op1 to set
     */
    public void setOp1(String op1) {
        this.op1 = op1;
    }

    /**
     * @return the op2
     */
    public String getOp2() {
        return op2;
    }

    /**
     * @param op2 the op2 to set
     */
    public void setOp2(String op2) {
        this.op2 = op2;
    }
}
