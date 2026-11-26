{************************************************************************}
{                                                                        }
{ ** Todos os Direitos Reservados                                        }
{ 16/06/2005                                                             }
{ - TPagUnibancoCnab240: Implementação do arquivo de Pagamento do        }
{                        banco Unibanco                                  }
{ Analista Responsável: Rodolpho da Silva                                }
{************************************************************************}

unit uPagUnibancoCnab240;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls;



Type
   TPagUnibancoCnab240 = Class
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
     procedure HeaderArquivoUnibancoCnab240;
        {Header Pagamento A Fornecedores}
        procedure HeaderLote;
           {Detalhe Segmento A - Pagamento A Fornecedores}
           procedure DetalheUnibancoCnab240Seguimento_A;
           {Detalhe Segmento B - Pagamento A Fornecedores}
           procedure DetalheUnibancoCnab240Seguimento_B;
           {Detalhe Segmento B - Pagamento A Fornecedores}
           procedure DetalheUnibancoCnab240Seguimento_C;
        {Trailer Lote Genérico}
        procedure TrailerLote;
     {Trailer Geral do Arquivo}

        procedure HeaderLiqTitulos;
        procedure DetalheLiqTitulos_J;
        procedure TrailerLiqTitulos;
     procedure TrailerArquivoUnibancoCnab240;
   public
     {Monta arquivo de pagamento do banco do Unibanco}
     Procedure PagamentosUnibancoCnab240;
     // pega o nome do arquivo;
     function GetNomeArq : string;

end;




Var
  PagUnibancoCnab240: TPagUnibancoCnab240;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString;




Procedure TPagUnibancoCnab240.PagamentosUnibancoCnab240;
Var iTipoPag,iFormaPag:Integer;

