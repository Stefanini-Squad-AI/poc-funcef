{************************************************************************}
{                                                                        }
{ ** Todos os Direitos Reservados                                        }
{ 23/04/2004                                                             }
{ - TPagREALcnab240: Implementação do arquivo de Pagamento do banco real }
{ Analista Responsável: André Tavares                                    }
{ andre tavares - pendência 18396 - 01/09/2005 - preencher o CPF ou CNPJ com zeros à esquerda }
{************************************************************************}

unit UPagRealCnab240;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls;

Type
   TPagREALcnab240 = Class
   private
     sNumEmpresaBanco : string;
     sFormaPagto : String; // André Tavares - pendência 15976
     {Mensagem genérica a ser impressa no arquivo }
     sMensagem1:string;
     {lista dos CODPORTFORMA a serem atualizados pela emissão do arquivo >>>> ARGH, Foi Ela !!!!!!!}
     lista:string;
     {Arquivo a ser gerado}
     ArquivoRemessa: TextFile;
     {Contadpr do total de registros do arquivo}
     iTotRegArq: Integer;
     {Contador sequencial do lotes do arquivo}
     iNumSeqLote: Integer;
     {Contador do total de registros do lote}
     iTotRegLote: Integer;
     {Contador sequencial de registros}
     ISEQREG: Integer;
     {tipo de documento da empresa}
     sTipoInsc: String;
     {Número de inscrição da empresa}
     sCodInscEmpresa: String;
     {Valor Total dos pagamentos do lote}
     rTotalValorPagoLote: Real;

     iSeqArquivo : integer;

     procedure MontaHeader(iFormaPag:Integer);
     {Monta o Detalhe do Lote do arquivo de acordo com a forma de pagamento}
     procedure MontaDetalhe(iFormaPag:Integer);
     {Monta o Traileo do Lote do arquivo de acordo com a forma de pagamento}
     procedure MontaTrailer(iFormaPag:Integer);

     {Header Geral do Arquivo}
     procedure HeaderArquivoRealCnab240;
        {Header Pagamento A Fornecedores}
        procedure HeaderLote;
           {Detalhe Segmento A - Pagamento A Fornecedores}
           procedure DetalheRealCnab240PagForne_A;
           {Detalhe Segmento B - Pagamento A Fornecedores}
           procedure DetalheRealCnab240PagForne_B;
           {Detalhe Segmento B - Pagamento A Fornecedores}
           procedure DetalheRealCnab240PagForne_C;
        {Trailer Lote Genérico}
        procedure TrailerLote;
     {Trailer Geral do Arquivo}

        procedure HeaderLiqTitulos;
        procedure DetalheLiqTitulos_J;
        procedure TrailerLiqTitulos;
     procedure TrailerArquivoRealCnab240;
   public
     {Monta arquivo de pagamento do banco do brasil}
     Procedure PagamentosRealCnab240;
     // pega o nome do arquivo;
     function GetNomeArq : string;

end;

Var
  PagREALcnab240: TPagREALcnab240;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString;

