{*******************************************************}
{   BANCO BANESPA - FOLHA DE PAGAMENTO - CNAB 240       }
{   IDMODELOSCNAB 56/P                                  }
{                                                       }
{ Autor: André Tavares   07/10/2005                     }
{*******************************************************}

unit uFolhaPagBanespaMT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls{, uCmFileUtils};

Type
   TFolhaPagBanespa = Class
   private
     sNumEmpresaBanco : string;
     SFinalidade, sFormaPgto, sCodCamaraComp : String;
   
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
     procedure HeaderArquivoBanespa; //ok *** verificar o campo "ocorrência para retorno"
       {Header de Lote - Cartão Salário}
       procedure HeaderLote; //ok  *** verificar
           procedure DetalheA; //ok
           procedure DetalheB; //ok
       procedure TrailerLote; //ok
     {Trailer Geral do Arquivo}
     procedure TrailerArquivoBanespa; //ok

   public

     iSeqArquivo : Integer;
     {Monta arquivo folha de pagamento Banespa}
     Procedure FolhaPagamentosBanespa;
     function GetNomeArq: string;
end;

Var
  FolhaPagBanespa: TFolhaPagBanespa;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString;



Procedure TFolhaPagBanespa.FolhaPagamentosBanespa;
Var
 iTipoPag, iFormaPag : Integer;

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
    begin
      sFormaPgto := intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;
      sCodCamaraComp := '018';
      if intBancoManager.iFloatExternoAlt > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        intBancoManager.CalcDataComFloatPag(intBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.iFloatExternoAlt,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      else //senão usa o float do portadorforma
        intBancoManager.CalcDataComFloatPag(intBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAISALT').AsInteger,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    end
    else
    begin
      if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) then //doc normal
      begin
        sFormaPgto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
        sCodCamaraComp := '700';
        if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
          intBancoManager.CalcDataComFloatPag(intBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asInteger,
                                              dataAux,
                                              intBancoManager.iFloatExterno,
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
        else //senão usa o float do portadorforma
          intBancoManager.CalcDataComFloatPag(intBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asInteger,
                                              dataAux,
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAIS').AsInteger,
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      end
      else if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 1) then //Cred CC
      begin
        sFormaPgto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
        sCodCamaraComp := '000';
        if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
          intBancoManager.CalcDataComFloatPag(intBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asInteger,
                                              dataAux,
                                              intBancoManager.iFloatExterno,
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
        else //senão usa o float do portadorforma
          intBancoManager.CalcDataComFloatPag(intBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asInteger,
                                              dataAux,
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAIS').AsInteger,
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      end else
      begin
        sFormaPgto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString; //ted str
        sCodCamaraComp := '810';
        if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
          intBancoManager.CalcDataComFloatPag(intBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asInteger,
                                              dataAux,
                                              intBancoManager.iFloatExterno,
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
        else //senão usa o float do portadorforma
          intBancoManager.CalcDataComFloatPag(intBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asInteger,
                                              dataAux,
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAIS').AsInteger,
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                              intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      end
    end;
  end;
  //fim - andré tavares - pendência 21782 - 22/03/2007 - utiliza o float do doc


begin
  sFormaPgto := '';
  sCodCamaraComp := '010';
  With IntBancoManager Do
  Begin
    Try
      DtmIntBanco.CdsValMaximo.Close;
      DtmIntBanco.sqlValMaximo.prepare;
      DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
      DtmIntBanco.sqlValMaximo.Open;
      MudaFormaPag;
      iTipoPag            := 0;
      iFormaPag           := 0;
      iNumSeqLote         := 0;
      iTotRegLote         := 0;
      //ISEQREG             := 0;
      iTotRegArq          := 0;
      rTotalValorPagoLote := 0;

      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);

      If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
         sCodInscEmpresa := '1'
      Else
         sCodInscEmpresa := '2';

      HeaderArquivoBanespa;

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
      TrailerArquivoBanespa;

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

procedure TFolhaPagBanespa.HeaderArquivoBanespa;
begin
  //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
  //if trim(intbancoManager.DataPagamento) <> '' then
  //  intBancoManager.dRestoreDtPagamento := strToDate(intbancoManager.DataPagamento);

  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    //Inc(iNumRemessa); andre tavares - pendência 21729 - 14/03/2006
    WriteLn(ArquivoRemessa,
            Concat('033', // Código do banco
                   '0000', // Código do Lote
                   '0', // Tipo de Registro
                    Spc(9) , // Brancos
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
                    AE(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), // código do convênio com o banco
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True), //Agência
                    ' ', // DV da Agência
                    GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,13,True,True), //Conta + DV
                    ' ', //dv ag/cc
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    Ae('Banco Santander Banespa',30), // Nome do Banco
                    spc(10), // Brancos
                    '1', // Indica Arquivo de Remessa
                    formatDateTime('DDMMYYYY', Date), //Data Gravação do Arquivo
                    formatDateTime('HHMMSS', Time), //Hora Gravação do Arquivo
                    // início - andre tavares - pendência 21729 - 14/03/2006
                    //Zd(IntToStr(iNumRemessa),6), //Numero Sequencial da Remessa
                    Zd(IntToStr(iSeqArquivo),6), //Numero Sequencial da Remessa
                    // fim - andre tavares - pendência 21729 - 14/03/2006
                    '060', //Layout do Arquivo
                    '00000', //Densidade de Gravação do Arquivo
                    spc(20),//uso do banco
                    spc(20),//uso da empresa
                    spc(19), //brancos
                    spc(10) //ocorrências para retorno
                    )); // Brancos
   End;
End;

procedure TFolhaPagBanespa.TrailerLote;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

      WriteLn(ArquivoRemessa,
              Concat('033', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Contador do Lote de Serviço
                    '5', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iTotRegLote),6), // Contador de Registros no Lote
                    ZD(RemoveVirgulas(rTotalValorPagoLote,2),18),//Valor Pagto
                    ZD('0',18),
                    Spc(171),
                    ZD('0',10) )); // Complemento de Registro
      rTotalValorPagoLote := 0;
      iTotRegLote := 0;
   End;
End;

procedure TFolhaPagBanespa.TrailerArquivoBanespa;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);

      WriteLn(ArquivoRemessa,
              Concat('033', // Código do banco
                    '9999', // Contador do Lote de Serviço
                    '9', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iNumSeqLote),6), // Contador de Registros no Lote
                    Zd(IntToStr(iTotRegArq),6), // Contador de Registros no Lote
                    Spc(211))); // Complemento de Registro
  End;