begin
 sFormaPagto := '';

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

          HeaderArquivoUnibancoCnab240;
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
        end
        else
        begin
          sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
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

             if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
                (CdsTexto.FieldByName('VALOR').asFloat >= CdsTexto.FieldByName('VALORMAXIMO').asFloat) and
                (CdsTexto.FieldByName('VALORMAXIMO').asFloat > 0) and (not CdsTexto.FieldByName('VALORMAXIMO').isnull) then
             begin
               sFormaPagto := CdsTexto.FieldByName('CODFORMAPGTOALT').AsString;
             end
             else
             begin
               sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
             end;

             if (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
                (iFormaPag  <> strToInt(sFormaPagto)) then
             begin
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

             if (CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 3) and  // se é doc e valor >= varMáximo então vira TED
                (CdsTexto.FieldByName('VALOR').asFloat >= CdsTexto.FieldByName('VALORMAXIMO').asFloat) and
                (CdsTexto.FieldByName('VALORMAXIMO').asFloat > 0) and (not CdsTexto.FieldByName('VALORMAXIMO').isnull) then
             begin
               sFormaPagto := CdsTexto.FieldByName('CODFORMAPGTOALT').AsString;
             end
             else
             begin
               sFormaPagto := CdsTexto.FieldByName('CODFORMAPAGTO').AsString;
             end;

             if (CdsTexto.Eof) or
                (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
                (iFormaPag  <> strToInt(sFormaPagto)) then
             begin
               ISEQREG := 0;
               MontaTrailer(iFormaPag);
             end;
          End; // while

          //Trailer Geral
          TrailerArquivoUnibancoCnab240;

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




procedure TPagUnibancoCnab240.HeaderArquivoUnibancoCnab240;
var
   sTipoServ,sagencia,dvag,scontaCorr,dvcc : string;
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
      sTipoServ := AE(BuscaParamIntBanco('TIPOSERVICO','S'),2);
      if trim(sTipoServ) = '00' then
        sTipoServ := '  ';

      Inc(iTotRegArq);
      WriteLn(ArquivoRemessa,
              Concat('409', // Código do banco
                     '0000', // Código do Lote
                     '0', // Tipo de Registro - Header de arquivo
                     Spc(9), // Uso exclusivo FEBRABAN - Preencher com 9 caracteres em brancos
                     sCodInscEmpresa, // Empresa - Inscrição
                     ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                     AE(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), // Código do convênio no banco
                     sagencia, //AGENCIA
                     dvAg,   //DV AG
                     scontaCorr, //CONTACORRENTE
                     dvcc,   //DV CC
                     ' ',
                     Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                     Ae('BANCO Unibanco S.A.',30), // Nome do Banco
                     Spc(10), //  Uso exclusivo FEBRABAN - Preencher com 10 caracteres em brancos
                     '1', // Indica Arquivo de Remessa (Cliente => Banco)
                     RemoveBarras2(DateToStr(Date)), //Data Gravação do Arquivo
                     RemovePontos(TimeToStr(Time)), //Hora Gravação do Arquivo
                     Zd((intToStr(iSeqArquivo)),6), //Numero Sequencial da Remessa
                     '080', // Número da versão do layout do Arquivo (padrão)
                     '00000', //Densidade de Gravação do Arquivo
                     Spc(69) // Reservado banco(20) + Reservado Empresa (20) + Uso exclusivo FEBRABAN / CNAB (29)
                     ));
   End;
End;





//************************************
procedure TPagUnibancoCnab240.HeaderLiqTitulos;
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
              Concat('409', // Código do banco
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




procedure TPagUnibancoCnab240.DetalheLiqTitulos_J;
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
              Concat('409', // Código do banco
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
                                      CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),//Valor Pagto
                    }
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),//Valor Líquido
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




procedure TPagUnibancoCnab240.TrailerLiqTitulos;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

      WriteLn(ArquivoRemessa,
              Concat('409', // Código do banco
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
procedure TPagUnibancoCnab240.TrailerArquivoUnibancoCnab240;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);

      WriteLn(ArquivoRemessa,
              Concat('409', // Código do banco
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
procedure TPagUnibancoCnab240.HeaderLote;
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

   //  Na rotina abaixo, é verificado se o pagamento definido pelo cliente é do tipo 90 (Pagamento de benefícios)
   //pois se for, é mudado para o tipo 30 (pagamento de salários) pois deve cair na conta-crédito do participante
   //como Pagamento de Sálário
   if trim(sTipoPagto) = '90' then  // Pagamento de benefícios
   begin
     sTipoPagto := '30';  //  Pagamento de salários
     if strToInt(sFormaPagto) = 12 then //se é TED
       sTipoPagto := '12'; //  Consignação de parcelas
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
              Concat('409', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    'C', // Brancos
                    ZD(sTipoPagto,2), // Tipo de Serviço
                    ZD(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2),  // Forma de Pagamento
                    '040', // Número da versão do Layout (padrao)
                    spc(1), //  Uso exclusivo FEBRABAN - Preencher com 1 caractere em branco
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição
                    AE(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,20), // Código do convênio no banco
                    sagencia, // Agência
                    DvAg, // Dv Agência
                    scontaCorr, //  Conta corrente
                    dvCC,  // Dv conta corrente
                    AE(DVAGCC,1),  //  Dv Agência/Conta Corrente
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




procedure TPagUnibancoCnab240.DetalheUnibancoCnab240Seguimento_A;
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
              Concat('409', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // Código Contador do Registro No Lote
                    'A', // Código Sequencial
                    '0', //Tipo de Movimento: 0= Inclusão, 1= Consulta, 3= Estorno, 5= Alteração, 7= Liquidação, 9= Exclusão
                    '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                    '018',  // código do tipo de pagamento
                    ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
                    GetAG(6,True,True), // Agência/Dv
                    GetCC(13,True,True),// Conta-Corrente/Dv
                    AE(DVAGCC,1), // DV Agência/Conta
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                    AE(trim(IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString),20), //Nº Documento
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    'BRL', // código da Moeda
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




procedure TPagUnibancoCnab240.DetalheUnibancoCnab240Seguimento_B;
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
              Concat('409', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // Número sequencial do registro de lote
                    'B', // Código Sequencial
                    Spc(3), //Uso exclusivo FEBRABAN - Brancos
                    sTipoInsc,//Tipo InsCricao Favorecido
                    AE(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Num Inscricao do Favorecido
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
                    {
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),
                    }
                    ZD('0',30),
                    //fim - andre tavares - pendência 21789 - 20/03/2006
                    ZD('0',15),
                    AE(CdsTexto.FieldByName('CODDOCUMENTO').AsString,15),
                    Spc(15))); // Complemento de Registro
   End;
End;




procedure TPagUnibancoCnab240.DetalheUnibancoCnab240Seguimento_C;
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
              Concat('409', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(ISEQREG),5), // Número sequencial do registro de lote
                    'C', // Código Sequencial
                    Spc(3), //Brancos
                    ZD('0',15), //valor IR
                    ZD('0',15), //valor ISS
                    ZD('0',15), //valor IOF
                    ZD('0',15), //valor outras deduçoes

                    //inicio - andre tavares - pendência 21789 - 20/03/2006
                    {
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15), // valor outros acréscimos
                    }
                    ZD('0',15),
                    //fim - andre tavares - pendência 21789 - 20/03/2006

                    sagencia, // Agência
                    DvAg, // Dv Agência
                    scontaCorr, // Conta Corrente
                    dvCC, // Dv Conta Corrente
                    ' ', // Dv Agência/Conta Corrente 
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),
                    Spc(113))); // Complemento de Registro
   End;
End;




procedure TPagUnibancoCnab240.TrailerLote;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);

      WriteLn(ArquivoRemessa,
              Concat('409', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Contador do Lote de Serviço
                    '5', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iTotRegLote),6), // Contador de Registros no Lote
                    ZD(RemoveVirgulas(rTotalValorPagoLote,2),18),//Valor Pagto
                    ZD('0',18), // Somatório da quantidade de moedas
                    Spc(171),  // Número de aviso de débito (6) + Uso FEBRABAN (165)
                    ZD('0',10) )); // Complemento de Registro
      rTotalValorPagoLote := 0;
      iTotRegLote := 0;
   End;
