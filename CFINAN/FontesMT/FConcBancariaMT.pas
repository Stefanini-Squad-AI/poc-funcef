unit FConcBancariaMT;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Pendência : 18486
Data      : 21/02/2005
Autor     : Rodolpho da Silva
Descrição : Considerar como saldo anterior, as movimentações anteriores a data indicada na caixa
            Data do Extrato no campo Data Inicial.
----------------------------------------------------------------------------------------------------
Rotina    : btnSelecionaClick
Pendência : 18400
Data      : 03/01/2005
Autor     : André Tavares
Descrição : Coloquei filter no cdsExtrato para obedecer o a filtragem por data
----------------------------------------------------------------------------------------------------
Rotina    : Novas procedures PreencheCabecalhoArquivo, PreencheExtrato e ExecutaPreConciliacao,
            visando à importação (a partir de um arquivo Quicken) e exibição de um extrato bancário,
            e pré-conciliação automática dos lançamentos coincidentes
Data      : 15/05/2003
Autor     : André Pontes
Descrição : Chamada da procedure ExecutaPreConciliacao após o preenchimentop da MovimFinanc
----------------------------------------------------------------------------------------------------
Rotina    : btnSelecionaClick
Data      : 15/05/2003
Autor     : André Pontes
Descrição : Chamada da procedure ExecutaPreConciliacao após o preenchimentop da MovimFinanc
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
   wwdbdatetimepicker, CMDateTimePicker, TREdit, TEdNum, Db, DBClient,
   uCMClientDataSet, uCtrlMovimFinanc, uCtrlListTercFinanc, uCtrlConcBancaria,
   Provider, DBTables, Wwquery, Wwdatsrc, uCmSqlParams, Math;


