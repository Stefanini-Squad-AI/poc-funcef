//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_16
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//********************************************************************************************************
//Data    : 30/05/2005
//Código  : AL_5
//Descr.  : Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
//Data    : 27/12/2004
//Código  : AL_4
//Descr.  : Correção no ComboBox de Fundo de Investimento, onde estava aparacendo o
//          IDFUNDOINVEST ao invés de DESCFUNDOINVEST. (DFM)
//********************************************************************************************************
//Data    : 22/11/2004
//Var.    : intQtdCotaOriginal
//Linha   : Al_3
//Descr.  : Nova variável inteira que recebe valor da Qtd de Cotas quando o botão sbtnAltDet é pressionado.
//          Ajuda no cálculo para restrição da Qtd de Cotas.
//********************************************************************************************************
//Data    : 23/11/2004
//Var.    : bolZeroTotalCota
//Linha   : Al_2
//Descr.  : Nova variável booleana que controla se o Fundo tem Limite de Cota. Ajuda no cálculo
//          para restrição da Qtd de Cotas.
//********************************************************************************************************
//Data    : 22/11/2004
//Var.    : bolAlterar
//Linha   : Al_2
//Descr.  : Nova variável booleana que controla se o botão sbtnAltDet foi pressionado. Ajuda no cálculo
//          para restrição da Qtd de Cotas.
//********************************************************************************************************
//Data    : 22/11/2004
//Função  : SalvaCota
//Descr.  : Verifica se a Qtd de Cotas está dentro do limite, para que possa ser salva
//********************************************************************************************************
//Data    : 22/11/2004
//Query   : qryHistFundoInvest e qrySomaCota
//Linha   : Al_1
//Descr.  : Novas querys que ajudam no cálculo para restrição de Qtd de Cotas
//********************************************************************************************************
unit FCadCotasIntegralizar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroRMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, uCtrlInvContab;

type
  TfrmCadCotasIntegralizar = class(TfrmCadastroRMDetInv)
    qryDetalheIDCOTAINTEGRALIZA: TFloatField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATAINTEGRALIZAR: TDateTimeField;
    qryDetalheQTDINTEGRALIZAR: TFloatField;
    qryInvest: TwwQuery;
    qryInvestDESCFUNDOINVEST: TStringField;
    qryInvestIDFUNDOINVEST: TFloatField;
    qryInvestIDGESTORCARTEIRA: TFloatField;
    qryInvestTRGDTINCLUSAO: TDateTimeField;
    qryInvestTRGUSERINCLUSAO: TStringField;
    qryInvestMOECODIGO: TFloatField;
    qryInvestIDCARTEIRAINVEST: TFloatField;
    qryInvestIDTIPOFUNDOINVEST: TFloatField;
    qryInvestCNPJFUNDO: TStringField;
    qryInvestSTAEXCLUSIVO: TStringField;
    qryInvestPZOCARENCIA: TFloatField;
    qryInvestPZOANIVERSARIO: TFloatField;
    qryInvestPZOLIQAPLIC: TFloatField;
    qryInvestPZOLIQRESG: TFloatField;
    qryInvestQTDDECQTD: TFloatField;
    qryInvestQTDDECVALOR: TFloatField;
    qryInvestSTAFUNDO: TStringField;
    qryInvestPZOAMORTIZACAO: TFloatField;
    qryInvestPERCTXPERFORM: TFloatField;
    qryInvestPERCTXADM: TFloatField;
    qryInvestCODFUNCETIP: TStringField;
    qryInvestSTAPROVISIONAIR: TStringField;
    qryInvestSTAPROVISIONAIOF: TStringField;
    qryInvestCONTRCETIP: TStringField;
    qryInvestDATAREFERENCIA: TStringField;
    dsInvest: TwwDataSource;
    qryConsCotaFundo: TwwQuery;
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    dbdDta: TCMDateTimePicker;
    DBECota: TDBRealEdit;
    qrySomaCota: TQuery;
    qryHistFundoInvest: TQuery;
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    strIdFundoInvest: String;
    {Al_2}bolAlterar, bolZeroTotalCota: Boolean;
    {Al_3}dblQtdCotaOriginal: Double;
    procedure StatusGeral;
    procedure StatusInclui;
    procedure StatusAltera;
    procedure Decimais;
    procedure SalvarCota;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCotasIntegralizar: TfrmCadCotasIntegralizar;

