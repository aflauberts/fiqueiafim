<?
//CONECTA AO MYSQL
require_once("conexao.php");

//PEGA OS ESTADOS 
$sql = "          
        SELECT a.id_estado, a.dsc_estado, a.sigl_estado 
        FROM estados a          
		ORDER BY a.dsc_estado"; 

//EXECUTA A QUERY               
$sql = mysql_query($sql);       

$row = mysql_num_rows($sql); ?>

<script language="JavaScript">

   function Dados(valor) {
      //verifica se o browser tem suporte a ajax
	  try {
         ajax = new ActiveXObject("Microsoft.XMLHTTP");
      } 
      catch(e) {
         try {
            ajax = new ActiveXObject("Msxml2.XMLHTTP");
         }
	     catch(ex) {
            try {
               ajax = new XMLHttpRequest();
            }
	        catch(exc) {
               alert("Esse browser não tem recursos para uso do Ajax");
               ajax = null;
            }
         }
      }
	  //se tiver suporte ajax
	  if(ajax) {
	     //deixa apenas o elemento 1 no option, os outros são excluídos
		 document.forms[0].listCidades.options.length = 1;
	     
		 idOpcao  = document.getElementById("opcoes");
		 
	     ajax.open("POST", "cidades.php", true);
		 ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		 
		 ajax.onreadystatechange = function() {
            //enquanto estiver processando...emite a msg de carregando
			if(ajax.readyState == 1) {
			   idOpcao.innerHTML = "Carregando...!";   
	        }
			//após ser processado - chama função processXML que vai varrer os dados
            if(ajax.readyState == 4 ) {
			   if(ajax.responseXML) {
			      processXML(ajax.responseXML);
			   }
			   else {
			       //caso não seja um arquivo XML emite a mensagem abaixo
				   idOpcao.innerHTML = "--Primeiro selecione o estado--";
			   }
            }
         }
		 //passa o código do estado escolhido
	     var params = "estado="+valor;
         ajax.send(params);
      }
   }
   
   function processXML(obj){
      //pega a tag cidade
      var dataArray   = obj.getElementsByTagName("cidade");
      
	  //total de elementos contidos na tag cidade
	  if(dataArray.length > 0) {
	     //percorre o arquivo XML paara extrair os dados
         for(var i = 0 ; i < dataArray.length ; i++) {
            var item = dataArray[i];
			//contéudo dos campos no arquivo XML
			var codigo    =  item.getElementsByTagName("codigo")[0].firstChild.nodeValue;
			var descricao =  item.getElementsByTagName("descricao")[0].firstChild.nodeValue;
			
	        idOpcao.innerHTML = "--Selecione uma das opções abaixo--";
			
			//cria um novo option dinamicamente  
			var novo = document.createElement("option");
			    //atribui um ID a esse elemento
			    novo.setAttribute("id", "opcoes");
				//atribui um valor
			    novo.value = codigo;
				//atribui um texto
			    novo.text  = descricao;
				//finalmente adiciona o novo elemento
				document.forms[0].listCidades.options.add(novo);
		 }
	  }
	  else {
	    //caso o XML volte vazio, printa a mensagem abaixo
		idOpcao.innerHTML = "--Primeiro selecione o estado--";
	  }	  
   }

</script>

<html>
   <head>
      <title>Ê</title>
	  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   </head>
   
   <body bgcolor="#FFFFFF">
	  <form name="frmAjax">
	     Estado:&nbsp;
	     <select name="listEstados" onChange="Dados(this.value);">
	        <option value="0">--Selecione o estado >></option>
		    <? for($i=0; $i<$row; $i++) { ?>
		       <option value="<? echo mysql_result($sql, $i, "id_estado"); ?>">
			   <? echo mysql_result($sql, $i, "dsc_estado"); ?></option>
		    <? } ?>
	     </select>
	  
	     <br><br>
	     Cidade:&nbsp;
	     <select name="listCidades">
            <option id="opcoes" value="0">--Primeiro selecione o estado--</option>
	     </select>
	  </form>
   </body>
</html>


