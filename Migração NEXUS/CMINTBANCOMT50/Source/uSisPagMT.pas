{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TSisPag: Arquivo de Pagamento do ITAÚ               }
{   ITAÚ - 0/P                                          }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 28/06/2001                             }
{                10/01/2002 - Fábio Barros              }
{                14/03/2002 - Fábio Barros              }
{                                                       }
{*******************************************************}

unit uSisPagMT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls;

Type
   TSisPag = Class
   private
     {Arquivo de Remessa a ser gerado}
     ArquivoRemessa: TextFile;
     {Contador sequencial do lote}
     iNumSeqLote: Integer;
     {Código do lote a ser gerado}
     iCodLote: Integer;
     {Contador de registros do lote no arquivo}
     iTotRegLote: Integer;
     {Contador de lotes do arquivo}
     iTotLoteArq: Integer;
     {Contador de Registros do Arquivo}
     iTotRegArq: Integer;
     {Descerição do processamento para mensagem de erro}
     sPasso: String;
     {Número do documento da empresa}
     sCodInscEmpresa: String;
     {Valor total dos pagamento no arquivo}
     rTotalValorPago: Real;
     {Monta header do arquivo}

     Procedure HeaderArquivoItau;
     {Monta trailer do arquivo}
     Procedure TrailerArquivoItau;
     {Monta o header do lote do tipo A}
     Procedure HeaderLoteAItau;
     {Monta o trailer do lote do tipo A}
     Procedure TrailerLoteAItau;

     {Monta o header do lote do tipo J}
     Procedure HeaderLoteJItau;
     {Monta o Trailer do lote do tipo J}
     Procedure TrailerLoteJItau;

     {Monta o detalhe do lote do tipo A}
     Procedure DetalheLoteAItau;
     {Monta o detalhe do lote do tipo B}
     Procedure DetalheLoteBItau;
     {Monta o detalhe do lote do tipo J}
     Procedure DetalheLoteJItau;


     {Formata o número da conta bancaria do favorecido\empresa}
     Function MontaNumConta(sConta :String; itam:Integer):String;
   public
     {Monta arquivo Sispag Banco Itau}
     Procedure MontaSispagItau;
end;

Var
  SisPag: TSisPag;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString, uCmFileUtils, uCMDialogs;

Procedure TSisPag.MontaSispagItau;
Var
  iTipoPag, iFormaPag, iEmiteAviso:Integer;