Procedure TPagREALcnab240.PagamentosRealCnab240;
Var iTipoPag,iFormaPag:Integer;

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

    intBancoManager.DtmIntBanco.CdsValMaximo.Close;
    intBancoManager.DtmIntBanco.sqlValMaximo.prepare;
    intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := intBancoManager.CdsTexto.FieldByName('CODPORTFORMA').asString;
    intBancoManager.DtmIntBanco.sqlValMaximo.Open;

    if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
       (intBancoManager.CdsTexto.FieldByName('VALOR').asFloat >= intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
       (intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
    begin
      sFormaPagto := intBancoManager.CdsTexto.FieldByName('CODFORMAPGTOALT').AsString;
      if intBancoManager.iFloatExternoAlt > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        //pendência 27109
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.iFloatExternoAlt,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      else //senão usa o float do portadorforma
        //pendência 27109
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAISALT').AsInteger,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    end
    else
    begin
      sFormaPagto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
      if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        //pendência 27109
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.iFloatExterno,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
      else //senão usa o float do portadorforma
        //pendência 27109
        intBancoManager.CalcDataComFloatPag(intBancoManager.DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asInteger,
                                            dataAux,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('DMAIS').AsInteger,
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGFLOATARQBANC').AsString = 'S',
                                            intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('FLGDATATDEBCRED').AsString = 'C')
    end;

  end;


begin
 sFormaPagto := '';

 With IntBancoManager Do
 Begin
     Try
          DtmIntBanco.CdsValMaximo.Close;
          DtmIntBanco.sqlValMaximo.prepare;
          DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
          DtmIntBanco.sqlValMaximo.Open;

          MudaFormaPag;
          iTipoPag    := 0;
          iFormaPag   := 0;
          iNumSeqLote := 0;
          iTotRegLote := 0;
          ISEQREG     := 0;
          iTotRegArq  := 0;

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
             sCodInscEmpresa := '1'
          Else
             sCodInscEmpresa := '2';

          HeaderArquivoRealCnab240;
          sMensagem1 := BuscaParamIntBanco('MENSAGEM1','S');
          lista:='';
          CdsTexto.First;
          iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
          iFormaPag := CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger;

        DtmIntBanco.CdsValMaximo.Close;
        DtmIntBanco.sqlValMaximo.prepare;
        DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
        DtmIntBanco.sqlValMaximo.Open;

        if (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
           (iFormaPag  <> strToInt(sFormaPagto)) then
        begin
          iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
          iFormaPag := strToInt(sFormaPagto);
        end;

        MontaHeader(iFormaPag);
        While Not CdsTexto.Eof Do
        Begin
          MudaFormaPag;

          if (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
             (iFormaPag  <> strToInt(sFormaPagto)) then
          begin
            sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString; // andre tavares - mudou o serviço
            iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
            iFormaPag := strToInt(sFormaPagto);
            MontaHeader(iFormaPag);
          end;


          MontaDetalhe(iFormaPag);

          if (trim(lista)<> '') then
          begin
              if Pos(CdsTexto.FieldByName('codportador').asstring,lista) =0 then
                 lista:=lista+','+CdsTexto.FieldByName('codportador').asstring ;
          end
          else
             lista := CdsTexto.FieldByName('codportador').asstring;

          //pendência 26926 - 09/01/2008
          if not intBancoManager.bUsaDataIntBanco then
            intBancoManager.DataPagamento := '';

          CdsTexto.Next;

          intbancoManager.DataPagamento := '';

          if (CdsTexto.Eof) or
             (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
             (iFormaPag  <> strToInt(sFormaPagto)) then
          begin
            ISEQREG := 0;
            MontaTrailer(iFormaPag);
          end;
       End; // while

          //Trailer Geral
          TrailerArquivoRealCnab240;

          CloseFile(ArquivoRemessa);

         UltCodArquivoGerado := intToStr(iSeqArquivo);

         if not IntBancoManager.ExecSQL(' UPDATE SEQREMESSA SET CONTROLEREMESSA = '+ intToStr(iSeqArquivo)+
                                  ' WHERE NUMEMPRESABANCO = '+ quotedStr(sNumEmpresaBanco)) then
           raise Exception.Create(IntBancoManager.MessageInfo);

          IntBancoManager.MostraArquivo;
          bArquivoCriado:= True;
     Except
          bArquivoCriado:= False;
          CloseFile(ArquivoRemessa);
          Raise;
     End;
 End;
End;

procedure TPagREALcnab240.HeaderArquivoRealCnab240;
var sTipoServ: string;
    sagencia, dvag, scontaCorr, dvcc : string;
Begin
  //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
  if trim(intbancoManager.DataPagamento) <> '' then
    intBancoManager.dRestoreDtPagamento := strToDate(intbancoManager.DataPagamento);

   sagencia := '';
   dvag := ' ';
   scontaCorr := '';
   dvcc := ' ';
   With IntBancoManager Do
   Begin
      sagencia   := GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,false, true);
      dvag       := GetDvAg(CdsEmpresa.FieldByName('NUMAGENCIA').AsString);
      scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, false, true);
      dvcc       := GetDvCC(CdsEmpresa.FieldByName('NUMCONTA').AsString);
      // início - André Tavares - 23/01/2004 - pendência 15976
      sTipoServ := AE(BuscaParamIntBanco('TIPOSERVICO','S'),2);
      if trim(sTipoServ) = '00' then
        sTipoServ := '  ';
      // fim    - André Tavares - 23/01/2004 - pendência 15976

      Inc(iTotRegArq);
      WriteLn(ArquivoRemessa,
              Concat('356', // Código do banco
                    '0000', // Código do Lote
                    '0', // Tipo de Registro
                    Spc(9), // Brancos
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    AE(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), // Númeoro de Inscrição
                    sagencia, //AGENCIA
                    dvAg,   //DV AG
                    scontaCorr, //CONTACORRENTE
                    dvcc,   //DV CC
                    ' ',
                    // fim    - André Tavares - 23/01/2004 - pendência 15976
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    Ae('BANCO REAL S.A.',30), // Nome do Banco
                    Spc(10), // Branco
                    '1', // Indica Arquivo de Remessa
                    RemoveBarras2(DateToStr(Date)), //Data Gravação do Arquivo
                    RemovePontos(TimeToStr(Time)), //Hora Gravação do Arquivo
                    Zd((intToStr(iSeqArquivo)),6), //Numero Sequencial da Remessa
                    '040', //Layout do Arquivo
                    '00000', //Densidade de Gravação do Arquivo
                    Spc(69) // Reservado banco(20) + Reservado Empresa (20) + Uso exclusivo FEBRABAN / CNAB (29)
                    ));
   End;
End;


//************************************
procedure TPagREALcnab240.HeaderLiqTitulos;
VAR DVAGCC:STRING[1];
    sagencia, dvag, scontaCorr, dvcc : string;
Begin
   sagencia := '';
   dvag := ' ';
   scontaCorr := '';
   dvcc := ' ';
   With IntBancoManager Do
   Begin
      sagencia   := GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,false, true);
      dvag       := GetDvAg(CdsEmpresa.FieldByName('NUMAGENCIA').AsString);
      scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, false, true);
      dvcc       := GetDvCC(CdsEmpresa.FieldByName('NUMCONTA').AsString);

      Inc(iTotRegArq);
      Inc(iTotRegLote);
      Inc(iNumSeqLote);

      DVAGCC:='';
      IF LENGTH(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString))>13 THEN
         DVAGCC:=COPY(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString),14,1);//DV AG/CC

      WriteLn(ArquivoRemessa,
              Concat('356', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    'C', // Brancos
                    ZD(CdsTexto.FieldByName('CODTIPOPAGTO').AsString,2), // Tipo de Pagamento
                    ZD(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2),  // Forma de Pagamento
                    '020', //Layout
                    SPC(1), //Branco
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), // Númeoro de Inscrição

                    sagencia, DvAg, scontaCorr, dvCC,
                    {
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('numagencia').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                    AE(COPY(CdsEmpresa.FieldByName('numagencia').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG)),1),1),   //DV AG
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG))-1)),12), //CONTACORRENTE
                    AE(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG)),1),1),   //DV CC
                    }
                    AE(DVAGCC,1),
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    AE( sMensagem1 ,40),
                    AE(CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), //Endereço
                    ZD(CdsEmpresa.FieldByName('NUMERO').AsString,5),//Número
                    AE(CdsEmpresa.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                    AE(CdsEmpresa.FieldByName('CIDADE').AsString,20),//Cidade
                    ZE(CdsEmpresa.FieldByName('CEP').AsString,8),//Cep
                    AE(CdsEmpresa.FieldByName('CODESTADO').AsString,2),//Estado
                    Spc(18))); // Complemento de Registro
   End;