type
   TfrmConcBancariaMT = class(TfrmOkCancelar)
      plnSaldos: TPanel;
      gbCorrente: TGroupBox;
      lblSaldoConciliadoAn: TLabel;
      lblSaldoConciliadoAt: TLabel;
    lbDiaAnterior: TLabel;
      gbOutraMoeda: TGroupBox;
      lblSaldoConciliaOMAt: TLabel;
      lblSaldoConciliaOMAn: TLabel;
      pnlDadosFiltro: TPanel;
      btnSeleciona: TBitBtn;
      gbSaldoExtrato: TGroupBox;
      lblSaldo: TLabel;
      Label1: TLabel;
      ednSaldoOMoeda: TRealEdit;
      ednSaldoCorrente: TRealEdit;
      gbData: TGroupBox;
      lblDataExtrato: TLabel;
      edDataExtrato: TCMDateTimePicker;
      gbBanco: TGroupBox;
      lblContaBanco: TLabel;
      dblcPortador: TwwDBLookupCombo;
      cdsPortador: TCMClientDataSet;
      cdsExtrato: TCMClientDataSet;
      edSaldoAntesConc: TRealEdit;
      edSaldoConc: TRealEdit;
      edSaldoConcDiaAnt: TRealEdit;
      edSaldoOMAntesConc: TRealEdit;
      edSaldoOMConc: TRealEdit;
      dsExtrato: TwwDataSource;
      btnMarcaTodos: TSpeedButton;
      btnInverteMarcacao: TSpeedButton;
      spTeste: TCMSqlParams;
      dsBanco: TwwDataSource;
      spBanco: TCMSqlParams;
      cdsBanco: TCMClientDataSet;
      btnLimpaArquivo: TBitBtn;
      btnAbreArquivo: TBitBtn;
      edtArquivo: TEdit;
      Label3: TLabel;
      dlgAbreArquivo: TOpenDialog;
      pnlExtrato: TPanel;
      pnlMovimFinanc: TPanel;
      wwDBGrid1: TwwDBGrid;
      dbgExtrato: TwwDBGrid;
      Panel3: TPanel;
      Panel4: TPanel;
      edtDataIni: TCMDateTimePicker;
      Label4: TLabel;

      procedure FormCreate(Sender: TObject);
      procedure dbgExtratoTitleButtonClick(Sender: TObject; AFieldName: String);
      procedure btnSelecionaClick(Sender: TObject);
      procedure dblcPortadorExit(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure btnMarcaTodosClick(Sender: TObject);
      procedure btnInverteMarcacaoClick(Sender: TObject);
      procedure btnAbreArquivoClick(Sender: TObject);
      procedure btnLimpaArquivoClick(Sender: TObject);


   private  // Private declarations

      txtArqExtrato     : TextFile;
      sNomeArquivo      : String;

      sUltimoIndice     : String;
      ExtratoVazio      : OleVariant;
      rSaldoCorrente    : Double;
      rSaldoOutraMoeda  : Double;
      CtrlMovimFinanc   : TCtrlMovimFinanc;
      CtrlConcBancaria  : TCtrlConcBancaria;
      CtrlListTerceiros : TCtrlListTercFinanc;

      procedure cdsExtratoSTATUSCONCILIAChange(Sender: TField);
      procedure LimpaCampos;

      procedure PreencheCabecalhoArquivo;
      procedure PreencheExtrato;
      procedure ExecutaPreConciliacao;


   public   // Public declarations

   end;



var
  frmConcBancariaMT: TfrmConcBancariaMT;



implementation
{$R *.DFM}
uses
   dBaseDados, uSistema, uMensErro;








procedure TfrmConcBancariaMT.PreencheCabecalhoArquivo;
var
   cAux     : Char;
   sLinha   : String;
   sLido    : String;
   sTexto   : String;
   sBanco   : String;
   iPos     : Integer;
   fSaldo   : Extended;
   bConta   : Boolean;
begin
   AssignFile(txtArqExtrato, sNomeArquivo);
   Reset(txtArqExtrato);

   try
      bConta := False;

      while not EOF(txtArqExtrato) do
      begin
         ReadLN(txtArqExtrato, sLinha);

         // corta os brancos
         sLinha := trim(sLinha);
         sLido  := '';
         sTexto := '';

         // ----------------------------------------------------------------------------------------
         // procura a informação do Banco <BANKID>001 (Banco do Brasil / Unibanco)
         iPos   := pos('<BANKID>', sLinha);
         if iPos > 0 then
         begin
            sLido  := trim(copy(sLinha, iPos + length('<BANKID>'), 15));
            sBanco := sLido;

            Continue;
         end;

         // procura a informação da conta-corrente <ACCTID>32.755-7 (Banco do Brasil / Unibanco)
         iPos   := pos('<ACCTID>', sLinha);
         if iPos > 0 then
         begin
            sLido  := trim(copy(sLinha, iPos + 8, 15));
            sTexto := sLido;

            if sBanco <> '' then
            begin
               edtArquivo.Text := sBanco + ' / ' + sTexto;
            end
            else
            begin
               edtArquivo.Text := sTexto;
            end;

            bConta := True;
            Continue;
         end;

         // procura a informação da conta-corrente <CLTID>4083009755 (Banco Itau)
         iPos   := pos('<CLTID>', sLinha);
         if iPos > 0 then
         begin
            sLido  := trim(copy(sLinha, iPos + 7, 10));
            sTexto := copy(sLido, 1, 4) + ' / ' + copy(sLido, 5, 5) + '-' + copy(sLido, 10, 1);

            edtArquivo.Text := sTexto;

            bConta := True;
            Continue;
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // procura a data de início <DTSTART>20030415
         iPos := pos('<DTSTART>', sLinha);
         if iPos > 0 then
         begin
            sLido  := trim(copy(sLinha, iPos + 9, 8));
            sTexto := copy(sLido, 7, 2) + '/' + copy(sLido, 5, 2) + '/' + copy(sLido, 1, 4);

            try
               edtDataIni.Date := StrToDate(sTexto);
            except
            end;

            Continue;
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // procura a data de término <DTEND>20030513
         iPos := pos('<DTEND>', sLinha);
         if iPos > 0 then
         begin
            sLido  := trim(copy(sLinha, iPos + 7, 8));
            sTexto := copy(sLido, 7, 2) + '/' + copy(sLido, 5, 2) + '/' + copy(sLido, 1, 4);

            try
               edDataExtrato.Date := StrToDate(sTexto);
            except
            end;

            Continue;
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // procura o saldo final <LEDGER>-100000000.87
         iPos := pos('<LEDGER>', sLinha);
         if iPos > 0 then
         begin
            cAux := DecimalSeparator;
            DecimalSeparator  := '.';

            sLido  := trim(copy(sLinha, iPos + 8, 15));
            sTexto := trim(sLido);

            try
               fSaldo := StrToFloat(sTexto);

               DecimalSeparator  := cAux;

               ednSaldoCorrente.Value := (trunc(fSaldo * Power(10, 2))) / Power(10, 2);
            except
            end;

            Break;
         end;
         // ----------------------------------------------------------------------------------------
      end;

      // se não houver sido identificada a conta-corrente
      if not(bConta) then edtArquivo.Text := sNomeArquivo;

   finally
      Closefile(txtArqExtrato);
   end;
end;



procedure TfrmConcBancariaMT.PreencheExtrato;
var
   cAux     : Char;
   sLinha   : String;
   sLido    : String;
   sTexto   : String;
   iPos     : Integer;
   iPos2    : Integer;
   fVlr     : Extended;
   bInsert  : Boolean;

   dDataTransacao : TDateTime;
   fVlrTransacao  : Extended;
   sNumDocumento  : String;
   sHistorico     : String;
begin
   if (length(trim(edtArquivo.Text)) = 0) then Exit;

   // Banco Itau -----------------------------------------------------------------------------------
   //
   // <STMTTRN>
   // <GENTRN>
   // <TRNTYPE>1
   // <DTPOSTED>20030417
   // <TRNAMT>-151.00
   // <FITID>000034
   // <CHKNUM>000034
   // <MEMO>CH COMPENSADO 356 000034
   // </GENTRN>
   // </STMTTRN>
   // ----------------------------------------------------------------------------------------------

   // Banco do Brasil ------------------------------------------------------------------------------
   //
   // <STMTTRN>
   //   <TRNTYPE>1
   //   <DTPOSTED>20030512
   //   <TRNAMT>-8.50
   //   <FITID>200305121850
   //   <CHKNUM>30512
   //   <MEMO>PLANO OURO
   // </STMTTRN>
   //
   // ----------------------------------------------------------------------------------------------

   // Unibanco -------------------------------------------------------------------------------------
   //
   // <STMTTRN>
   // <TRNTYPE>CREDIT
   // <DTPOSTED>20030502080000
   // <TRNAMT>0.43
   // <FITID>7970123
   // <CHECKNUM>7970123
   // <MEMO>ESTORNO CPMF
   // </STMTTRN>
   //
   // ----------------------------------------------------------------------------------------------


   AssignFile(txtArqExtrato, sNomeArquivo);
   Reset(txtArqExtrato);

   cdsBanco.DisableControls;
   spBanco.Open;

   TFloatField(cdsBanco.FieldByName('VALOR')).DisplayFormat  := '#,#0.00;(#,#0.00)';

   try
      while not(EOF(txtArqExtrato)) and ( pos('</OFC>', sLinha) = 0 ) do
      begin
         bInsert := False;

         // ----------------------------------------------------------------------------------------
         // lê até encontrar o delimitador de início de transação (<STMTTRN>)
         repeat
            ReadLN(txtArqExtrato, sLinha);
            sLinha := trim(sLinha);
            sLido  := '';
            sTexto := '';
         until
            (pos('<STMTTRN>', sLinha) > 0) or (EOF(txtArqExtrato));
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         // lê até encontrar a data da transação (<DTPOSTED>)
         repeat
            ReadLN(txtArqExtrato, sLinha);
            sLinha := trim(sLinha);
            sLido  := '';
            sTexto := '';
            iPos   := pos('<DTPOSTED>', sLinha);
         until
            (iPos > 0) or (EOF(txtArqExtrato));

         // Data da Transação (<DTPOSTED>)
         if iPos > 0 then
         begin
            bInsert := True;

            sLido  := trim(copy(sLinha, iPos + length('<DTPOSTED>'), 8));
            sTexto := copy(sLido, 7, 2) + '/' + copy(sLido, 5, 2) + '/' + copy(sLido, 1, 4);

            try
               // Guarda a data da transacao
               dDataTransacao := StrToDate(sTexto);
            except
            end;
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // lê até encontrar o valor da transação (<TRNAMT>)
         repeat
            ReadLN(txtArqExtrato, sLinha);
            sLinha := trim(sLinha);
            sLido  := '';
            sTexto := '';
            iPos   := pos('<TRNAMT>', sLinha);
         until
            (iPos > 0) or (EOF(txtArqExtrato));

         // valor da transação (<TRNAMT>)
         if iPos > 0 then
         begin
            bInsert := True;

            sLido  := trim(copy(sLinha, iPos + length('<TRNAMT>'), 15));
            sTexto := trim(sLido);

            cAux              := DecimalSeparator;
            DecimalSeparator  := '.';
            try
               try
                  fVlr           := StrToFloat(sTexto);
                  fVlrTransacao  := (trunc(fVlr * Power(10, 2))) / Power(10, 2);
               except
               end;
            finally
               DecimalSeparator  := cAux;
            end;
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // lê até encontrar o nº do cheque (<CHKNUM> ou <CHECKNUM>)
         repeat
            ReadLN(txtArqExtrato, sLinha);
            sLinha := trim(sLinha);
            sLido  := '';
            sTexto := '';
            iPos   := pos('<CHKNUM>', sLinha);
            iPos2  := pos('<CHECKNUM>', sLinha);
         until
            (iPos > 0) or (iPos2 > 0) or (EOF(txtArqExtrato));

         // nº do cheque (<CHKNUM>)
         if iPos > 0 then
         begin
            bInsert := True;

            sLido          := trim(copy(sLinha, iPos + length('<CHKNUM>'), 15));
            sNumDocumento  := trim(sLido);
         end;

         // nº do cheque (<CHECKNUM>)
         if iPos2 > 0 then
         begin
            bInsert := True;

            sLido          := trim(copy(sLinha, iPos2 + length('<CHECKNUM>'), 15));
            sNumDocumento  := trim(sLido);
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // lê até encontrar o histórico da transacao (<MEMO>)
         repeat
            ReadLN(txtArqExtrato, sLinha);
            sLinha := trim(sLinha);
            sLido  := '';
            sTexto := '';
            iPos   := pos('<MEMO>', sLinha);
         until
            (iPos > 0) or (EOF(txtArqExtrato));

         // histórico da transacao (<MEMO>)
         if iPos > 0 then
         begin
            bInsert := True;

            sLido       := trim(copy(sLinha, iPos + length('<MEMO>'), 60));
            sHistorico  := trim(sLido);
         end;
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // Preenche a linha do Extrato

         if bInsert then
         begin
            cdsBanco.Append;

            cdsBanco.FieldByName('CONCILIADO').Asinteger := 0;
            cdsBanco.FieldByName('VALOR').AsCurrency     := fVlrTransacao;
            cdsBanco.FieldByName('DATA').AsDateTime      := dDataTransacao;
            cdsBanco.FieldByName('NUMCHEQUE').AsString   := sNumDocumento;
            cdsBanco.FieldByName('DESCRICAO').AsString   := sHistorico;

            cdsBanco.Post;
         end;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
      end;

   finally
      Closefile(txtArqExtrato);

      cdsBanco.First;
      cdsBanco.EnableControls;
   end;
end;




procedure TfrmConcBancariaMT.ExecutaPreConciliacao;
begin
   if not(cdsBanco.Active) or (cdsBanco.IsEmpty) or (length(trim(edtArquivo.Text)) = 0) or
      not(cdsExtrato.Active) or (cdsExtrato.IsEmpty) then Exit;

   cdsExtrato.DisableControls;
   cdsBanco.DisableControls;

   try

      // Varre o extrato do banco
      cdsBanco.First;
      while not(cdsBanco.EOF) do
      begin

         // Varre o extrato do MovimFinanc
         cdsExtrato.First;
         while not(cdsExtrato.EOF) do
         begin
            try
               // compara o número (do cheque) do Extrato com o número do documento na MovimFinanc
               if ( trim(cdsBanco.FieldByName('NUMCHEQUE').AsString) = trim(cdsExtrato.FieldByName('NUMCHQBORDERO').AsString) ) or
                  ( StrToInt(trim(cdsBanco.FieldByName('NUMCHEQUE').AsString)) = StrToInt(trim(cdsExtrato.FieldByName('NUMCHQBORDERO').AsString)) ) then
               begin
                  // compara o valor do Extrato com o valor na MovimFinanc,
                  // levando em contao 'E/S' para verificar o sinal no extrato
                  if ( (cdsExtrato.FieldByName('ENTRADASAIDA').AsString = 'E') and
                       (cdsBanco.FieldByName('VALOR').AsCurrency = cdsExtrato.FieldByName('VALORLANCFINAN').AsCurrency) ) or
                     ( (cdsExtrato.FieldByName('ENTRADASAIDA').AsString = 'S') and
                       (cdsBanco.FieldByName('VALOR').AsCurrency = (cdsExtrato.FieldByName('VALORLANCFINAN').AsCurrency * (-1))) ) then
                  begin
                     cdsExtrato.Edit;
                     cdsExtrato.FieldByName('STATUSCONCILIA').AsString  := 'P';
                     cdsExtrato.Post;

                     cdsBanco.Edit;
                     cdsBanco.FieldByName('CONCILIADO').AsInteger       := 1;
                     cdsBanco.Post;
                  end;
               end;
            except
               // só para o caso de o número do cheque não ser conversível para inteiro
            end;

            cdsExtrato.Next;
         end;

         cdsBanco.Next;
      end;

   finally
      cdsExtrato.EnableControls;
      cdsBanco.EnableControls;
   end;
end;



procedure TfrmConcBancariaMT.FormCreate(Sender: TObject);
begin
   inherited;

   sUltimoIndice     := 'AscDATALANCFINAN';
   rSaldoCorrente    := 0;
   rSaldoOutraMoeda  := 0;

   //Inicializa CtrlMovimFinanc
   CtrlMovimFinanc   := TCtrlMovimFinanc.Create(Sistema.IdEmpresa,
                                                Sistema.IdModulo,
                                                Sistema.IdUsuario,
                                                Sistema.UsaPlanoPatro);

   CtrlMovimFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carega cds de Extrato
   cdsExtrato.Data   := CtrlMovimFinanc.ListMovimFinancConciliacao(-1, -1); // vazio
   ExtratoVazio      := cdsExtrato.Data;

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros := TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados, True);

   cdsPortador.Data  := CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa,0);

   //Inicializa CtrlConcBancaria
   CtrlConcBancaria  := TCtrlConcBancaria.Create(Sistema.IdEmpresa,
                                                 Sistema.IdModulo,
                                                 Sistema.IdUsuario,
                                                 Sistema.UsaPlanoPatro);

   CtrlConcBancaria.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlConcBancaria.cdsExtrato := cdsExtrato;

   edDataExtrato.Date := Date;

   edtDataIni.Date    := Date;
