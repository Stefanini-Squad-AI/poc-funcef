{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TDebAutBanrisul: Implementação do arquivo para         }
{                 Débito Automático do Banco BANRISUL   }
{   BANCO BANRISUL - DÉBITO AUTOMÁTICO                  }
{   IDMODELOSCNAB 24/R                                  }
{                                                       }
{ Analista Responsável: Fábio Barros                    }
{ Atualizado Em: 22/04/2002                             }
{                                                       }
{*******************************************************}

unit uDebAutBanrisulMT;

interface

Uses classes, SysUtils, Dialogs, Forms, Graphics,Controls;

Type
   TDebAutBanrisul = Class
   private
     {Arquivo a ser gerado}
     ArquivoRemessa: TextFile;
     {Contadpr do total de registros do arquivo}
     iTotRegArq: Integer;
     {Valor Total dos pagamentos}
     rTotalValorPago: Double;

     {Header do Arquivo - REGISTRO TIPO 'A'}
     procedure HeaderArquivo;
        {Registros para pagamento}
        procedure DetalheE;
     {Trailer do Arquivo - REGISTRO TIPO 'Z'}
     procedure TrailerArquivo;

   public
     {Monta arquivo de pagamento}
     Procedure GeraArquivoBanrisul;
end;

Var
  DebAutBanrisul: TDebAutBanrisul;

implementation

Uses uSistema, uContaBancariaMT, uIntBancoManager, uString;


Procedure TDebAutBanrisul.GeraArquivoBanrisul;
Var
 Lista : String;
 slArquivo: String;
begin
  With IntBancoManager Do
  Begin
    Try
      iTotRegArq      := 0;
      Lista           := '';
      rTotalValorPago := 0;
      {Nome do Arquivo a ser Gerado}
      slArquivo := 'RPEN' + FormatDateTime('DDMM',Date) + '.BRR';
      sNomeArquivo := ExtractFilePAth(sNomeArquivo) + slArquivo;
      AssignFile(ArquivoRemessa,sNomeArquivo);
      ReWrite(ArquivoRemessa);
      HeaderArquivo;

      CdsTexto.First;
      While Not CdsTexto.Eof Do
      begin
         DetalheE;
{         if trim(lista) <> '' then
         begin
           if Pos(biblioteca.CdsTexto.FieldByName('codportador').AsString, lista) = 0 then
              lista := lista+','+biblioteca.CdsTexto.FieldByName('codportador').AsString;
         end
         else
            lista := biblioteca.CdsTexto.FieldByName('codportador').asstring;}
         CdsTexto.Next;
      End;
      //Trailer Geral
      TrailerArquivo;

      CloseFile(ArquivoRemessa);
      UltCodArquivoGerado := CodArquivoRemessa;
      if not IntBancoManager.ExecSQL(' UPDATE PORTADORFORMA SET CONTROLEREMESSA = ' + CodArquivoRemessa +
                                     ' WHERE CODARQUIVOREMESSA=18 AND CODPORTADOR IN (' + lista + ')' +
                                     ' AND IDPESSOA = ' + inttostr(sistema.idempresa) ) then

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


procedure TDebAutBanrisul.HeaderArquivo;
begin
  with IntBancoManager do
  begin
    WriteLn(ArquivoRemessa,
            Concat('A', // Código do Registro
                   '1', // Código de Remessa
                   Ae(CdsEmpresa.FieldByName('NUMEMPRESABANCO').AsString,5), //Código do Convênio
                   Spc(15), // Brancos
                   AE(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,20), // Nome da Empresa
                   '041', // Código do Banco
                   AE(CdsEmpresa.FieldByName('NOMEBANCO').AsString,20), // Nome do Banco
                   FormatDateTime('YYYYMMDD', Date), //Data da Gravação do Arquivo
                   ZD((CodArquivoRemessa),6), //Numero Sequencial da Remessa
                   '04', // Versão do Layout
                   AE('DÉBITO AUTOMÁTICO',17), // Descrição do Layout
                   spc(52))); // Brancos
    Inc(iTotRegArq);
  end;
end;

procedure TDebAutBanrisul.TrailerArquivo;
begin
  with IntBancoManager do
  begin
    Inc(iTotRegArq);
    Write(ArquivoRemessa,
            Concat('Z', // Código do Registro
                   Zd(IntToStr(iTotRegArq),6), // Quantidade Total de Registros no Arquivo(inclusive header e trailler)
                   Zd(RemoveVirgulas(rTotalValorPago,2),17), // Soma dos Valores de todos os registros do arquivo
                   spc(126) )); // Filler
  end;
end;

procedure TDebAutBanrisul.DetalheE;
begin
  with IntBancoManager do
  begin
    WriteLn(ArquivoRemessa,
            Concat('E', // Código do Registro
                   AE(CdsTexto.FieldByName('NOME').AsString,25), //Identificação do Cliente na Empresa
                   GetAG(4,False,True), //Agência para Débito
//                 GetCC(10, True,True), //Identificação do Cliente no Banco - CONTA CORRENTE
                   GetCC(CdsTexto.FieldByName('NUMCONTA').AsString, 10, True, True),
                   spc(4), //Brancos
                   RemoveBarras3(FuncaoGeral.Decode(DataPagamento,'', CdsTexto.FieldByName('DATAPROGRAMADA').AsString,DataPagamento)), //Data do Vencimento
                   ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15), //Valor Pagto
                   '03', //Código da Moeda - '03' para REAL / '01' para UFIR
                   AE(CdsTexto.FieldByName('CODDOCUMENTO').AsString,60), //Uso da Empresa
                   spc(20), //Reservado para o futuro
                   '0')); //Código do Movimento
    rTotalValorPago := rTotalValorPago + CdsTexto.FieldByName('VALOR').AsFloat;
  end;
  Inc(iTotRegArq);
end;
end.



