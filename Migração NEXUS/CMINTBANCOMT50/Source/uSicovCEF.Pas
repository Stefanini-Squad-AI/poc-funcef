// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : Emissão de Bloquetos e Cobranca Eletronica
// Autor(a)    : Eraldo Silva
// Data        : 09/11/2011
// Sol         : 154915/5481
// Kintana     : 1348007
// Alteração   : Aumentar a visualização do campo número "documentos para impressão"
//               para 6 caracteres; 2º e incluir barra de progressão de forma que
//               identifique quantos documentos foram gerados.
//---------------------------------------------------------------------------------

unit uSicovCEF;

interface

Uses classes, SysUtils, Controls, DDadosBancariosMT, dialogs, Db, DBTables, Wwquery;

Type
   TSicovCEF = Class
   private
     {Arquivo a ser gerado}
     ArquivoRemessa: TextFile;
     {Total de Registros do arquivo}
     iTotRegArq: Integer;
     {String para informação da ação a ser executada}
     sPasso: String;
     {Valor total dos registros no arquivo}
     rTotalValorPago: Real;
     {Calcula o DV das Agências e da Conta Corrente para o PAGFOR do Bradesco}

     // numEmpresaBanco
     sNumEmpresaBanco : string;
     FiCodOcorrencia: integer;

     {convênio SICOV Caixa Econômica Federal}
     procedure HeaderSicovCEF;
     Procedure DetalheSicovCefE;
     Procedure TraillerSicovCef;
    procedure SetiCodOcorrencia(const Value: integer);
   public
     iSeqArquivo     : LongInt;   // numero sequencial do arquivo
     sRecPag         : String;
     bMostraMensagem : Boolean;
     constructor Create;
     Procedure MontaSicovCef;
     function  GetNomeArq : String;
     property iCodOcorrencia : integer read FiCodOcorrencia write SetiCodOcorrencia;
end;

Var
  SicovCEF: TSicovCEF;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString, uCmDialogs,
     uCMClientDataSet,faguarde,Forms;



// -----------------------------------------------------------------------------


constructor TSicovCEF.Create;
begin
  inherited Create;  // Initialize inherited parts
end;


