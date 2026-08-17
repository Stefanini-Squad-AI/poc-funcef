unit FCtrForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, Grids, Wwdbigrd, Wwdbgrid, Spin, Db, DBTables, Wwquery,
  Wwdatsrc, TB97Tlbr, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmCtrForn = class(TfrmSairAjuda)
    wwDBGrid1: TwwDBGrid;
    grpPrevidenciario: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbchkIDATmpPag: TDBCheckBox;
    dbchkIdaIntPag: TDBCheckBox;
    dbchkVoltaIntPag: TDBCheckBox;
    dbchkVoltaTmpPag: TDBCheckBox;
    DBDateEdit1: TCMDateTimePicker;
    DBDateEdit2: TCMDateTimePicker;
    DBDateEdit3: TCMDateTimePicker;
    DBDateEdit4: TCMDateTimePicker;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    GroupBox1: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbchkIdaTmpComiss: TDBCheckBox;
    dbchkIdaIntComiss: TDBCheckBox;
    dbchkVoltaIntComiss: TDBCheckBox;
    dbchkVoltaTmpComiss: TDBCheckBox;
    DBDateEdit5: TCMDateTimePicker;
    DBDateEdit6: TCMDateTimePicker;
    DBDateEdit7: TCMDateTimePicker;
    DBDateEdit8: TCMDateTimePicker;
    qryforn: TwwQuery;
    qryfornpag: TwwQuery;
    qryforncomiss: TwwQuery;
    dsforn: TwwDataSource;
    dsfornpag: TwwDataSource;
    dsforncomiss: TwwDataSource;
    procedure AbreQuerys(sMes : string);
    procedure FormActivate(Sender: TObject);
    procedure cmbMesCobChange(Sender: TObject);
    procedure spedAnoCobChange(Sender: TObject);
    procedure qryfornAfterScroll(DataSet: TDataSet);
  private
    sMesCobranca : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCtrForn: TfrmCtrForn;

implementation

procedure TfrmCtrForn.AbreQuerys(sMes : string);
begin

  qryFornpag.Close;
  qryFornpag.SQL.Clear;
  qryFornpag.SQL.Add( ' SELECT * FROM CTRLINTERFACE '+
                      ' WHERE IDPESSOA = '+qryForn.Fieldbyname('IdPessoa').ASString+ ' AND '+
                      ' TIPO = ''F'' AND MESREFERENCIA = '''+sMes+'''');
  qryFornpag.Open;

  qryForncomiss.Close;
  qryForncomiss.SQL.Clear;
  qryForncomiss.SQL.Add( ' SELECT * FROM CTRLINTERFACE '+
                      ' WHERE IDPESSOA = '+qryForn.Fieldbyname('IdPessoa').ASString+ ' AND '+
                      ' TIPO = ''G'' AND MESREFERENCIA = '''+sMes+'''');
  qryForncomiss.Open;


  dbchkIdaTmpPag.Checked := (qryFornpag.FieldByName('flgIdaTmp').AsInteger  = 1);
  dbchkIdaIntPag.Checked := (qryFornpag.FieldByName('flgIdaInterface').AsInteger  = 1);
  dbchkVoltaIntPag.Checked := (qryFornpag.FieldByName('flgVoltaInterface').AsInteger  = 1);
  dbchkVoltaTmpPag.Checked := (qryFornpag.FieldByName('flgVoltaTmp').AsInteger  = 1);

  dbchkIdaTmpComiss.Checked := (qryForncomiss.FieldByName('flgIdaTmp').AsInteger  = 1);
  dbchkIdaIntComiss.Checked := (qryForncomiss.FieldByName('flgIdaInterface').AsInteger  = 1);
  dbchkVoltaIntComiss.Checked := (qryForncomiss.FieldByName('flgVoltaInterface').AsInteger  = 1);
  dbchkVoltaTmpComiss.Checked := (qryForncomiss.FieldByName('flgVoltaTmp').AsInteger  = 1);


end;


{$R *.DFM}

procedure TfrmCtrForn.FormActivate(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cmbMesCob.ItemIndex := AMonth - 1;
     cmbMesCob.Text := cmbMesCob.Items[cmbMesCob.ItemIndex];
     spedAnoCob.Text := IntToStr(AYear);
  end;
  sMesCobranca := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sMesCobranca := sMesCobranca+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sMesCobranca := sMesCobranca+IntToStr(cmbMesCob.ItemIndex+1);

  qryForn.Close;
  qryForn.Open;
  // Abrir querys

  if not qryforn.isempty then AbreQuerys(sMesCobranca);

end;

procedure TfrmCtrForn.cmbMesCobChange(Sender: TObject);
begin
  inherited;
  sMesCobranca := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sMesCobranca := sMesCobranca+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sMesCobranca := sMesCobranca+IntToStr(cmbMesCob.ItemIndex+1);
  if not qryforn.isempty then  AbreQuerys(sMesCobranca);
end;

procedure TfrmCtrForn.spedAnoCobChange(Sender: TObject);
begin
  inherited;
  sMesCobranca := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sMesCobranca := sMesCobranca+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sMesCobranca := sMesCobranca+IntToStr(cmbMesCob.ItemIndex+1);
  if not qryforn.isempty then   AbreQuerys(sMesCobranca);

end;

procedure TfrmCtrForn.qryfornAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sMesCobranca := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sMesCobranca := sMesCobranca+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sMesCobranca := sMesCobranca+IntToStr(cmbMesCob.ItemIndex+1);
  if not qryforn.isempty then  AbreQuerys(sMesCobranca);
end;

end.
