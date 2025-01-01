--para estudar transacoes
select A1.indexexecution,
(A1.total+A2.total+A3.total) as total_evaluated,
(A2.total+A3.total) as total_appr,
CONVERT ((A1.sumtxs+A2.sumtxs+A3.sumtxs), CHAR) as sumtx_total,
CONVERT (A2.sumtxs+A3.sumtxs, CHAR) as sumtx_approved
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R2/result2.csv'
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
from TApprovalDetail A1, TApprovalDetail A2, TApprovalDetail A3
where A1.indexexecution=A2.indexexecution and A2.indexexecution=A3.indexexecution 
and A1.resultapproval=0 and A2.resultapproval=1
and A3.resultapproval=2;


--Para estudar soma
select A1.indexexecution,
(A1.total+A2.total+A3.total) as total_evaluated,
(A2.total+A3.total) as total_appr,
CONVERT ((A1.sumtxs+A2.sumtxs+A3.sumtxs), CHAR) as sumtx_total,
CONVERT (A2.sumtxs+A3.sumtxs, CHAR) as sumtx_approved
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R2/result3.csv'
FIELDS TERMINATED BY ';\''
LINES TERMINATED BY '\n'
from TApprovalDetail A1, TApprovalDetail A2, TApprovalDetail A3
where A1.indexexecution=A2.indexexecution and A2.indexexecution=A3.indexexecution 
and A1.resultapproval=0 and A2.resultapproval=1
and A3.resultapproval=2;

