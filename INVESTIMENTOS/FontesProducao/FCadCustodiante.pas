unit FCadCustodiante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, StdCtrls, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables,
  Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  checklst, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, UMensErro, TB97Ctls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, TREdit;

type
  TfrmCadCustodiante = class(TfrmPessoa)
    TbsCustodiante: TTabSheet;
    QryProcuraCustodiante: TwwQuery;
    GroupBox1: TGroupBox;
    DBESIGLA: TwwDBEdit;
    LblSigla: TLabel;
    ckbAtivoCust: TDBCheckBox;
    qrySubTipoIDCUSTODIANTE: TFloatField;
    qrySubTipoSGLCUSTODIANTE: TStringField;
    qrySubTipoFLGCODATIVOCUST: TStringField;
    procedure FormActivate(Sender: TObject);
    function JaExiste : boolean ;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCustodiante: TfrmCadCustodiante;

implementation

{$R *.DFM}
procedure TfrmCadCustodiante.FormActivate(Sender: TObject);
begin
 inherited;
 pgctrlDetalhe.activepage := TbsCustodiante;
end;

Function TfrmCadCustodiante.JaExiste;
var
 ssql : string ;
begin
 Result := False ;
 Try
  qryProcuraCustodiante.Sql.Clear;
  sSql := 'SELECT C.IDCUSTODIANTE,C.SGLCUSTODIANTE FROM CUSTODIANTE C WHERE C.SGLCUSTODIANTE = '''+qrySubTipo.FieldByname('SglCustodiante').AsString + '''';
  qryProcuraCustodiante.SQL.Add(sSQL);
  qryProcuraCustodiante.Open;
  Result :=  not qryProcuraCustodiante.IsEmpty;
  qryProcuraCustodiante.Close;
 Except raise ;
 end;
end;

procedure TfrmCadCustodiante.bbtnConfirmarClick(Sender: TObject);
begin
  if qrysubtipo.FieldByName('SglCustodiante').AsString = '' then begin
    MsgDlg('Sigla do Custodiante deve ser Informada', 'Aviso', mtError, [mbOk, mbHelp], 0);
    pgctrlDetalhe.activepage := TbsCustodiante;
    dbeSigla.setfocus;
    exit;
  end else if (ds.dataset.state  in [dsInsert, dsEdit]) then
    if JaExiste then
      if (MsgDlg('Existe Custodiante Cadastrado com essa Sigla . Deseja Gravar ?',
                 'Aviso', mtWarning, [mbYes,mbNo],0) = mrYes) then
      else begin
        pgctrlDetalhe.activepage := TbsCustodiante;
        dbeSigla.setfocus;
        exit;
      end;

// Heranca
  inherited;
  If qrySubTipo.FieldByName('FLGCODATIVOCUST').AsString = '' Then
     ckbAtivoCust.Checked := False;
end;

procedure TfrmCadCustodiante.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  If qrySubTipo.FieldByName('FLGCODATIVOCUST').AsString = '' Then
     ckbAtivoCust.Checked := False;
end;

procedure TfrmCadCustodiante.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  If qrySubTipo.FieldByName('FLGCODATIVOCUST').AsString = '' Then
     ckbAtivoCust.Checked := False;
end;

procedure TfrmCadCustodiante.CmeCadastroFind(Sender: TObject);
Begin
  inherited;
  If qrySubTipo.FieldByName('FLGCODATIVOCUST').AsString = '' Then
     ckbAtivoCust.Checked := False;
End;

procedure TfrmCadCustodiante.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  If qrySubTipo.FieldByName('FLGCODATIVOCUST').AsString = '' Then
     ckbAtivoCust.Checked := False;
end;

end.
