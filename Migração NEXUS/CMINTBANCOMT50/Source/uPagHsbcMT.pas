{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TPagHsbc: Implementação do arquivo de Pagto do HSBC }
{   HSBC BAMERINDUS                                     }
{   IDMODELOSCNAB 17/P                                  }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 28/06/2001                             }
{                28/12/2001                             }
{                18/02/2002                             }
{*******************************************************}
{
CODBARRA - Código de Barra
CODBARRAVALOR - Linha Digitavel
}

unit uPagHsbcMT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls;

Type
   TPagHsbc = Class
   private
     {Arquivo de Remessa a ser gerado}
     ArquivoRemessa: TextFile;
     {Total de Registros no arquivo}
     iTotRegArq: Integer;
     {Número sequencial da remessa}
     iNumRemessa: Integer;
     {Número sequencial do qrquivo no lote}
     iNumSeqLote: Integer;
     {Total de registros do lote}
     iTotRegLote: Integer;
     {Tipo de documentação da empresa}
     sTipoInsc: String;
     {Código de inscrição da empresa}
     sCodInscEmpresa: String;
     {Valor Total dos registro no arquivo}
     rTotalValorPago: Real;
     {Valor total dos pagamentos no lote}
     rTotalValorPagoLote: Real;

     {Monta o header do lote do arquivo de acordo com a Forma de Pagamento}
     procedure MontaHeader(iFormaPag:Integer);
     {Monta o detalhe do lote do arquivo de acordo com a Forma de Pagamento}
     procedure MontaDetalhe(iFormaPag:Integer);
     {Monta o trailer do lote do arquivo de acordo com a Forma de Pagamento}
     procedure MontaTrailer(iFormaPag:Integer);


     {Header Geral do Arquivo - Registro 0}
     procedure HeaderArquivoHsbc;
         {Header de Lote - Pagamento A Fornecedores - Registro 1}
         procedure HeaderHsbcPagForne;
           {Detalhe do Pagamento de Fornecedores - Segmento A - Registro 3}
           procedure DetalheHsbcPagForne_A;
           {Detalhe do Pagamento de Fornecedores - Segmento B - Registro 3}
           procedure DetalheHsbcPagForne_B;

         {Header para Liquidação de Parcelas CNR}
         procedure HeaderHsbcLiqParcelas;
           {Detalhe da Liquidação de Parcelas CNR - Segmento A - Registro 3}
           procedure DetalheHsbcLiqParcelas_A;

         {Trailer Lote Genérico - Utilizado nos lotes de:
          Pagamento de Fornecedores/Liquidação de Parcelas/Cartão Salário}
         procedure TrailerLote;
         {Header para Liquidação de Títulos}
         procedure HeaderHsbcLiqTitulos;
           {Detalhe Segmento J - Liquidação de Títulos Código de Barras}
           procedure DetalheHsbcLiqTitulos_J;
           {Detalhe Segmento K - Liquidação de Títulos Bloquetos}
           procedure DetalheHsbcLiqTitulos_K;
           {Detalhe Segmento L - Liquidação de Títulos Bloquetos Complemento}
           //procedure DetalheHsbcLiqTitulos_L;
         {Trailher para Liquidação de Títulos}
         procedure TrailerLiqTitulos;

       {Header de Lote - Cartão Salário - Registro 1}
       procedure HeaderHsbcCartaoSalario;

       {Trailer Geral do Arquivo - Registro - 9}
       procedure TrailerArquivoHsbc;
          {Detalhe do Cartão Salário - Segmento A - Registro 3}
           procedure DetalheHsbcCartaoSalario_A;

   public
     {Monta arquivo de pagamento do HSBC}
     Procedure PagamentosHsbc;
end;

Var
  PagHsbc: TPagHsbc;

implementation

Uses uSistema, uIntBancoManager, uString, uContaBancariaMT;

