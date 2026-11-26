unit UPagBescCnab240;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls, dbclient {, ucmFileUtils};

Type
   TPagBesccnab240 = Class
   private
     sRecPag: string;
     sNumEmpresaBanco : string;
     sFormaPagto : String;
     SFinalidade, sCodCamaraComp: string;

     {Mensagem genérica a ser impressa no arquivo }
     sMensagem1:string;
     {lista dos CODPORTFORMA a serem atualizados pela emissão do arquivo }
     //lista:string; 
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

     //coódigo da GPS e CPF/CGC do contribuinte
     sCodPagGPS, sNumdocContrib, sNomeContrib : string; // para pagamento de GPS

     procedure MontaHeader(iFormaPag:Integer); //ok
     {Monta o Detalhe do Lote do arquivo de acordo com a forma de pagamento}
     procedure MontaDetalhe(iFormaPag:Integer); //ok
     {Monta o Traileo do Lote do arquivo de acordo com a forma de pagamento}
     procedure MontaTrailer(iFormaPag:Integer); //ok

     {Header Geral do Arquivo}
     procedure HeaderArquivoBescCnab240; //ok BESC
        {Header Pagamento A Fornecedores}
        procedure HeaderLote; //ok BESC
           {Detalhe Segmento A - Pagamento A Fornecedores}
           procedure DetalheBescCnab240PagForne_A; //ok BESC
           {Detalhe Segmento A - Pagamento de GPS}
//           procedure DetalheBescCnab240PagGPS_A; //ok  não encontrado no manual do BESC
           {Detalhe Segmento B - Pagamento A Fornecedores}
//           procedure DetalheBescCnab240PagForne_B; //ok  não encontrado no manual do BESC
           {Detalhe Segmento B - Pagamento de GPS}
//           procedure DetalheBescCnab240PagGPS_B; //ok //ok  não encontrado no manual do BESC
        {Trailer Lote Genérico}
        procedure TrailerLote; //ok BESC
     {Trailer Geral do Arquivo}

//        procedure HeaderLiqTitulos; //ok não encontrado no manual do BESC
//        procedure DetalheLiqTitulos_J; //ok não encontrado no manual do BESC
//        procedure TrailerLiqTitulos;  //ok  não encontrado no manual do BESC
     procedure TrailerArquivoBescCnab240; //ok

     function GetDadosGPS(const codDocumento: extended): Olevariant;
   public
     {Monta arquivo de pagamento do banco do brasil}
     Procedure PagamentosBescCnab240;
     // pega o nome do arquivo;
     function GetNomeArq : string;
end;

Var
  PagBescCnab240: TPagBesccnab240;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString;

Procedure TPagBesccnab240.PagamentosBescCnab240;
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
      sFormaPagto := intBancoManager.DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;
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
    else
    begin
      if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) then //doc normal
      begin
        sFormaPagto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
        sCodCamaraComp := '700';
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
      else if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 1) then //Cred CC
      begin
        sFormaPagto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
        sCodCamaraComp := '000';
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
      end else
      begin
        sFormaPagto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString; //ted str
        sCodCamaraComp := '018'; //sCodCamaraComp := '810';
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
    end;
  end;
  //fim - andré tavares - pendência 21782 - 22/03/2007 - utiliza o float do doc

