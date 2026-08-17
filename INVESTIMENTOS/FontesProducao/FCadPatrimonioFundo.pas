unit FCadPatrimonioFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdbedit, Mask, wwdblook, DBCtrls2, TREdit, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, fcLabel;

type
  TfrmCadPatrimonioFundo = class(TfrmCadMestreDetalheCS)
    qryDetalhe: TwwQuery;
    updDetalhe: TUpdateSQL;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATAREFERENCIA: TDateTimeField;
    qryDetalheQTDCOTAS: TFloatField;
    qryDetalheVLRPATRIMONIO: TFloatField;
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    qryInvest: TwwQuery;
    dsInvest: TwwDataSource;
    dbdDta: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    qryInvestIDFUNDOINVEST: TFloatField;
    qryInvestDESCFUNDOINVEST: TStringField;
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
    DBECota: TDBRealEdit;
    DBEValorPatrimonio: TDBRealEdit;
    qryConsCotaFundo: TwwQuery;
    Bevel1: TBevel;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    qryDetalheIDPATRIMONIOFDO: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBEValorPatrimonioExit(Sender: TObject);
    Procedure Decimais;
    procedure DBECotaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure StatusGeral;
    procedure StatusInclui;
    procedure StatusAltera;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPatrimonioFundo: TfrmCadPatrimonioFundo;

implementation
uses UDataBase, UOperComum, UmensErro, UBibliotecaInvest;

{$R *.DFM}

Procedure TfrmCadPatrimonioFundo.Decimais;
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

procedure TfrmCadPatrimonioFundo.FormShow(Sender: TObject);
begin
  inherited;
  qryInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryInvest.Open;
  qryDetalhe.Open;
//Mostra a Grid do Detalhe
  dbgrdDet.BringToFront;

// Carrega quantidade de casas decimais
  Decimais;

// Define o status dos controles do form
  StatusGeral;

end;

procedure TfrmCadPatrimonioFundo.bbtnOkDetClick(Sender: TObject);
begin
  if dbdDta.Text = '' then
  begin
    ShowMessage('O Campo DATA deve ser preenchido');
    Exit;
  end;
  if DBECota.Text = '' then
  begin
    ShowMessage('O Campo COTA deve ser preenchido');
    Exit;
  end;
  if DBEValorPatrimonio.Text = '' then
  begin
    ShowMessage('O Campo VALOR DO PATRIMÔNIO deve ser preenchido');
    Exit;
  end;

  if dsDet.DataSet.State in [dsInsert] then
     qryDetalhe.FieldByName('IDPATRIMONIOFDO').AsInteger := LeUltRegistro(nil,'PATRIMONIOFUNDO');

  qryDetalhe.FieldByName('IDFUNDOINVEST').Value := StrToInt(dblInvest.LookupValue);
  bbtnConfirmar.Enabled := True;
  pnlControlesDet.SendToBack;
  qryDetalhe.post;
  inherited;
  AplicaAlteracoes([qryDetalhe]);
  CmeDetalhe.Cancel(Self);
  StatusGeral;
end;

procedure TfrmCadPatrimonioFundo.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TfrmCadPatrimonioFundo.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  StatusGeral;
end;

procedure TfrmCadPatrimonioFundo.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  StatusInclui;
  dbdDta.setfocus;
end;

procedure TfrmCadPatrimonioFundo.sbtnExcluiDetClick(Sender: TObject);
begin
 if (not qryDetalhe.IsEmpty) then
 begin
    if (MsgDlg('Deseja realmente excluir este Fundo desta Composição?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
    begin
       inherited;
       aplicaAlteracoes([qryDetalhe]);
    end;
 end;
 StatusGeral;
end;

procedure TfrmCadPatrimonioFundo.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  StatusAltera;
end;

procedure TfrmCadPatrimonioFundo.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  sbtnAltDet.Click
end;

procedure TfrmCadPatrimonioFundo.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  StatusGeral;
end;

procedure TfrmCadPatrimonioFundo.sbtnProcurarClick(Sender: TObject);
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
     dblInvest.Text        := MontaSelect.ValoresChave[1];
     dblInvest.PerformSearch;

     qryDetalhe.Close;
     qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger := StrToInt(montaSelect.ValoresChave[0]);

     DBECota.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
     wDisplay := '#,##0.';
     for x := 1 to DBECota.DecDigits do
         wDisplay := wDisplay + '0';
     qryDetalheQTDCOTAS.DisplayFormat := wDisplay;

     qryDetalhe.Open;
  end;

// Define o status dos controles do form
  StatusGeral;

end;

procedure TfrmCadPatrimonioFundo.dblInvestCloseUp(Sender: TObject;
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
      sbtnInsDet.Enabled    := True;
      sbtnAltDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;
      dblInvest.Enabled := True;
      case dsDet.State of
           dsEdit   : DBEValorPatrimonio.SetFocus;
           dsInsert : dbdDta.SetFocus;
      end;

// Altera Formato do Valor da Cota
      DBECota.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
      wDisplay := '#,##0.';
      for x := 1 to DBECota.DecDigits do
          wDisplay := wDisplay + '0';
      qryDetalheQTDCOTAS.DisplayFormat := wDisplay;

   end;
// Define o status dos controles do form
  StatusGeral;
end;

procedure TfrmCadPatrimonioFundo.DBEValorPatrimonioExit(Sender: TObject);
begin
  inherited;
  if (Trim(dbdDta.Text) <> '') and (Trim(dblInvest.Text) <> '') then
  begin
     qryConsCotaFundo.Close;
     qryConsCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := qryInvest.FieldByName('IDFUNDOINVEST').AsInteger;
     qryConsCotaFundo.ParamByName('DATACOTA').AsDateTime := dbdDta.DateTime;
     qryConsCotaFundo.Open;
     if qryConsCotaFundo.IsEmpty then
     begin
        MsgDlg('Impossível calcular a quantidade de cotas, não há Cota para este Fundo nesta Data.','Mensagem do Sistema',mtInformation,[mbOk],0);
        exit;
     end;
     DBECota.Value := OperComum.Round(DBEValorPatrimonio.Value / qryConsCotaFundo.FieldByName('VLRCOTA').AsFloat, qryInvest.FieldByName('QTDDECQTD').AsInteger);
     qryConsCotaFundo.Close;
  end;
end;

procedure TfrmCadPatrimonioFundo.StatusGeral;
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

procedure TfrmCadPatrimonioFundo.StatusInclui;
begin
   sbtnProcurar.Enabled := False;
   dblInvest.Enabled := False;

   sbtnAltDet.Enabled := False;
   sbtnExcluiDet.Enabled := False;

   bbtnOkDet.Enabled := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled := True;
end;

procedure TfrmCadPatrimonioFundo.StatusAltera;
begin
   sbtnProcurar.Enabled := False;
   dblInvest.Enabled := False;

   sbtnInsDet.Enabled := False;
   sbtnExcluiDet.Enabled := False;

   bbtnOkDet.Enabled := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled := True;

   dbdDta.Enabled := False;

end;

procedure TfrmCadPatrimonioFundo.DBECotaExit(Sender: TObject);
begin
  inherited;
  If bbtnOkDet.CanFocus Then
    bbtnOkDet.SetFocus;
end;

procedure TfrmCadPatrimonioFundo.FormCreate(Sender: TObject);
begin
  inherited;
  if iTipoInvestUsu <> 0 then
     MontaSelect.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));
end;

end.
