unit FLancaHoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit,
  Db, DBTables, Wwquery, TREdit, wwdblook, Spin, Wwtable, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmLancaHoras = class(TfrmOkCancelar)
    dblcAtraso: TwwDBLookupCombo;
    dblcDiurna: TwwDBLookupCombo;
    dblcNoturna: TwwDBLookupCombo;
    dblcExtra: TwwDBLookupCombo;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    redAtraso: TRealEdit;
    redDiurna: TRealEdit;
    redNoturna: TRealEdit;
    redExtra: TRealEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qryRub1: TwwQuery;
    wwDBEdit1: TwwDBEdit;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    qryRub2: TwwQuery;
    qryRub3: TwwQuery;
    qryRub4: TwwQuery;
    tblRubInd: TwwTable;
    qryMotivo: TwwQuery;
    Label9: TLabel;
    dblcAdicNot: TwwDBLookupCombo;
    redAdNot: TRealEdit;
    Label10: TLabel;
    qryRub5: TwwQuery;
    qryRub6: TwwQuery;
    Label11: TLabel;
    dblcRepouso: TwwDBLookupCombo;
    redRepouso: TRealEdit;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancaHoras: TfrmLancaHoras;

implementation

uses FRegHoras;

{$R *.DFM}

procedure TfrmLancaHoras.FormShow(Sender: TObject);
var
  wDia, wMes, wAno : word;
begin
  inherited;
  redAtraso.Value  := TotAtraso;
  redDiurna.Value  := TotDiurno;
  redNoturna.Value := TotNoturno;
  redExtra.Value   := TotFolga;
  redAdNot.Value   := TotAdicNot;
  redRepouso.Value := 0;
  if  (TotDiurno + TotNoturno + TotFolga)  > 0  then
      redRepouso.Value := (30 - QtdRepouso) + QtdRepouso / 100;

  if not qryRub1.Active then qryRub1.Open;
  if not qryRub2.Active then qryRub2.Open;
  if not qryRub3.Active then qryRub3.Open;
  if not qryRub4.Active then qryRub4.Open;
  if not qryRub5.Active then qryRub5.Open;
  if not qryRub6.Active then qryRub6.Open;
  dblcAtraso.Text := '';
  if  qryRub1.Locate('CodRubCLT','50002',[])  then
      dblcAtraso.Text := qryRub1.FieldByName('Descricao').AsString;
  dblcDiurna.Text := '';
  if  qryRub2.Locate('CodRubCLT','40520',[])  then
      dblcDiurna.Text := qryRub2.FieldByName('Descricao').AsString;
  dblcNoturna.Text := '';
  if  qryRub3.Locate('CodRubCLT','40530',[])  then
      dblcNoturna.Text := qryRub3.FieldByName('Descricao').AsString;
  dblcExtra.Text := '';
  if  qryRub4.Locate('CodRubCLT','40540',[])  then
      dblcExtra.Text := qryRub4.FieldByName('Descricao').AsString;
  dblcAdicNot.Text := '';
  if  qryRub5.Locate('CodRubCLT','40004',[])  then
      dblcAdicNot.Text := qryRub5.FieldByName('Descricao').AsString;
  dblcRepouso.Text := '';
  if  qryRub6.Locate('CodRubCLT','00003',[])  then
      dblcRepouso.Text := qryRub6.FieldByName('Descricao').AsString;

  DecodeDate(frmRegHoras.tblParam.FieldbyName('NormalIni').Value, wAno, wMes, wDia);
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;

end;

