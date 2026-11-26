{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCnabSantander: Implementação do arquivo para       }
{                   Cobrança Registrada/Sem Registro    }
{                   para o Banco Santander              }
{   BANCO SANTANDER - COBRANÇA                          }
{   IDMODELOSCNAB 10/R                                  }
{                                                       }
{ Analista Responsável: Fábio Barros                    }
{ Atualizado Em: 22/04/2002                             }
{                14/06/2002                             }
{                                                       }
{*******************************************************}

unit uCnabSantanderMT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics,CMwwQuery, Controls;

Type
   TCnabSantander = Class
   private
     {Arquivo a ser gerado}
     ArquivoRemessa: TextFile;
     {Contadpr do total de registros do arquivo}
     iTotRegArq: Integer;
     {Contador do total de registros do lote}
     iTotRegLote: Integer;
     {Contador dos registros no lote}
     iRegLote: Integer;
     rNossoNumero      : Double;
     {Valor Total dos pagamentos}
     rTotalValorPago: Double;
     {Tipo de Inscrição da Empresa}
     sTipoEmpresa : String;
     {Tipo de Inscrição do Cliente}
     sTipoSacado : String;
     {Header do Arquivo}
     procedure HeaderArquivo;
       {Header do Lote}
       procedure HeaderLote;
         {Registros para pagamento - Segmento P}
         procedure DetalheP;
         {Registros para pagamento de Titulos Novo - Segmento Q}
         procedure DetalheQ;
       {Trailer do Lote}
       procedure TrailerLote;
     {Trailer do Arquivo}
     procedure TrailerArquivo;
   public
     {Monta arquivo de pagamento}
     Procedure GeraArquivoSantander;
end;

Var
  CnabSantander: TCnabSantander;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString;


Procedure TCnabSantander.GeraArquivoSantander;
begin
  With IntBancoManager Do
  Begin
    Try
      iTotRegArq      := 0;
      rTotalValorPago := 0;
      iTotRegLote     := 0;
      iRegLote        := 1;
      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);

      if CdsEmpresa.FieldByName('TIPO').AsString = 'F' then
        sTipoEmpresa := '1'
      else
        sTipoEmpresa := '2';

      HeaderArquivo;
      HeaderLote;
      CdsTexto.First;

      While Not CdsTexto.Eof Do
      begin
        if CdsTexto.FieldByName('TIPO').AsString = 'F' then
          sTipoSacado := '1'
        else
          sTipoSacado := '2';
         DetalheP;
         DetalheQ;
         CdsTexto.Next;
      End;

      TrailerLote;
      TrailerArquivo;

      CloseFile(ArquivoRemessa);

      UltNossoNumero      := FloatToStr(rNossoNumero);
      UltCodArquivoGerado := CodArquivoRemessa;
      MostraArquivo;
    Except
      CloseFile(ArquivoRemessa);
      Raise;
    End;
 End;
End;


procedure TCnabSantander.HeaderArquivo;
begin
  with IntBancoManager do
  begin
    WriteLn(ArquivoRemessa,
            Concat('353', //Código do Banco na Compensação
                   '0000', //Lote de Serviço
                   '0', //Tipo de Registro
                   spc(8), //Uso do Banco
                   sTipoEmpresa, //Tipo de Inscrição da Empresa
                   ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,15), //Inscrição da Empresa
                   GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString, 5, True, True), //Agência + DV
                   GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 10, True, True), //Conta + DV
                   spc(25), //Uso do Banco
                   AE(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), //Nome da Empresa
                   AE('Banco Santander',30), //Nome do Banco
                   spc(10), //Brancos
                   '1', //Remessa
                   RemoveBarras2(DateToStr(Date)), //Data Gravação do Arquivo
                   spc(6), //Brancos
                   ZD((CodArquivoRemessa),6), //Numero Sequencial da Remessa
                   '040', //Versão do Layout do Arquivo
                   spc(74))); // Brancos
    Inc(iTotRegArq);
  end;
end;


procedure TCnabSantander.HeaderLote;
begin
  with IntBancoManager do
  begin
    WriteLn(ArquivoRemessa,
            Concat('353', //Código do Banco na Compensação
                   '0001', //Lote de Serviço(Fixo, pois eu só gero um Lote) - Fábio Barros 14/06/2002
                   '1', //Tipo de Registro
                   'R', //Tipo de Operação
                   '01', //Tipo de Serviço
                   spc(2), //Reservado ao Banco
                   '030', //Nº do Layoute do Lote
                   spc(1), //brancos
                   sTipoEmpresa, //Tipo de Inscrição da Empresa
                   ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,15), //Inscrição da Empresa
                   spc(20), //Brancos
                   GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString, 5, True, True), //Agência + DV
                   GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 10, True, True), //Conta + DV
                   spc(5), //Uso do Banco
                   AE(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), //Nome do Cedente
                   AE(BuscaParamIntBanco('MENSAGEMLOTE1','S'),40),
                   AE(BuscaParamIntBanco('MENSAGEMLOTE2','S'),40),
                   ZD((CodArquivoRemessa),8), //Numero Sequencial da Remessa
                   RemoveBarras2(DateToStr(Date)), //Data Gravação do Arquivo
                   spc(41))); //Brancos
    Inc(iTotRegArq);
    Inc(iTotRegLote);
  end;
end;

procedure TCnabSantander.DetalheP;
var
  sNossoNumeroFinal,
  sValorMora        : String;