End;


procedure TPagREALcnab240.DetalheLiqTitulos_J;
Var
   sBarras, sBanco, sMoeda, sCampoLivre, sDv, sValor: String;
Begin

   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

      If CdsTexto.FieldByName('CODBARRA').IsNull Then
      Begin
         sBarras     := CdsTexto.FieldByName('CODBARRAVALOR').AsString;
         sBarras     := ZE(sBarras,47);
         sBanco      := Copy(sBarras,1,3);
         sMoeda      := Copy(sBarras,4,1);
         sCampoLivre := Copy(sBarras,5,5) + Copy(sBarras,11,10) + Copy(sBarras,22,10);
         sDv         := Copy(sBarras,33,1);
         sValor      := ZD(Trim(Copy(sBarras,34,14)),14);
      End
      Else
      Begin
         sBarras     := CdsTexto.FieldByName('CODBARRA').AsString;
         sBarras     := ZE(sBarras,44);
         sBanco      := Copy(sBarras,1,3);
         sMoeda      := Copy(sBarras,4,1);
         sDv         := Copy(sBarras,5,1);
         sValor      := ZD(Trim(Copy(sBarras,6,14)),14);
         sCampoLivre := Copy(sBarras,20,25);
      End;


      WriteLn(ArquivoRemessa,
              Concat('356', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // Código Contador do Registro No Lote
                    'J', // Código Sequencial
                    '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio

                    //inicio codigo de barras
                    ZD(sBanco,3),
                    ZD(sMoeda,1),
                    ZD(sDv,1),
                    ZD(sValor,14),
                    ZD(sCampoLivre,25),
                    //fim codigo de barras

                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                    RemoveBarras2(CdsTexto.FieldByName('DATAVENCTO').AsString), //Dat Prevista Para Pagto

                    //inicio - andre tavares - pendência 21789 - 20/03/2006
                    //ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
                    ZD(RemoveVirgulas(ValorBrutoDoc(CdsTexto.FieldByName('VALOR').AsFloat, CdsTexto.FieldByName('VALORDESCONTO').AsFloat, CdsTexto.FieldByName('VALORJUROS').AsFloat),2),15), // Valor do NOMINAL
                    //fim - andre tavares - pendência 21789 - 20/03/2006

                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto

                    //inicio - andre tavares - pendência 21789 - 20/03/2006
                    {ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat -
                                      CdsTexto.FieldByName('VALORDESCONTO').AsFloat +
                                      CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),//Valor Pagto}
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
                    //fim - andre tavares - pendência 21789 - 20/03/2006

                    ZD('0',15), //Brancos
                    AE(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString,20), // Identificador do Sacado
                    Spc(18)));

                    //inicio - andre tavares - pendência 21789 - 20/03/2006
                    {rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat -
                                                                 CdsTexto.FieldByName('VALORDESCONTO').AsFloat +
                                                                 CdsTexto.FieldByName('VALORJUROS').AsFloat;}
                    rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
                    //fim - andre tavares - pendência 21789 - 20/03/2006
   End;