Procedure TPagHsbc.PagamentosHsbc;
var iTipoPag,iFormaPag:Integer;
begin
 With IntBancoManager Do
 begin
   Try
     iTipoPag        := 0;
     iFormaPag       := 0;
     iNumSeqLote     := 0;
     iTotRegLote     := 0;
     iTotRegArq      := 0;
     rTotalValorPago := 0;

     AssignFile(ArquivoRemessa,sNomeArquivo);
     ReWrite(ArquivoRemessa);

     if CdsEmpresa.FieldByName('TIPO').AsString = 'F' then
       sCodInscEmpresa := '1'
     else
       sCodInscEmpresa := '2';

     HeaderArquivoHsbc;
     CdsTexto.First;
     while not CdsTexto.Eof do
     begin
       if (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
          (iFormaPag <> CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger) then
       begin
         iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
         iFormaPag := CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger;
         MontaHeader(iFormaPag);
       end;
       MontaDetalhe(iFormaPag);
       CdsTexto.Next;
       if (CdsTexto.Eof) or
          (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
          (iFormaPag <> CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger) then
           MontaTrailer(iFormaPag);
     end;

      //Trailer Geral
      TrailerArquivoHsbc;

      CloseFile(ArquivoRemessa);
      MostraArquivo;
      bArquivoCriado:= True;
   Except
        bArquivoCriado:= False;
        CloseFile(ArquivoRemessa);
        Raise;
   End;
 End;
End;

procedure TPagHsbc.HeaderArquivoHsbc;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iNumRemessa);
    WriteLn(ArquivoRemessa,
            Concat('399', // Código do banco
                   '0000', // Código do Lote
                   '0', // Tipo de Registro
                    Spc(9) , // Brancos
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,6), // Número do Contrato - Número da Empresa no Banco
                    Spc(14), // Brancos
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True), //Agência
                    spc(1), // Brancos
                    GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,13,True,True), //Conta + DV
                    spc(1), // Brancos
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    Ae(CdsEmpresa.FieldByName('NOMEBANCO').AsString,30), // Nome do Banco
                    spc(10), // Brancos
                    '1', // Indica Arquivc de Remessa
                    RemoveBarras2(DateToStr(Date)), //Data Gravação do Arquivo
                    RemovePontos(TimeToStr(Time)), //Hora Gravação do Arquivo
                    Zd(IntToStr(iNumRemessa),6), //Numero Sequencial da Remessa
                    '020', //Layout do Arquivo
                    '01600', //Densidade de Gravação do Arquivo
                    'CPG', //Sigla do Aplicativo
                    'Y2K', //Identifica ano 2000
                    Spc(63))); // Complemento de Registro
   End;
End;

procedure TPagHsbc.TrailerLote;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    WriteLn(ArquivoRemessa,
            Concat('399', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Contador do Lote de Serviço
                    '5', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iTotRegLote),6), // Contador de Registros no Lote
                    Spc(3), //Brancos
                    ZD(RemoveVirgulas(rTotalValorPagoLote,2),15),//Valor Pagto
                    Spc(199))); // Complemento de Registro
    rTotalValorPago     := rTotalValorPago +  rTotalValorPagoLote;
    rTotalValorPagoLote := 0;
    iTotRegLote         := 0;
  end;
end;

procedure TPagHsbc.TrailerArquivoHsbc;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('399', // Código do banco
                   '9999', // Contador do Lote de Serviço
                   '9', // Tipo de Registro
                   Spc(9), //Brancos
                   Zd(IntToStr(iNumSeqLote),6), // Contador de Registros no Lote
                   Zd(IntToStr(iTotRegArq),6), // Contador de Registros no Lote
                   Spc(211))); // Complemento de Registro
  end;
end;

procedure TPagHsbc.HeaderHsbcPagForne;
Begin
   With IntBancoManager Do
   Begin
      Inc(iTotRegArq);
      Inc(iTotRegLote);
      Inc(iNumSeqLote);
      WriteLn(ArquivoRemessa,
              Concat('399', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    'C', // Brancos
                    zd(CdsTexto.FieldByName('CODTIPOPAGTO').AsString,2), // Tipo de Pagamento
                    zd(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2),  // Forma de Pagamento
                    '020', //Layout
                    spc(1), //Branco
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,6), // Número do Contrato - Número da Empresa no Banco
                    Spc(14), // Brancos
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True),
                    spc(1), //Brancos
                    GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,13,True,True), //Contas + DV
                    spc(1), //Branco
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    Spc(40), //Mensagem Genérica
                    AE(CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), //Endereço
                    ZD(CdsEmpresa.FieldByName('NUMERO').AsString,5),//Número
                    AE(CdsEmpresa.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                    AE(CdsEmpresa.FieldByName('CIDADE').AsString,20),//Cidade
                    ZE(CdsEmpresa.FieldByName('CEP').AsString,8),//Cep
                    AE(CdsEmpresa.FieldByName('CODESTADO').AsString,2),//Estado
                    Spc(18))); // Complemento de Registro
   End;
