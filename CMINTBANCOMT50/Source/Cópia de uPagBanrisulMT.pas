{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TPagBanrisul: Implementação do arquivo de Pagamento }
{                 de Fornecedores do Banco BANRISUL     }
{   BANCO BANRISUL - PAGAMENTO DE FORNECEDORES          }
{   IDMODELOSCNAB 21/P                                  }
{                                                       }
{ Analista Responsável: Fábio Barros                    }
{ Atualizado Em: 26/11/2001                             }
{                29/08/2002                             }
{                28/11/2002                             }
{*******************************************************}
{------------------------------------------------------------}
{ André Tavares - 08/07/2003 - Resolução da pendência  14132 }
{ Andre tavares - 16/07/2003 - pendência 14332                }
{------------------------------------------------------------}


unit uPagBanrisulMT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls;

Type
   TPagBanrisul = Class
   private
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
     {Header Geral do Arquivo - REGISTRO TIPO '0'}
     procedure HeaderArquivo;
       {Header de LOTE - REGISTRO TIPO '1'}
        procedure HeaderLote;
           {Detalhe Segmento A - REGISTRO TIPO '3'}
           procedure DetalheSegA;
           procedure DetalheSegD;
           {
            Detalhe Segmento I - REGISTRO TIPO '3'
            Por enquanto eu não estou usando este Registro.
            Ele possui uma coluna que necessita de um parametro
            que não está implementado.
            Fábio Barros
           }
           //procedure DetalheSegI;
           {Detalhe Segmento J - REGISTRO TIPO '3'}
           procedure DetalheSegJ;
        {Trailer de LOTE - REGISTRO TIPO '5'}
        procedure TrailerLote;
     {Trailer Geral do Arquivo - REGISTRO TIPO '9'}
     procedure TrailerArquivo;
   public
     {Monta arquivo de pagamento}
     Procedure GeraArquivoBanrisul;
end;

Var
  PagBanrisul: TPagBanrisul;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString;

Procedure TPagBanrisul.GeraArquivoBanrisul;
Var
 iTipoPag, iFormaPag : Integer;
 Lista : String;
begin
  With IntBancoManager Do
  Begin
    Try
      iTipoPag            := 0;
      iFormaPag           := 0;
      iNumSeqLote         := 0;
      iTotRegLote         := 0;
      ISEQREG             := 0;
      iTotRegArq          := 0;
      Lista               := '';
      rTotalValorPagoLote := 0;

      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);

      If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
         sCodInscEmpresa := '1'
      Else
         sCodInscEmpresa := '2';

      HeaderArquivo;

      CdsTexto.First;
      While Not CdsTexto.Eof Do
      begin
        if (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or (iFormaPag <> CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger) then
        begin
          iTipoPag  := CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger;
          iFormaPag := CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger;
          HeaderLote;
        end;
// -----------------------------------------------------------------------------
         INC(ISEQREG);
         case CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger of
           1,3,10: DetalheSegA; // C/C, OP e DOC
           30,31:  DetalheSegJ; // Pagamento de Títulos
           // Início - André Tavares - 15/07/2003 - pendência 14322
           33: DetalheSegD; // pagamento de arrecadações de concessionárias (Luz, telefone, etc)
           // Fim - André Tavares - 15/07/2003 - pendência 14322
         end;
// -----------------------------------------------------------------------------
         CdsTexto.Next;
         if (CdsTexto.Eof) or
            (iTipoPag  <> CdsTexto.FieldByName('CODTIPOPAGTO').AsInteger) or
            (iFormaPag <> CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger) then
         begin
           ISEQREG := 0;
           TrailerLote;
         end;
      End;
      //Trailer Geral
      TrailerArquivo;

      CloseFile(ArquivoRemessa);

      if not IntBancoManager.ExecSQL('UPDATE PORTADORFORMA SET CONTROLEREMESSA = '+CodArquivoRemessa +
                                     ' WHERE CODARQUIVOREMESSA = 21 AND ' +
                                     ' CODPORTFORMA = ' + CdsTexto.FieldByName('CODPORTFORMA').AsString) then
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


procedure TPagBanrisul.HeaderArquivo;
var s : string;
Begin
  With IntBancoManager Do
  Begin
    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('041', // Código do banco
                   '0000', // Lote de serviço
                   '0', // Tipo de Registro
                   Spc(9), // Brancos
                   sCodInscEmpresa, // Empresa - Inscrição
                   ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição da Empresa
                   ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,5), // Número de Inscrição da Empresa no Banco
                   spc(15), // Brancos
                   GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,True,True), //Agencia
                   '0', // Zero ou Branco
                   '000', // Zeros constantes
                   Zd(CdsEmpresa.FieldByName('NUMCONTA').AsString,10), //Conta + Dv
                   '0', // Zero ou Branco
                   AE(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                   AE(CdsEmpresa.FieldByName('NOMEBANCO').AsString,30), // Nome do Banco
                   spc(10), // Brancos
                   '1', // Código de Remessa/Retorno
                   RemoveBarras2(DateToStr(Date)), //Data Gravação do Arquivo
                   RemovePontos(TimeToStr(Time)), //Hora Gravação do Arquivo
                   ZD((CodArquivoRemessa),6), //Numero Sequencial da Remessa
                   '020', // Número da Versão do Layout
                   '01600', // Densidade de Gravação do Arquivo(BPI)
                   spc(20), // Para uso do Banco
                   spc(20), // Para uso da Empresa
                   spc(29))); // Brancos
  end;