end;



procedure TfrmConcBancariaMT.dbgExtratoTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   if not(cdsExtrato.Active) or (cdsExtrato.IsEmpty) or (AFieldName='STATUSCONCILIA') then Exit;

   if (AFieldName=sUltimoIndice) and (Trim(cdsExtrato.IndexName)=Trim('Asc'+AFieldName)) then
      cdsExtrato.IndexName:='Desc'+AFieldName
   else
      cdsExtrato.IndexName:='Asc'+AFieldName;

   sUltimoIndice:=AFieldName;
end;




procedure TfrmConcBancariaMT.dblcPortadorExit(Sender: TObject);
begin
   gbSaldoExtrato.Enabled := True;

   if (cdsPortador.FieldByName('MOECODIGO').AsFloat <> 0) then
   begin
      ednSaldoCorrente.Enabled := False;
      ednSaldoOMoeda.Enabled   := True;
   end
   else
   begin
      ednSaldoCorrente.Enabled := True;
      ednSaldoOMoeda.Enabled   := False;
   end;
end;




procedure TfrmConcBancariaMT.btnSelecionaClick(Sender: TObject);
var
   rSaldoConcDiaAnt  : Double;
   rSaldoAntesConc   : Double;
   rSaldoOMAntesConc : Double;
   rSaldoConc        : Double;
   rSaldoOMConc      : Double;
   sFilter           : string;
