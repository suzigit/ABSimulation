--para estudar transacoes
select A1.indexexecution,
(A1.total+A2.total+A3.total) as total_evaluated,
(A2.total+A3.total) as total_appr,
CONVERT ((A1.sumtxs+A2.sumtxs+A3.sumtxs), CHAR) as sumtx_total,
CONVERT (A2.sumtxs+A3.sumtxs, CHAR) as sumtx_approved
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R3/result1.csv'
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
from TApprovalDetail A1, TApprovalDetail A2, TApprovalDetail A3
where A1.indexexecution=A2.indexexecution and A2.indexexecution=A3.indexexecution 
and A1.resultapproval=0 and A2.resultapproval=1
and A3.resultapproval=3;


--Para estudar soma
select A1.indexexecution,
(A1.total+A2.total+A3.total) as total_evaluated,
(A2.total+A3.total) as total_appr,
CONVERT ((A1.sumtxs+A2.sumtxs+A3.sumtxs), CHAR) as sumtx_total,
CONVERT (A2.sumtxs+A3.sumtxs, CHAR) as sumtx_approved
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R3/resultSum.csv'
FIELDS TERMINATED BY ';\''
LINES TERMINATED BY '\n'
from TApprovalDetail A1, TApprovalDetail A2, TApprovalDetail A3
where A1.indexexecution=A2.indexexecution and A2.indexexecution=A3.indexexecution 
and A1.resultapproval=0 and A2.resultapproval=1
and A3.resultapproval=3;

---

select indexexecution, verifiernumber, count(*) 
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R3/verifiers.csv'
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
from APPROVALTXS_SCENARIO3 group by indexexecution, verifiernumber order by indexexecution, verifiernumber

existem 150 dispositional trust para 150 verifiers. --select count(distinct adddispositionaltrust) from APPROVALTXS_SCENARIO3;


-- ordena os verifiers pelo adddispositional trust, para comparar o count
select indexexecution, verifiernumber, adddispositionaltrust, count(*)
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R3/resultverifierorder.csv'
FIELDS TERMINATED BY ';\''
LINES TERMINATED BY '\n'
from APPROVALTXS_SCENARIO3
where resultapproval=3
group by indexexecution, verifiernumber,  adddispositionaltrust
order by adddispositionaltrust;