procedure TSicovCEF.MontaSicovCEF;
Begin

   With IntBancoManager Do
   Begin
     try
       try
          iTotRegArq  := 0;
          rTotalValorPago := 0;
          frmAguarde.Max := CdsTexto.RecordCount;
          frmAguarde.Pos := 0;

          sPasso := 'Criar Arquivo Para Gravar Os Dados';

          if not IntBancoManager.ExecSQL('UPDATE SEQREMESSA SET CONTROLEREMESSA = '+ intToStr(iSeqArquivo)+#13+#10+
                                         'WHERE NUMEMPRESABANCO = '+ quotedStr(sNumEmpresaBanco)+#13+#10+
                                         '  AND CONTROLEREMESSA <= ' + intToStr(iSeqArquivo)) then
             raise Exception.Create(IntBancoManager.MessageInfo);

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          sPasso := 'Montar Header do Arquivo';

          HeaderSicovCef;
          sPasso := 'Montar Detalhe do Arquivo';
          CdsTexto.First;
          While Not CdsTexto.Eof Do
          Begin
            //Eraldo Luis da Silva SOL 154915/5481 Kintana 1348007 INICIO
            Application.ProcessMessages;
            frmAguarde.Mostra('Gerando '+IntToStr(frmAguarde.Pos)+' de '+IntToStr(frmAguarde.Max)+ ' documentos para impressao... ');
            //Eraldo Luis da Silva SOL 154915/5481 Kintana 1348007 Fim
            DetalheSicovCefE;
            CdsTexto.Next;
            frmAguarde.Pos := frmAguarde.Pos + 1;
          End;
          frmaguarde.apaga; //Eraldo Luis da Silva SOL 154915/5481 Kintana 1348007

          TraillerSicovCef;

          CloseFile(ArquivoRemessa);

          sPasso := 'Prepar Visualização do Arquivo';
          CodArquivoRemessa := intToStr(iSeqArquivo);

          if bMostraMensagem then
            MostraArquivo;

          bArquivoCriado:= True;
       finally
          if iSeqArquivo = 999999 then
            iSeqArquivo := 0;

       end;
     Except
          bArquivoCriado:= False;
          MsgAviso('Erro ao gerar arquivo de remessa enquanto tentava ... ' + (#13+#10) + sPasso,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
     End;
   End;
End;


procedure TSicovCEF.HeaderSicovCEF;
var  sData : String;
     sDescr: string;

Begin
 With IntBancoManager Do
 begin
   sdata := formatDateTime('YYYYMMDD', Date);

   if SicovCEF.sRecPag = 'R' then
     sDescr:='DEBITO AUTOMATICO'
   else
     sDescr:='CRED AUTOMAT     ';


   WriteLn(ArquivoRemessa,
           Concat('A', // Código do Registro
                   '1', // Identificação da Fita Remessa/Retorno
                   Ae(sNumEmpresaBanco, 20), //Código do Convênio
                   Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,20), // Nome da Empresa
                  '104', //Código do Banco
                   Ae('CAIXA',20), //Nome do Banco
                   sdata, // data corrente
                   Zd(intToStr(iSeqArquivo),6),  // numero da sequencia do arquivo
                  '04', //LayOut
                   //'DEB/CRED AUTOMAT.', //Identificação do Serviço
                   sDescr, //Identificação do Serviço
                   Spc(52)));
 end;

End;


procedure TSicovCEF.DetalheSicovCefE;
var sData, sCodMov, sConta, sAgencia, sCodDoc, sNoDoc : String;
Begin

 sConta := '';
 sAgencia := '';
 sCodDoc := '';

 Inc(iTotRegArq);

 With IntBancoManager Do
 begin
   rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat;
   sdata := formatDateTime('YYYYMMDD', CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime);

   // se for contas a Pagar
   if sRecPag = 'P' then
   begin
     sCodMov := '2';
     sAgencia := GetAg(4,False,True);
     sConta := GetCC(12,True,True);
     sCodDoc := CdsTexto.FieldByName('CODDOCUMENTO').asString;
     sNoDoc := CdsTexto.FieldByName('NODOCUMENTO').asString;
   end
   else  // se for contas a receber etc, busca a conta corrente para débito
   begin
     try
       DtmDadosBancarios.SqlBuscaCC.Sql.Text :=
          ' SELECT DISTINCT '+
          '   C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA, C.IDCBANCARIA, '+
          '   B.MASCARACC, '+
          '   B.MASCARAAGENCIA  '+
          ' FROM '+
          '   PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '+
          ' WHERE '+
          '   (D.IDFORCLI = ' + CdsTexto.FieldByName('IDFORCLI').AsString +') AND '+
          '   (C.IDPESSOA = D.IDFORCLI)  AND       '+
          //'   (C.FLGCONTAPREF = 1)       AND       '+ andré tavares - 21/01/2005 - pendência 18497
          '   (C.IDAGENCIA = A.IDPESSOA) AND       '+
          '   (A.IDBANCO   = B.IDPESSOA) AND       '+
          '   (A.IDPESSOA = PA.IDPESSOA) AND       '+
          '   (B.IDPESSOA = PB.IDPESSOA) AND       '+
          // início - andré tavares - 21/01/2005 - pendência 18497
          '  (NVL(D.CODGRUPOCNAB, D.CODDOCUMENTO) = ' + CdsTexto.FieldByName('CODDOCUMENTO').AsString + ') AND '+
          '  ((C.IDCBANCARIA = D.IDCBANCARIA) OR ((D.IDCBANCARIA IS NULL)  AND (C.FLGCONTAPREF = 1))) ';
          // fim - andré tavares - 21/01/2005 - pendência 18497

       DtmDadosBancarios.SqlBuscaCC.Open;
      except
        Raise;
      end;
     sCodMov := '0';
     sAgencia := zd(DtmDadosBancarios.cdsBuscaCC.FieldByName('NUMAGENCIA').asString, 4);
     sConta   := zd(DtmDadosBancarios.cdsBuscaCC.FieldByName('CONTACORRENTE').asString, 12);

     try
       DtmDadosBancarios.SqlBuscaCC.Sql.Text :=
          ' SELECT  '+
          '   D.CODDOCUMENTO,  D.NODOCUMENTO '+
          ' FROM '+
          '   DOCUMENTO D '+
          ' WHERE '+
          '   (D.IDFORCLI = ' + CdsTexto.FieldByName('IDFORCLI').AsString +') AND '+
          '   (D.CODGRUPOCNAB = ' + CdsTexto.FieldByName('CODDOCUMENTO').AsString +')';
        DtmDadosBancarios.SqlBuscaCC.Open;
 // inicio - andre tavares - 06/09/2004
        if trim(DtmDadosBancarios.cdsBuscaCC.FieldByName('CODDOCUMENTO').asString) <> '' then
          sCodDoc := DtmDadosBancarios.cdsBuscaCC.FieldByName('CODDOCUMENTO').asString
        else
          sCodDoc := CdsTexto.FieldByName('CODDOCUMENTO').asString;

        if trim(DtmDadosBancarios.cdsBuscaCC.FieldByName('NODOCUMENTO').asString) <> '' then
          sNoDoc := DtmDadosBancarios.cdsBuscaCC.FieldByName('NODOCUMENTO').asString
        else
          sNoDoc := CdsTexto.FieldByName('NODOCUMENTO').asString;
 // fim - andre tavares - 06/09/2004



      except
        Raise;
      end;

   end;

   if FiCodOcorrencia >= 0 then
   begin
     sCodMov := intToStr(FiCodOcorrencia);
   end;

   WriteLn(ArquivoRemessa,
           Concat('E', // Código do Registro
                  AE(sCodDoc,25), //Identificação do Cliente na empresa
                  sAgencia,  // Agência para Débito/Crédito
                  sConta, // Identificação do cliente no banco
                  '  ',
                  sdata,
                  ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Crédito
                  '03', //Código da moeda
                  AD(sNoDoc, 20),
                  AE(CdsTexto.FieldByName('NOME').asstring,40), // Uso da Empresa.
                  Spc(20), //Filer
                  sCodMov)); //Código do Movimento
 end;
End;

procedure TSicovCEF.TraillerSicovCef;
Begin
  With IntBancoManager Do
  begin
    iTotRegArq := iTotRegArq + 2;
    if sRecPag = 'P' then
      WriteLn(ArquivoRemessa,
              Concat('Z', // Código do registro
                     ZD(IntToStr(iTotRegArq),6), // Total de Registros no Arquivo
                     zd('0',17),//Zeros
                     ZD(RemoveVirgulas(rTotalValorPago,2),17), // Somatorio dos valores pagos
                     Spc(109)))
    else
      WriteLn(ArquivoRemessa,
              Concat('Z', // Código do registro
                     ZD(IntToStr(iTotRegArq),6), // Total de Registros no Arquivo
                     ZD(RemoveVirgulas(rTotalValorPago,2),17), // Somatorio dos valores pagos
                     zd('0',17),//Zeros
                     Spc(109)));
  end;
End;

function TSicovCEF.GetNomeArq: String;
var qryNroSeq : twwQuery;
begin
  sNumEmpresaBanco := '';
  //início - André tavares - pendência 27799 - 05/05/2008 - prende o registro para que o usuário concorrente não pegue o mesmo número.
  IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Sql.Text :=
  ' SELECT CODPORTFORMA FROM PORTADORFORMA WHERE CODPORTFORMA = '+ IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsString +' FOR UPDATE ';
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;
  //fim - pendência 27799 - 05/05/2008 - prende o registro para que o usuário concorrente não pegue o mesmo número.

// Alterado por Arnaldo V. Scarin em 22/08/2008 - SOL: 93740 - Kintana: 402444

//  IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
//  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Sql.Text :=
//  ' SELECT  '+
//  '   NVL(S.CONTROLEREMESSA, 0) AS CONTROLEREMESSA, P.NUMEMPRESABANCO '+
//  ' FROM PORTADORFORMA P, SEQREMESSA S WHERE CODPORTFORMA = '+ IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsString +
//  ' AND IDPESSOA = ' + inttostr(sistema.idempresa) +
//  ' AND P.NUMEMPRESABANCO = S.NUMEMPRESABANCO ';
//  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;
//  sNumEmpresaBanco := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('NUMEMPRESABANCO').asString;
//  iSeqArquivo := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('CONTROLEREMESSA').asInteger + 1;

  With IntBancoManager.DtmDadosBancarios do
  begin
    CDSBuscaNumSeqArq.Close;
    SqlBuscaNumSeqArq.Sql.Text := 'SELECT P.NUMEMPRESABANCO '+#10#13+
                                  'FROM PORTADORFORMA P, SEQREMESSA S'+#10#13+
                                  'WHERE CODPORTFORMA = '+ IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsString+#10#13+
                                  '  AND IDPESSOA = ' + inttostr(sistema.idempresa)+#10#13+
                                  '  AND P.NUMEMPRESABANCO = S.NUMEMPRESABANCO ';
    SqlBuscaNumSeqArq.Open;
    sNumEmpresaBanco := CDSBuscaNumSeqArq.fieldByName('NUMEMPRESABANCO').asString;

    qryNroSeq := TwwQuery.Create(Nil);
    try
      qryNroSeq.DataBaseName := 'BaseDados';
      qryNroSeq.Sql.Text := 'SELECT SEQREMESSA'+sNumEmpresaBanco+'.NextVal as CONTROLEREMESSA from dual';
      try
        qryNroSeq.Open;
        iSeqArquivo := qryNroSeq.fieldByName('CONTROLEREMESSA').asInteger;
        QryNroSeq.Close;
      except
        raise Exception.Create(IntBancoManager.MessageInfo);
      end;
    finally
      QryNroSeq.Free;
    end;
  end;
  result := 'COV' + Copy(RemoveBarras(DateToStr(Date)), 3, 2)  + intTostr(iSeqArquivo) + '.TXT';
end;

procedure TSicovCEF.SetiCodOcorrencia(const Value: integer);
begin
  FiCodOcorrencia := Value;
end;


end.


