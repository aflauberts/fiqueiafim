<?
//CONECTA AO MYSQL
require_once("conexao.php");

//RECEBE PARÃMETRO                     
$pEstado = $_POST["estado"];           

//QUERY  
$sql = " 
       SELECT a.id_cidade, a.dsc_cidade    
        FROM  cidades a                    
		WHERE a.cod_estado = ".$pEstado."  
		ORDER BY a.dsc_cidade";            

//EXECUTA A QUERY               
$sql = mysql_query($sql);       

$row = mysql_num_rows($sql);    

//VERIFICA SE VOLTOU ALGO 
if($row) {                
   //XML
   $xml  = "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n";
   $xml .= "<cidades>\n";               
   
   //PERCORRE ARRAY            
   for($i=0; $i<$row; $i++) {  
      $codigo    = mysql_result($sql, $i, "id_cidade"); 
	  $descricao = mysql_result($sql, $i, "dsc_cidade");
      $xml .= "<cidade>\n";     
      $xml .= "<codigo>".$codigo."</codigo>\n";                  
      $xml .= "<descricao>".ucfirst(strtolower($descricao))."</descricao>\n";         
      $xml .= "</cidade>\n";    
   }//FECHA FOR                 
   
   $xml.= "</cidades>\n";
   
   //CABEÇALHO
   Header("Content-type: application/xml; charset=iso-8859-1"); 
}//FECHA IF (row)                                               

//PRINTA O RESULTADO  
echo $xml;            
?>