End;

procedure TPagREALcnab240.TrailerLiqTitulos;
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
                    SPC(199) ));
      rTotalValorPagoLote := 0;
      iTotRegLote := 0;
   End;
End;

//************************************
procedure TPagREALcnab240.TrailerArquivoRealCnab240;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);

      Write(ArquivoRemessa,
              Concat('356', // Código do banco
                    '9999', // Contador do Lote de Serviço
                    '9', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iNumSeqLote),6), // Contador de Registros no Lote
                    Zd(IntToStr(iTotRegArq),6), // Contador de Registros no Lote
                    ZD('0',6),
                    Spc(205))); // Complemento de Registro
  End;
End;

//***********************************************
procedure TPagREALcnab240.HeaderLote;
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
     if strToInt(sFormaPagto) = 12 then //se é TED
       sTipoPagto := '12';
   end;

   With IntBancoManager Do
   Begin
      sagencia   := GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,false, true);
      dvag       := GetDvAg(CdsEmpresa.FieldByName('NUMAGENCIA').AsString);
      scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, false, true);
      dvcc       := GetDvCC(CdsEmpresa.FieldByName('NUMCONTA').AsString);

      Inc(iTotRegArq);
      Inc(iTotRegLote);
      Inc(iNumSeqLote);
      DVAGCC:='';
      IF LENGTH(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString))>13 THEN
         DVAGCC:=COPY(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString),14,1);//DV AG/CC

      WriteLn(ArquivoRemessa,
              Concat('356', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    'C', // Brancos
                    ZD(sTipoPagto,2), // Tipo de Serviço
                    ZD(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2),  // Forma de Pagamento
                    '030', //Layout
                    spc(1), //Branco
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    AE(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), //
                    sagencia, DvAg, scontaCorr, dvCC,
                    {
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('numagencia').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                    AE(COPY(CdsEmpresa.FieldByName('numagencia').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG)),1),1),   //DV AG
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG))-1)),12), //CONTACORRENTE
                    AE(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG)),1),1),   //DV CC
                    }
                    AE(DVAGCC,1),
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    AE( sMensagem1 ,40),
                    AE(CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), //Endereço
                    ZD(CdsEmpresa.FieldByName('NUMERO').AsString,5),//Número
                    AE(CdsEmpresa.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                    AE(CdsEmpresa.FieldByName('CIDADE').AsString,20),//Cidade
                    ZE(CdsEmpresa.FieldByName('CEP').AsString,8),//Cep
                    AE(CdsEmpresa.FieldByName('CODESTADO').AsString,2),//Estado
                    Spc(18))); // uso exclusivo Febraban CNAB
   End;
