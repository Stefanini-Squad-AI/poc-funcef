{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TPagBB: Implementação do arquivo de Pagamento do BB }
{   BANCO DO BRASIL PAGAMENTOS                          }
{   IDMODELOSCNAB 18/P                                  }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 28/06/2001                             }
{                23/01/2004 - André Tavares - pendência 15976 }
{                                                       }
{*******************************************************}

unit uPagBBMT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls;

Type
   TPagBB = Class
   private
     sNumEmpresaBanco, sCodCamaraComp : string; 
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

     function LimpaString(const str: string): string;

     {Monta o Header do Lote do arquivo de acordo com a forma de pagamento}
     procedure MontaHeader(iFormaPag:Integer);
     {Monta o Detalhe do Lote do arquivo de acordo com a forma de pagamento}
     procedure MontaDetalhe(iFormaPag:Integer);
     {Monta o Traileo do Lote do arquivo de acordo com a forma de pagamento}
     procedure MontaTrailer(iFormaPag:Integer);

     {Header Geral do Arquivo}
     procedure HeaderArquivoBB;

        {Trailer Lote Genérico}
        procedure TrailerLote;

        {Header Pagamento A Fornecedores}
        procedure HeaderBBPagForne;
           {Detalhe Segmento A - Pagamento A Fornecedores}
           procedure DetalheBBPagForne_A;
           {Detalhe Segmento B - Pagamento A Fornecedores}
           procedure DetalheBBPagForne_B;

        {Header Para Liquidação de Títulos}
        procedure HeaderBBLiqTitulos;
           {Detalhe Segmento J - Liquidação de Títulos Código de Barras}
           procedure DetalheBBLiqTitulos_J;
           {Detalhe Segmento K - Liquidação de Títulos Bloquetos}
           procedure DetalheBBLiqTitulos_K;
           {Detalhe Segmento L - Liquidação de Títulos Bloquetos Complemento}
           procedure DetalheBBLiqTitulos_L;
           {Trailher Para Liquidação de Títulos}
        procedure TrailerLiqTitulos;

     {Trailer Geral do Arquivo}
     procedure TrailerArquivoBB;
   public
     {Monta arquivo de pagamento do banco do brasil}
     Procedure PagamentosBB;

end;

Var
  Pagbb: TPagBB;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString;




