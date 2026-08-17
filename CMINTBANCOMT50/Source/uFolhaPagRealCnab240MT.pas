{*******************************************************}
{   BANCO Real - FOLHA DE PAGAMENTO - CNAB 240          }
{   IDMODELOSCNAB 57/P                                  }
{                                                       }
{ Autor: André Tavares   11/10/2005                     }
{*******************************************************}

unit uFolhaPagRealCnab240MT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls;

Type
   TFolhaPagReal = Class
   private
     sNumEmpresaBanco : string;
     sFormaPgto, sCodCamaraComp : String;

     {tipo de documento da empresa}
     sTipoInsc: String;
     {Contador sequencial de registros}
     //ISEQREG: Integer;
     {Arquivo de Remessa a ser gerado}
     ArquivoRemessa: TextFile;
     {Total de Registros no arquivo}
     iTotRegArq: Integer;
     {Número sequencial da remessa}
     //iNumRemessa: Integer;
     {Número sequencial do qrquivo no lote}
     iNumSeqLote: Integer;
     {Total de registros do lote}
     iTotRegLote: Integer;
     {Código de inscrição da empresa}
     sCodInscEmpresa: String;
     {Valor Total dos registro no arquivo}
     rTotalValorPago: Real;
     {Valor total dos pagamentos no lote}
     rTotalValorPagoLote: Real;

     {Header Geral do Arquivo}
     procedure HeaderArquivoReal; //ok
       procedure HeaderLote;      //ok
           procedure DetalheA;    //ok
           procedure DetalheB;    // ok
       procedure TrailerLote;     //ok
     {Trailer Geral do Arquivo}
     procedure TrailerArquivoReal; //ok

   public
     iSeqArquivo : Integer;
     {Monta arquivo folha de pagamento Real}
     Procedure FolhaPagamentosReal; //ok
     function GetNomeArq: string; //ok
end;

Var
  FolhaPagReal: TFolhaPagReal;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString;



Procedure TFolhaPagReal.FolhaPagamentosReal;
Var
 iTipoPag, iFormaPag : Integer;
 Lista : String;


  //início - andré tavares - pendência 21782 - 22/03/2007 - utiliza o float do doc
  procedure MudaFormaPag;
  var dataAux: TDateTime;
  begin

    //pendência 26926 - 09/01/2008 - se o módulo de origem preencha a dataPagamento
    //--
    if (intBancoManager.bUsaDataIntBanco = true) then
    begin
      if trim(intBancoManager.DataPagamento) = '' then
        intBancoManager.bUsaDataIntBanco := false
      else
        intBancoManager.bUsaDataIntBanco := true;
    end;
    //--
    if (trunc(intBancoManager.dRestoreDtPagamento) = 0) then
    begin
      if intBancoManager.bUsaDataIntBanco then
        intBancoManager.dRestoreDtPagamento := strToDate(intBancoManager.DataPagamento)
      else
        intBancoManager.dRestoreDtPagamento := intBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').asDateTime;
    end;
    //--
    if (intBancoManager.bUsaDataIntBanco = true) then
      dataAux := strToDate(intBancoManager.DataPagamento)
    else
    begin
      intBancoManager.dRestoreDtPagamento := intBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').asDateTime;
      dataAux := intBancoManager.dRestoreDtPagamento;
    end;

    if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
       (intBancoManager.CdsTexto.FieldByName('VALOR').asFloat >= intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
       (intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
    begin // TED STR
      sFormaPgto := intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;
      sCodCamaraComp := '018';
      if intBancoManager.iFloatExternoAlt > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.iFloatExternoAlt,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      else //senão usa o float do portadorforma
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAISALT').AsInteger,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    end
    else if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger in [41, 43]) then
    begin //TED CIP
      sFormaPgto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
      sCodCamaraComp := '018';
      if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.iFloatExterno,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      else //senão usa o float do portadorforma
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAIS').AsInteger,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    end
    else if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) then
    begin //DOC < valormáximo
      sFormaPgto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
      sCodCamaraComp := '018';
      if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.iFloatExterno,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      else //senão usa o float do portadorforma
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAIS').AsInteger,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    end
    else begin // crédito em CC
      sFormaPgto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
      sCodCamaraComp := '700';
      if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.iFloatExterno,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      else //senão usa o float do portadorforma
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            intBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAIS').AsInteger,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    end;


  end;
  //fim - andré tavares - pendência 21782 - 22/03/2007 - utiliza o float do doc