End;

procedure TFolhaPagBanespa.HeaderLote;
VAR
  DVAGCC:STRING[1];
  sTipoPagto : String;
  sagencia, dvag, scontaCorr, dvcc : string;
Begin
   sagencia := '';
   dvag := ' ';
   scontaCorr := '';
   dvcc := ' ';

   sFinalidade := IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString;
{   sTipoPagto := IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString;
   if trim(IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString) = '90' then
   begin
     sTipoPagto := '30';
     if strToInt(sFormaPgto) = 12 then //se é TED
       sTipoPagto := '12';
   end;
}
   With IntBancoManager Do
   Begin
      sagencia   := GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,false, true);
      dvag       := GetDvAg(CdsEmpresa.FieldByName('NUMAGENCIA').AsString);
      //scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, true, true);
      scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,13,True,True);
//      dvcc       := GetDvCC(CdsEmpresa.FieldByName('NUMCONTA').AsString);

      Inc(iTotRegArq);
      Inc(iTotRegLote);
      Inc(iNumSeqLote);
      DVAGCC:='';
      IF LENGTH(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString))>13 THEN
         DVAGCC:=COPY(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString),14,1);//DV AG/CC

      WriteLn(ArquivoRemessa,
              Concat('033', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    'C', // Brancos
                    '30', // Tipo de Serviço
                    ZD(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2),  // Forma de Pagamento
                    '031', //Versão do layout de lote
                    spc(1), //Branco
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    AE(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), //
                    sagencia, ' ', scontaCorr, //dvCC,
                    ' ',
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    spc(40),
                    AE(CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), //Endereço
                    ZD(CdsEmpresa.FieldByName('NUMERO').AsString,5),//Número
                    AE(CdsEmpresa.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                    AE(CdsEmpresa.FieldByName('CIDADE').AsString,20),//Cidade
                    ZE(CdsEmpresa.FieldByName('CEP').AsString,8),//Cep
                    AE(CdsEmpresa.FieldByName('CODESTADO').AsString,2),//Estado
                    Spc(18))); // uso exclusivo Febraban CNAB
   End;
End;

procedure TFolhaPagBanespa.DetalheA;
//VAR DVAGCC : STRING[1];
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);
      //DVAGCC:='';
      //Acerto Do Teste da Conta Corrente
      //IF LENGTH(TRIM(CdsTexto.FieldByName('CONTACORRENTE').AsString))>13 THEN
      //   DVAGCC := GetDvCC;

      WriteLn(ArquivoRemessa,
              Concat('033', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(iTotRegLote),5), // Código Contador do Registro No Lote
                    'A', // Código Segmento
                    '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                    sCodCamaraComp,  // código da camara de compensaçao
                    ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
                    GetAG(5,False,True),
                    ' ',// DV AG
                    GetCC(13,True,True),
                    ' ',
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                    AE(trim(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString),20), //Nº Documento

                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto

                    'BRL', // código da Moeda
                    ZD('0',15), //QTD MOEDA
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
                    Spc(20), //Brancos
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data real do pagamento
                    ZD('0',15),
                    Spc(40), //Mensagem Específica Para o Registro
                    ZD(SFinalidade, 2), //finalidade do DOC, TED CIP e TED (código do motivo do pagamento) 99 = outros
                    Spc(10), //Branco
                    AE(CdsTexto.FieldByName('FLGEMITEAVISO').AsString,1), //Emite Aviso Cobrança
                    Spc(10)));

      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
   End;