begin
 sFormaPagto := '';
 sCodCamaraComp := '000';

 With IntBancoManager Do
 Begin
     Try
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

        HeaderArquivoBescCnab240;
        sMensagem1 := BuscaParamIntBanco('MENSAGEM1','S');
        //lista:='';
        CdsTexto.First;
        iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
        iFormaPag := CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger;

        DtmIntBanco.CdsValMaximo.Close;
        DtmIntBanco.sqlValMaximo.prepare;
        DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
        DtmIntBanco.sqlValMaximo.Open;
        // doc, ted e ted str
        if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
           (CdsTexto.FieldByName('VALOR').asFloat >= DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
           (DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
        begin
          //transforma para a forma de pagamento alternativa confonforme o valor
          sFormaPagto := DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;

          if sFormaPagto = '03' then //um simples DOC
            sCodCamaraComp := '700'
          else if (sFormaPagto = '41') then //ted cip outra titularidade
            sCodCamaraComp := '018'
          else if (sFormaPagto = '43') then sCodCamaraComp := '018'; //ted cip mesma titularidade
        end
        else if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 1) then //credito em cc
        begin
          sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
          sCodCamaraComp := '000';
        end else if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger in [41, 43]) then // ted cip
        begin
          sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
          sCodCamaraComp := '018'
        end else begin //ted str
          sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
          sCodCamaraComp := '018';//sCodCamaraComp := '810'
        end;

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
               //amf 26.06.2007 - monta os trailers de lote intermediários
               ISEQREG := 0;
               MontaTrailer(iFormaPag);

               iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
               iFormaPag := strToInt(sFormaPagto);

               //amf 27.06.2007 - deve montar um novo header após o trailler de lote
               MontaHeader(iFormaPag);
            end;

            if ( (iTipoPag = cdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) and
                 (iFormaPag = StrToInt(sFormaPagto)) ) then
            begin
              MontaDetalhe(iFormaPag);
              { pra quê isso ????!!!!!
              if (trim(lista)<> '') then
              begin
                 if Pos(CdsTexto.FieldByName('codportador').asstring,lista) =0 then
                     lista:=lista+','+CdsTexto.FieldByName('codportador').asstring ;
              end
              else
                 lista := CdsTexto.FieldByName('codportador').asstring;
              }   
            end;

            iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
            iFormaPag := strToInt(sFormaPagto);

            cdsTexto.Next;

            //pendência 26926 - 09/01/2008
            if not intBancoManager.bUsaDataIntBanco then
              intBancoManager.DataPagamento := '';

            if (cdsTexto.Eof) then
               MontaTrailer(iFormaPag);
          End; // while

          //Trailer Geral
          TrailerArquivoBescCnab240;

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

procedure TPagBesccnab240.HeaderArquivoBescCnab240;
var sTipoServ: string;
    sagencia, dvag, scontaCorr, dvcc : string;
Begin
  if trim(intbancoManager.DataPagamento) <> '' then
    intBancoManager.dRestoreDtPagamento := strToDate(intbancoManager.DataPagamento);

   sagencia := '';
   scontaCorr := '';
   dvcc := ' ';
   With IntBancoManager Do
   Begin
      sagencia   := GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,6, true, true);
      scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, false, true); //andre tavares - 29/12/2005

      //amf dígito da agência e dígito da conta.
      dvag       := GetDvAg(CdsEmpresa.FieldByName('NUMAGENCIA').AsString);
      dvcc       := GetDvCC(CdsEmpresa.FieldByName('NUMCONTA').AsString);

      sTipoServ := AE(BuscaParamIntBanco('TIPOSERVICO','S'),2);
      if trim(sTipoServ) = '00' then
        sTipoServ := '  ';

      Inc(iTotRegArq);
      WriteLn(ArquivoRemessa,
              Concat('027', // Código do banco
                    '0000', // Código do Lote
                    '0', // Tipo de Registro
                    Spc(9), // Brancos
                    sCodInscEmpresa, // Empresa - Inscrição // tipo de inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), // código do convênio

                    //início - andré tavares - 04/07/2007 - ajuste para pegar a conta da fundação
                    //ZD(GetAG(6,True,True), 6),
                    sagencia,
                    //dvag,
                    //AE(GetCC(13,True,True), 13),
                    scontaCorr,
                    dvcc,
                    dvcc,
                    //GetDvCC,//' ', //dvccag
                    //fim - andré tavares - 04/07/2007 - ajuste para pegar a conta da fundação

                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    Ae('BANCO EST STA CATARINA SA',30), // Nome do Banco
                    Spc(10), // Branco
                    '1', // Indica Arquivo de Remessa
                    formatDateTime('DDMMYYYY', Date), //Data Gravação do Arquivo
                    RemovePontos(TimeToStr(Time)), //Hora Gravação do Arquivo
                    Zd((intToStr(iSeqArquivo)),6), //Numero Sequencial da Remessa
                    '020', //Layout do Arquivo
                    '00000', //Densidade de Gravação do Arquivo
                    'AGL',
                    '0',
                    Spc(65) // Reservado banco(16) + Reservado Empresa (20) + Uso exclusivo FEBRABAN / CNAB (29)
                    ));
   End; //with
End;


