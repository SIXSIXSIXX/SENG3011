package apiv3.Company;

public class CompanyStock {
	private  double pipstemp;
	private  double iniLot;
	private  double incRate;
	private  double maxTrade;
	
	
	
	public CompanyStock(double pipstemp, double iniLot, double incRate, double maxTrade) {
		super();
		this.pipstemp = pipstemp;
		this.iniLot = iniLot;
		this.incRate = incRate;
		this.maxTrade = maxTrade;
	}
	public double getPipstemp() {
		return pipstemp;
	}
	public void setPipstemp(double pipstemp) {
		this.pipstemp = pipstemp;
	}
	public double getIniLot() {
		return iniLot;
	}
	public void setIniLot(double iniLot) {
		this.iniLot = iniLot;
	}
	public double getIncRate() {
		return incRate;
	}
	public void setIncRate(double incRate) {
		this.incRate = incRate;
	}
	public double getMaxTrade() {
		return maxTrade;
	}
	public void setMaxTrade(double maxTrade) {
		this.maxTrade = maxTrade;
	}
	@Override
	public String toString() {
		return "CompanyStock [pipstemp=" + pipstemp + ", iniLot=" + iniLot + ", incRate=" + incRate + ", maxTrade="
				+ maxTrade + "]";
	}

	
}