//início - andré tavares - pendência 21782 - 22/03/2007 - utiliza o float do doc
(*
Procedure TPagBB.PagamentosBB;
Var iTipoPag,iFormaPag:Integer;

begin
 sFormaPagto := '';

//inicio - andre tavares - pendência 18494 - 20/01/2005
{
 IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.Close;
 IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Sql.Text :=
 ' SELECT nvl(CONTROLEREMESSA, 0) AS CONTROLEREMESSA FROM MODELOSCNAB WHERE IDMODELOSCNAB = 18 ';
 IntBancoManager.DtmDadosBancarios.SqlBuscaNumSeqArq.Open;
 iSeqArquivo := IntBancoManager.DtmDadosBancarios.CDSBuscaNumSeqArq.fieldByName('CONTROLEREMESSA').asInteger + 1;
}

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

        HeaderArquivoBB;
        sMensagem1 := BuscaParamIntBanco('MENSAGEM1','S');
        lista:='';
        CdsTexto.First;
        iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
        iFormaPag := CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger;

        DtmIntBanco.CdsValMaximo.Close;
        DtmIntBanco.sqlValMaximo.prepare;
        DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
        DtmIntBanco.sqlValMaximo.Open;
        if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
           (CdsTexto.FieldByName('VALOR').asFloat >= DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
           (DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
        begin
          sFormaPagto := DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;
          sCodCamaraComp:='018';
        end
        else
        begin
          sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
          sCodCamaraComp:='700';
        end;
        if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger <> 3)  then
        begin
            sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
            sCodCamaraComp:='700';
        end;

        DtmIntBanco.CdsValMaximo.Close;
        DtmIntBanco.sqlValMaximo.prepare;
        DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
        DtmIntBanco.sqlValMaximo.Open;
        if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
           (CdsTexto.FieldByName('VALOR').asFloat >= DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
           (DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
        begin
          sFormaPagto := DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;
        end
        else
        begin
          sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
        end;
        iFormaPag := strToInt(sFormaPagto);
        MontaHeader(iFormaPag);



        While Not CdsTexto.Eof Do
        Begin

            DtmIntBanco.CdsValMaximo.Close;
            DtmIntBanco.sqlValMaximo.prepare;
            DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
            DtmIntBanco.sqlValMaximo.Open;
            if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
               (CdsTexto.FieldByName('VALOR').asFloat >= DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
               (DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
            begin
              sFormaPagto := DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;
            end
            else
            begin
              sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
            end;


            if (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
               (iFormaPag  <> strToInt(sFormaPagto)) then
            begin
              MontaTrailer(iFormaPag);
              iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
              iFormaPag := strToInt(sFormaPagto);
              MontaHeader(iFormaPag);
            end;


            DtmIntBanco.CdsValMaximo.Close;
            DtmIntBanco.sqlValMaximo.prepare;
            DtmIntBanco.sqlValMaximo.paramByName('CODPORTFORMA').asString := CdsTexto.FieldByName('CODPORTFORMA').asString;
            DtmIntBanco.sqlValMaximo.Open;
            if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
               (CdsTexto.FieldByName('VALOR').asFloat >= DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
               (DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
            begin
             // sFormaPagto := DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;
              //transforma para a forma de pagamento alternativa confonforme o valor
              sFormaPagto := DtmIntBanco.CdsValMaximo.FieldByName('CODFORMAPGTOALT').AsString;
              sCodCamaraComp := '018';
            end
            else
              sCodCamaraComp := '700';

            if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 1) then //credito em cc
            begin
              sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
              sCodCamaraComp := '000';
            end else if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
                   (CdsTexto.FieldByName('VALOR').asFloat >= DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat) and
                   (DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').asFloat > 0) and (not DtmIntBanco.CdsValMaximo.FieldByName('VALORMAXIMO').isnull) then
            begin
              sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
             // sCodCamaraComp := '018'
            end else begin //ted str
              sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
              sCodCamaraComp := '700' ;

              if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger <> 3)  then
              begin
                sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
                sCodCamaraComp := '000' ;
              end;
            end;//else

            MontaDetalhe(iFormaPag);

            if (trim(lista)<> '') then
            begin
                if Pos(CdsTexto.FieldByName('codportador').asstring,lista) =0 then
                   lista:=lista+','+CdsTexto.FieldByName('codportador').asstring ;
            end
            else
               lista := CdsTexto.FieldByName('codportador').asstring;

            CdsTexto.Next;


            if (CdsTexto.Eof) or
               (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
               (iFormaPag  <> strToInt(sFormaPagto)) then
            begin
              ISEQREG := 0;
              MontaTrailer(iFormaPag);
            end;

            //*** início - andre tavares - pendência ???? - 09/11/2006
            iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
            iFormaPag := strToInt(sFormaPagto);
            //*** fim - andre tavares - pendência ???? - 09/11/2006

         End; //while

         //Trailer Geral
         TrailerArquivoBB;

         CloseFile(ArquivoRemessa);

         UltCodArquivoGerado := intToStr(iSeqArquivo);

         UltCodArquivoGerado := intToStr(iSeqArquivo);
//inicio - andre tavares - pendência 18494 - 20/01/2005
        if not IntBancoManager.ExecSQL(' UPDATE SEQREMESSA SET CONTROLEREMESSA = '+ intToStr(iSeqArquivo)+
                                 ' WHERE NUMEMPRESABANCO = '+ quotedStr(sNumEmpresaBanco)) then
          raise Exception.Create(IntBancoManager.MessageInfo);
//fim - andre tavares - pendência 18494 - 20/01/2005

         IntBancoManager.MostraArquivo;
         bArquivoCriado:= True;
     Except
          bArquivoCriado:= False;
          CloseFile(ArquivoRemessa);
          Raise;
     End;
 End;
End;
*)



Procedure TPagBB.PagamentosBB;
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
      sCodCamaraComp:='018';
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
      sCodCamaraComp:='700';
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
    if (intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger <> 3)  then
    begin
      sFormaPagto := intBancoManager.CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
      sCodCamaraComp:='700';
      if intBancoManager.iFloatExterno > 0 then //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
        //pendência 27109
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

    end;

    iFormaPag := strToInt(sFormaPagto);
  end;
  //fim - andré tavares - pendência 21782 - 22/03/2007 - utiliza o float do doc


begin
  sFormaPagto := '';

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

        HeaderArquivoBB;
        sMensagem1 := BuscaParamIntBanco('MENSAGEM1','S');
        lista:='';
        CdsTexto.First;
        iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
        iFormaPag := CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger;

        //MudaFormaPag; andré tavares - pendência 21782 - 22/03/2007 - utiliza o float do doc

        MontaHeader(iFormaPag);

        While Not CdsTexto.Eof Do
        Begin

            MudaFormaPag;

            if (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
               (iFormaPag  <> strToInt(sFormaPagto)) then
            begin
              MontaTrailer(iFormaPag);
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

            CdsTexto.Next;

            //pendência 26926 - 09/01/2008
            if not intBancoManager.bUsaDataIntBanco then
              intBancoManager.DataPagamento := '';


            if (CdsTexto.Eof) or
               (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
               (iFormaPag  <> strToInt(sFormaPagto)) then
            begin
              ISEQREG := 0;
              MontaTrailer(iFormaPag);
            end;

            iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
            iFormaPag := strToInt(sFormaPagto);

         End; //while

         //Trailer Geral
         TrailerArquivoBB;

         CloseFile(ArquivoRemessa);

         UltCodArquivoGerado := intToStr(iSeqArquivo);

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
//fim - andré tavares - pendência 21782 - 22/03/2007 - utiliza o float do doc



procedure TPagBB.HeaderArquivoBB;
var sTipoServ: string;
Begin
  //andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma
  if trim(intbancoManager.DataPagamento) <> '' then
    intBancoManager.dRestoreDtPagamento := strToDate(intbancoManager.DataPagamento);

   With IntBancoManager Do
   Begin
      // início - André Tavares - 23/01/2004 - pendência 15976
      sTipoServ := AE(BuscaParamIntBanco('TIPOSERVICO','S'),2);
      if trim(sTipoServ) = '00' then
        sTipoServ := '  ';
      // fim    - André Tavares - 23/01/2004 - pendência 15976

      Inc(iTotRegArq);
      WriteLn(ArquivoRemessa,
              Concat('001', // Código do banco
                    '0000', // Código do Lote
                    '0', // Tipo de Registro
                    Spc(9), // Brancos
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    AE(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), // Númeoro de Inscrição
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('numagencia').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                    AE(COPY(CdsEmpresa.FieldByName('numagencia').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG)),1),1),   //DV AG
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG))-1)),12), //CONTACORRENTE
                    AE(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG)),1),1),   //DV CC
                    // início - André Tavares - 23/01/2004 - pendência 15976
                    { COPY(Modulo( 0,11,11,18,(ZD(TRIM(COPY(CdsEmpresa.FieldByName('numagencia').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG))-1)),5)+
                                             ZD(TRIM(COPY(CdsEmpresa.FieldByName('numCONTA').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG))-1)),12)) ),18,1),//DV AG/CC }
                    ' ',
                    // fim    - André Tavares - 23/01/2004 - pendência 15976
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    Ae(CdsEmpresa.FieldByName('NOMEBANCO').AsString,30), // Nome do Banco
                    Spc(10), // Branco
                    '1', // Indica Arquivc de Remessa
                    RemoveBarras2(DateToStr(Date)), //Data Gravação do Arquivo
                    RemovePontos(TimeToStr(Time)), //Hora Gravação do Arquivo
                    Zd((intToStr(iSeqArquivo)),6), //Numero Sequencial da Remessa
                    '030', //Layout do Arquivo
                    // início - André Tavares - 23/01/2004 - pendência 15976
                    //'01600', //Densidade de Gravação do Arquivo
                    '00000', //Densidade de Gravação do Arquivo
                    // fim - André Tavares - 23/01/2004 - pendência 15976
                    Spc(51),
                    'CSP',
                    ZD(BuscaParamIntBanco('CONTROLEVAN','S'),3) ,//controle das vans
                    // início - André Tavares - 23/01/2004 - pendência 15976
                    // AE(BuscaParamIntBanco('TIPOSERVICO','S'),2),  //TIPO DE SERVIÇO
                    sTipoServ,
                    // fim - André Tavares - 23/01/2004 - pendência 15976
                    SPC(10))); // Complemento de Registro
   End;