//************************************
(*
procedure TPagBesccnab240.HeaderLiqTitulos;
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
      scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 13, true, true); //andre tavares - 29/12/2005

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
                    '20', // Tipo de Serviço
                    ZD(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2),  // Forma de Pagamento
                    '030', //versao do header de lote
                    SPC(1), //Branco
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), // Númeoro de Inscrição
                    sagencia, DvAg, scontaCorr, //dvCC, a cc já tem o dv
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


procedure TPagBesccnab240.DetalheLiqTitulos_J;
var
   sBarras, sBanco, sMoeda, sCampoLivre, sDv, sValor: String;
begin
  With IntBancoManager Do
  Begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    if CdsTexto.FieldByName('TIPO').AsString = 'F' then
       sTipoInsc := '1'
    else
       sTipoInsc := '2';
    if CdsTexto.FieldByName('CODBARRA').IsNull then
    begin
      if Length(CdsTexto.FieldByName('CODBARRAVALOR').AsString) < 47 then
        sBarras := Copy(CdsTexto.FieldByName('CODBARRAVALOR').AsString, 1,33) +
                   ZD(trim(Copy(CdsTexto.FieldByName('CODBARRAVALOR').AsString, 34, 14)),14)
      else
      sBarras := CdsTexto.FieldByName('CODBARRAVALOR').AsString;
      sBarras     := ZE(sBarras,47);
      sBanco      := Copy(sBarras,1,3);
      sMoeda      := Copy(sBarras,4,1);
      sCampoLivre := Copy(sBarras,5,5) + Copy(sBarras,11,10) + Copy(sBarras,22,10);
      sDv         := Copy(sBarras,33,1);
      sValor      := ZD(Trim(Copy(sBarras,34,14)),14);
    end
    else
    begin
      sBarras     := CdsTexto.FieldByName('CODBARRA').AsString;
      sBarras     := ZE(sBarras,47);
      sBanco      := Copy(sBarras,1,3);
      sMoeda      := Copy(sBarras,4,1);
      sDv         := Copy(sBarras,5,1);
      sValor      := ZD(Trim(Copy(sBarras,6,14)),14);
      sCampoLivre := Copy(sBarras,20,25);
    end;
    WriteLn(ArquivoRemessa,
            Concat('033', // Código do banco
                   Zd(IntToStr(iNumSeqLote),4), // Lote de Serviço - Sequence DO LOTE
                   '3', // Tipo de Registro
                   Zd(IntToStr(ISEQREG),5), // Sequence do registro NO LOTE
                   'J', // Código do Seguimento
                   '0', // Tipo de Movimento
                   '00', // Código de Instrução para alteração
                   sBanco, // Código do Banco (Código de Barras/Linha Digitável)
                   sMoeda, // Código da Moeda (Código de Barras/Linha Digitável)
                   sDv,    // DV (Código de Barras/Linha Digitável)
                   sValor, // Fator de Vencimento + Valor (Código de Barras/Linha Digitável)
                   sCampoLivre, // Campo Livre (Código de Barras/Linha Digitável)
                   AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome do Cedente
                   RemoveBarras2(CdsTexto.FieldByName('DATAVENCTO').AsString), // Data do Vencimento
                   //início andre tavares - pendência 21789 - 20/03/2006
                   //ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15), // // Valor do NOMINAL
                   ZD(RemoveVirgulas(ValorBrutoDoc(CdsTexto.FieldByName('VALOR').AsFloat, CdsTexto.FieldByName('VALORDESCONTO').AsFloat, CdsTexto.FieldByName('VALORJUROS').AsFloat),2),15), // // Valor do NOMINAL
                   //fim andre tavares - pendência 21789 - 20/03/2006
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),//descontos
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),  //valorjuros

                   RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data do Pagamento

                   //início andre tavares - pendência 21789 - 20/03/2006
                   {ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat -
                                     CdsTexto.FieldByName('VALORDESCONTO').AsFloat +
                                     CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15), // Valor do Pagamento}
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat, 2),15), // Valor do Pagamento

                   //fim andre tavares - pendência 21789 - 20/03/2006

                   '000000000000000', // Zeros - Qtd da Moeda

                   //início - André Tavares - pendência 21659 - 28/03/2006 - É mais eficaz para identificar o documento no Recebimento Automático
                   //AD(CdsTexto.FieldByName('NODOCUMENTO').AsString, 20), // NUMERO DO DOCUMENTO ATRIBUIDO PELA EMPRESA
                   AD(CdsTexto.FieldByName('CODDOCUMENTO').AsString, 20), // NUMERO DO DOCUMENTO ATRIBUIDO PELA EMPRESA
                   //fim - André Tavares - pendência 21659 - 28/03/2006

                   spc(20), //número atribuido pelo banco
                   '  ', //codogo da moeda (opcional)
                   spc(6), // Brancos
                   spc(10))); // Códigos de Ocorrência
    rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
  end;