procedure TfrmLancaHoras.bbtnConfirmarClick(Sender: TObject);
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

  if  (redAtraso.Value > 0) and (dblcAtraso.Text <> '')  then
  if not tblRubInd.FindKey([frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value,
                            frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value,
                            qryRub1.FieldByName('IDPROVENTO').Value,IntUm])
  then begin
       tblRubInd.Insert;
       tblRubInd.FieldbyName('IDPESSOA').Value := frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value;
       tblRubInd.FieldbyName('IDEMPRESA').Value := frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value;
       tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub1.FieldByName('IDPROVENTO').Value;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub1.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redAtraso.Value;
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
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redAtraso.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
       then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                       tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
       tblRubInd.Post;
  end;

  if  (redDiurna.Value > 0) and (dblcDiurna.Text <> '')  then
  if not tblRubInd.FindKey([frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value,
                            frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value,
                            qryRub2.FieldByName('IDPROVENTO').Value,IntUm])
  then begin
       tblRubInd.Insert;
       tblRubInd.FieldbyName('IDPESSOA').Value := frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value;
       tblRubInd.FieldbyName('IDEMPRESA').Value := frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value;
       tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub2.FieldByName('IDPROVENTO').Value;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub2.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redDiurna.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
       tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
       tblRubInd.FieldbyName('PARCELAS').Value := 1;
       tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := 1;
       tblRubInd.Post;
  end
  else begin
       tblRubInd.Edit;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub2.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redDiurna.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
       then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                       tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
       tblRubInd.Post;
  end;

  if  (redNoturna.Value > 0) and (dblcNoturna.Text <> '')  then
  if not tblRubInd.FindKey([frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value,
                            frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value,
                            qryRub3.FieldByName('IDPROVENTO').Value,IntUm])
  then begin
       tblRubInd.Insert;
       tblRubInd.FieldbyName('IDPESSOA').Value := frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value;
       tblRubInd.FieldbyName('IDEMPRESA').Value := frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value;
       tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub3.FieldByName('IDPROVENTO').Value;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub3.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redNoturna.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
       tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
       tblRubInd.FieldbyName('PARCELAS').Value := 1;
       tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := 1;
       tblRubInd.Post;
  end
  else begin
       tblRubInd.Edit;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub3.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redNoturna.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
       then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                       tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
       tblRubInd.Post;
  end;

  if  (redExtra.Value > 0) and (dblcExtra.Text <> '')  then
  if not tblRubInd.FindKey([frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value,
                            frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value,
                            qryRub4.FieldByName('IDPROVENTO').Value,IntUm])
  then begin
       tblRubInd.Insert;
       tblRubInd.FieldbyName('IDPESSOA').Value := frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value;
       tblRubInd.FieldbyName('IDEMPRESA').Value := frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value;
       tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub4.FieldByName('IDPROVENTO').Value;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub4.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redExtra.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
       tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
       tblRubInd.FieldbyName('PARCELAS').Value := 1;
       tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := 1;
       tblRubInd.Post;
  end
  else begin
       tblRubInd.Edit;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub4.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redExtra.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
       then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                       tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
       tblRubInd.Post;
  end;

  if  (redAdNot.Value > 0) and (dblcAdicNot.Text <> '')  then
  if not tblRubInd.FindKey([frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value,
                            frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value,
                            qryRub5.FieldByName('IDPROVENTO').Value,IntUm])
  then begin
       tblRubInd.Insert;
       tblRubInd.FieldbyName('IDPESSOA').Value := frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value;
       tblRubInd.FieldbyName('IDEMPRESA').Value := frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value;
       tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub5.FieldByName('IDPROVENTO').Value;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub5.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redAdNot.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
       tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
       tblRubInd.FieldbyName('PARCELAS').Value := 1;
       tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := 1;
       tblRubInd.Post;
  end
  else begin
       tblRubInd.Edit;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub5.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redAdNot.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
       then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                       tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
       tblRubInd.Post;
  end;

  if  (redRepouso.Value > 0) and (dblcRepouso.Text <> '')  then
  if not tblRubInd.FindKey([frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value,
                            frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value,
                            qryRub6.FieldByName('IDPROVENTO').Value,IntUm])
  then begin
       tblRubInd.Insert;
       tblRubInd.FieldbyName('IDPESSOA').Value := frmRegHoras.qryFuncio.FieldByName('IDPESSOA').Value;
       tblRubInd.FieldbyName('IDEMPRESA').Value := frmRegHoras.qryFuncio.FieldByName('IdEmpresa').Value;
       tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub6.FieldByName('IDPROVENTO').Value;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub6.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redRepouso.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
       tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
       tblRubInd.FieldbyName('PARCELAS').Value := 1;
       tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := 1;
       tblRubInd.Post;
  end
  else begin
       tblRubInd.Edit;
       tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub6.FieldByName('IDREGRA').Value;
       tblRubInd.FieldbyName('VALORRUBRICA').Value := redRepouso.Value;
       tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
       if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
       then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                       tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
       tblRubInd.Post;
  end;

end;

end.