End;

procedure TPagBB.TrailerLote;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

      WriteLn(ArquivoRemessa,
              Concat('001', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Contador do Lote de Serviço
                    '5', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iTotRegLote),6), // Contador de Registros no Lote
                    ZD(RemoveVirgulas(rTotalValorPagoLote,2),18),//Valor Pagto
                    ZD('0',18),
                    Spc(171),
                    {ZD('0',10)} Spc(10) )); // Complemento de Registro //andré tavares - pendência 25443 - 22/05/2007
      rTotalValorPagoLote := 0;
      iTotRegLote := 0;
   End;
End;

procedure TPagBB.TrailerArquivoBB;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);

      WriteLn(ArquivoRemessa,
              Concat('001', // Código do banco
                    '9999', // Contador do Lote de Serviço
                    '9', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iNumSeqLote),6), // Contador de Registros no Lote
                    Zd(IntToStr(iTotRegArq),6), // Contador de Registros no Lote
                    ZD('0',6),
                    Spc(205))); // Complemento de Registro
  End;
End;

procedure TPagBB.HeaderBBPagForne;
VAR
  DVAGCC:STRING[1];
  sTipoPagto : String;
Begin

   sTipoPagto := IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString;
   if trim(IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString) = '90' then
   begin
     sTipoPagto := '30';
     if strToInt(sFormaPagto) = 12 then //se é TED
       sTipoPagto := '12';
   end;

   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);
      Inc(iNumSeqLote);
      DVAGCC:='';
      IF LENGTH(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString))>13 THEN
         DVAGCC:=COPY(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString),14,1);//DV AG/CC

      WriteLn(ArquivoRemessa,
              Concat('001', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    'C', // Brancos
                    ZD(CdsTexto.FieldByName('CODTIPOPAGTO').AsString,2), // Tipo de Pagamento
                    ZD(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2),  // Forma de Pagamento
                    '020', //Layout
                    spc(1), //Branco
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    // início - André Tavares - 23/01/2004 - pendência 15976
                    //ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), // Númeoro de Inscrição
                    AE(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), //
                    // fim    - André Tavares - 23/01/2004 - pendência 15976
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('numagencia').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                    AE(COPY(CdsEmpresa.FieldByName('numagencia').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG)),1),1),   //DV AG
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG))-1)),12), //CONTACORRENTE
                    AE(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG)),1),1),   //DV CC
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