end;


{
procedure TPagBesccnab240.DetalheLiqTitulos_J;
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
              Concat('033', // Código do banco
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

                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // // Nome do Cedente
                    formatDateTime('DDMMYYYY',CdsTexto.FieldByName('DATAVENCTO').AsDateTime), //Dat Prevista Para Pagto
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Nominal do título
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat -
                                      CdsTexto.FieldByName('VALORDESCONTO').AsFloat +
                                      CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),//Valor Pagto
                    ZD('0',15), //Brancos
                    AE(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString,20), // Identificador do Sacado
                    Spc(18)));

                    rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat -
                                                                 CdsTexto.FieldByName('VALORDESCONTO').AsFloat +
                                                                 CdsTexto.FieldByName('VALORJUROS').AsFloat;

   End;
End;

}

procedure TPagBesccnab240.TrailerLiqTitulos;
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
                    SPC(199) ));
      rTotalValorPagoLote := 0;
      iTotRegLote := 0;
   End;
End;
*)

//************************************
procedure TPagBesccnab240.TrailerArquivoBescCnab240;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);

      WriteLn(ArquivoRemessa,
              Concat('027', // Código do banco
                    '9999', // Contador do Lote de Serviço
                    '9', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iNumSeqLote),6), // Contador de Registros no Lote
                    Zd(IntToStr(iTotRegArq),6), // Contador de Registros no Lote
                    '000000',
                    Spc(205))); // Complemento de Registro
  End;
End;

//***********************************************
procedure TPagBesccnab240.HeaderLote;
VAR
  DVAGCC:STRING[1];
//  sTipoPagto : String;
  sagencia, dvag, scontaCorr, sVerLayout , dvcc : string;
Begin

   sVerLayout := '020';
   sagencia := '';
//   dvag := ' ';
   scontaCorr := '';
//   dvcc := ' ';

   sFinalidade := IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString;
{   sTipoPagto := IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString;
   if trim(IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString) = '90' then
   begin
     sTipoPagto := '30';
     if strToInt(sFormaPagto) = 12 then //se é TED
       sTipoPagto := '12';
   end;
}
   With IntBancoManager Do
   Begin
      sagencia   := GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString, 6, true, true);

//      if sFormaPagto = '50' then //p. 21175
//        dvag := ' '
//      else
      dvag := GetDvAg(CdsEmpresa.FieldByName('NUMAGENCIA').AsString);

      //scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, true, true);
      scontaCorr := GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 12, false, true); // andre tavares - 29/12/2005
      dvcc       := GetDvCC(CdsEmpresa.FieldByName('NUMCONTA').AsString);

      Inc(iTotRegArq);