End;

procedure TPagHsbc.DetalheHsbcPagForne_A;
var Livre : string;
begin
  With IntBancoManager Do
  begin
    Livre := CdsTexto.FieldByName('CODDOCUMENTO').AsString ;
    try
     {Testa se o campo livre esta em branco. Se não estiver o passa no lugar do CodDocumento}
     if trim(CdsTexto.FieldByName('Livre').AsString) <> '' then
       Livre := CdsTexto.FieldByName('Livre').AsString;
    except
    end;
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    WriteLn(ArquivoRemessa,
            Concat('399', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(iTotRegLote),5), // Código Contador do Registro No Lote
                    'A', // Código Sequencial
                    '0', // Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', // Codigo de Instrução para motivo 00 = Inc, 99 = Exc, 55 = Inc com Bloqueio
                    Spc(3), // Brancos - De acordo com a nota explicativa N, que acompanha o manual, eu não preciso informar este campo.
                    AE(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
                    GetAg(5,False,True),
                    spc(1), // Brancos
                    GetCC(13,True,True),
                    spc(1), // Brancos
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                    AE(Livre,16), // Nº Documento
                    Spc(4),
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    'R$ ', // Fixo
                    Spc(17), // Brancos
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),// Valor Pagto
                    Spc(43), // Brancos
                    Spc(40), // Mensagem Específica Para o Registro
                    Spc(12), // Branco
                    Copy(CdsTexto.FieldByName('FLGEMITEAVISO').AsString,1,1), //Emite Aviso Cobrança
                    Spc(10)));
      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
  end;
end;

procedure TPagHsbc.DetalheHsbcPagForne_B;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    if CdsTexto.FieldByName('TIPO').AsString = 'F' then
       sTipoInsc := '1'
    else
       sTipoInsc := '2';

    WriteLn(ArquivoRemessa,
            Concat('399', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(iTotRegLote),5), // Código Contador dos Registros No Lote
                    'B', // Código Sequencial
                    Spc(3), //Brancos
                    sTipoInsc,//Tipo InsCricao Favorecido
                    AE(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), //Num Inscricao do Favorecido
                    AE(CdsTexto.FieldByName('LOGRADOURO').AsString,30), //Endereço
                    ZD(CdsTexto.FieldByName('NUMERO').AsString,5),//Número
                    AE(CdsTexto.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                    AE(CdsTexto.FieldByName('BAIRRO').AsString,15),//Bairro
                    AE(CdsTexto.FieldByName('CIDADE').AsString,20),//Cidade
                    ZE(CdsTexto.FieldByName('CEP').AsString,8),//Cep
                    AE(CdsTexto.FieldByName('CODESTADO').AsString,2),//Estado
                    Spc(113))); // Complemento de Registro
  end;
end;

procedure TPagHsbc.HeaderHsbcLiqParcelas;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    Inc(iNumSeqLote);
    WriteLn(ArquivoRemessa,
            Concat('399', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    'C', // Brancos
                    '01', //Tipo de Serviço
                    '33', //Forma de Lançamento
                    '020', //Layout
                    spc(1), //Branco
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,6), // Número do Contrato - Número da Empresa no Banco
                    Spc(14), // Brancos
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True),
                    spc(1), //Brancos
                    GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,13,True, True), //Contas + DV
                    Spc(1), //Branco
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    Spc(40), //Brancos
                    AE(CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), //Endereço
                    ZD(CdsEmpresa.FieldByName('NUMERO').AsString,5),//Número
                    AE(CdsEmpresa.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                    AE(CdsEmpresa.FieldByName('CIDADE').AsString,20),//Cidade
                    ZE(CdsEmpresa.FieldByName('CEP').AsString,8),//Cep
                    AE(CdsEmpresa.FieldByName('CODESTADO').AsString,2),//Estado
                    Spc(18))); // Complemento de Registro
  end;