procedure TPagBB.DetalheBBPagForne_A;
VAR DVAGCC : STRING[1];
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);
      DVAGCC:='';
      //Acerto Do Teste da Conta Corrente
      IF LENGTH(TRIM(CdsTexto.FieldByName('CONTACORRENTE').AsString))>13 THEN
         DVAGCC := GetDvCC;

      WriteLn(ArquivoRemessa,
              Concat('001', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // Código Contador do Registro No Lote
                    'A', // Código Sequencial
                    '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                    // início - André Tavares - 23/01/2004 - pendência 15976
                    //'000', //Brancos
                    //catia p : 22120
                    //'018',  // código da câmara de compensação
                    sCodCamaraComp,
                    // fim - André Tavares - 23/01/2004 - pendência 15976
                    ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido

                    //início - andre tavares - pendência 25209 - 26/04/2007
                    //GetAG(6,True,True),
                    // andre tavares - pendência 24635 - 05/03/2007
                    ZD(TRIM(COPY(CdsTexto.FieldByName('numagencia').AsString,1,LENGTH(TRIM(CdsTexto.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                    AE(COPY(CdsTexto.FieldByName('numagencia').AsString,LENGTH(TRIM(CdsTexto.FieldByName('numagencia').AsStrinG)),1),1),   //DV AG
                    //zd(LimpaString(copy(CdsTexto.FieldByName('NUMAGENCIA').AsString, 1, 4)), 5), ' ', //andré tavares - pendência - 07/02/2007
                    //GetCC(13,True,True),
                    //zd(LimpaString(copy(CdsTexto.FieldByName('CONTACORRENTE').AsString, 1, 12)), 12), ' ', //andré tavares - pendência - 07/02/2007
                    ZD(TRIM(COPY(CdsTexto.FieldByName('CONTACORRENTE').AsString,1,LENGTH(TRIM(CdsTexto.FieldByName('CONTACORRENTE').AsStrinG))-1)),12), //CONTACORRENTE
                    AE(COPY(CdsTexto.FieldByName('CONTACORRENTE').AsString,LENGTH(TRIM(CdsTexto.FieldByName('CONTACORRENTE').AsStrinG)),1),1),   //DV CC
                    AE(DVAGCC,1),
                    //' ', //andré tavares - pendência - 07/02/2007
                    //fim - andre tavares - pendência 25209 - 26/04/2007

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
                    spc(23),//ZD('0',23),  //andré tavares - pendência 25443 - 22/05/2007
                    Spc(40), //Mensagem Específica Para o Registro
                    Spc(12), //Branco
                    AE(CdsTexto.FieldByName('FLGEMITEAVISO').AsString,1), //Emite Aviso Cobrança
                    Spc(10)));

      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
   End;
End;

procedure TPagBB.DetalheBBPagForne_B;
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
              Concat('001', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // 
                    'B', // Código Sequencial
                    Spc(3), //Brancos
                    sTipoInsc,//Tipo InsCricao Favorecido
                    //AE(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Num Inscricao do Favorecido
                    ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Num Inscricao do Favorecido //andré tavares - 01/12/2006 - atendendo à solicitação do BB e Valia
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
                    ZD('0',30),
                    //fim - andre tavares - pendência 21789 - 20/03/2006
                    ZD('0',15),
                    AE(CdsTexto.FieldByName('IDPESSOA').AsString,15),
                    Spc(15))); // Complemento de Registro
   End;
End;


procedure TPagBB.HeaderBBLiqTitulos;
VAR
DVAGCC:STRING[1];
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);
      Inc(iNumSeqLote);

      DVAGCC:='';
      IF LENGTH(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString))>13 THEN
         DVAGCC:=COPY(TRIM(CdsEmpresa.FieldByName('numCONTA').AsString),14,1);//DV AG/CC


      WriteLn(ArquivoRemessa,
              Concat('001', // Código do banco
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
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('numagencia').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                    AE(COPY(CdsEmpresa.FieldByName('numagencia').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('numagencia').AsStrinG)),1),1),   //DV AG
                    ZD(TRIM(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,1,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG))-1)),12), //CONTACORRENTE
                    AE(COPY(CdsEmpresa.FieldByName('NUMCONTA').AsString,LENGTH(TRIM(CdsEmpresa.FieldByName('NUMCONTA').AsStrinG)),1),1),   //DV CC
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

