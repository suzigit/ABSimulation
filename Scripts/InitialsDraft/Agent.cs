Init:
-----
TotalTrustValue = this.getInitialTrustValue();
LastUpdateTrustValue = time();


TXCreation:
-----------

this.TxAmount = normal(this.MinTxValue,this.MaxTxValue,this.MeanTxValue,this.StDevTxValue);

this.TotalRiskTxValue = this.calculateTotalRiskValue();

if (get_Main().ConsiderUpdateTrustScore 
  && (this.NumberOfTimesIncreasedTotalTrust < get_Main().MaxNumberOfTimesToIncreaseTotalTrust)) {

	this.updateTrustValue();
}

KYCVerifier kycVerifierToGo = main.kYCVerifiers.random();
traceToDB("From agent " + this.getId() + ": Tx amount=" + this.TxAmount + ", risk tx value=" + this.TotalRiskTxValue + ", total trust value=" + this.TotalTrustValue +  ", kyc verifier to go=" + kycVerifierToGo.getId());

send(this, kycVerifierToGo);


ACCEPTED:
---------
if (this.TotalRiskTxValue > this.ReceivedKycVerifierTrustValue) {
	this.ReceivedKycVerifierTrustValue = this.TotalRiskTxValue;	
	traceToDB("## Update ReceivedKycVerifierTrustValue From agent " + this.getId() + ": " + this.ReceivedKycVerifierTrustValue);
}



UPDATE TRUST VALUE:
-------------------

double increaseFactorDueToTime = get_Main().IncreaseFactorDueToTime;//% to increase
int numberOfDaysToIncreaseFactor = get_Main().NumberOfDaysToIncreaseFactor;

double currentTime = time();
double days = differenceInCalendarUnits(DAY, LastUpdateTrustValue, currentTime);

//change state due time
if (days > numberOfDaysToIncreaseFactor) {

	double increasedValueKycCompliance = this.ReceivedKycVerifierTrustValue*(1+increaseFactorDueToTime/100); 
	double increasedValueTotalTrust = this.TotalTrustValue*(1+increaseFactorDueToTime/100);
		
//FIXME
	this.TotalTrustValue = Math.min(increasedValueTotalTrust,increasedValueKycCompliance);
	this.LastUpdateTrustValue = time();
	this.NumberOfTimesIncreasedTotalTrust++;
	
	traceToDB("** updating trust due to time => From agent " + this.getId() + ": this.TotalTrustValue=" + this.TotalTrustValue+ ", time=" + this.time());
	
}


CALCULATE RISK VALUE:
--------------------
if (this.TxAmount == 0) {
	return 40;//0
}
if (this.TxAmount > 400) {
	return 100;
}
return (3*this.TxAmount)/20+40;



GETInitialtrustvalue:
---------------------

return this.KycFixedCertificateScore;