begin
   inherited;

   if (Trim(dblcPortador.Text) = '') then
   begin
      MsgDlg('Obrigatório preencher a Conta do Banco/Caixa que se Deseja Conciliar', 'Controle Financeiro', mtError, [mbOk], 0);
      Repaint;
      dblcPortador.SetFocus;
      Exit;
   end;

   if Trim(edtDataIni.Text) = '' then
   begin
      MsgDlg('Obrigatório preencher a Data Inicial do Extrato que se Deseja Conciliar', 'Controle Financeiro', mtError, [mbOk], 0);
      Repaint;
      if edtDataIni.CanFocus then edtDataIni.SetFocus;
      Exit;
   end;

   if (Trim(edDataExtrato.Text) = '') then
   begin
      MsgDlg('Obrigatório preencher a Data do Extrato que se Deseja Conciliar', 'Controle Financeiro', mtError, [mbOk], 0);
      Repaint;
      dblcPortador.SetFocus;
      Exit;
   end;

   sFilter := '';
   if (trim(edtDataIni.text) <> '') and (trim(edDataExtrato.text) = '') then
     sFilter := ' DATALANCFINAN >= ' + quotedStr(edtDataIni.text)
   else  if (trim(edtDataIni.text) = '') and (trim(edDataExtrato.text) <> '') then
     sFilter := ' DATALANCFINAN <= ' + quotedStr(edDataExtrato.text)
   else if (trim(edtDataIni.text) <> '') and (trim(edDataExtrato.text) <> '') then
     sFilter := ' DATALANCFINAN >= ' + quotedStr(edtDataIni.text) + ' AND DATALANCFINAN <= ' + quotedStr(edDataExtrato.text);

   if sFilter <> '' then
   begin
     cdsExtrato.close;
     cdsExtrato.Filtered := false;
     cdsExtrato.Filter := sFilter;
     cdsExtrato.Filtered := true;
   end;

   cdsExtrato.Data   := CtrlMovimFinanc.ListMovimFinancConciliacao(StrToFloat(dblcPortador.LookupValue),
                                                                   Sistema.IdEmpresa);


   btnMarcaTodos.Enabled      := not(cdsExtrato.IsEmpty);
   btnInverteMarcacao.Enabled := not(cdsExtrato.IsEmpty);

   TFloatField(cdsExtrato.FieldByName('VALORLANCFINAN')).DisplayFormat  := '#,##0.00';
   TFloatField(cdsExtrato.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';

   TStringField(cdsExtrato.FieldByName('STATUSCONCILIA')).OnChange      := cdsExtratoSTATUSCONCILIAChange;

   cdsExtrato.IndexName := 'AscDATALANCFINAN';

   if not(CtrlConcBancaria.CalculaSaldos(rSaldoConcDiaAnt,
                                         rSaldoAntesConc,
                                         rSaldoOMAntesConc,
                                         rSaldoConc,
                                         rSaldoOMConc,
                                         StrToFloat(dblcPortador.LookupValue),
                                         edtDataIni.Date,
                                         edDataExtrato.Date)) then
   begin
      MsgDlg(CtrlConcBancaria.MessageInfo, 'Controle Financeiro', mtError, [mbOk], 0);
      Repaint;
   end
   else
   begin
      lbDiaAnterior.Caption        := 'Até o dia ' + DateToStr(edtDataIni.Date-1);
      lblSaldoConciliadoAn.Caption := 'Até o dia ' + edDataExtrato.Text;



      rSaldoCorrente             := rSaldoConc;
      rSaldoOutraMoeda           := rSaldoOMConc;
      edSaldoConcDiaAnt.Value    := rSaldoConcDiaAnt;
      edSaldoAntesConc.Value     := rSaldoAntesConc;
      edSaldoConc.Value          := rSaldoConc;
      edSaldoOMAntesConc.Value   := rSaldoOMAntesConc;
      edSaldoOMConc.Value        := rSaldoOMConc;
   end;

   PreencheExtrato;

   // Marca os documentos encontrados no Extrato e na Movimentacao Financeira
   ExecutaPreConciliacao;
end;



procedure TfrmConcBancariaMT.cdsExtratoSTATUSCONCILIAChange(Sender: TField);
begin
   if cdsExtrato.FieldByName('STATUSCONCILIA').AsString = 'P' then
   begin
      if cdsExtrato.FieldByName('ENTRADASAIDA').AsString = 'E' then
      begin
         rSaldoCorrente   := rSaldoCorrente   + cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
         rSaldoOutraMoeda := rSaldoOutraMoeda + cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
      end
      else
      begin
         rSaldoCorrente   := rSaldoCorrente   - cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
         rSaldoOutraMoeda := rSaldoOutraMoeda - cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
      end;
   end
   else
   begin
      if cdsExtrato.FieldByName('ENTRADASAIDA').AsString = 'E' then
      begin
         rSaldoCorrente   := rSaldoCorrente   - cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
         rSaldoOutraMoeda := rSaldoOutraMoeda - cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
      end
      else
      begin
         rSaldoCorrente   := rSaldoCorrente   + cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
         rSaldoOutraMoeda := rSaldoOutraMoeda + cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
      end;
   end;

   edSaldoConc.Value    := rSaldoCorrente;
   edSaldoOMConc.Value  := rSaldoOutraMoeda;
end;





procedure TfrmConcBancariaMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   //Aplica Marcações
   if not(CtrlConcBancaria.AplicaMarcacoes) then
   begin
      MsgDlg(CtrlConcBancaria.MessageInfo, 'Controle Financeiro', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   if (cdsPortador.FieldByName('MOECODIGO').AsFloat <> 0) then
   begin
      if Format('%17.2f', [rSaldoOutraMoeda]) <> Format('%17.2f', [ednSaldoOMoeda.Value]) then
      begin
         MsgDlg('Saldo Conciliado não bate com o Saldo do Extrato.Verifique', 'Controle Financeiro', mtError, [mbOk], 0);
         Repaint;
         ednSaldoOMoeda.SetFocus;
         Exit;
      end;
   end
   else
   if Format('%17.2f', [rSaldoCorrente]) <> Format('%17.2f', [ednSaldoCorrente.Value]) then
   begin
      MsgDlg('Saldo Conciliado não bate com o Saldo do Extrato.Verifique', 'Controle Financeiro', mtError, [mbOk], 0);
      Repaint;
      ednSaldoCorrente.SetFocus;
      Exit;
   end;

   //Aplica Conciliação
   if not(CtrlConcBancaria.Concilia(StrToFloat(dblcPortador.LookupValue),edDataExtrato.Date)) then
   begin
      MsgDlg(CtrlConcBancaria.MessageInfo, 'Controle Financeiro', mtWarning, [mbOk], 0);
      Repaint;
   end
   else
   begin
      MsgDlg('Conciliação Efetuada com Sucesso', 'Controle Financeiro', mtWarning, [mbOk], 0);
      Repaint;
      LimpaCampos;
   end;
end;





procedure TfrmConcBancariaMT.LimpaCampos;
begin
   //Limpa cdsExtrato
   cdsExtrato.Close;

   cdsExtrato.IndexName       := 'AscDATALANCFINAN';
   cdsExtrato.Data            := ExtratoVazio;

   dblcPortador.Text          := '';
   edDataExtrato.Date         := Date;
   ednSaldoCorrente.Value     := 0;
   ednSaldoOMoeda.Value       := 0;
   edSaldoConcDiaAnt.Value    := 0;
   edSaldoAntesConc.Value     := 0;
   edSaldoConc.Value          := 0;
   edSaldoOMAntesConc.Value   := 0;
   edSaldoOMConc.Value        := 0;

   rSaldoCorrente             := 0;
   rSaldoOutraMoeda           := 0;

   dblcPortador.SetFocus;
end;



procedure TfrmConcBancariaMT.btnMarcaTodosClick(Sender: TObject);
begin
   cdsExtrato.First;

   while not(cdsExtrato.Eof) do
   begin
      if (cdsExtrato.FieldByName('STATUSCONCILIA').AsString <> 'P') then
      begin
         cdsExtrato.Edit;
         cdsExtrato.FieldByName('STATUSCONCILIA').AsString := 'P';
         cdsExtrato.Post;
      end;
      cdsExtrato.Next;
   end;
end;





procedure TfrmConcBancariaMT.btnInverteMarcacaoClick(Sender: TObject);
begin
   cdsExtrato.First;
   while not(cdsExtrato.Eof) do
   begin
      if (cdsExtrato.FieldByName('STATUSCONCILIA').AsString <> 'P') then
      begin
         cdsExtrato.Edit;
         cdsExtrato.FieldByName('STATUSCONCILIA').AsString  := 'P';
         cdsExtrato.Post;
      end
      else
      begin
         cdsExtrato.Edit;
         cdsExtrato.FieldByName('STATUSCONCILIA').AsString  := 'N';
         cdsExtrato.Post;
      end;

      cdsExtrato.Next;
   end;
end;





procedure TfrmConcBancariaMT.btnAbreArquivoClick(Sender: TObject);
begin
   inherited;

   // pasta default = pasta da aplicação
   dlgAbreArquivo.InitialDir := ExtractFilePath(Application.ExeName);

   if dlgAbreArquivo.Execute then
   begin
      Repaint;
      sNomeArquivo := dlgAbreArquivo.FileName;

      PreencheCabecalhoArquivo;
      PreencheExtrato;

      ExecutaPreConciliacao;
   end;
   Repaint;
end;





procedure TfrmConcBancariaMT.btnLimpaArquivoClick(Sender: TObject);
begin
   inherited;

   // Fecha o Extrato do Banco
   cdsBanco.Close;

   // limpa o nome do arquivo de modelo
   edtArquivo.Clear;

   // limpa os campos que vêm do Extrato
   edtDataIni.Clear;
   edDataExtrato.Clear;

   ednSaldoCorrente.Value  := 0;
   ednSaldoOMoeda.Value    := 0;
end;



end.