End;

procedure TPagREALcnab240.DetalheRealCnab240PagForne_A;
VAR DVAGCC, dvCC : STRING[1];
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);
      DVAGCC:=' ';
      dvCC := GetDVCC;
      if trim(dvCC) = '' then
        dvCC := ' '; 
      //Acerto Do Teste da Conta Corrente
      IF LENGTH(TRIM(CdsTexto.FieldByName('CONTACORRENTE').AsString))>13 THEN
         DVAGCC := COPY(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString),14,1);//DV AG/CC

      WriteLn(ArquivoRemessa,
              Concat('356', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // Código Contador do Registro No Lote
                    'A', // Código Sequencial
                    '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                    '018',  // código do tipo de pagamento
                    ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
                    // andre tavares - 20276 - 22/09/2005 - estava truncando o último dígito se fosse igual a zero
                    // GetAG(6,True,True),
                    GetAG(5,True,True),
                    AE(GetDvAg, 1),
                    zd(GetCC(12, false, True), 12),
                    AE(dvCC, 1),
                    AE(DVAGCC,1),
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                    // início - André Tavares - 23/01/2004 - pendência 15976
                    // AE(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString,20), //Nº Documento
                    AE(trim(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString),20), //Nº Documento
                    // fim    - André Tavares - 23/01/2004 - pendência 15976
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    // início - André Tavares - 23/01/2004 - pendência 15976
                    //SPC(3), //MOEDA
                    'BRL', // código da Moeda
                    // fim    - André Tavares - 23/01/2004 - pendência 15976
                    ZD('0',15), //QTD MOEDA
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
                    Spc(20), //Brancos
                    ZD('0',23),
                    Spc(40), //Mensagem Específica Para o Registro
                    Spc(12), //Branco
                    AE(CdsTexto.FieldByName('FLGEMITEAVISO').AsString,1), //Emite Aviso Cobrança
                    Spc(10)));

      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
   End;
End;

procedure TPagREALcnab240.DetalheRealCnab240PagForne_B;
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
                    Zd(IntToStr(ISEQREG),5), //
                    'B', // Código Sequencial
                    Spc(3), //Brancos
                    sTipoInsc,//Tipo InsCricao Favorecido
                    // início - andre tavares - pendência 18396 - 01/09/2005 - preencher o CPF ou CNPJ com zeros à esquerda
                    //AE(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Num Inscricao do Favorecido
                    ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Num Inscricao do Favorecido
                    // fim - andre tavares - pendência 18396 - 01/09/2005 - preencher o CPF ou CNPJ com zeros à esquerda
                    AE(CdsTexto.FieldByName('LOGRADOURO').AsString,30), //Endereço
                    ZD(CdsTexto.FieldByName('NUMERO').AsString,5),//Número
                    AE(CdsTexto.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                    AE(CdsTexto.FieldByName('BAIRRO').AsString,15),//Bairro
                    AE(CdsTexto.FieldByName('CIDADE').AsString,20),//Cidade
                    ZE(CdsTexto.FieldByName('CEP').AsString,8),//Cep
                    AE(CdsTexto.FieldByName('CODESTADO').AsString,2),//Estado
                    RemoveBarras2(CdsTexto.FieldByName('DATAVENCTO').AsString)  ,
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),
                    ZD('0',15),
                    //inicio - andre tavares - pendência 21789 - 20/03/2006
                    //ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),
                    //ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),
                    ZD('0', 30),
                    //fim - andre tavares - pendência 21789 - 20/03/2006
                    ZD('0',15),
                    AE(CdsTexto.FieldByName('CODDOCUMENTO').AsString,15),
                    Spc(15))); // Complemento de Registro
   End;
