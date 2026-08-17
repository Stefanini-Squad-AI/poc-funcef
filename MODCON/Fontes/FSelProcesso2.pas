unit FSelProcesso2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwtable, Wwdatsrc, ExtCtrls, wwdblook, Spin,
  StdCtrls, TEdNum, MAHlpBtn, Buttons, Wwquery, Dateedit, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmSelProcesso = class(TfrmOkCancelar)
    ds: TwwDataSource;
    tblProcesso: TwwTable;
    qryAdvog: TwwQuery;
    qryTRT: TwwQuery;
    pnSelecao: TPanel;
    pnResult: TPanel;
    gbxTipEncer: TGroupBox;
    cbxArquiv: TCheckBox;
    cbxAcordo: TCheckBox;
    cbxDesist: TCheckBox;
    cbxSent: TCheckBox;
    rgAdv1: TRadioGroup;
    rgAdv2: TRadioGroup;
    rgAT: TRadioGroup;
    gbxAdv1: TGroupBox;
    dblcAdv1: TwwDBLookupCombo;
    lstAdv1: TListBox;
    lstCodAdv1: TListBox;
    gbxAdv2: TGroupBox;
    dblcAdv2: TwwDBLookupCombo;
    lstAdv2: TListBox;
    lstCodAdv2: TListBox;
    gbxAT: TGroupBox;
    dblcAT: TwwDBLookupCombo;
    lstAT: TListBox;
    lstCodAT: TListBox;
    gbxTempAdm: TGroupBox;
    Label1: TLabel;
    ednAdm1: TSpinEdit;
    ednAdm2: TSpinEdit;
    gbxSalario: TGroupBox;
    Label4: TLabel;
    ednCus1: TEditNum;
    ednCus2: TEditNum;
    rgTRT: TRadioGroup;
    gbxTRT: TGroupBox;
    dblcTRT: TwwDBLookupCombo;
    lstTRT: TListBox;
    lstCodTRT: TListBox;
    rgSitProc: TRadioGroup;
    gbxFaixaData: TGroupBox;
    Label3: TLabel;
    EdDataNot1: TDateEdit;
    EdDataNot2: TDateEdit;
    gbxDataEnc: TGroupBox;
    Label5: TLabel;
    EdDataEnc1: TDateEdit;
    EdDataEnc2: TDateEdit;
    gbxNumPr: TGroupBox;
    Label2: TLabel;
    EdnNum1: TEditNum;
    EdnNum2: TEditNum;
    procedure FormCreate(Sender: TObject);
    procedure rgAdv1Click(Sender: TObject);
    procedure rgAdv2Click(Sender: TObject);
    procedure rgATClick(Sender: TObject);
    procedure dblcAdv1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcAdv2CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcATCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstAdv1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstAdv2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstATKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ednAdm2Change(Sender: TObject);
    procedure ednAdm1Change(Sender: TObject);
    procedure rgTRTClick(Sender: TObject);
    procedure dblcTRTCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstTRTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdnNum1Change(Sender: TObject);
    procedure EdnNum2Change(Sender: TObject);
    procedure ednCus1Change(Sender: TObject);
    procedure ednCus2Change(Sender: TObject);
    procedure rgSitProcClick(Sender: TObject);
    procedure tblProcessoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelProcesso: TfrmSelProcesso;
  SvItem : Integer;
  I , J : Integer;
  ANO1, MES1, DIA1, ANO2, MES2, DIA2 : Word;


implementation

{$R *.DFM}


procedure TfrmSelProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  EdDataNot1.Date := (Date-365);
  EdDataNot2.Date := Date;
  EdDataEnc1.Date := (Date-365);
  EdDataEnc2.Date := Date;
  ds.Dataset.Filtered := False;
  //tblProcesso.Open;
  qryAdvog.Open;
  qryTRT.Open;

end;

procedure TfrmSelProcesso.rgAdv1Click(Sender: TObject);
begin
  inherited;
  if qryAdvog.EOF  then  rgAdv1.ItemIndex := 0;
  gbxAdv1.Visible := (rgAdv1.ItemIndex = 1);
end;