end;

procedure TPagHsbc.DetalheHsbcLiqParcelas_A;
var livre : string;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    livre := IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString ;
    try
      if trim(CdsTexto.FieldByName('livre').asstring) <> '' then
         livre := CdsTexto.FieldByName('livre').asstring;
    except
    end;
    WriteLn(ArquivoRemessa,
            Concat('399', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(iTotRegLote),5), // Código Contador do Registro No Lote
                    'A', // Código Sequencial
                    '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                    Spc(3), //Brancos
                    AE(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), //Banco Favorecido
                    GetAg(5,False,True),
                    spc(1), //Brancos
                    GetCC(13,True,True),
                    spc(1), //Brancos
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                    AE(Livre,16), //Nº Documento
                    Spc(4),
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    'R$ ', //Fixo
                    Spc(17), //Brancos
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor Pagto
                    Spc(43), //Brancos
                    AE(Livre,16), //Nº Documento
                    RemoveBarras2(CdsTexto.FieldByName('DATAVENCTO').AsString), //Data do Vencimento
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor Pagto
                    Spc(26)));
      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
  end;
end;

procedure TPagHsbc.HeaderHsbcLiqTitulos;
begin
   With IntBancoManager Do
   begin
     Inc(iTotRegArq);
     Inc(iTotRegLote);
     Inc(iNumSeqLote);
     WriteLn(ArquivoRemessa,
             Concat('399', // Código do banco
                     Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                     '1', // Tipo de Registro
                     'C', // Brancos
                     '01', // Tipo de Pagamento
                     CdsTexto.FieldByName('CODFORMAPAGTO').AsString,  //Forma de Pagamento
                     '020', //Layout
                     spc(1), //Branco
                     sCodInscEmpresa, // Empresa - Inscrição
                     ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
                     ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,6), // Número do Contrato
                     Spc(14), // Brancos
                     GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True),
                     spc(1), //Brancos
                     GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,13,True, True), //Contas + DV
                     spc(1), //Branco
                     Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                     Spc(40), //Brancos
                     AE(CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), //Endereço
                     ZD(CdsEmpresa.FieldByName('NUMERO').AsString,5),//Número
                     AE(CdsEmpresa.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                     AE(CdsEmpresa.FieldByName('CIDADE').AsString,20),//Cidade
                     ZE(CdsEmpresa.FieldByName('CEP').AsString,8),//Cep
                     AE(CdsEmpresa.FieldByName('CODESTADO').AsString,2),//Estado
                     Spc(18))); // Complemento de Registro
   end;
end;

procedure TPagHsbc.DetalheHsbcLiqTitulos_J;
var
   sBarras, sBanco, sMoeda, sCampoLivre, sDv, sValor,livre: String;