begin
  sFormaPgto := '';
  sCodCamaraComp := '018';

  With IntBancoManager Do
  Begin
    Try
      iTipoPag            := 0;
      iFormaPag           := 0;
      iNumSeqLote         := 0;
      iTotRegLote         := 0;
      //ISEQREG             := 0;
      iTotRegArq          := 0;
      Lista               := '';
      rTotalValorPagoLote := 0;

      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);

      If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
         sCodInscEmpresa := '1'
      Else
         sCodInscEmpresa := '2';

      HeaderArquivoReal;

      CdsTexto.First;
      While Not CdsTexto.Eof Do
      begin
        DtmIntBanco.CdsValMaximo.Close;
        DtmIntBanco.sqlValMaximo.prepare;
        DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
        DtmIntBanco.sqlValMaximo.Open;

        MudaFormaPag;

        if (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
           (iFormaPag  <> strToInt(sFormaPgto)) then
        begin
          iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
          iFormaPag := strToInt(sFormaPgto);

          HeaderLote;
        end;
         //INC(ISEQREG);
         DetalheA;
         DetalheB;

         CdsTexto.Next;

        DtmIntBanco.CdsValMaximo.Close;
        DtmIntBanco.sqlValMaximo.prepare;
        DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
        DtmIntBanco.sqlValMaximo.Open;

        //pendência 26926 - 09/01/2008
        if not intBancoManager.bUsaDataIntBanco then
          intBancoManager.DataPagamento := '';

        if (CdsTexto.Eof) or
           (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
           (iFormaPag  <> strToInt(sFormaPgto)) then
        begin
          //ISEQREG := 0;
          TrailerLote;
        end;
      End;
      //Trailer Geral
      TrailerArquivoReal;

      CloseFile(ArquivoRemessa);

      if not IntBancoManager.ExecSQL(' UPDATE SEQREMESSA SET CONTROLEREMESSA = '+ intToStr(iSeqArquivo)+
                                  ' WHERE NUMEMPRESABANCO = '+ quotedStr(sNumEmpresaBanco)) then
        raise Exception.Create(IntBancoManager.MessageInfo);

      MostraArquivo;
      bArquivoCriado:= True;
     Except
       bArquivoCriado:= False;
       CloseFile(ArquivoRemessa);
       Raise;
     End;
 End;
End;

procedure TFolhaPagReal.HeaderArquivoReal;
begin
  //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
  if trim(intbancoManager.DataPagamento) <> '' then
    intBancoManager.dRestoreDtPagamento := strToDate(intbancoManager.DataPagamento);

  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    //Inc(iNumRemessa);
    WriteLn(ArquivoRemessa,
            Concat('356', // Código do banco
                   '0000', // Código do Lote
                   '0', // Tipo de Registro
                    Spc(9) , // Brancos
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
                    AE(trim(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString), 20), // Número do Convênio - Preencher com Brancos(ver layout)
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True), //Agência
                    GetDVAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString), // DV da Agência
                    GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,13,true,True), //Conta + DV
                    ' ',//AE(copy(GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,12,true,True), length(GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,12,true,True)) -1, 1), 1), //dv ag/cc
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    Ae('ABN AMRO REAL S.A.',30), // Nome do Banco
                    spc(10), // Brancos
                    '1', // Indica Arquivo de Remessa
                    formatDateTime('DDMMYYYY', Date), //Data Gravação do Arquivo
                    formatDateTime('HHMMSS', Time), //Hora Gravação do Arquivo
                    Zd(IntToStr(iSeqArquivo),6), //Numero Sequencial da Remessa
                    '040', //Layout do Arquivo
                    '00000', //Densidade de Gravação do Arquivo
                    spc(20),//uso do banco
                    spc(20),//uso da empresa
                    spc(19), //brancos
                    spc(10) //ocorrências para retorno
                    )); // Brancos
   End;
End;

