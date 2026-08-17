unit FCadResponsa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc,
  Wwquery, TB97, MAHlpBtn, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, checklst,
  Buttons, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, TREdit;

type
  TfrmCadResponsa = class(TfrmPessoa)
    qryRespon: TwwQuery;
    updRespon: TUpdateSQL;
    dsRespon: TwwDataSource;
    plnRespon: TPanel;
    qryResponIDRESPONSAVEL: TFloatField;
    qryResponFLGATIVOFIXO: TFloatField;
    qryResponFLGCONTRATO: TFloatField;
    qryResponFLGPROJETO: TFloatField;
    chkAtivoFixo: TDBCheckBox;
    chkContrato: TDBCheckBox;
    chkProjeto: TDBCheckBox;
    plnCapBem: TPanel;
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure PessoaSaveSubtipo(Sender: TObject);
    Procedure PessoaChangePessoa(IdPessoa: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadResponsa: TfrmCadResponsa;

implementation

{$R *.DFM}
Uses uSistema;
procedure TFrmCadResponsa.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryRespon.Append;
  qryRespon.FieldByName('FLGATIVOFIXO').asInteger := 1;
  qryRespon.FieldByName('FLGCONTRATO').AsInteger  := 0;
  qryRespon.FieldByName('FLGPROJETO').asInteger   := 0;
End;

procedure TFrmCadResponsa.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  qryRespon.Edit;
End;

procedure TFrmCadResponsa.CmeCadastroDelete(Sender: TObject);
begin
  qryRespon.Delete;
  inherited;
End;

procedure TFrmCadResponsa.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  qryRespon.CancelUpdates;
End;

procedure TFrmCadResponsa.PessoaChangePessoa(IdPessoa: Integer);
begin
  inherited;
  qryRespon.Close;
  qryRespon.ParamByName('IDPESSOA').AsInteger := IdPessoa;
  qryRespon.Open;
end;

procedure TFrmCadResponsa.PessoaSaveSubtipo(Sender: TObject);
begin
   qryRespon.FieldByName('IDRESPONSAVEL').AsInteger  := qry.FieldByName('IDPESSOA').AsInteger;
   qryRespon.ApplyUpdates;
   qryRespon.CommitUpdates;
end;
end.