begin
 With IntBancoManager Do
 Begin
   Try
     iTipoPag        := 0;
     iFormaPag       := 0;
     iNumSeqLote     := 1;
     iCodLote        := 1;
     iTotRegLote     := 0;
     iTotLoteArq     := 0;
     iTotRegArq      := 0;
     rTotalValorPago := 0;

     sPasso := 'Criar Arquivo Para Gravar Os Dados';

     AssignFile(ArquivoRemessa,sNomeArquivo);
     ReWrite(ArquivoRemessa);

     If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
        sCodInscEmpresa := '1'
     Else
        sCodInscEmpresa := '2';


     //Header Geral
     sPasso := 'Montar Header do Arquivo';
     HeaderArquivoItau;

     IntBancoManager.CdsTexto.First;
     While Not IntBancoManager.CdsTexto.Eof Do
     Begin
       //Query Texto Ordenada Por Tipo de Pagamento (TP), Forma de PagaMento (FP), CodDocumento (COD)}

       sPasso := 'Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo);

       If  (IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger <> 30) And
           (IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger <> 31) Then
       Begin
         {Segmento A
          Só Monta Este Segmento Para
         (IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger <> 30) And
         (IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger <> 31), ou Seja:
          Não é Bloqueto nem do Itaú nem de Outros Bancos}
          //Header de Lote Segementos A e B
          //Se o Tipo de Pgto e a forma de pgto forem mantidos, não imprime header
          If (iTipoPag  <> IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) Or
             (iFormaPag <> IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger) Then
          Begin
            iTipoPag  := IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
            iFormaPag := IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger;
            //iNumLote  := IntBancoManager.CdsTexto.FieldByName('NUMLOTE').AsInteger;
            sPasso := 'Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Header de Lote A';
            HeaderLoteAItau;
          End;
          //Transação Segmento A
          sPasso := 'Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Detalhe de Lote A';
          DetalheLoteAItau;

          sPasso := 'Incrementar Contador do Registro No Lote Ao Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Detalhe de Lote A';
          Inc(iTotRegLote);

          //Só Emite Aviso Pagto Se IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').AsString <> 0
          //Transação Segmento B
          If IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').IsNull Then
             iEmiteAviso := 0
          Else
             iEmiteAviso := IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').AsInteger;

          If ( iEmiteAviso <> 0) Then
          Begin
            sPasso := 'Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Detalhe de Lote B';
            DetalheLoteBItau;
            sPasso := 'Incrementar Contador Ao Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Detalhe de Lote B';
            Inc(iTotRegLote);
          End;

          sPasso := 'Passar para o Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo + 1);
          IntBancoManager.CdsTexto.Next;

          sPasso := 'Incrementar Contador do Lote Ao Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Detalhe de Lote B';
          InC(iNumSeqLote);

          //Só Imprime Trailer Se o Tipo de Pgto e a forma de pgto forem Alterados
          //Trailer de Lote Segementos A e B
          sPasso := 'Verificar Tipo e Forma de Pagto Para o Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Trailer Do Lote A ';
          If (iTipoPag  <> IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) Or
             (iFormaPag <> IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger) Or
             (IntBancoManager.CdsTexto.Eof) Then
          Begin
            sPasso := 'Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Trailer de Lote A';
            TrailerLoteAItau;
            rTotalValorPago := 0;
            Inc(iTotLoteArq);
            Inc(iCodLote);
            iNumSeqLote := 1;
            iTotRegLote := 0;
         End;
       End
       Else
       Begin
         {Segmento J
          Só Monta Este Segmento Para
         (IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 30) or
         (IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 31)}

          //Header de Lote Segemento J
          //Se o Tipo de Pgto e a forma de pgto forem mantidos, não imprime header
          If (iTipoPag  <> IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) Or
             (iFormaPag <> IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger) Then
          Begin
            iTipoPag  := IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
            iFormaPag := IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger;
            sPasso := 'Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Header de Lote J';
            HeaderLoteJItau;
          End;

          //Transação Segmento J
          sPasso := 'Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Detalhe de Lote J';
          DetalheLoteJItau;
          Inc(iNumSeqLote);
          Inc(iTotRegLote);

          IntBancoManager.CdsTexto.Next;

          //Só Imprime Trailer Se Tipo de Pgto e forma de pgto forem Alterados
          //Trailer de Lote Segemento J
          If (iTipoPag  <> IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) Or
             (iFormaPag <> IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger) Or
             //(iNumLote <> IntBancoManager.CdsTexto.FieldByName('NUMLOTE').AsInteger) Or
             (IntBancoManager.CdsTexto.Eof) Then
          Begin
            sPasso := 'Gravar Registro Nº ' + IntToStr(IntBancoManager.CdsTexto.RecNo) + ' No Trailer de Lote J';
            TrailerLoteJItau;
            rTotalValorPago := 0;
            Inc(iTotLoteArq);
            Inc(iCodLote);
            iTotRegLote := 0;
            iNumSeqLote := 1;
          End;
       End;
     End;
     //Trailer Geral
     sPasso := 'Gravar Trailer do Arquivo';
     TrailerArquivoItau;

     sPasso := 'Fechar Arquivo de Remessa';
     CloseFile(ArquivoRemessa);

     sPasso := 'Prepar Visualização do Arquivo';
     if bExibeArquivoGerado then
       VisualizaArquivo(sNomeArquivo,'');
     bArquivoCriado:= True;
   Except
     On E:Exception Do
     Begin
       bArquivoCriado:= False;
       MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso +
          (#13+#10) + E.Message,'Atenção');
       CloseFile(ArquivoRemessa);
       Abort;
     End;
   End;
 End;
End;

procedure TSisPag.HeaderArquivoItau;
Begin
 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('341', // Código do banco
               '0000', // Código do Lote
               '0', // Tipo de Registro
               Spc(6), // Brancos
               '040', // Layout de Arquivo
               sCodInscEmpresa, // Empresa - Inscrição
               ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
               Spc(20), // Brancos
               GetAG(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True), //Agência
               ' ', //Brancos
               MontaNumConta(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,14), // Conta
               Ae(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
               Ae(IntBancoManager.CdsEmpresa.FieldByName('NOMEBANCO').AsString,30), // Nome do Banco
               Spc(10), // Branco
               '1', // Indica Arquivc de Remessa
               RemoveBarras2(DateToStr(Date)), //Data Gravação do Arquivo
               RemovePontos(TimeToStr(Time)), //Hora Gravação do Arquivo
               Zd('0',9), //Zeros
               Zd('0',5), //Unidade de densidade
               AE(' ',69))); // Complemento de Registro
End;

procedure TSisPag.HeaderLoteAItau;
Var
  sFinLote,sHistDeb: String;
Begin
 sFinLote :=  'PAGAMENTO DOS DOCUMENTOS DO LOTE N. ' + IntBancoManager.CdsTexto.FieldByName('NUMLOTE').AsString;

 sHistDeb :=  'LT ' + IntBancoManager.CdsTexto.FieldByName('NUMLOTE').AsString ;

 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('341', // Código do banco
               Zd(IntToStr(iCodLote),4), // Código do Lote
               '1', // Tipo de Registro
               'C', // Tipo de Operacao
               FuncaoGeral.Decode(Trim(IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString),'','00',ZD(IntToStr(IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger),2)), //Tipo de Pagamento
               FuncaoGeral.Decode(Trim(IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString),'','00',ZD(IntToStr(IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger),2)), //Forma de Pagamento
               '030', //Layout do Lote
               ' ', //Brancos
               sCodInscEmpresa, // Empresa - Inscrição
               ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
               Spc(20), // Brancos
               GetAG(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True), //Agência
               ' ', //Brancos
               MontaNumConta(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,14), // Conta
               Ae(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
               Ae(sFinLote,30), // Finalidade do Lote
               Ae(sHistDeb,10), // Histórco de C/C
               AE(IntBancoManager.CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), //Endereço
               ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMERO').AsString,5),//Número
               AE(IntBancoManager.CdsEmpresa.FieldByName('COMPLEMENTO').AsString,15),//Complemento
               AE(IntBancoManager.CdsEmpresa.FieldByName('CIDADE').AsString,20),//Cidade
               ZE(IntBancoManager.CdsEmpresa.FieldByName('CEP').AsString,8),//Cep
               AE(IntBancoManager.CdsEmpresa.FieldByName('CODESTADO').AsString,2),//Estado
               Spc(8),//Brancos
               Spc(10))); // Complemento de Registro, Arquivo de Retorno
End;

procedure TSisPag.DetalheLoteAItau;
Var
  sTipoMoeda, sAgenciaConta, sHistorico: String;
Begin
 Inc(iTotRegArq);
 sTipoMoeda := '';
   sAgenciaConta := '';
 sHistorico := '';

 If (IntBancoManager.CdsTexto.FieldByName('TIPOMOEDA').AsString = '') Then
    sTipoMoeda := 'REA'
 Else
    sTipoMoeda := '009';


{ Fabio Barros - 15/10/2001
----------------------------------------------------------------------------------
 If IntBancoManager.CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsInteger = 341 Then
     sAgenciaConta := '0' + ZD(Trim(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString),4) +
                      ' ' +
                      ZD('0',7) +
                      MontaNumConta(IntBancoManager.CdsTexto.FieldByName('CONTACORRENTE').AsString,14)
 Else
     sAgenciaConta := ZD(Trim(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString),5) +
                      ' ' +
                      MontaNumConta(IntBancoManager.CdsTexto.FieldByName('CONTACORRENTE').AsString,14);
 ----------------------------------------------------------------------------------
}


 //sAgenciaConta := ZD(Trim(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString),5) +

{Gustavo - 13/03/2002}
 sAgenciaConta := GetAG(5,False,True) +
 {Gustavo - 13/03/2002}
                  ' ' +
                  MontaNumConta(IntBancoManager.CdsTexto.FieldByName('CONTACORRENTE').AsString,14);
 sHistorico := TRIM('PGTO DOC N. ' + TRIM(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString) + ' ' +
                                    TRIM(IntBancoManager.CdsTexto.FieldByName('COMPLDOCUMENTO').AsString));

 rTotalValorPago := rTotalValorPago + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;

 WriteLn(ArquivoRemessa,
         Concat('341', // Código do banco
               Zd(IntToStr(iCodLote),4), // Código do Lote
               '3', // Tipo de Registro
               Zd(IntToStr(iNumSeqLote),5), // Número Sequencial do Registro no Lote
               'A',//Segmento
               '000',//Tipo de Operação
               '000',//Zeros
               AE(IntBancoManager.CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
               AE(sAgenciaConta,20), //Agencia Conta Favorecido
               AE(IntBancoManager.CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
               AE(IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CODDOCUMENTO').AsString,20), //Nº Documento
               RemoveBarras2(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)), //Dat Prevista Para Pagto
               sTipoMoeda, //Tipo de Moeda Para PAGTO
               ZD('0',15),//Zeros
               ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
               SPC(15),//Nosso Número
               Spc(5),//Brancos
               ZD('0',8),//Data Efetiva Pagto - Retorno
               Spc(15),//Valor Efetivo Pagto - Retorno
               AE(sHistorico,18), //Finalidade de Detalhe
               Spc(2), //Brancos
               '000000', //Retorno Identificação de DOC/OP/CHEQUE no retorno
               ZD(Trim(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString),14),
               Spc(12),//Brancos
               Copy(trim(IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').AsString),1,1), //Emite Aviso Pagto
               Spc(10)))//Código da Ocorrência - Retorno
End;

procedure TSisPag.DetalheLoteBItau;
Var
  sTipoInsc: String;
Begin
 Inc(iTotRegArq);
 If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
    sTipoInsc := '1'
 Else
    sTipoInsc := '2';

 WriteLn(ArquivoRemessa,
         Concat('341', // Código do banco
               Zd(IntToStr(iCodLote),4), // Código do Lote
               '3', // Tipo de Registro
               Zd(IntToStr(iNumSeqLote),5), // Número Sequencial do Registro no Lote
               'B',//Segmento
               Spc(3),//Brancos
               sTipoInsc,//Tipo InsCricao Favorecido
               AE(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Num Inscricao do Favorecido
               AE(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString,30), //Endereço
               ZD(IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString,5),//Número
               AE(IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,15),//Complemento
               AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,15),//Bairro
               AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,20),//Cidade
               ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),//Cep
               AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),//Estado
               Spc(113))); // Complemento de Registro
End;

procedure TSisPag.TrailerLoteAItau;
Begin
 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('341', // Código do banco
                Zd(IntToStr(iCodLote),4), // Código do Lote
                '5', // Tipo de Registro
                Spc(9), // Brancos
                ZD(IntToStr(iTotRegLote+2),6), // Total de Registros do Lote - Todos os Seguementos + o Header e o Footer
                ZD(RemoveVirgulas(rTotalValorPago,2),18), // Valor Pagto
                ZD('0',18), // Zeros
                Spc(171),  // Brancos
                Spc(10))); // Zeros
End;

procedure TSisPag.HeaderLoteJItau;
Var
  sFinLote, sHistDeb: String;
Begin
 sFinLote :=  TRIM('PAGAMENTO DOS DOCUMENTOS DO LOTE N. ' + IntBancoManager.CdsTexto.FieldByName('NUMLOTE').AsString);
 sHistDeb :=  TRIM('LT ' + IntBancoManager.CdsTexto.FieldByName('NUMLOTE').AsString);
 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('341', // Código do banco
               Zd(IntToStr(iCodLote),4), // Código do Lote
               '1', // Tipo de Registro
               'C', // Tipo de Operacao
               ZD(IntToStr(IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger),2), //Tipo de Pagamento
               ZD(IntToStr(IntBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger),2), //Forma de Pagamento
               '030', //Layout do Lote
               ' ', //Brancos
               sCodInscEmpresa, // Empresa - Inscrição
               ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
               Spc(20), // Brancos
               GetAG(IntBancoManager.CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True), //Agência
               ' ', //Brancos
               MontaNumConta(IntBancoManager.CdsEmpresa.FieldByName('NUMCONTA').AsString,14), // Conta
               Ae(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
               Ae(sFinLote,30), // Finalidade do Lote
               Ae(sHistDeb,10), // Histórco de C/C
               AE(IntBancoManager.CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), //Endereço
               ZD(IntBancoManager.CdsEmpresa.FieldByName('NUMERO').AsString,5),//Número
               AE(IntBancoManager.CdsEmpresa.FieldByName('COMPLEMENTO').AsString,15),//Complemento
               AE(IntBancoManager.CdsEmpresa.FieldByName('CIDADE').AsString,20),//Cidade
               ZE(IntBancoManager.CdsEmpresa.FieldByName('CEP').AsString,8),//Cep
               AE(IntBancoManager.CdsEmpresa.FieldByName('CODESTADO').AsString,2),//Estado
               Spc(8),//Brancos
               Spc(10))); // Complemento de Registro
End;


procedure TSisPag.DetalheLoteJItau;
Var
  sBanco,sMoeda,sDv,sValor,sCampoLivre,sBarras: String;
  rValPagto: Real;
Begin
 Inc(iTotRegArq);
 //42297020080000193333293277958117413400
 If IntBancoManager.CdsTexto.FieldByName('CODBARRAVALOR').IsNull Then
 Begin
    //Código de Barras
    If IntBancoManager.CdsTexto.FieldByName('CODBARRA').IsNull Then
       sBarras := Spc(44)
    Else
       sBarras     := IntBancoManager.CdsTexto.FieldByName('CODBARRA').AsString;
    //sBarras     := ZE(sBarras,44); //
    sBanco      := Copy(sBarras,1,3);
    sMoeda      := Copy(sBarras,4,1);
    sDv         := Copy(sBarras,5,1);
    sValor      := Copy(sBarras,6,14);
    sCampoLivre := Copy(sBarras,20,25);
 End
 Else
 Begin
    //Representação numérica do código de barras
    sBarras     := IntBancoManager.CdsTexto.FieldByName('CODBARRAVALOR').AsString;
    //sBarras     := ZE(sBarras,47);
    sBanco      := Copy(sBarras,1,3);
    sMoeda      := Copy(sBarras,4,1);
    sDv         := Copy(sBarras,33,1);
    sValor      := ZD(Trim(Copy(sBarras,34,14)),14);
    sCampoLivre := Copy(sBarras,5,5) + Copy(sBarras,11,10) + Copy(sBarras,22,10);
 End;

 //inicio - andre tavares - pendência 21789 - 20/03/2006
 {rValPagto :=  (IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat + IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat) -
               IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat;}

 rValPagto := IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;
 //fim - andre tavares - pendência 21789 - 20/03/2006

 rTotalValorPago := rTotalValorPago + rValPagto;

 //rTotalValorPago := rTotalValorPago + IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat;

 WriteLn(ArquivoRemessa,
         Concat('341', // Código do banco
               Zd(IntToStr(iCodLote),4), // Código do Lote
               '3', // Tipo de Registro
               Zd(IntToStr(iNumSeqLote),5), // Número Sequencial do Registro no Lote
               'J',//Segmento
               '000',//Tipo de Movimento
               sBanco,
               sMoeda,
               sDv,
               sValor,
               sCampoLivre,
               AE(IntBancoManager.CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
               RemoveBarras2(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), //Dat Prevista

               //inicio - andre tavares - pendência 21789 - 20/03/2006
               //ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
               ZD(RemoveVirgulas(IntBancoManager.ValorBrutoDoc(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat, IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat, IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat),2),15), // Valor do NOMINAL
               //fim - andre tavares - pendência 21789 - 20/03/2006

               ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),//Valor Desconto
               ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),//Valor Pago

               RemoveBarras2(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)), //Dat Prevista
               ZD(RemoveVirgulas(rValPagto,2),15),//Valor Pagto líquido
               ZD('0',15), //ZEROS
               AE(IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CODDOCUMENTO').AsString,20), //Nº Documento
               Spc(13), //Brancos
               Spc(15), //Nosso Número - Atribuído Pelo banco
               SPC(10))); // Código para ocorrência Retorno