procedure TFolhaPagReal.TrailerLote;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

      WriteLn(ArquivoRemessa,
              Concat('356', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Contador do Lote de Serviço
                    '5', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iTotRegLote),6), // Contador de Registros no Lote
                    ZD(RemoveVirgulas(rTotalValorPagoLote,2),18),//Valor Pagto
                    ZD('0',18), //qtde de moedas
                    Spc(171), //uso do banco
                    ZD('0',10) )); // Complemento de Registro
      rTotalValorPagoLote := 0;
      iTotRegLote := 0;
   End;
End;

procedure TFolhaPagReal.TrailerArquivoReal;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);

      WriteLn(ArquivoRemessa,
              Concat('356', // Código do banco
                    '9999', // Contador do Lote de Serviço
                    '9', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iNumSeqLote),6), // Contador de Registros no Lote
                    Zd(IntToStr(iTotRegArq),6), // Contador de Registros no Lote
                    Spc(6),//ZD('0',6), //qtde de contas p/conc (lotes)
                    Spc(205))); // uso do banco
  End;
End;

procedure TFolhaPagReal.HeaderLote;
VAR
  DVAGCC:STRING[1];
  sTipoPagto : String;
  sagencia, dvag, scontaCorr, dvcc : string;
Begin
   sagencia := '';
   dvag := ' ';
   scontaCorr := '';
   dvcc := ' ';

   sTipoPagto := IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString;
   if trim(IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString) = '90' then
   begin
     sTipoPagto := '30';
     if strToInt(sFormaPgto) = 12 then //se é TED
       sTipoPagto := '12';
   end;

   With IntBancoManager Do
   Begin
      sagencia   := GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,false, true);
      dvag       := GetDvAg(CdsEmpresa.FieldByName('NUMAGENCIA').AsString);
      scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, false, true);
      dvcc       := GetDvCC(CdsEmpresa.FieldByName('NUMCONTA').AsString);
//      dvcc       := AE(copy(GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, true, true), length(GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, true, true)) -1, 1), 1); //dv ag/cc
      DVAGCC     :=  ' '; //AE(copy(GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, true, true), length(GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, true, true))   , 1), 1); //dv ag/cc, //dv ag/cc

      Inc(iTotRegArq);
      Inc(iTotRegLote);
      Inc(iNumSeqLote);
//      DVAGCC := GetDvCC;
//      IF LENGTH(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString))>13 THEN
//         DVAGCC:=COPY(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString),14,1);//DV AG/CC

      WriteLn(ArquivoRemessa,
              Concat('356', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    'C', // Brancos
                    '90', // Tipo de Serviço
                    ZD(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2),  // Forma de Pagamento
                    '030', //Versão do layout de lote
                    spc(1), //Branco
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    AE(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), //
                    sagencia, DvAg, scontaCorr, dvCC,
                    AE(DVAGCC,1),
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    AE(Mensagem1, 40),
                    AE(CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), //Endereço
                    ZD(CdsEmpresa.FieldByName('NUMERO').AsString,5),//Número
                    AE(CdsEmpresa.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                    AE(CdsEmpresa.FieldByName('CIDADE').AsString,20),//Cidade
                    ZE(CdsEmpresa.FieldByName('CEP').AsString,8),//Cep
                    AE(CdsEmpresa.FieldByName('CODESTADO').AsString,2),//Estado
                    Spc(18))); // uso exclusivo Febraban CNAB
   End;
End;

procedure TFolhaPagReal.DetalheA;
VAR DVAGCC, dvCC, dvAg : STRING[1];
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

//      if ZD(GetCC(13,False,True), 13) = '0000000000000' then //recibo op
//        DVAGCC := '0'
//      else
      DVAGCC := ' ';

      {ANDRE TAVARES Pendência 21932. 29/03/2006
      if trim(GetDVCC) = '' then
        dvCC := Zd(GetDVCC, 1);
      }
      if trim(GetDVCC) = '' then
        dvCC := ' '
      else dvCC := Zd(GetDVCC, 1);

      if (trim(GetDvAg) = '') or (trim(GetDvAg) = '0') then //NO CASO DE ORDEM DE PAGAMENTOS O DV TEM QUE SER = 0 MESMO
        dvAg := '0'
      else
        dvAg := trim(GetDvAg);

      //Acerto Do Teste da Conta Corrente
    {  IF LENGTH(TRIM(CdsTexto.FieldByName('CONTACORRENTE').AsString))>13 THEN
        DVAGCC := GetDvCC;
    }



      //DVAGCC     := AE(copy(GetCC(12,True,True), length(GetCC(12,True,True))   , 1), 1); //dv ag/cc, //dv ag/cc

      WriteLn(ArquivoRemessa,
              Concat('356', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(iTotRegLote),5), // Código Contador do Registro No Lote
                    'A', // Código Segmento
                    '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                    sCodCamaraComp,  // código da camara de compensaçao
                    ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
                    GetAG(5,false,True),
                    //zd(GetDVAG, 1),// DV AG
                    dvAg,
                    //GetCC(12,False,True), // CC
                    Zd(GetCC(12,False,True), 12),
                    dvCC,
                    DVAGCC,  //DVAGCC
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                    AE(trim(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString),20), //Nº Documento
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    'BRL', // código da Moeda
                    ZD('0',15), //QTD MOEDA
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
                    Spc(20), //Brancos
                    //RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data real do pagamento
                    '00000000', //Data real do pagamento
                    ZD('0',15),
                    Spc(40), //Mensagem Específica Para o Registro
                    ZD(CdsTexto.FieldByName('CODTIPOPAGTO').AsString, 2), //finalidade do DOC, TED CIP e TED (código do motivo do pagamento) 99 = outros
                    Spc(10), //Branco
                    AE(CdsTexto.FieldByName('FLGEMITEAVISO').AsString,1), //Emite Aviso Cobrança
                    Spc(10)));

      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
   End;