procedure TPagBB.DetalheBBLiqTitulos_J;
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
              Concat('001', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // Código Contador do Registro No Lote
                    'J', // Código Sequencial
                    '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                    ZD(sBanco,3),
                    ZD(sMoeda,1),
                    ZD(sDv,1),
                    ZD(sValor,14),
                    ZD(sCampoLivre,25),
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
                                      CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),//Valor Pagto
                    }
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat, 2),15), // Valor do Pagamento
                    //fim - andre tavares - pendência 21789 - 20/03/2006

                    ZD('0',15), //Brancos
                    AE(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString,20), // Identificador do Sacado
                    Spc(38)));

                    //inicio - andre tavares - pendência 21789 - 20/03/2006
                    //rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat -
                    //                                             CdsTexto.FieldByName('VALORDESCONTO').AsFloat +
                    //                                             CdsTexto.FieldByName('VALORJUROS').AsFloat;
                    rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
                    //fim - andre tavares - pendência 21789 - 20/03/2006

   End;
End;

procedure TPagBB.DetalheBBLiqTitulos_K;
VAR DVAGCC:STRING[1];
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

      DVAGCC:='';
      IF LENGTH(TRIM(CdsTexto.FieldByName('CONTACORRENTE').AsString))>13 THEN
         DVAGCC:=GetDvCC;//DV AG/CC

      If CdsTexto.FieldByName('TIPO').AsString = 'F' Then
         sTipoInsc := '1'
      Else
         sTipoInsc := '2';

      WriteLn(ArquivoRemessa,
              Concat('001', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // Código Contador do Registro No Lote
                    'K', // Código Sequencial
                    '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                    '000', //Brancos
                    zd(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
                    Spc(20),//Nome do Banco Depositário
                    ZD(TRIM(COPY(CdsTexto.FieldByName('numagencia').AsString,1,LENGTH(TRIM(CdsTexto.FieldByName('numagencia').AsStrinG))-1)),5), //AGENCIA
                    Spc(20),//Nome da Agência Depositária
                    Spc(25),//Endereço da Agência Depositária
                    sTipoInsc, //Tipo Inscrição do Cedente
                    zd(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Num Inscricao do Favorecido
                    GetAG(6,True,True),
                    GetCC(13,True,True),
                    AE(DVAGCC,1),
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                    AE(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString,20), //Nº Documento Empresa
                    AE(CdsTexto.FieldByName('NODOCUMENTO').AsString,20), //Nº Documento Banco
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
                    Spc(8),
                    AE(CdsTexto.FieldByName('FLGEMITEAVISO').AsString,1), //Emite Aviso Cobrança
                    Spc(10)
                    ));
      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
   End;
End;

procedure TPagBB.DetalheBBLiqTitulos_L;
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
              Concat('001', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // Código Contador do Registro No Lote
                    'L', // Código Sequencial
                    Spc(3), //Brancos
                    '00000000',
                    Spc(3),//Espécie do Documento
                    ' ',//Aceito
                    '00000000',//Data Processamento
                    SPC(15),
                    Spc(3),//Brancos
                    ZD('0',15),  //QTDMOEDA
                    RemoveBarras2(CdsTexto.FieldByName('DATAVENCTO').AsString),
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Pagto
                    ZD('0',15),

                    //inicio - andre tavares - pendência 21789 - 20/03/2006
                    {
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),//Valor Pagto
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),//Valor Pagto
                    }
                    ZD('0',30),
                    //fim - andre tavares - pendência 21789 - 20/03/2006
                    
                    ZD('0',15), //MULTA
                    AE(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString,20), //Nº Documento Empresa
                    ZD(sBanco,3),
                    ZD(sMoeda,1),
                    ZD(sDv,1),
                    ZD(sValor,14),
                    ZD(sCampoLivre,25),
                    Spc(23)));

   End;
