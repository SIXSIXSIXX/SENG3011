package apiv3.strategy;



public class State {
	private double changeLot = 0;
	private double changePoint = Double.NaN;
	private double singleProfit = 0;
	private double totalProfit = 0;
	private double investedCaptail = 0;
	private double remainLots = 0;
	private double macd = 0;
	private double breakEvenPoint = 0;
	
	
	public State() {
	}
	public double getChangeLot() {
		return changeLot;
	}
	public void setChangeLot(double changeLot) {
		this.changeLot = changeLot;
	}
	public double getChangePoint() {
		return changePoint;
	}
	public void setChangePoint(double changePoint) {
		this.changePoint = changePoint;
	}
	public double getSingleProfit() {
		return singleProfit;
	}
	public void setSingleProfit(double singleProfit) {
		this.singleProfit = singleProfit;
	}
	public double getTotalProfit() {
		return totalProfit;
	}
	public void setTotalProfit(double totalProfit) {
		this.totalProfit = totalProfit;
	}

	public double getRemainLots() {
		return remainLots;
	}
	public void setRemainLots(double remainLots) {
		this.remainLots = remainLots;
	}
	public double getBreakEvenPoint() {
		return breakEvenPoint;
	}
	public void setBreakEvenPoint(double breakEvenPoint) {
		this.breakEvenPoint = breakEvenPoint;
	}

	public double getInvestedCaptail() {
		return investedCaptail;
	}
	public void setInvestedCaptail(double investedCaptail) {
		this.investedCaptail = investedCaptail;
	}
	public double getMacd() {
		return macd;
	}
	public void setMacd(double macd) {
		this.macd = macd;
	}
	@Override
	public String toString() {
		return "State [changeLot=" + changeLot + ", changePoint=" + changePoint + ", singleProfit=" + singleProfit
				+ ", totalProfit=" + totalProfit + ", investedCaptail=" + investedCaptail + ", remainLots=" + remainLots
				+ ", macd=" + macd + ", breakEvenPoint=" + breakEvenPoint + "]";
	}
	


	
	
}
