Init Verifier
-------------

if (get_Main().ConsiderDispositionalTrust) {
	TotalToAddDueToDT = get_Main().MultiAdditionalDispositionalTrust * this.DispositionalTrustScore;

	traceToDB("From KYC Verifier " + this.getId() + ": Dispositional Trust Score=" + this.DispositionalTrustScore + ", TotalToAdd=" + this.TotalToAddDueToDT);
	
}


Evaluating Text:
-----------------

this.currentBasicUser = msg;

TotalTxBasicUsersAnalyzed++;
double localTotalToAddDueToDT = 0;

if (this.currentBasicUser.TxAmount<get_Main().MaxValueToApplyDispositionalTrust) {
	localTotalToAddDueToDT = TotalToAddDueToDT;
}
//maior or igual --- FIXME
if(this.currentBasicUser.getInitialTrustValue()>this.currentBasicUser.TotalRiskTxValue) {
	TotalTxBasicUsersApproved++;
	SumTxApproved += this.currentBasicUser.TxAmount;
}

if(this.currentBasicUser.TotalTrustValue+localTotalToAddDueToDT>this.currentBasicUser.TotalRiskTxValue) {
	TotalTxBasicUsersApprovedDinamically++;
	SumTxApprovedDinamically += this.currentBasicUser.TxAmount;
	this.Result = "accepted";
}else {
	this.Result = "notAccepted";
}

Exit action: send(this.Result, this.currentBasicUser);