End;



procedure TPagREALcnab240.DetalheRealCnab240PagForne_C;
var  sagencia, dvag, scontaCorr, dvcc : string;
Begin
   sagencia := '';
   dvag := ' ';
   scontaCorr := '';
   dvcc := ' ';
   With IntBancoManager Do
   Begin
      sagencia   := GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,false, true);
      dvag       := GetDvAg(CdsEmpresa.FieldByName('NUMAGENCIA').AsString);
      scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, false, true);
      dvcc       := GetDvCC(CdsEmpresa.FieldByName('NUMCONTA').AsString);

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
                    Zd(IntToStr(ISEQREG),5), //
                    'C', // Código Sequencial
                    Spc(3), //Brancos

                    ZD('0',15), //valor IR
                    ZD('0',15), //valor ISS
                    ZD('0',15), //valor IOF
                    ZD('0',15), //valor outras deduçoes                 
                    //inicio - andre tavares - pendência 21789 - 20/03/2006
                    //ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15), // valor outros acréscimos
                    ZD('0',15),
                    //fim - andre tavares - pendência 21789 - 20/03/2006

                    sagencia, DvAg, scontaCorr, dvCC,
                    {
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('numagencia').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                    AE(COPY(CdsEmpresa.FieldByName('numagencia').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG)),1),1),   //DV AG
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG))-1)),12), //CONTACORRENTE
                    AE(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG)),1),1),   //DV CC
                    }

                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),
                    Spc(113))); // Complemento de Registro
   End;
End;

procedure TPagREALcnab240.TrailerLote;
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
                    ZD('0',18),
                    Spc(171),
                    ZD('0',10) )); // Complemento de Registro
      rTotalValorPagoLote := 0;
      iTotRegLote := 0;
   End;
End;
//***********************************************

procedure TPagREALcnab240.MontaDetalhe(iFormaPag:Integer);
Begin
  Case iFormaPag of  1,2,3,5,10,20,18:   // andre tavares - coloquei a forma de pagamento 18 (TED).
    Begin
      sFormaPagto := zd(intToStr(iFormaPag), 3); 
      INC(ISEQREG);
      DetalheRealCnab240PagForne_A;
      // na emissão de um doc/ted necessário gerar o segmento B também
      If ((iFormaPag in [3, 18]) and ((sFormaPagto = '003') or (sFormaPagto = '018'))) {DOC} or ((Not IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').IsNull) AND
         (IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').ASSTRING <>'0')) Then
      begin
        INC(ISEQREG);
        DetalheRealCnab240PagForne_B;
      end;
    end 
    else // do case
    begin
     INC(ISEQREG);
     DetalheLiqTitulos_J;
    end;
  end; //case
End;

procedure TPagREALcnab240.MontaHeader(iFormaPag:Integer);
Begin
  Case iFormaPag of
  1,2,3,5,10,18,20: HeaderLote;
  31,30        : HeaderLiqTitulos;
  End;
End;


procedure TPagREALcnab240.MontaTrailer(iFormaPag:Integer);
Begin
  ISEQREG:=0;
  Case iFormaPag of
  1,2,3,5,10,18,20: TrailerLote;
  30,31        : TrailerLiqTitulos;
  End;
End;


function TPagREALcnab240.GetNomeArq: string;
begin
{
  IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Sql.Text :=
  ' SELECT nvl(CONTROLEREMESSA, 0) AS CONTROLEREMESSA FROM MODELOSCNAB WHERE IDMODELOSCNAB = 52 ';
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;
  iSeqArquivo := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('CONTROLEREMESSA').asInteger + 1;
}

//inicio - andre tavares - pendência 18494 - 20/01/2005
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
//fim - andre tavares - pendência 18494 - 20/01/2005

// andre tavares - pendência 25191 - 08/05/2007
//  result := 'REALDOC' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iSeqArquivo), 2) + '.DAT';
  result := 'REALDOC' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iSeqArquivo), 5) + '.DAT';
end;

end.



