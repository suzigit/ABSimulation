select A1.indexexecution,  
(A1.total+A2.total) as total_evaluated,
(A2.total) as total_apprstatic,
(A1.sumtxs+A2.sumtxs) as sumtx_total,
(A2.sumtxs) as sumtx_static
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R1/result.csv'
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
from TApprovalDetail A1, TApprovalDetail A2
where A1.indexexecution=A2.indexexecution and A1.resultapproval=0 and A2.resultapproval=1;


--para estudar transacoes
select A1.indexexecution,  
(A1.total+A2.total) as total_evaluated,
(A2.total) as total_apprstatic,
CONVERT ((A1.sumtxs+A2.sumtxs), CHAR) as sumtx_total,
CONVERT (A2.sumtxs, CHAR) as sumtx_static
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R1/result2.csv'
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
from TApprovalDetail A1, TApprovalDetail A2
where A1.indexexecution=A2.indexexecution and A1.resultapproval=0 and A2.resultapproval=1;


--Para estudar soma
select A1.indexexecution,  
(A1.total+A2.total) as total_evaluated,
(A2.total) as total_apprstatic,
CONVERT ((A1.sumtxs+A2.sumtxs), CHAR) as sumtx_total,
CONVERT (A2.sumtxs, CHAR) as sumtx_static
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R1/result2.csv'
FIELDS TERMINATED BY ';\''
LINES TERMINATED BY '\n'
from TApprovalDetail A1, TApprovalDetail A2
where A1.indexexecution=A2.indexexecution and A1.resultapproval=0 and A2.resultapproval=1;

//usei? awk '{gsub(/'\''/, ""); print}' result2.csv > result3.csv


DO NOT FORGET OF SAVING AS XLS TO KEEP FORMULAS
--------



select A1.indexexecution,  
(A1.total+A2.total) as total_evaluated,
(A2.total) as total_apprstatic,
CONVERT ((A1.sumtxs+A2.sumtxs), CHAR) as sumtx_total,
CONVERT (A2.sumtxs, CHAR) as sumtx_static
from TApprovalDetail A1, TApprovalDetail A2
where A1.indexexecution=A2.indexexecution and A1.resultapproval=0 and A2.resultapproval=1;






select A1.indexexecution,  
(A1.total+A2.total) as total_evaluated,
(A2.total) as total_apprstatic,
(A1.sumtxs+A2.sumtxs) as sumtx_total,
(A2.sumtxs) as sumtx_static
from TApprovalDetail A1, TApprovalDetail A2
where A1.indexexecution=A2.indexexecution and A1.resultapproval=0 and A2.resultapproval=1;

select A1.indexexecution,  
(A1.total+A2.total) as total_evaluated,
(A2.total) as total_apprstatic,
(A1.sumtxs+A2.sumtxs) as sumtx_total,
(A2.sumtxs) as sumtx_static
INTO OUTFILE '/var/lib/mysql-files/result.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
from TApprovalDetail A1, TApprovalDetail A2
where A1.indexexecution=A2.indexexecution and A1.resultapproval=0 and A2.resultapproval=1;




SELECT order_id,product_name,qty
INTO OUTFILE '/var/lib/mysql-files/orders.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM orders
WHERE foo = 'bar';




select A1.indexexecution, A1.total as total_0, A1.resultapproval as resultapproval_0, 
A2.total as total_1, A2.resultapproval as resultapproval_1, 
A3.total as total_2, A3.resultapproval as resultapproval_2, 
A4.total as total_3, A4.resultapproval as resultapproval_3, 
A5.total as total_4, A5.resultapproval as resultapproval_4,
(A1.total+A2.total+A3.total+A4.total+A5.total) as total_evaluated,
(A2.total) as total_apprstatic,
(A3.total) as total_apprtrustvalue,
(A4.total) as total_apprdispostrust,
(A5.total) as total_apprboth,
(A3.total+A4.total+A5.total) as total_ADDEDapprs,
CAST (A2.total as float)*100/(A1.total+A2.total+A3.total+A4.total+A5.total) as percent_apprstatic,
CAST ( (A2.total+A3.total+A4.total+A5.total) as float ) *100/(A1.total+A2.total+A3.total+A4.total+A5.total) as percent_ADDEDapprs,
CAST ( (A3.total+A4.total+A5.total) as float ) *100/(A1.total+A2.total+A3.total+A4.total+A5.total) as percent_ADDEDnewapprs,
CAST ( (A2.total+A3.total) as float ) *100/(A1.total+A2.total+A3.total+A4.total+A5.total) as percent_ADDED_TV_apprs,
CAST ( (A2.total+A4.total) as float ) *100/(A1.total+A2.total+A3.total+A4.total+A5.total) as percent_ADDED_DT_apprs,
CAST ( (A2.total+A5.total) as float ) *100/(A1.total+A2.total+A3.total+A4.total+A5.total) as percent_ADDED_TVandDT_apprs,

(A1.sumtxs+A2.sumtxs+A3.sumtxs+A4.sumtxs+A5.sumtxs) as sumtx_total,
(A2.sumtxs) as sumtx_static,
(A3.sumtxs+A4.sumtxs+A5.sumtxs) as sumtx_ADDEDapprs

from TApprovalDetail A1, TApprovalDetail A2, TApprovalDetail A3, TApprovalDetail A4, TApprovalDetail A5 
where A1.indexexecution=A2.indexexecution and A2.indexexecution=A3.indexexecution and A3.indexexecution=A4.indexexecution and A4.indexexecution=A5.indexexecution
and A1.resultapproval=0 and A2.resultapproval=1 and A3.resultapproval=2 and A4.resultapproval=3 and A5.resultapproval=4;