end;

procedure TPagBanrisul.TrailerArquivo;
Begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Write(ArquivoRemessa,
            Concat('041', // Código do banco
                   '9999', // Contador do Lote de Serviço
                   '9', // Tipo de Registro
                   Spc(9), // Brancos - Uso FEBRABAN
                   Zd(IntToStr(iNumSeqLote),6), // Quantidade do Total de Lotes no Arquivo
                   Zd(IntToStr(iTotRegArq),6), // Soma de todos os registros do arquivo
                   ZD('0',6),
// início André Tavares 08/07/2003 - resolução da pendência 14312
//                   Spc(205)+ chr(13) + chr(10) + chr(26) )); // Complemento de Registro
                   Spc(205)+ chr(26) )); // Complemento de Registro
// Fim André Tavares
  end;

end;

procedure TPagBanrisul.HeaderLote;
var
  sTipoPagto : String;
Begin
{ -----------------------------------------------------------------------------
  Esta é uma alteração temporaria para atender a pendencia da FCRT
  ------------------------------------------------------------------------------ }
  sTipoPagto := IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString;
  if trim(IntBancoManager.CdsTexto.FieldByName('CODTIPOPAGTO').AsString) = '90' then
    sTipoPagto := '30';
{ ------------------------------------------------------------------------------ }

  With IntBancoManager Do
  Begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    Inc(iNumSeqLote);
    WriteLn(ArquivoRemessa,
            Concat('041', // Código do Banco
                   Zd(IntToStr(iNumSeqLote),4), // Código de LOTE
                   '1', // Tipo de Registro
                   'C', // Tipo de Operação - 'C'
                   ZD(sTipoPagto,2), // Tipo de Serviço
                   ZD(CdsTexto.FieldByName('CODFORMAPAGTO').AsString,2),  // Forma de Pagamento
                   '020', // Versão do Layout
                   spc(1), //Branco
                   sCodInscEmpresa, // Empresa - Inscrição
                   ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Númeoro de Inscrição da Empresa
                   ZD(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,5), // Número de Inscrição da Empresa no Banco
                   spc(15), // Brancos
                   GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,True,True), //Agencia
                   '0', // Zero
                   '000', //Zeros
                   Zd(CdsEmpresa.FieldByName('NUMCONTA').AsString,10), //Conta + Dv
                   ' ', //Branco
                   Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                   Spc(40),//Brancos
                   Ae(CdsEmpresa.FieldByName('LOGRADOURO').AsString,30), // Endereço
                   Zd(CdsEmpresa.FieldByName('NUMERO').AsString,5), //Número
                   Ae(CdsEmpresa.FieldByName('BAIRRO').AsString,15), // Bairro
                   Ae(CdsEmpresa.FieldByName('CIDADE').AsString,20), // Cidade
                   Ae(CdsEmpresa.FieldByName('CEP').AsString,8), // Cep
                   Ae(CdsEmpresa.FieldByName('CODESTADO').AsString,2), // Estado
                   Spc(18)//Branco
                   ));
  end;
end;