//amf 27.06.2007      Inc(iTotRegLote);
      Inc(iNumSeqLote);
      DVAGCC:='';

      IF LENGTH(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString))>13 THEN
         DVAGCC:=COPY(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString),14,1);//DV AG/CC

      WriteLn(ArquivoRemessa,
              Concat('027', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    //'C', // Brancos
                    sRecPag, //pendência 26864 - 16/01/2008
                    '  ', // Tipo de Serviço
                    ZD(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2),  // Forma de Pagamento
                    sVerLayout, //Versão do layout de lote
                    spc(1), //Branco
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), //

                    //início - andré tavares - 04/07/2007 - ajuste para pegar a conta da fundação
                    //ZD(GetAG(6,True,True), 6),
                    sagencia,
                    //dvag,
                    //AE(GetCC(13,True,True), 13),
                    scontaCorr,
                    dvcc,
                    dvcc,
                    //GetDvCC,//' ', //dvccag
                    //fim - andré tavares - 04/07/2007 - ajuste para pegar a conta da fundação

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

procedure TPagBesccnab240.DetalheBescCnab240PagForne_A;
VAR DVAGCC : STRING[1];
//    _cpfcgc: string;
    _indicadorProvisao: string;
    _finalidade: string;

Begin
     //_cpfcgc := IntBancoManager.GetCPFCNPJ(IntBancoManager.CdsTexto.FieldByName('IDFORCLI').AsInteger);

     if (trim(sRecPag) = 'D') then
       sCodCamaraComp := '   ';
       
     _indicadorProvisao    := '1';
     if ( (sCodCamaraComp = '700') or (sCodCamaraComp = '018')) then
        _indicadorProvisao := '0';

     _finalidade := sFinalidade;

     if (Length(_finalidade) < 2) then
        _finalidade := '0' + _finalidade;


     //amf 26.06.2007 - Finalidade DOC/TED
     if (_indicadorProvisao = '1') then // é DOC/TED
           _finalidade := '  ';

     if ( trunc(intBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime) =
          trunc(Date) ) then
        _indicadorProvisao := '0';

      With IntBancoManager Do
      Begin
            Inc(iTotRegArq);
            Inc(iTotRegLote);
            DVAGCC:= '';
            //Acerto Do Teste da Conta Corrente
            IF LENGTH(TRIM(CdsTexto.FieldByName('CONTACORRENTE').AsString)) > 13 THEN
               DVAGCC := GetDvCC;

            WriteLn(ArquivoRemessa,
                    Concat('027', // Código do banco
                          Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                          '3', // Tipo de Registro
                          Zd(IntToStr(ISEQREG),5), // Código Contador do Registro No Lote
                          'A', // Código Segmento
                          '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                          '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                          sCodCamaraComp,  // código da camara de compensaçao
                          ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
                          ZD(GetAG(6,True,True), 6),
                          AE(GetCC(13,True,True), 13),
                          GetDvCC,//' ', //dvccag
                          AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                          //início - André Tavares - pendência 21659 - 28/03/2006 - É mais eficaz para identificar o documento no Recebimento Automático
                          //AE(trim(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString),20), //Nº Documento
                          //amf 26.06.2007 - a pedido do Darcy, conforme email.
                          //AE(_cpfcgc, 20),//ZD(_cpfcgc, 20),//AE(CdsTexto.FieldByName('CODDOCUMENTO').AsString, 20), // NUMERO DO DOCUMENTO ATRIBUIDO PELA EMPRESA
                          //fim - André Tavares - pendência 21659 - 28/03/2006
                          //andre tavares - tem que ser os dados que vem no dataset
                          AE(CdsTexto.FieldByName('NUMDOCUMENTO').AsString, 20), //Num Inscricao do Favorecido
                          RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                          'BRL', // código da Moeda
                          ZD('0',15), //QTD MOEDA
                          ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
                          RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Spc(20), //Brancos
                          _indicadorProvisao, //'0',  //indicador de provisionamento     ZD('0',15),
                          _finalidade, //finalidade do DOC, TED CIP e TED (código do motivo do pagamento) 99 = outros
                          spc(9), // brancos
                          ZD('0', 8), //amf 26.06.2007 ZD('ddmmyyyy', date),
                          ZD('0', 15),
                          //início - andre tavares - 05/07/2007 - coddocumento para fazer o retorno
                          //Spc(40), //Mensagem Específica Para o Registro
                          Spc(9), 
                          AE(CdsTexto.FieldByName('CODDOCUMENTO').AsString, 31),
                          //fim - andre tavares - 05/07/2007 - coddocumento para fazer o retorno
                          Spc(12), //Branco
                          AE(CdsTexto.FieldByName('FLGEMITEAVISO').AsString,1), //Emite Aviso Cobrança
                          Spc(10)));

            rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;

      End;
End;

(*
procedure TPagBesccnab240.DetalheBescCnab240PagForne_A;
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
              Concat('027', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), //
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
                    {
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),
                    }
                    ZD('0', 30),
                    //fim andre tavares - pendência 21789 - 20/03/2006

                    ZD('0', 15),
                    FormatDateTime('hhnn', time), // horário do envio do pagamento
                    Spc(11),
                    Spc(15))); // Complemento de Registro
   End;
End;
*)