End;

procedure TSisPag.TrailerLoteJItau;
Begin
 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('341', // Código do banco
               Zd(IntToStr(iCodLote),4), // Código do Lote
               '5', // Tipo de Registro
               Spc(9), //Brancos
               ZD(IntToStr(iTotRegLote+2),6), // Total de Registros do LOte
               ZD(RemoveVirgulas(rTotalValorPago,2),18),//Valor Pagto
               ZD('0',18),//Zeros
               Spc(171),//Brancos
               Spc(10)));//Zeros
End;

procedure TSisPag.TrailerArquivoItau;
Begin
 Inc(iTotRegArq);
 WriteLn(ArquivoRemessa,
         Concat('341', // Código do banco
                '9999', // Código do Lote
                '9', // Tipo de Registro
                Spc(9), //Brancos
                ZD(IntToStr(iTotLoteArq),6), // Total de Lotes no Arquivo
                ZD(IntToStr(iTotRegArq),6), // Total de Registros no Arquivo
                Spc(211)))//Brancos
End;

Function TSisPag.MontaNumConta(sConta :String; Itam:Integer):String;
Var
 sAux :String;
Begin
   sAux := sConta;
   sAux := ZD(sAux,Itam-1);
   Insert(' ',sAux,Itam-1);
   Result := sAux;
End;

// Fim Sispag Banco Itau

end.
