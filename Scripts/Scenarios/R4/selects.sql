--para estudar transacoes
select A1.indexexecution,
(A1.total+A2.total+A3.total+A4.total+A5.total) as total_evaluated,
(A2.total+A3.total+A4.total+A5.total) as total_appr
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R4/result1.csv'
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
from TApprovalDetail A1, TApprovalDetail A2, TApprovalDetail A3,
TApprovalDetail A4, TApprovalDetail A5
where A1.indexexecution=A2.indexexecution and A2.indexexecution=A3.indexexecution 
and A3.indexexecution=A4.indexexecution and A4.indexexecution=A5.indexexecution
and A1.resultapproval=0 and A2.resultapproval=1
and A3.resultapproval=2 and A4.resultapproval=3 and A5.resultapproval=4;


--Para estudar soma
select A1.indexexecution,
(A1.total+A2.total+A3.total+A4.total+A5.total) as total_evaluated,
(A2.total+A3.total+A4.total+A5.total) as total_appr,
CONVERT ((A1.sumtxs+A2.sumtxs+A3.sumtxs+A4.sumtxs+A5.sumtxs), CHAR) as sumtx_total,
CONVERT (A2.sumtxs+A3.sumtxs+A4.sumtxs+A5.sumtxs, CHAR) as sumtx_approved
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R4/resultSum.csv'
FIELDS TERMINATED BY ';\''
LINES TERMINATED BY '\n'
from TApprovalDetail A1, TApprovalDetail A2, TApprovalDetail A3,
TApprovalDetail A4, TApprovalDetail A5
where A1.indexexecution=A2.indexexecution and A2.indexexecution=A3.indexexecution 
and A3.indexexecution=A4.indexexecution and A4.indexexecution=A5.indexexecution
and A1.resultapproval=0 and A2.resultapproval=1
and A3.resultapproval=2 and A4.resultapproval=3 and A5.resultapproval=4;


select indexexecution, agentnumber, TIMEEXECUTION, NEWTRUSTVALUE 
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R4/trustchangesR4.csv'
FIELDS TERMINATED BY ';\''
LINES TERMINATED BY '\n'
from TRUSTCHANGES_SCENARIO4 
order by indexexecution, agentnumber, TIMEEXECUTION;