(*
procedure TPagBesccnab240.DetalheBescCnab240PagGPS_A;
VAR DVAGCC : STRING[1];
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);
      DVAGCC:='';
      //Acerto Do Teste da Conta Corrente
      IF LENGTH(TRIM(CdsTexto.FieldByName('CONTACORRENTE').AsString)) > 13 THEN
         DVAGCC := GetDvCC;

      WriteLn(ArquivoRemessa,
              Concat('033', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // Código Contador do Registro No Lote
                    'A', // Código Segmento
                    '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                    '000',  // código da camara de compensaçao
                    '000', //Banco Favorecido
                    '00000', //código da agencia do favorecido
                    ' ',//dvag
                    '000000000000',
                    '  ', //dvcc dvccag
                    AE(sNomeContrib, 30), // Nome da Favorecido

                    //início - André Tavares - pendência 21659 - 28/03/2006 - É mais eficaz para identificar o documento no Recebimento Automático
                    //AE(trim(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString),20), //Nº Documento
                    AE(CdsTexto.FieldByName('CODDOCUMENTO').AsString, 20), // NUMERO DO DOCUMENTO ATRIBUIDO PELA EMPRESA
                    //fim - André Tavares - pendência 21659 - 28/03/2006

                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    'BRL', // código da Moeda
                    ZD('0',15), //QTD MOEDA
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
                    Spc(20), //Brancos
                    formatDateTime('DDMMYYYY', date),
                    ZD('0',17),  // valor real do pagamento + '00'
                    'GPS', //Código do tributo
                    ZD(sCodPagGPS, 4), //código do pagamento do GPS 9(004)
                    formatDateTime('YYYYMM', CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime),
                    Spc(48) //filler
                  ) );

      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;

   End;
End;

procedure TPagBesccnab240.DetalheBescCnab240PagGPS_B;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

      WriteLn(ArquivoRemessa,
              Concat('033', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), //
                    'B', // Código Sequencial
                    Spc(3), //Brancos
                    sTipoInsc,//Tipo InsCricao CONTRIBUINTE //andre tavares - pendenca 21102 - 29/05/2006
                    ZD(sNumdocContrib ,14), //Num Inscricao do CONTRIBUINTE
                    spc(30), //Endereço CONTRIBUINTE
                    spc(5),//Número CONTRIBUINTE
                    spc(15),//Complemento CONTRIBUINTE
                    spc(15),//Bairro CONTRIBUINTE
                    spc(20),//Cidade CONTRIBUINTE
                    '00000000',//Cep CONTRIBUINTE
                    '  ',//Estado CONTRIBUINTE
                    formatDateTime('DDMMYYYY',CdsTexto.FieldByName('DATAPROGRAMADA').AsDateTime),
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),
                    ZD('0', 15),
                    ZD('0', 30),
                    ZD('0', 15),// valor atualização /juros e multa
                    Spc(20),
                    Spc(10))); // ocorrencia do retorno
   End;
End;
*)

procedure TPagBesccnab240.TrailerLote;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
//amf 27.06.2007      Inc(iTotRegLote);

      WriteLn(ArquivoRemessa,
              Concat('027', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Contador do Lote de Serviço
                    '5', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iTotRegLote),6), // Contador de Registros no Lote
                    ZD(RemoveVirgulas(rTotalValorPagoLote,2),18),//Valor Pagto
                    ZD('0',18),
                    Spc(171),
                    spc(10) )); // Complemento de Registro
      rTotalValorPagoLote := 0;
      iTotRegLote := 0;
   End;
End;

//***********************************************