procedure TPagBanrisul.DetalheSegA;
var
 ContaCorrente : String;
 sSeuNumero    : String;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);

    if CdsTexto.FieldByName('TIPO').AsString = 'F' then
       sTipoInsc := '1'
    else
       sTipoInsc := '2';

    case CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger of
      1, 3:  ContaCorrente := GetCC(13,True,True);
      10: ContaCorrente := ZD('0',13);
    end;

    //Arquivo de Pagamento do TotalPrev
    if trim(IdentificaOrigem) = '18' then
      sSeuNumero := CdsTexto.FieldByName('LIVRE').AsString
    else
      sSeuNumero := CdsTexto.FieldByName('CODDOCUMENTO').AsString;

    WriteLn(ArquivoRemessa,
            Concat('041', // Código do Banco
                   Zd(IntToStr(iNumSeqLote),4), // Lote de Serviço
                   '3', // Tipo de Registro
                   Zd(IntToStr(ISEQREG),5), // Código Contador do Registro no Lote
                   'A', // Código do Seguemento
                   '0', // Tipo de Movimento
                   '00', // Codigo instrução para Movimento
                   '010', // Código da Câmara de Compensação
                   ZD(CdsTexto.FieldByName('CODBANCOFAVORECIDO').AsString,3), // Código do Banco Favorecido
                   GetAG(5,True,True),
//                   ZD(Trim(MascaraAlfa(CdsTexto.FieldByName('NUMAGENCIA').AsString)),5),
//                   GetAG(5,False,True), // Agencia da Conta do Favorecido
                   '0', // Zero ou Branco
                   ContaCorrente, // Conta Favorecido
                   '0', // Zero ou Branco
                   AE(MascaraAlfa(CdsTexto.FieldByName('RAZAOSOCIAL').AsString),30), // Nome do Favorecido
                   AE(ZD(sSeuNumero,6),20), // Seu Numero - Nº Documento na Empresa
                   RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data Prevista para Pagto
                   'BRL', // Tipo de Moeda
                   ZD('0',15), // Zeros
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15), // Valor para Creditar
                   Spc(20), // Nosso Numero - só será informado no Retorno
                   spc(8), // Data da efetivação do crédito na conta - só será informado no Retorno
                   spc(15), // Valor do crédito efetuado
                   spc(25), // Brancos
                   sTipoInsc, // Tipo de Inscrição
                   ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição do Favorecido
                   Spc(12), // Brancos
                   '0', // Não emite aviso ao Favorecido
                   spc(10))); // Códigos das ocorrências de retorno
      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
  end;
end;

(*
procedure TPagBanrisul.DetalheSegI;
Begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    if CdsTexto.FieldByName('TIPO').AsString = 'F' then
       sTipoInsc := '1'
    else
       sTipoInsc := '2';
    WriteLn(ArquivoRemessa,
            Concat('041', // Código do banco
                   Zd(IntToStr(iNumSeqLote),4), // Lote de Serviço - Sequence DO LOTE
                   '3', // Tipo de Registro
                   Zd(IntToStr(ISEQREG),5), // Sequence do registro NO LOTE
                   'I', // Código do Seguimento
                   '0', // Tipo de Movimento
                   '00', // Código de Instrução para alteração
                   Spc(4), // Código de pagamento do INSS
                   AE(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), // Identificador do Documento
                   COPY(RemoveBarras2(CdsTexto.FieldByName('DATAEMISSAO').AsString),3,6) , // Competencia
                   RemoveBarras2(CdsTexto.FieldByName('DATAVENCTO').AsString), // Data do Vencimento
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15), // Valor 6 = INSS
                   ZD('0',15), // Valor 7
                   ZD('0',15), // Valor 8
                   ZD('0',15), // Valor 9
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15), // Valor 10
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15), // Valor 11 - Total arrecadado
                   spc(1), // Branco

                   spc(4), // Agencia Cobradora
                   spc(4), // Numero da máquina
                   spc(3), // NDU - Sistema Banrisul
                   spc(5), // NSU - numero correspondente a autenticação
                   spc(69), // Reservado
                   spc(5), // Reservado para sequencia do contas a pagar
                   spc(10))); // Códigos de Ocorrência
    rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
  end;
end;
*)


