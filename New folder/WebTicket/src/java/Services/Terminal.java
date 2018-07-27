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
public class Terminal {

    private int terminaL_id, SerialNumber, MCC;
    private String model, condition, Status, Currency, TClass;
    private boolean sale, OnlineReturned, OffLineReturned, OfflineSale, OnlineVoid, OffLineVoid,
            Preauth, Amex, instatiment, prepainSerives, Diners, Permuim, ManualEntry;
    private int storeId, merchantId;
    private int sim1,sim2;

    /**
     * @return the terminaL_id
     */
    public int getTerminaL_id() {
        return terminaL_id;
    }

    /**
     * @param terminaL_id the terminaL_id to set
     */
    public void setTerminaL_id(int terminaL_id) {
        this.terminaL_id = terminaL_id;
    }

    /**
     * @return the SerialNumber
     */
    public int getSerialNumber() {
        return SerialNumber;
    }

    /**
     * @param SerialNumber the SerialNumber to set
     */
    public void setSerialNumber(int SerialNumber) {
        this.SerialNumber = SerialNumber;
    }

    /**
     * @return the MCC
     */
    public int getMCC() {
        return MCC;
    }

    /**
     * @param MCC the MCC to set
     */
    public void setMCC(int MCC) {
        this.MCC = MCC;
    }

    /**
     * @return the model
     */
    public String getModel() {
        return model;
    }

    /**
     * @param model the model to set
     */
    public void setModel(String model) {
        this.model = model;
    }

    /**
     * @return the condition
     */
    public String getCondition() {
        return condition;
    }

    /**
     * @param condition the condition to set
     */
    public void setCondition(String condition) {
        this.condition = condition;
    }

    /**
     * @return the Status
     */
    public String getStatus() {
        return Status;
    }

    /**
     * @param Status the Status to set
     */
    public void setStatus(String Status) {
        this.Status = Status;
    }

    /**
     * @return the Currency
     */
    public String getCurrency() {
        return Currency;
    }

    /**
     * @param Currency the Currency to set
     */
    public void setCurrency(String Currency) {
        this.Currency = Currency;
    }

    /**
     * @return the Class
     */
    /**
     * @return the TClass
     */
    public String getTClass() {
        return TClass;
    }

    /**
     * @param TClass the TClass to set
     */
    public void setTClass(String TClass) {
        this.TClass = TClass;
    }

    /**
     * @return the sale
     */
    public boolean isSale() {
        return sale;
    }

    /**
     * @param sale the sale to set
     */
    public void setSale(boolean sale) {
        this.sale = sale;
    }

    /**
     * @return the OnlineReturned
     */
    public boolean isOnlineReturned() {
        return OnlineReturned;
    }

    /**
     * @param OnlineReturned the OnlineReturned to set
     */
    public void setOnlineReturned(boolean OnlineReturned) {
        this.OnlineReturned = OnlineReturned;
    }

    /**
     * @return the OffLineReturned
     */
    public boolean isOffLineReturned() {
        return OffLineReturned;
    }

    /**
     * @param OffLineReturned the OffLineReturned to set
     */
    public void setOffLineReturned(boolean OffLineReturned) {
        this.OffLineReturned = OffLineReturned;
    }

    /**
     * @return the OfflineSale
     */
    public boolean isOfflineSale() {
        return OfflineSale;
    }

    /**
     * @param OfflineSale the OfflineSale to set
     */
    public void setOfflineSale(boolean OfflineSale) {
        this.OfflineSale = OfflineSale;
    }

    /**
     * @return the OnlineVoid
     */
    public boolean isOnlineVoid() {
        return OnlineVoid;
    }

    /**
     * @param OnlineVoid the OnlineVoid to set
     */
    public void setOnlineVoid(boolean OnlineVoid) {
        this.OnlineVoid = OnlineVoid;
    }

    /**
     * @return the OffLineVoid
     */
    public boolean isOffLineVoid() {
        return OffLineVoid;
    }

    /**
     * @param OffLineVoid the OffLineVoid to set
     */
    public void setOffLineVoid(boolean OffLineVoid) {
        this.OffLineVoid = OffLineVoid;
    }

    /**
     * @return the Preauth
     */
    public boolean isPreauth() {
        return Preauth;
    }

    /**
     * @param Preauth the Preauth to set
     */
    public void setPreauth(boolean Preauth) {
        this.Preauth = Preauth;
    }

    /**
     * @return the Amex
     */
    public boolean isAmex() {
        return Amex;
    }

    /**
     * @param Amex the Amex to set
     */
    public void setAmex(boolean Amex) {
        this.Amex = Amex;
    }

    /**
     * @return the instatiment
     */
    public boolean isInstatiment() {
        return instatiment;
    }

    /**
     * @param instatiment the instatiment to set
     */
    public void setInstatiment(boolean instatiment) {
        this.instatiment = instatiment;
    }

    /**
     * @return the prepainSerives
     */
    public boolean isPrepainSerives() {
        return prepainSerives;
    }

    /**
     * @param prepainSerives the prepainSerives to set
     */
    public void setPrepainSerives(boolean prepainSerives) {
        this.prepainSerives = prepainSerives;
    }

    /**
     * @return the Diners
     */
    public boolean isDiners() {
        return Diners;
    }

    /**
     * @param Diners the Diners to set
     */
    public void setDiners(boolean Diners) {
        this.Diners = Diners;
    }

    /**
     * @return the Permuim
     */
    public boolean isPermuim() {
        return Permuim;
    }

    /**
     * @param Permuim the Permuim to set
     */
    public void setPermuim(boolean Permuim) {
        this.Permuim = Permuim;
    }

    /**
     * @return the ManualEntry
     */
    public boolean isManualEntry() {
        return ManualEntry;
    }

    /**
     * @param ManualEntry the ManualEntry to set
     */
    public void setManualEntry(boolean ManualEntry) {
        this.ManualEntry = ManualEntry;
    }

    /**
     * @return the storeId
     */
    public int getStoreId() {
        return storeId;
    }

    /**
     * @param storeId the storeId to set
     */
    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    /**
     * @return the merchantId
     */
    public int getMerchantId() {
        return merchantId;
    }

    /**
     * @param merchantId the merchantId to set
     */
    public void setMerchantId(int merchantId) {
        this.merchantId = merchantId;
    }

   

    /**
     * @return the sim1
     */
    public int getSim1() {
        return sim1;
    }

    /**
     * @param sim1 the sim1 to set
     */
    public void setSim1(int sim1) {
        this.sim1 = sim1;
    }

    /**
     * @return the sim2
     */
    public int getSim2() {
        return sim2;
    }

    /**
     * @param sim2 the sim2 to set
     */
    public void setSim2(int sim2) {
        this.sim2 = sim2;
    }

}