End;
//***********************************************




procedure TPagUnibancoCnab240.MontaDetalhe(iFormaPag:Integer);
Begin
  Case iFormaPag of  1,2,3,5,10,20,18:   // andre tavares - coloquei a forma de pagamento 18 (TED).
    Begin
      sFormaPagto := zd(intToStr(iFormaPag), 3); 
      INC(ISEQREG);
      DetalheUnibancoCnab240Seguimento_A;
      // na emissão de um doc/ted necessário gerar o segmento B também
      If ((iFormaPag in [3, 18]) and ((sFormaPagto = '003') or (sFormaPagto = '018'))) {DOC} or ((Not IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').IsNull) AND
         (IntBancoManager.CdsTexto.FieldByName('FLGEMITEAVISO').ASSTRING <>'0')) Then
      begin
        INC(ISEQREG);
        DetalheUnibancoCnab240Seguimento_A;
      end;
    end 
    else // do case
    begin
     INC(ISEQREG);
     DetalheLiqTitulos_J;
    end;
  end; //case
End;




procedure TPagUnibancoCnab240.MontaHeader(iFormaPag:Integer);
Begin
  Case iFormaPag of
  1,2,3,5,10,18,20: HeaderLote;
  31,30        : HeaderLiqTitulos;
  End;
End;



procedure TPagUnibancoCnab240.MontaTrailer(iFormaPag:Integer);
Begin
  ISEQREG:=0;
  Case iFormaPag of
  1,2,3,5,10,18,20: TrailerLote;
  30,31        : TrailerLiqTitulos;
  End;
End;



function TPagUnibancoCnab240.GetNomeArq: string;
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

  result := 'PG' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iSeqArquivo), 2) + '.REM';
end;

end.



