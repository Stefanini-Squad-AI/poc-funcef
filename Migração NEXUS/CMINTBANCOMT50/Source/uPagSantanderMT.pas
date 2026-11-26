{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TPagHsbc: Implementação do arquivo de               }
{   Pagamentos do SANTANDER                             }
{   BANCO SANTANDER - FOLHA DE PAGAMENTO                }
{   IDMODELOSCNAB 26/P                                  }
{                                                       }
{ Analista Responsável: Fábio Barros                    }
{ Atualizado Em: 13/06/2002                             }
{*******************************************************}

unit uPagSantanderMT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics, Controls;

Type
   TPagSantander = Class
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
     {Código de inscrição da empresa}
     sCodInscEmpresa: String;
     {Valor Total dos registro no arquivo}
     rTotalValorPago: Real;
     {Valor total dos pagamentos no lote}
     rTotalValorPagoLote: Real;

     {Header Geral do Arquivo}
     procedure HeaderArquivoSantander;
       {Header de Lote - Cartão Salário}
       procedure HeaderSantanderCartaoSalario;
          {Detalhe do Cartão Salário}
           procedure DetalheSantanderCartaoSalario_A;
       {Trailer Lote - Cartão Salário}
       procedure TrailerLote;
     {Trailer Geral do Arquivo}
     procedure TrailerArquivoSantander;

   public
     {Monta arquivo de pagamento do HSBC}
     Procedure PagamentosSantander;
end;

Var
  PagSantander: TPagSantander;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString;

Procedure TPagSantander.PagamentosSantander;
begin
 With IntBancoManager Do
 begin
   Try
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

     HeaderArquivoSantander;
     HeaderSantanderCartaoSalario;
     CdsTexto.First;
     while not CdsTexto.Eof do
     begin
       DetalheSantanderCartaoSalario_A;
       CdsTexto.Next;
     end;
     TrailerLote;
     //Trailer Geral
     TrailerArquivoSantander;

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

procedure TPagSantander.HeaderArquivoSantander;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iNumRemessa);
    WriteLn(ArquivoRemessa,
            Concat('353', // Código do banco
                   '0000', // Código do Lote
                   '0', // Tipo de Registro
                    Spc(9) , // Brancos
                    sCodInscEmpresa, // Empresa - Inscrição
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
                    spc(20), // Número do Convênio - Preencher com Brancos(ver layout)
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True), //Agência
                    '0', // DV da Agência
                    GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,12,True,True), //Conta + DV
                    '00', // Zeros
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    Ae('SANTANDER BRASIL',30), // Nome do Banco
                    spc(10), // Brancos
                    '1', // Indica Arquivc de Remessa
                    RemoveBarras2(DateToStr(Date)), //Data Gravação do Arquivo
                    RemovePontos(TimeToStr(Time)), //Hora Gravação do Arquivo
                    Zd(IntToStr(iNumRemessa),6), //Numero Sequencial da Remessa
                    '020', //Layout do Arquivo
                    '01600', //Densidade de Gravação do Arquivo
                    RemoveBarras2(DateToStr(Date)), //Data do Crédito
                    Spc(61))); // Brancos
   End;
End;

procedure TPagSantander.TrailerLote;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    WriteLn(ArquivoRemessa,
            Concat('353', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Contador do Lote de Serviço
                    '5', // Tipo de Registro
                    Spc(9), //Brancos
                    Zd(IntToStr(iTotRegLote),6), // Contador de Registros no Lote
                    ZD(RemoveVirgulas(rTotalValorPagoLote,2),15),//Valor Pagto
                    zd('0',18),
                    Spc(181)));

    rTotalValorPago     := rTotalValorPago +  rTotalValorPagoLote;
    rTotalValorPagoLote := 0;
    iTotRegLote         := 0;
  end;
end;

procedure TPagSantander.TrailerArquivoSantander;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    WriteLn(ArquivoRemessa,
            Concat('353', // Código do banco
                   '9999', // Contador do Lote de Serviço
                   '9', // Tipo de Registro
                   Spc(9), //Brancos
                   Zd(IntToStr(iNumSeqLote),6), // Contador de Registros no Lote
                   Zd(IntToStr(iTotRegArq),6), // Contador de Registros no Lote
                   zd('0',6),
                   Spc(205)));
  end;
end;

procedure TPagSantander.HeaderSantanderCartaoSalario;
begin
  With IntBancoManager Do
  begin
    Inc(iTotRegArq);
    Inc(iTotRegLote);
    Inc(iNumSeqLote);
    WriteLn(ArquivoRemessa,
            Concat('353', // Código do Banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '1', // Tipo de Registro
                    'D', // Tipo de Operação
                    '30', // Tipo de Serviço
                    '00',  // Zeros
                    '020', //Layout
                    spc(1), //Branco
                    sCodInscEmpresa, // Tipo de Inscrição da Empresa - Fixo
                    ZD(CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição
                    spc(20), // Número do Contrato - Número da Empresa no Banco
                    Spc(14), // Brancos
                    GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,5,False,True),
                    '0', //Zero
                    GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,12, True, True), //Contas + DV
                    '00', //Zeros
                    Ae(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,30), // Nome da Empresa
                    Spc(70), //Brancos
                    ZD('0',5), //Zeros
                    Spc(35), //Brancos
                    ZD('0',5), //Zeros
                    Spc(23))); // Complemento de Registro
  end;
end;

procedure TPagSantander.DetalheSantanderCartaoSalario_A;
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
            Concat('353', // Código do banco
                    Zd(IntToStr(iNumSeqLote),4), // Código Contador do Lote
                    '3', // Tipo de Registro
                    Zd(IntToStr(iTotRegLote),5), // Código Contador do Registro No Lote
                    'A', // Código Sequencial
                    '0', // Tipo de Movimento 0 = I, 5 = B, 9 = E
                    '04', // Forma de Lançamento
                    '018', // Câmara de Compensação
                    '353', //Banco Favorecido
                    GetAG(5, False, True),
                    '0', //Zero
                    GetCC(12, True, True),
                    '00', //Livre
                    AE(CdsTexto.FieldByName('RAZAOSOCIAL').AsString, 30), //Nome do Funcionário
                    ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), // Número de Inscrição do Funcionario
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    spc(3), //Moeda
                    ZD('0', 15),
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),// Valor Pagto
                    ZD('0', 20),
                    RemoveBarras2(FuncaoGeral.Decode(DataPagamento,'',CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Dat Prevista Para Pagto
                    ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15),// Valor Pagto
                    ZD('0', 34),
                    spc(18),
                    '0', //Zero
                    spc(10)));

      rTotalValorPagoLote := rTotalValorPagoLote + CdsTexto.FieldByName('VALOR').AsFloat;
      Inc(iTotRegArq);
      Inc(iTotRegLote);
  end;
end;

end.