begin
  with IntBancoManager Do
   begin
     livre := IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString ;
     try
       if trim(CdsTexto.FieldByName('livre').asstring) <> '' then
          livre:=CdsTexto.FieldByName('livre').asstring;
     except
     end;
     Inc(iTotRegArq);
     Inc(iTotRegLote);


     If CdsTexto.FieldByName('CODBARRA').IsNull Then
     begin
      { Fábio Barros - Coloquei esse filtro porque existem boletos que NÃO possuem
        o VALOR DO BOLETO na linha Digitável
      if Length(CdsTexto.FieldByName('CODBARRAVALOR').AsString) = 33 then
        sBarras   := trim(CdsTexto.FieldByName('CODBARRAVALOR').AsString) +
                            ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),14)
      else
        {Se for menor do que 47 significa que não contem FATOR DE VENCIMENTO ou VALOR}

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
        {
        Código de Barras
        Não é necessário verificar se o boleto possui valor, porque
        os boletos que não possuem, são completados automaticamente com ZEROS.
         }
        sBarras     := CdsTexto.FieldByName('CODBARRA').AsString;
        sBarras     := ZE(sBarras,47);
        sBanco      := Copy(sBarras,1,3);
        sMoeda      := Copy(sBarras,4,1);
        sDv         := Copy(sBarras,5,1);
        sValor      := ZD(Trim(Copy(sBarras,6,14)),14);
        sCampoLivre := Copy(sBarras,20,25);
      end;

      WriteLn(ArquivoRemessa,
              Concat('399', // Código do banco
                      Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                      '3', // Tipo de Registro
                      Zd(IntToStr(iTotRegLote),5), // Código Contador do Registro No Lote
                      'J', // Código Sequencial
                      '0', //Tipo de Movimento 0 = I, 5 = B, 9 = E
                      '00', //Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                      sBanco,
                      sMoeda,
                      sDv,
                      sValor,
                      sCampoLivre,
                      AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome do Favorecido
                      RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data do Vencimento
                      spc(2), //Brancos

                      //inicio - andre tavares - pendência 21789 - 20/03/2006
                      //ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor Pagto
                      ZD(RemoveVirgulas(ValorBrutoDoc(CdsTexto.FieldByName('VALOR').AsFloat, CdsTexto.FieldByName('VALORDESCONTO').AsFloat, CdsTexto.FieldByName('VALORJUROS').AsFloat),2),13), // Valor do NOMINAL
                      //fim - andre tavares - pendência 21789 - 20/03/2006

                      Spc(2), //Brancos
                      ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13),//Valor Pagto
                      Spc(2), //Brancos
                      ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13),//Valor Pagto
                      RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                      Spc(2), //Brancos
                      
                      //inicio - andre tavares - pendência 21789 - 20/03/2006
                      {
                      ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat -
                                        CdsTexto.FieldByName('VALORDESCONTO').AsFloat +
                                        CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13),//Valor Pagto
                      }
                      ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),//Valor Pagto
                      //fim - andre tavares - pendência 21789 - 20/03/2006

                      Spc(2), //Brancos
                      ZD('0',13), // Qtd Moeda
                      ZD(CdsTexto.FieldByName('CODDOCUMENTO').AsString,20), //Cód. Atribuído ao Sacado
                      Spc(38)));
      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
   End;
End;

procedure TPagHsbc.DetalheHsbcLiqTitulos_K;
var
  Livre, SeuNumero, sCod : String;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    if CdsTexto.FieldByName('TIPO').AsString = 'F' then
       sTipoInsc := '1'
    else
       sTipoInsc := '2';
    Livre := CdsTexto.FieldByName('CODDOCUMENTO').AsString ;
    try
      if trim(CdsTexto.FieldByName('livre').asstring) <> '' then
         livre:=CdsTexto.FieldByName('livre').asstring;
    except
    end;

    if CdsTexto.FieldByName('CODBARRA').IsNull then
       sCod := Copy(CdsTexto.FieldByName('CODBARRAVALOR').AsString,1,3)
    else
       sCod := Copy(CdsTexto.FieldByName('CODBARRA').AsString,1,3);

// -----------------------------------------------------------------------------
    if CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger = 30 then {Liquidação de Títulos do HSBC}
      SeuNumero := spc(20)
    else
      SeuNumero := AE(Trim(Livre),20);
// -----------------------------------------------------------------------------
    WriteLn(ArquivoRemessa,
            Concat('399', // Código do banco
                   Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                   '3', // Tipo de Registro
                   Zd(IntToStr(iTotRegLote),5), // Código Contador do Registro No Lote
                   'K', // Código Sequencial
                   '0', // Tipo de Movimento 0 = I, 5 = B, 9 = E
                   '00', // Codigo Instrucao Para Motivo 00 = Inc, 99= Exc, 55 = Inc Com Bloqueio
                   Spc(3), // Brancos
                   sCod,  //Banco Depositário
                   Spc(20), // Nome do Banco Depositário
                   spc(5), // Código da Agência Depositária
                   Spc(20), // Nome da Agência Depositária
                   Spc(25), // Endereço da Agência Depositária
                   sTipoInsc, // Tipo Inscrição do Cedente
                   AE(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), // Num Inscricao do Favorecido
                   GetAg(5,False,True),
                   spc(1), // Brancos
                   GetCC(13,True,True),
                   spc(1), // Brancos
                   AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Favorecido
                   SeuNumero, // Nº Documento Empresa
//                 AE(CdsTexto.FieldByName('NODOCUMENTO').AsString,16), // Nº Documento Banco
                   spc(16), // Nº Documento Banco - NossoNumero
                   Spc(4),
                   RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data para Lançamento
                   Spc(2), // Brancos
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13), // Valor Pagto
                   Spc(19)));
      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
  end;