End;

procedure TPagBB.TrailerLiqTitulos;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

      WriteLn(ArquivoRemessa,
              Concat('001', // Código do banco
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

procedure TPagBB.MontaHeader(iFormaPag:Integer);
Begin
  Case iFormaPag of
  1,2,3,5,10, 18, 20: HeaderBBPagForne;
  31,30    : HeaderBBLiqTitulos;
  End;
End;

procedure TPagBB.MontaDetalhe(iFormaPag:Integer);
Begin

  Case iFormaPag of
  1,2,3,5,10,20,18:   // andre tavares - coloquei a forma de pagamento 18 (TED).
  Begin

    sFormaPagto := zd(intToStr(iFormaPag), 3);
    INC(ISEQREG);
    DetalheBBPagForne_A;

    // início - André Tavares - 23/01/2004 - pendência 15976
    {If (Not IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').IsNull) AND
       (IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').ASSTRING <>'0') Then}
    // na emissão de um doc necessário gerar o segmento B também

(*
    If ((iFormaPag in [3, 18]) and ((sFormaPagto = '003') or (sFormaPagto = '018'))) {DOC} or ((Not IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').IsNull) AND
       (IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').ASSTRING <>'0')) Then
    // fim - André Tavares - 23/01/2004 - pendência 15976
    begin
           INC(ISEQREG);
           DetalheBBPagForne_B;
    end;
*)   //comentei acima
    //andré tavares - pendência 25443 - 22/05/2007 - tive que disponibilizar o seguimento B para todas as formas de pagamento.
    INC(ISEQREG);
    DetalheBBPagForne_B;

  End;
  30:
  begin
   INC(ISEQREG);
   If (Not IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').IsNull) AND (IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').ASSTRING <>'0') Then
      DetalheBBLiqTitulos_k
   else
      DetalheBBLiqTitulos_J;
  end;
  31:
  Begin
   INC(ISEQREG);
   If (Not IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').IsNull) AND (IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').ASSTRING <>'0') Then
   begin
     DetalheBBLiqTitulos_k;
     INC(ISEQREG);
     DetalheBBLiqTitulos_L;
   end
   else
      DetalheBBLiqTitulos_J;
  End;
  End;
End;

procedure TPagBB.MontaTrailer(iFormaPag:Integer);
Begin
  ISEQREG:=0;
  Case iFormaPag of
  1,2,3,5,10, 18, 20: TrailerLote;
  30,31: TrailerLiqTitulos;
  End;
End;


function TPagBB.LimpaString(const str: string): string;
var i: integer;
begin
  result := trim(str);

  //remove qualquer caracter <> '0'..'9'
  for i := 1 to length(result) do
  begin
    if not (ord(result[i])) in [ord('0').. ord('9')] then
    while pos(result[i], result) > 0 do
      delete(result, pos(result[i], result), 1);
  end;

end;



end.