procedure TfrmSelProcesso.rgAdv2Click(Sender: TObject);
begin
  inherited;
  if qryAdvog.EOF  then  rgAdv2.ItemIndex := 0;
  gbxAdv2.Visible := (rgAdv2.ItemIndex = 1);
end;

procedure TfrmSelProcesso.rgATClick(Sender: TObject);
begin
  inherited;
  if qryAdvog.EOF  then  rgAT.ItemIndex := 0;
  gbxAT.Visible := (rgAT.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcAdv1CloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstAdv1.Items.Add(qryAdvog.FieldByName('NOME').Value);
     lstCodAdv1.Items.Add(qryAdvog.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.dblcAdv2CloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstAdv2.Items.Add(qryAdvog.FieldByName('NOME').Value);
     lstCodAdv2.Items.Add(qryAdvog.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.dblcATCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstAT.Items.Add(qryAdvog.FieldByName('NOME').Value);
     lstCodAT.Items.Add(qryAdvog.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.lstAdv1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstAdv1.Items.Count > 0)  then begin
      SvItem := lstAdv1.ItemIndex;
      lstAdv1.Items.Delete(SvItem);
      lstCodAdv1.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.lstAdv2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstAdv2.Items.Count > 0)  then begin
      SvItem := lstAdv2.ItemIndex;
      lstAdv2.Items.Delete(SvItem);
      lstCodAdv2.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.lstATKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstAT.Items.Count > 0)  then begin
      SvItem := lstAT.ItemIndex;
      lstAT.Items.Delete(SvItem);
      lstCodAT.Items.Delete(SvItem);
  end;
end;


procedure TfrmSelProcesso.ednAdm2Change(Sender: TObject);
begin
  inherited;
  if ednAdm2.Value < ednAdm1.Value then ednAdm2.Value := ednAdm1.Value;
end;

procedure TfrmSelProcesso.ednAdm1Change(Sender: TObject);
begin
  inherited;
  if ednAdm1.Value > ednAdm2.Value then ednAdm1.Value := ednAdm2.Value;
end;

procedure TfrmSelProcesso.rgTRTClick(Sender: TObject);
begin
  inherited;
  if qryTRT.EOF  then  rgTRT.ItemIndex := 0;
  gbxTRT.Visible := (rgTRT.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcTRTCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
     lstTRT.Items.Add(qryTRT.FieldByName('DESCRICAO').Value);
     lstCodTRT.Items.Add(qryTRT.FieldByName('CODIGOTRT').AsString);
end;

procedure TfrmSelProcesso.lstTRTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstTRT.Items.Count > 0)  then begin
      SvItem := lstTRT.ItemIndex;
      lstTRT.Items.Delete(SvItem);
      lstCodTRT.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.EdnNum1Change(Sender: TObject);
begin
  inherited;
  if StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text) then
     ednNum1.Text := ednNum2.Text;
end;

procedure TfrmSelProcesso.EdnNum2Change(Sender: TObject);
begin
  inherited;
  if StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text) then
     ednNum2.Text := ednNum1.Text;
end;

procedure TfrmSelProcesso.ednCus1Change(Sender: TObject);
begin
  inherited;
  if StrToFloat(ednCus1.Text) > StrToFloat(ednCus2.Text) then
     ednCus1.Text := ednCus2.Text;
end;

procedure TfrmSelProcesso.ednCus2Change(Sender: TObject);
begin
  inherited;
  if StrToFloat(ednCus2.Text) < StrToFloat(ednCus1.Text) then
     ednCus2.Text := ednCus1.Text;
end;


procedure TfrmSelProcesso.rgSitProcClick(Sender: TObject);
begin
  inherited;
  gbxTipEncer.Visible := rgSitProc.ItemIndex > 0;
  gbxDataEnc.Visible := rgSitProc.ItemIndex > 0
end;

