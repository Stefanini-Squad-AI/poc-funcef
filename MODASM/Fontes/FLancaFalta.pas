unit FLancaFalta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit,
  Db, DBTables, Wwquery, TREdit, wwdblook, Spin, Wwtable, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmLancaFalta = class(TfrmOkCancelar)
    dblcFalta: TwwDBLookupCombo;
    Label5: TLabel;
    redFalta: TRealEdit;
    Label4: TLabel;
    qryRub1: TwwQuery;
    wwDBEdit1: TwwDBEdit;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    tblRubInd: TwwTable;
    qryMotivo: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancaFalta: TfrmLancaFalta;

implementation

uses FCadRegOcorr, USistema;

{$R *.DFM}

procedure TfrmLancaFalta.FormShow(Sender: TObject);
var
  wDia, wMes, wAno : word;
begin
  inherited;
  redFalta.Value  := StrToInt(frmCadRegOcorr.dbedLicenca.Text);

  if not qryRub1.Active then qryRub1.Open;

  dblcFalta.Text := '';
  if  qryRub1.Locate('IdProvento',frmCadRegOcorr.qryParamRH.FieldByName('IDRUBFALTA').Value,[])  then
      dblcFalta.Text := qryRub1.FieldByName('Descricao').AsString;

  DecodeDate(frmCadRegOcorr.qryParamRH.FieldbyName('NormalIni').Value, wAno, wMes, wDia);
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;

end;

procedure TfrmLancaFalta.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef : String;
  IntUm   : Integer;
begin
  inherited;
  IntUm := 1;
  sMesRef := Trim(spnedAno.Text) + '/';
  if cmbMes.ItemIndex <= 8
  then sMesRef := sMesRef + '0'+IntToStr(cmbMes.ItemIndex+1)
  else sMesRef := sMesRef + IntToStr(cmbMes.ItemIndex+1);

  if not tblRubInd.Active then tblRubInd.Open;

  if  (redFalta.Value > 0) and (dblcFalta.Text <> '')  then
  if not tblRubInd.FindKey([frmCadRegOcorr.qry.FieldByName('IDPESSOA').Value,
                            Sistema.IdEmpresa,
                            qryRub1.FieldByName('IDPROVENTO').Value,IntUm])
  then begin
       tblRubInd.Insert;
       tblRubInd.FieldbyName('IDPESSOA').Value := frmCadRegOcorr.qry.FieldByName('IDPESSOA').Value;
       tblRubInd.FieldbyName('IDEMPRESA').Value := Sistema.IdEmpresa;
       tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub1.FieldByName('IDPROVENTO').Value;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub1.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redFalta.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
       tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
       tblRubInd.FieldbyName('PARCELAS').Value := 1;
       tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := 1;
       tblRubInd.Post;
  end
  else begin
       tblRubInd.Edit;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub1.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redFalta.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
       then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                       tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
       tblRubInd.Post;
  end;


end;

end.