procedure TPagBesccnab240.MontaDetalhe(iFormaPag:Integer);
Begin
  Case iFormaPag of  1,2,3,5,10,18,20,41,43, 50:   // andre tavares - coloquei a forma de pagamento 18 (TED).
    Begin
      sFormaPagto := zd(intToStr(iFormaPag), 3);
      INC(ISEQREG);
      DetalheBescCnab240PagForne_A;
      // na emissão de um doc/ted necessário gerar o segmento B também
      (*
      If ((iFormaPag in [3, 18, 41, 43]) and ((sFormaPagto = '003') or (sFormaPagto = '018'))) {DOC} or
      {TED}((sFormaPagto = '041') or (sFormaPagto = '043')) or ((Not IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').IsNull) AND
         (IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').ASSTRING <>'0')) Then
      begin
        INC(ISEQREG);
        DetalheBescCnab240PagForne_B;
      end;
      *)
    end;

//não encontrado no manual do BESC
(*
    //início - andre tavares - 03/04/2006 - pendência 21175 - pega o código da GPS.
    50: begin//pagamento de GPS
      sFormaPagto := zd(intToStr(iFormaPag), 3);

      with TClientDataSet.Create(nil) do
      begin
        try
          data           := GetDadosGPS(IntBancoManager.cdsTexto.fieldByName('CODDOCUMENTO').asFloat);
          sCodPagGPS     := fieldByName('CODIGOGPS').asString;
          sNumdocContrib := fieldByName('NUMDOCUMENTO').asString;
          sNomeContrib   := fieldByName('NOMECONTRIB').asString;
          //andre tavares - pendenca 21102 - 29/05/2006
          If FieldByName('TIPO').AsString = 'F' Then
             sTipoInsc := '1'
          Else
             sTipoInsc := '2';

        finally
          free;
        end;//try
      end;//with

      INC(ISEQREG);
      DetalheBescCnab240PagGPS_A;
      INC(ISEQREG);
      DetalheBescCnab240PagGPS_B;
*)
//não encontrado no manual do BESC
    end //case
    //fim - andre tavares - 03/04/2006 - pendência 21175 - pega o código da GPS.

(* //não encontrado no manual do BESC
    else // do case
    begin
     INC(ISEQREG);
     DetalheLiqTitulos_J;
    end;
*)

//  end; //case
End;

procedure TPagBesccnab240.MontaHeader(iFormaPag:Integer);
Begin
//amf 26.06.2007  sFormaPagto := intToStr(iFormaPag);
  Case iFormaPag of
  1,2,3,5,10,18,20,41,43, 50: HeaderLote;
//  31,30        : HeaderLiqTitulos;
  End;
End;


procedure TPagBesccnab240.MontaTrailer(iFormaPag:Integer);
Begin
  ISEQREG:=0;
  Case iFormaPag of
  1,2,3,5,10,18,20,41,43, 50: TrailerLote;
//  30,31        : TrailerLiqTitulos; //não encontrado no manual do BESC
  End;
End;


function TPagBesccnab240.GetNomeArq: string;
begin
  //coódigo da GPS
  sCodPagGPS := '';
  //CPF/CGC do contribuinte
  sNumdocContrib :=  '';
  // Nome do contribuinte do INSS
  sNomeContrib := '';
  SFinalidade := '99';
  IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Sql.Text :=
  ' SELECT  '+
  '   P.RECPAG, NVL(S.CONTROLEREMESSA, 0) AS CONTROLEREMESSA, P.NUMEMPRESABANCO, NVL(P.CODTIPOPAGTO, 99) AS CODTIPOPAGTO '+
  ' FROM PORTADORFORMA P, SEQREMESSA S WHERE CODPORTFORMA = '+ IntBancoManager.CdsTexto.FieldByName('CODPORTFORMA').AsString +
  ' AND IDPESSOA = ' + inttostr(sistema.idempresa) +
  ' AND P.NUMEMPRESABANCO = S.NUMEMPRESABANCO ';

  IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;
  sNumEmpresaBanco := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('NUMEMPRESABANCO').asString;
  iSeqArquivo := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('CONTROLEREMESSA').asInteger + 1;
  if trim(IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('RECPAG').asString) = 'R' then
    sRecPag := 'D'
  else
    sRecPag := 'C';

  result := 'AE' + sNumEmpresaBanco + '.AGL';
end;

//início - andre tavares - 03/04/2006 - pendência 21175 - pega o código da GPS.
function TPagBesccnab240.GetDadosGPS(const codDocumento: extended): Olevariant;
var
  sSQL : string;
begin
  // -----------------------------------------------------------------------------------------------
  // André Pontes - 02/04/2007 - pendência 22657

  sSQL :=
  'SELECT '                                                       + #13 +
  '  DIN.CODIGOPGTO AS CODIGOGPS, '                               + #13 +
  '  BEN.NUMDOCUMENTO, BEN.NOME AS NOMECONTRIB, BEN.TIPO '        + #13 +
  'FROM '                                                         + #13 +
  '  DOCINSS DIN, '                                               + #13 +
  '  PESSOA  BEN  '                                               + #13 +
  'WHERE '                                                        + #13 +
  '      DIN.CODDOCINSS  = ' + FormatFloat('#0', CodDocumento)    + #13 +
  '  AND DIN.IDBENEFINSS = BEN.IDPESSOA ';

  Result := IntBancoManager.GetDataPacket(sSQL);
end;
//fim - andre tavares - 03/04/2006 - pendência 21175 - pega o código da GPS.



end.