procedure TfrmSelProcesso.tblProcessoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
   if  (rgSitProc.ItemIndex < 2) and
        (tblProcesso.FieldByName('FLGSITPROC').AsInteger <>
         rgSitProc.ItemIndex)  then begin
              Accept := False;
              exit;
   end;
   if  (rgSitProc.ItemIndex > 0)  then
   if  ((not cbxArquiv.Checked)       and
        (tblProcesso.FieldByName('TIPOENCER').Value = 'A'))   or
       ((not cbxAcordo.Checked)    and
        (tblProcesso.FieldByName('TIPOENCER').Value = 'C'))   or
       ((not cbxDesist.Checked)    and
        (tblProcesso.FieldByName('TIPOENCER').Value = 'D'))   or
       ((not cbxSent.Checked)     and
        (tblProcesso.FieldByName('TIPOENCER').Value = 'S'))
        then
            begin
              Accept := False;
              exit;
            end;

   if  (rgAdv1.ItemIndex > 0)  then begin
     Accept := False;
     for  I := 0  to  (lstAdv1.Items.Count - 1)  do begin
          if lstAdv1.Items[I] = ''  then  break;
          if lstCodAdv1.Items[I] =
             tblProcesso.FieldByName('IDADVOGRECDA').AsString  then begin
             Accept := True;
             break;
          end;
     end;
     if  Accept = False  then  exit;
   end;

   if  (rgAdv2.ItemIndex > 0)  then begin
     Accept := False;
     for  I := 0  to  (lstAdv2.Items.Count - 1)  do begin
          if lstAdv2.Items[I] = ''  then  break;
          if lstCodAdv2.Items[I] =
             tblProcesso.FieldByName('IDADVOGRECTE').AsString  then begin
             Accept := True;
             break;
          end;
     end;
     if  Accept = False  then  exit;
   end;

   if  (rgAT.ItemIndex > 0)  then begin
     Accept := False;
     for  I := 0  to  (lstAT.Items.Count - 1)  do begin
          if lstAT.Items[I] = ''  then  break;
          if lstCodAT.Items[I] =
             tblProcesso.FieldByName('IDASSISTTECN').AsString  then begin
             Accept := True;
             break;
          end;
     end;
     if  Accept = False  then  exit;
   end;

   if  (rgTRT.ItemIndex > 0)  then begin
     Accept := False;
     for  I := 0  to  (lstTRT.Items.Count - 1)  do begin
          if lstTRT.Items[I] = ''  then  break;
          if lstCodTRT.Items[I] =
             tblProcesso.FieldByName('CODIGOTRT').AsString  then begin
             Accept := True;
             break;
          end;
     end;
     if  Accept = False  then  exit;
   end;


   if  ((ednAdm1.VALUE > 0) or  (ednAdm2.VALUE < 999))
       then  begin //Tempo de Existencia
           if tblProcesso.FieldByName('FLGSITPROC').Value = 1 then
              DecodeDate(tblProcesso.FieldByName('DATAEFETENC').Value, ANO2, MES2, DIA2)
           else
              DecodeDate(Date, ANO2, MES2, DIA2);
           DecodeDate(tblProcesso.FieldByName('DATANOTIF').Value, ANO1, MES1, DIA1);
           if  (DIA2 < DIA1)  then  J := -1  else  J := 0;
           I := (ANO2 - ANO1)*12 + (MES2 - MES1) + J;
           if  (I < ednAdm1.VALUE)  or  (I > ednAdm2.VALUE)  then
               begin
                  Accept := False;
                  exit;
               end;
       end;

   if  (StrToFloat(ednNum1.Text) > 0) or
       (ednNum2.Text <> '9999999999') then
      begin
           if  (tblProcesso.FieldByName('NUMPROCTRAB').Value
                < StrToFloat(ednNum1.Text))  or
                (tblProcesso.FieldByName('NUMPROCTRAB').Value
                > StrToFloat(ednNum2.Text))  then
               begin
                  Accept := False;
                  exit;
               end;
      end;

   if  (StrToFloat(ednCus1.Text) > 0) or
       (ednCus2.Text < '9999999999') then
      begin
           if  (tblProcesso.FieldByName('CUSTOPROC').Value
                < StrToFloat(ednCus1.Text))  or
                (tblProcesso.FieldByName('CUSTOPROC').Value
                > StrToFloat(ednCus2.Text))  then
               begin
                  Accept := False;
                  exit;
               end;
      end;

end;


procedure TfrmSelProcesso.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmSelProcesso.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ds.Dataset.Close;
  ds.Dataset.Filtered := True;
  ds.Dataset.Open;
  ds.Dataset.First;
end;

end.