end;

(*
procedure TPagHsbc.DetalheHsbcLiqTitulos_L;
var
  livre : string;
  sBarras, sBanco, sMoeda, sCampoLivre, sDv, sValor: String;
begin
//64193162600000369101381768000016350984138170  - Exemplo de Cod. Barras extraido no leitor
//64191381746800001635909841381701316260000036910 - Linha digitável do mesmo bloqueto.
  With IntBancoManager Do
  begin
    livre := IdentificaOrigem + CdsTexto.FieldByName('CODDOCUMENTO').AsString ;
    try
      if trim(CdsTexto.FieldByName('livre').asstring) <> '' then
        livre:=CdsTexto.FieldByName('livre').asstring;
    except
    end;
    Inc(iTotRegArq);
    Inc(iTotRegLote);

    if CdsTexto.FieldByName('CODBARRA').IsNull then
    begin
      {Linha Digitável}
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
            Concat('399', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(iTotRegLote),5), // Código Contador do Registro No Lote
                    'L', // Código Sequencial
                    Spc(3), // Brancos
                    RemoveBarras2(CdsTexto.FieldByName('DATAVENCTO').AsString), //Data Emissão
//                  RemoveBarras2(DateToStr(Date)), //Data Emissão
                    Spc(3), // Espécie do Documento
                    'A', // Aceite
                    '00000000', // Data Processamento no Bamco
                    spc(10), // Uso do Banco
                    Spc(5), // Carteira de Cobranca
                    'R$ ', // Tipo de Moeda
                    Spc(2), // Filler
                    zd('0',13), // Qtde Moeda
                    RemoveBarras2(CdsTexto.FieldByName('DATAVENCTO').AsString), // Dat Prevista Para Pagto
                    sPC(2),// Brancos
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),// Valor Pagto
                    Spc(2), // Brancos
                    ZD('0',13),// Valor do Abatimento
                    Spc(2), // Brancos
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13),// Valor Pagto
                    Spc(2), // Brancos
                    ZD('0',13),// Valor da Multa
                    Spc(2), // Brancos
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),13), // Valor mora
                    spc(20), // NR Ref. do Sacado
                    sBanco, // Banco - Cód. Barra/Linha Digitável
                    sMoeda, // Moeda - Cód. Barra/Linha Digitável
                    sDv, // Dv - Cód. Barra/Linha Digitável
                    sValor, // Valor - Cód. Barra/Linha Digitável
                    sCampoLivre, // Campo Livre - Cód. Barra/Linha Digitável
                    Spc(23))); // Filler - Brancos
      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
  end;
end;
*)
procedure TPagHsbc.TrailerLiqTitulos;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    WriteLn(ArquivoRemessa,
            Concat('399', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Contador do Lote de Serviço
                    '5', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iTotRegLote),6), // Contador de Registros no Lote
                    Spc(3), //Brancos
                    ZD(RemoveVirgulas(rTotalValorPagoLote,2),15),// Valor Pagto
                    Spc(199))); // Complemento de Registro
    rTotalValorPago     := rTotalValorPago +  rTotalValorPagoLote;
    rTotalValorPagoLote := 0;
    iTotRegLote         := 0;
  end;
end;

procedure TPagHsbc.MontaHeader(iFormaPag:Integer);
Begin
  Case iFormaPag of
  1,2,3,5,7: HeaderHsbcPagForne;
  33:HeaderHsbcLiqParcelas;
  30,31,32: HeaderHsbcLiqTitulos;
  37: HeaderHsbcCartaoSalario;
  End;
End;

procedure TPagHsbc.MontaDetalhe(iFormaPag:Integer);
begin
  Case iFormaPag of
    1,2,3,5:
    {
    Crédito em Conta Corrente
    Crédito Administrativo
    DOC
    Crédito em Conta Poupança
    }
    begin
      DetalheHsbcPagForne_A;
      {Se for diferente de 399 significa que é DOC}
      If copy(Trim(IntBancoManager.CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString),1,3) <> '399' then DetalheHsbcPagForne_B;
    end;
    7:  DetalheHsbcPagForne_A; //Cheque Salário

    33: DetalheHsbcLiqParcelas_A; //Liquidação de Parcelas Cobrança não registrada - CNR

    30, 31: DetalheHsbcLiqTitulos_J; //Titulos HSBC e de OUTROS BANCOS(TERCEIROS)

    32: DetalheHsbcLiqTitulos_k; //Liberação de Titulos HSBC