End;

procedure TFolhaPagReal.DetalheB;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

      If CdsTexto.FieldByName('TIPO').AsString = 'F' Then
         sTipoInsc := '1'
      Else
         sTipoInsc := '2';

      WriteLn(ArquivoRemessa,
              Concat('356', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(iTotRegLote),5), //
                    'B', // Código Sequencial
                    Spc(3), //Brancos
                    sTipoInsc,//Tipo InsCricao Favorecido
                    ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Num Inscricao do Favorecido
                    AE(CdsTexto.FieldByName('LOGRADOURO').AsString,30), //Endereço
                    ZD(CdsTexto.FieldByName('NUMERO').AsString,5),//Número
                    AE(CdsTexto.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                    AE(CdsTexto.FieldByName('BAIRRO').AsString,15),//Bairro
                    AE(CdsTexto.FieldByName('CIDADE').AsString,20),//Cidade
                    ZE(CdsTexto.FieldByName('CEP').AsString,8),//Cep
                    AE(CdsTexto.FieldByName('CODESTADO').AsString,2),//Estado
                    formatDateTime('DDMMYYYY',CdsTexto.FieldByName('DATAVENCTO').AsDateTime),
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),
                    ZD('0', 15),
                    //início andre tavares - pendência 21789 - 20/03/2006
                    //ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),
                    //ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),
                    ZD('0', 30),
                    //fim andre tavares - pendência 21789 - 20/03/2006
                    ZD('0', 15),
                    ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), // Número do documento que identifica o favorecido
                    Spc(15))); // Complemento de Registro
   End;
End;


function TFolhaPagReal.GetNomeArq: string;
begin
  IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Sql.Text :=
  ' SELECT  '+
  '   nvl(S.CONTROLEREMESSA, 0) AS CONTROLEREMESSA, P.NUMEMPRESABANCO '+
  ' FROM PORTADORFORMA P, SEQREMESSA S WHERE CODPORTFORMA = '+ IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsString +
  ' AND IDPESSOA = ' + inttostr(sistema.idempresa) +
  ' AND P.NUMEMPRESABANCO = S.NUMEMPRESABANCO ';
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;
  sNumEmpresaBanco := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('NUMEMPRESABANCO').asString;
  iSeqArquivo := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('CONTROLEREMESSA').asInteger + 1;

// andre tavares - pendência 25191 - 08/05/2007
//  result := 'REALFOLPAG' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iSeqArquivo), 2) + '.DAT';
  result := 'REALFOLPAG' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iSeqArquivo), 5) + '.DAT';


end;



end.