begin
  with IntBancoManager do
  begin
    rNossoNumero      := StrToFloat(NossoNumero) + 1;
    sNossoNumeroFinal := ZD(CalculaModulo11(Trim(FloatToStr(rNossoNumero)), False, 9),13);
    sValorMora := BuscaParamIntBanco('VALORMORA','S');
    WriteLn(ArquivoRemessa,
            Concat('353', //Código do Banco na Compensação
                   '0001',//Número do Lote Remessa
                   '3', //Tipo de Registro
                   ZD(IntToStr(iRegLote),5), //Numero de Documentos dentro do Lote
                   'P', //Cód. Segmento do Registro detalhe
                   spc(1), //Reservado ao Banco
                   '01', //Código de Movimento Remessa (01 - Entrada de Título)
                   GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString, 5, True, True), //Agência + DV
                   GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 10, True, True), //Conta + DV
                   GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString, 10, True, True), //Conta + DV(Conta Cobrança)
                   spc(2), //Brancos
                   sNossoNumeroFinal, //Nosso Número
                   BuscaParamIntBanco('TIPOCOBRANCA','S'), //Tipo de Cobrança
                   BuscaParamIntBanco('FORMACADASTRAMENTO','S'), //Forma de Cadastramento
                   '1', //Tipo de Documento
                   spc(2), //Brancos
                   AE(CdsTexto.FieldByName('NODOCUMENTO').AsString,15), //Nº do Documento
                   RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data de Vencimento
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),// Valor do Titulo
                   ZD('0',5), //Agencia, com DV, encarregada pela Cobrança - Informação preenchida pelo Banco
                   spc(1), //Reservado ao Banco
                   BuscaParamIntBanco('ESPECIETITULO','S'), //Espécie do Título
                   BuscaParamIntBanco('ACEITE','S'), //Espécie do Título
                   RemoveBarras2(CdsTexto.FieldByName('DATAEMISSAO').AsString), //Data de Emissao
                   BuscaParamIntBanco('CODIGOMORA','S'), //Código de Mora
                   RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data dO Juros de Mora(Vencimento)
                   sValorMora, //Valor da Mora/Dia ou Taxa Mensal
                   '1', //Cód. do 1º Desconto (1 - Valor Fixo até a data Informada)
                   REMOVEBARRAS2(CdsTexto.FieldByName('DATALIMITE').AsString), //Data limite p/Desconto
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),15), //Valor do desconto
                   BuscaParamIntBanco('IOF','S'), //Pecentual do IOF
                   ZD('0', 15), //Valor do Abatimento
                   AE(CdsTexto.FieldByName('CODDOCUMENTO').AsString,25), //Identificação do Titulo na Empresa
                   ZD(BuscaParamIntBanco('DIASPROTESTO','S'),2), //Dias p/protesto
                   '1', //Código para Baixa Devolução
                   ZD(BuscaParamIntBanco('DIASBAIXA','S'),3), //Dias para BAIXA/DEVOLUÇÃO
                   '00', //Real
                   spc(11))); //Reservado
    rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat;
    if not AtualizaDoc('1','S',FloatToStr(rNossoNumero),DateToStr(Date),CodArquivoRemessa,CdsTexto.FieldByName('CodDocumento').AsString,CdsTexto.FieldByName('FLGGRUPO').AsString) then
       Raise Exception.Create(MessageInfo);
  end;
  Inc(iTotRegLote);
  Inc(iTotRegArq);
  Inc(iRegLote);
end;

procedure TCnabSantander.DetalheQ;
begin
  with IntBancoManager do
  begin
    WriteLn(ArquivoRemessa,
            Concat('353', //Código do Banco na Compensação
                   '0001',//Número do Lote Remessa
                   '3', //Tipo de Registro
                   ZD(IntToStr(iRegLote),5), //Numero de Documentos dentro do Lote
                   'Q', //Cód. Segmento do Registro detalhe
                   spc(1), //Reservado ao Banco
                   '01', //Código de Movimento Remessa (01 - Entrada de Título)
                   sTipoSacado, //Tipo de Inscrição do Sacado
                   ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //Inscrição do Sacado
                   AE(CdsTexto.FieldByName('NOME').AsString,40),
                   AE(Copy(CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                           CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                           CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40), //Endereço do SACADO
                   AE(CdsTexto.FieldByName('BAIRRO').AsString,15),
                   ZE(CdsTexto.FieldByName('CEP').AsString,8),
                   AE(CdsTexto.FieldByName('CIDADE').AsString,15),
                   AE(CdsTexto.FieldByName('CODESTADO').AsString,2),
                   sTipoSacado, //Tipo de Inscrição do Sacado/Avalista
                   ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //Inscrição do Sacado/Avalista
                   AE(CdsTexto.FieldByName('NOME').AsString,40), //Nome do Sacado/Avalista
                   '000', //Identificador de Carnê
                   '000', //Sequencial da Parcela ou Numero inicial da parcela
                   '000', //Quantidade total de parcelas
                   '000', //Nº do Plano
                   spc(19))); //Reservado
  end;
  Inc(iTotRegArq);
  Inc(iTotRegLote);
  Inc(iRegLote);
end;

procedure TCnabSantander.TrailerLote;
begin
  with IntBancoManager do
  begin
    Inc(iTotRegLote);
    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('353', // Código do Banco
                   '0001', //Numero do Lote
                   '5', //Tipo de Registro
                   spc(9), //Brancos
                   Zd(IntToStr(iTotRegLote),6), // Quantidade Total de Registros no Lote(inclusive header e trailler)
                   spc(217) )); // Filler
  end;
end;


procedure TCnabSantander.TrailerArquivo;
begin
  with IntBancoManager do
  begin
    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('353', // Código do Banco
                   '0000', //Numero do Lote
                   '9', //Tipo de Registro
                   spc(9), //Brancos
                   '000001', //Qtd de Lotes no Arquivo
                   Zd(IntToStr(iTotRegArq),6), // Quantidade Total de Registros no Arquivo(todos os Registros)
                   spc(211) )); // Filler
  end;
end;
end.