End;

procedure TFolhaPagBanespa.DetalheB;
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
              Concat('033', // Código do banco
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
                    FormatDateTime('HHNN', time), // horário do envio do pagamento
                    Spc(11),
                    Spc(15))); // Complemento de Registro
   End;
End;


function TFolhaPagBanespa.GetNomeArq: string;
begin
  SFinalidade := '99';
  IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Sql.Text :=
  ' SELECT  '+
  '   NVL(S.CONTROLEREMESSA, 0) AS CONTROLEREMESSA, P.NUMEMPRESABANCO, NVL(P.CODTIPOPAGTO, 99) AS CODTIPOPAGTO '+
  ' FROM PORTADORFORMA P, SEQREMESSA S WHERE CODPORTFORMA = '+ IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsString +
  ' AND IDPESSOA = ' + inttostr(sistema.idempresa) +
  ' AND P.NUMEMPRESABANCO = S.NUMEMPRESABANCO ';
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;
  sNumEmpresaBanco := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('NUMEMPRESABANCO').asString;
  iSeqArquivo := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('CONTROLEREMESSA').asInteger + 1;
//  SFinalidade := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('CODTIPOPAGTO').asString;
//  result := 'BANESPFOLPAG' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iSeqArquivo), 2) + '.DAT';
// andre tavares - pendência 24327 - 22/03/2007
  result := 'BANESPFOLPAG' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iSeqArquivo), 5) + '.DAT';
//  cmDebugToFile(IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Sql.Text + ' - '+SFinalidade, 'c:\log.txt');
end;



end.