{    31:
    begin
      DetalheHsbcLiqTitulos_k;
      DetalheHsbcLiqTitulos_L;
    end;
 }
    37: DetalheHsbcCartaoSalario_A; //Cartão Salário
  end;
end;

procedure TPagHsbc.MontaTrailer(iFormaPag:Integer);
Begin
  Case iFormaPag of
  1,2,3,5,7,33,37: TrailerLote;
  30,32,31: TrailerLiqTitulos;
  End;
End;


procedure TPagHsbc.HeaderHsbcCartaoSalario;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    Inc(iNumSeqLote);
    WriteLn(ArquivoRemessa,
            Concat('399', // Código do Banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    'C', // Brancos
                    '37', // Tipo de Serviço
                    '01',  // Forma de Lançamento
                    '020', //Layout
                    spc(1), //Branco
                    '2', // Tipo de Inscrição da Empresa - Fixo
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,6), // Número do Contrato - Número da Empresa no Banco
                    Spc(14), // Brancos
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True),
                    spc(1), //Brancos
                    GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,13, True, True), //Contas + DV
                    spc(1), //Branco
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,19), // Nome da Empresa
                    Spc(51), //Mensagem Genérica
                    AE(CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), //Endereço
                    ZD(CdsEmpresa.FieldByName('NUMERO').AsString,5),//Número
                    AE(CdsEmpresa.FieldByName('COMPLEMENTO').AsString,15),//Complemento
                    AE(CdsEmpresa.FieldByName('CIDADE').AsString,20),//Cidade
                    ZE(CdsEmpresa.FieldByName('CEP').AsString,8),//Cep
                    AE(CdsEmpresa.FieldByName('CODESTADO').AsString,2),//Estado
                    Spc(18))); // Complemento de Registro
  end;
end;

procedure TPagHsbc.DetalheHsbcCartaoSalario_A;
var Livre : string;
begin
  With IntBancoManager Do
  begin
    Livre := CdsTexto.FieldByName('CODDOCUMENTO').AsString ;
    try
     {Testa se o campo livre esta em branco. Se não estiver o passa no lugar do CodDocumento}
     if trim(CdsTexto.FieldByName('Livre').AsString) <> '' then
       Livre := CdsTexto.FieldByName('Livre').AsString;
    except
    end;
    WriteLn(ArquivoRemessa,
            Concat('399', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(iTotRegLote),5), // Código Contador do Registro No Lote
                    'A', // Código Sequencial
                    '0', // Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '00', // Codigo de Instrução para motivo 00 = Inc, 99 = Exc, 55 = Inc com Bloqueio
                    Spc(3), // Brancos - De acordo com a nota explicativa N, que acompanha o manual, eu não preciso informar este campo.
                    '399', //Banco Favorecido
                    '00000', // Zerado
                    spc(1), // Brancos
                    //   GetCC(13,True,True), - Substituir essa linha pelo número do cartão
                    GetCC(13,True,True),
                    //   zd('0',13), // Número do Cartão
                    spc(1), // Brancos
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString,19), //Nome do Funcionário
                    spc(11), // Brancos
                    AE(Livre,16), // Nº Documento
                    Spc(4),
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    'R$ ', // Fixo
                    Spc(17), // Brancos
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13),// Valor Pagto
                    Spc(43), // Brancos
                    '34', // Código do Comando
                    '094', // Tipo do Cartão - ('094' - Personalizado com o Nome da Empresa e do Funcionário)
                    zd('0',8), // Data de Nascimento do Funcionário
                    spc(1), // Sexo do Funcionário
                    zd('0',2), // Motivo do Cancelamento
                    zd('0',2), // Motivo Reemissão
                    zd('0',5), // Número da Remessa - Atribuído pelo Banco
                    Spc(40)));
      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
      Inc(iTotRegArq);
      Inc(iTotRegLote);
  end;
end;

end.