implementation

uses UDataBase, UOperComum, UmensErro, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmCadCotasIntegralizar.StatusGeral;
begin
   dblInvest.Enabled := True;
   dbdDta.Enabled := True;
   sbtnProcurar.Enabled := True;

   if Trim(dblInvest.Text) = '' then
   begin
      sbtnInsDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      sbtnExcluiDet.Enabled := False;
      dbgrdDet.Enabled := False;
   end
   else
   begin
      if qryDetalhe.IsEmpty then
      begin
         sbtnInsDet.Enabled := True;
         sbtnAltDet.Enabled := False;
         sbtnExcluiDet.Enabled := False;
         dbgrdDet.Enabled := False;
      end
      else
      begin
         sbtnInsDet.Enabled := True;
         sbtnAltDet.Enabled := True;
         sbtnExcluiDet.Enabled := True;
         dbgrdDet.Enabled := True;
      end;
   end;
   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;
   bbtnVoltarDet.Enabled := False;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;
end;

procedure TfrmCadCotasIntegralizar.StatusInclui;
begin
   sbtnProcurar.Enabled := False;
   dblInvest.Enabled := False;

   sbtnAltDet.Enabled := False;
   sbtnExcluiDet.Enabled := False;

   bbtnOkDet.Enabled := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled := True;
end;

procedure TfrmCadCotasIntegralizar.StatusAltera;
begin
   sbtnProcurar.Enabled    := False;
   dblInvest.Enabled       := False;

   sbtnInsDet.Enabled      := False;
   sbtnExcluiDet.Enabled   := False;

   bbtnOkDet.Enabled       := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled   := True;
end;

procedure TfrmCadCotasIntegralizar.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var x: integer;
    wDisplay: String;
begin
   if dblInvest.lookupvalue <> '' then
   begin
      inherited;
      qryDetalhe.Close;
      qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger := StrToInt(dblInvest.LookupValue);
      qryDetalhe.Open;

      strIdFundoInvest:=dblInvest.LookupValue;

      sbtnInsDet.Enabled    := True;
      sbtnAltDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;
      dblInvest.Enabled     := True;

      case dsDet.State of
          dsInsert : dbdDta.SetFocus;
      end;

// Altera Formato do Valor da Cota
      DBECota.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
      wDisplay := '#,##0.';
      for x := 1 to DBECota.DecDigits do
          wDisplay := wDisplay + '0';

      qryDetalheQTDINTEGRALIZAR.DisplayFormat := wDisplay;
   end;

// Define o status dos controles do form
  StatusGeral;
end;

procedure TfrmCadCotasIntegralizar.sbtnInsDetClick(Sender: TObject);
begin
   bolAlterar:=False;
   inherited;
   StatusInclui;
   dbdDta.setfocus;
end;

procedure TfrmCadCotasIntegralizar.sbtnAltDetClick(Sender: TObject);
begin
   bolAlterar:=True;
   dblQtdCotaOriginal:=0;
   dblQtdCotaOriginal:=qryDetalhe.FieldByName('QTDINTEGRALIZAR').AsInteger;
   inherited;
   StatusAltera;
end;