// André Tavares - Resolução da pendência 14332
procedure TPagBanrisul.DetalheSegD;
var
  ContaCorrente : String;
  sSeuNumero    : String;
  sBarras, sBanco, sMoeda, sCampoLivre, sDv, sValor: String;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);

    if CdsTexto.FieldByName('TIPO').AsString = 'F' then
       sTipoInsc := '1'
    else
       sTipoInsc := '2';

    case CdsTexto.FieldByName('CODFORMAPAGTO').AsInteger of
      1, 3:  ContaCorrente := GetCC(13,True,True);
      10: ContaCorrente := ZD('0',13);
    end;

    //Arquivo de Pagamento do TotalPrev
    if trim(IdentificaOrigem) = '18' then
      sSeuNumero := CdsTexto.FieldByName('LIVRE').AsString
    else
      sSeuNumero := CdsTexto.FieldByName('CODDOCUMENTO').AsString;

    if CdsTexto.FieldByName('CODBARRA').IsNull then
    begin
      if Length(CdsTexto.FieldByName('CODBARRAVALOR').AsString) < 47 then
        sBarras := Copy(CdsTexto.FieldByName('CODBARRAVALOR').AsString, 1,33) +
                   ZD(trim(Copy(CdsTexto.FieldByName('CODBARRAVALOR').AsString, 34, 14)),14)
      else
      sBarras     := CdsTexto.FieldByName('CODBARRAVALOR').AsString;
      sBarras     := ZE(sBarras,48);
      sBanco      := Copy(sBarras,1,3);
      sMoeda      := Copy(sBarras,4,1);
      sCampoLivre := Copy(sBarras,5,5) + Copy(sBarras,11,10) + Copy(sBarras,22,10);
      sDv         := Copy(sBarras,33,1);
      sValor      := ZD(Trim(Copy(sBarras,34,14)),14);
    end
    else
    begin
      sBarras     := CdsTexto.FieldByName('CODBARRA').AsString;
      sBarras     := ZE(sBarras,48);
      sBanco      := Copy(sBarras,1,3);
      sMoeda      := Copy(sBarras,4,1);
      sDv         := Copy(sBarras,5,1);
      sValor      := ZD(Trim(Copy(sBarras,6,14)),14);
      sCampoLivre := Copy(sBarras,20,25);
    end;

    WriteLn(ArquivoRemessa,
            Concat('041', // Código do Banco
                   Zd(IntToStr(iNumSeqLote),4), // Lote de Serviço
                   '3', // Tipo de Registro
                   Zd(IntToStr(ISEQREG),5), // Código Contador do Registro no Lote
                   'D', // Código do Seguemento
                   '0', // Tipo de Movimento
                   '00', // Codigo instrução para Movimento
                   sBarras, // código de barras
                   RemoveBarras2(FuncaoGeral.Decode(IntBancoManager.DataPagamento,'',IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString,IntBancoManager.DataPagamento)),//Data do Crédito ao Favorecido
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15), // Valor para Creditar
                   Spc(21), //Em branco - reservado.
                   sValor,  // valor principal implícito no código de barras
          {???}    ZD(RemoveVirgulas(CdsTexto.FieldByName('INDICECORRECAO').AsFloat,2),15), // Atualização monetária
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VLRMULTA').AsFloat,2),15), // Valor da MULTA
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),16), // Valor de JUROS
                   spc(4), // número da Agência retornado pelo banco
                   spc(4), // número da máquina retornado pelo banco
                   spc(3), // NDU retornado pelo banco
                   spc(6), // NSU retornado pelo banco
                   spc(30),//Nome do Cedente/favorecido (retornado pelo Banco)
                   spc(9), // reservado
                   spc(5), // reservado
                   spc(10))); // Códigos das ocorrências de retorno
      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
  end;
end;



procedure TPagBanrisul.DetalheSegJ;
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
            Concat('041', // Código do banco
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
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15), // Valor Pagto
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15),
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15),
                   RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data do Pagamento
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat -
                                     CdsTexto.FieldByName('VALORDESCONTO').AsFloat +
                                     CdsTexto.FieldByName('VALORJUROS').AsFloat,2),15), // Valor do Pagamento
                   '0', // Zeros - Qtd da Moeda
                   spc(4), // Brancos
                   sTipoInsc, // Tipo de Inscrição
                   ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
                   spc(4), // Brancos
                   Copy(sBarras,10,1)+Copy(sBarras,21,1)+Copy(sBarras,32,1), // D1 + D2 + D3
                   spc(10))); // Códigos de Ocorrência
    rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
  end;
end;

procedure TPagBanrisul.TrailerLote;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    WriteLn(ArquivoRemessa,
            Concat('041', // Código do banco
                   Zd(IntToStr(iNumSeqLote),4), // Contador do Lote de Serviço
                   '5', // Tipo de Registro
                   Spc(9), // Brancos
                   Zd(IntToStr(iTotRegLote),6), // Contador de Registros no Lote
                   ZD(RemoveVirgulas(rTotalValorPagoLote,2),18),// Valor Pagto
                   ZD('0',18),
                   Spc(171),
                   spc(10) )); // Códigos de ocorrência para retorno
    rTotalValorPagoLote := 0;
    iTotRegLote := 0;
  end;
end;



end.