procedure TfrmCadCotasIntegralizar.sbtnExcluiDetClick(Sender: TObject);
begin
   bolAlterar:=False;
   // AL_5 - Inicio
   if (not qryDetalhe.IsEmpty) then
   begin
      //AL_6
      if not CtrlInvContab.TestaPeriodo(qryDetalheDATAINTEGRALIZAR.AsString, iTipoInvestUsu) then
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0)
      else
      begin
         if (not qryDetalhe.IsEmpty) then
         begin
            inherited;
            aplicaAlteracoes([qryDetalhe]);
         end;
      end;
   end;
   // AL_5 - Fim
   StatusGeral;
end;

procedure TfrmCadCotasIntegralizar.bbtnOkDetClick(Sender: TObject);
begin
   // Al_5 - Inicio
   if dbdDta.Text = '' then
   begin
      MsgDlg('O Campo DATA deve ser preenchido', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbdDta.CanFocus then
         dbdDta.SetFocus;
      Exit;
   end;
   if DBECota.Text = '' then
   begin
      MsgDlg('O Campo Quantidade de Cotas deve ser preenchido', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if DBECota.CanFocus then
         DBECota.SetFocus;
      Exit;
   end;
   //AL_6
   if not CtrlInvContab.TestaPeriodo(qryDetalheDATAINTEGRALIZAR.AsString, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbdDta.CanFocus then
         dbdDta.SetFocus;
      Exit;
   end;

   try  //Finally
      try // Except
         //AL_1
         qryHistFundoInvest.Close;
         qryHistFundoInvest.SQL.Clear;
         qryHistFundoInvest.SQL.Add('SELECT QTDTOTINTEGRALIZA As TotalCota FROM HISTFUNDOINVEST H '+
                                    'WHERE IDFUNDOINVEST = '+strIdFundoInvest+' AND '+
                                    'DTAVIGENCIA = (SELECT MAX(DTAVIGENCIA) '+
                                                   'FROM HISTFUNDOINVEST '+
                                                   'WHERE IDFUNDOINVEST = H.IDFUNDOINVEST)');
         qryHistFundoInvest.Open;
         qrySomaCota.Close;
         qrySomaCota.SQL.Clear;
         qrySomaCota.SQL.Add('SELECT SUM(QTDINTEGRALIZAR) AS SomaCota '+
                             'FROM  COTAINTEGRALIZA '+
                             'WHERE IDFUNDOINVEST = '+ strIdFundoInvest);
         qrySomaCota.Open;
         if (qryHistFundoInvest.FieldByName('TotalCota').AsFloat=0) or
            (qryHistFundoInvest.FieldByName('TotalCota').AsFloat=Null) then
         begin
            if MsgDlg('Sem Limite de cota! Deseja continuar?','Confirmação',
                      mtConfirmation,[MbYes,MbNo],0)=mrYes then
            begin
               bolZeroTotalCota:=True;
               SalvarCota;
            end
            else
            begin
//               inherited;
               bbtnCancelarClick(nil);
            end;
         end
         else
         begin
            bolZeroTotalCota:=False;
            SalvarCota;
         end;
      except
         on E: Exception do
            MsgDlg(E.Message, 'Mensagem do Sistema', mtError, [mbOk], 0);
      end;
   finally
      qryHistFundoInvest.Close;
      qrySomaCota.Close;
   end;
   // AL_5 - Fim
end;

procedure TfrmCadCotasIntegralizar.SalvarCota;
var dblValorSomaCota: Double;
begin
   dblValorSomaCota:=0;
   if bolZeroTotalCota=False then
   begin
      if (qrySomaCota.FieldByName('SomaCota').AsFloat=0) then
         dblValorSomaCota:=dbeCota.Value
      else
      begin
         if bolAlterar=False then
            dblValorSomaCota:=qrySomaCota.FieldByName('SomaCota').AsFloat+dbeCota.Value
         else
            dblValorSomaCota:=(qrySomaCota.FieldByName('SomaCota').AsFloat-dblQtdCotaOriginal)+dbeCota.Value;
      end;
   end;
   if (dblValorSomaCota>qryHistFundoInvest.FieldByName('TotalCota').AsFloat) then
   begin
      MsgDlg('Limite de cota excedido.','Aviso',MtWarning,[MbOk],0);
      dbeCota.SetFocus;
   end
   else
   begin
      if dsDet.DataSet.State in [dsInsert] then
         if qryDetalhe.FieldByName('IDCOTAINTEGRALIZA').AsInteger <=0 then
            qryDetalhe.FieldByName('IDCOTAINTEGRALIZA').AsInteger := LeUltRegistro(nil,'COTAINTEGRALIZA');
      qryDetalhe.FieldByName('IDFUNDOINVEST').Value := StrToInt(dblInvest.LookupValue);
      bbtnConfirmar.Enabled := True;
      pnlControlesDet.SendToBack;
      qryDetalhe.post;
      inherited;
      AplicaAlteracoes([qryDetalhe]);
      CmeDetalhe.Cancel(Self);
      StatusGeral;
   end;
end;

procedure TfrmCadCotasIntegralizar.bbtnCancelarDetClick(Sender: TObject);
begin
   bolAlterar:=False;
   inherited;
   StatusGeral;
end;

procedure TfrmCadCotasIntegralizar.bbtnVoltarDetClick(Sender: TObject);
begin
   bolAlterar:=False;
   inherited;
   StatusGeral;
end;

procedure TfrmCadCotasIntegralizar.FormShow(Sender: TObject);
begin
   inherited;

   // Se for Fundo de Ações muda o Título do Form
   if iTipoInvestUsu = 4 then
      lbNomItem.Caption := 'Fluxo de Subscrição de Cotas';

   //Abre Qry's
   qryInvest.Close;
   qryInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   qryInvest.Open;

   qryDetalhe.Open;
   //Mostra a Grid do Detalhe
   dbgrdDet.BringToFront;

   // Carrega quantidade de casas decimais
   Decimais;

   // Define o status dos controles do form
   StatusGeral;

   // Filtra por Tipo de Investimento
   MontaSelect.Filtro.Add('FUNDOINVEST.IDTIPOFUNDOINVEST = ' + IntToStr(iTipoInvestUsu));
end;

Procedure TfrmCadCotasIntegralizar.Decimais;
var tmpQry : TQuery;
begin
   tmpQry := TQuery.Create(Self);
   tmpQry.DatabaseName := 'BaseDados';
   tmpQry.sql.Add('SELECT MAX(QTDDECQTD) AS DECIMAIS FROM FUNDOINVEST');
   tmpQry.Open;

   if tmpQry.RecordCount > 0 then
      DBECOTA.DecDigits := tmpQry.FieldByName('DECIMAIS').AsInteger
   else
      DBECOTA.DecDigits := 0;

   tmpQry.Free;
end;

procedure TfrmCadCotasIntegralizar.FormPaint(Sender: TObject);
begin
   inherited;
   PnlFundo.Enabled :=True;
   pnlMestre.Enabled:=True;
end;

procedure TfrmCadCotasIntegralizar.sbtnProcurarClick(Sender: TObject);
var x: Integer;
    wDisplay: String;
begin
   inherited;
   PnlFundo.Enabled :=True;
   pnlMestre.Enabled:=True;

   sbtnInsDet.Enabled    := True;
   sbtnAltDet.Enabled    := True;
   sbtnExcluiDet.Enabled := True;
   dblInvest.Enabled := True;

   if MontaSelect.RetornouValor then
   begin
      dblInvest.LookupValue := MontaSelect.ValoresChave[0];
      dblInvest.PerformSearch;

      qryDetalhe.Close;
      qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger := StrToInt(montaSelect.ValoresChave[0]);

      DBECota.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
      wDisplay := '#,##0.';
      for x := 1 to DBECota.DecDigits do
          wDisplay := wDisplay + '0';
      qryDetalheQTDINTEGRALIZAR.DisplayFormat := wDisplay;

      qryDetalhe.Open;
   end;

// Define o status dos controles do form
   StatusGeral;
end;

end.
