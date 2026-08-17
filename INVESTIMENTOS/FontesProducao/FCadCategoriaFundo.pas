unit FCadCategoriaFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Wwdbspin, StdCtrls, Mask, wwdbedit, Db, CmEventosCadastro,
  ImgList, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti,
  Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, fcCombo,
  fcColorCombo, wwdblook, FCadastroCSInv, fcLabel;

type
  TfrmCadCatogoriaFundo = class(TfrmCadastroCSInv)
    Label1: TLabel;
    dbeNome: TwwDBEdit;
    dbsNivel: TwwDBSpinEdit;
    Label2: TLabel;
    dbcCorCategoria: TfcColorCombo;
    Label3: TLabel;
    qryIDCATEGORIAFUNDO: TFloatField;
    qryNIVELCATEGFUNDO: TFloatField;
    qryCORCATEGFUNDO: TFloatField;
    dlgCorCategFundo: TColorDialog;
    dblMoeda: TwwDBLookupCombo;
    Label4: TLabel;
    qryMOECODIGO: TFloatField;
    qryMoeda: TwwQuery;
    qryMoedaMOECODIGO: TFloatField;
    qryMoedaMOEDESC: TStringField;
    qryMoedaMOESIGLA: TStringField;
    qryNOMECATEGFUNDO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Sel(S: Integer);
  public
    { Public declarations }
  end;

var
  frmCadCatogoriaFundo: TfrmCadCatogoriaFundo;

implementation
Uses UDataBase, uMensErro;
{$R *.DFM}

{ TfrmCadNivelFundo }

procedure TfrmCadCatogoriaFundo.Sel(S: Integer);
begin
  qry.Close;
  qry.ParamByName('IDCATEGORIAFUNDO').AsInteger := S;
  qry.Open;
  if not qry.IsEmpty then
     dbcCorCategoria.SelectedColor :=  TColor(qry.FieldByName('CORCATEGFUNDO').AsInteger);
end;

procedure TfrmCadCatogoriaFundo.FormCreate(Sender: TObject);
begin
  inherited;
  qryMoeda.Open;
  Sel(-1);
end;

procedure TfrmCadCatogoriaFundo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));

end;

procedure TfrmCadCatogoriaFundo.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.State = dsInsert Then
     qry.FieldByName('IDCATEGORIAFUNDO').AsInteger := LeUltRegistro(nil, 'CATEGORIAFUNDO');

  if qry.State in [dsInsert, dsEdit] Then
     qry.FieldByName('CORCATEGFUNDO').AsInteger := dbcCorCategoria.SelectedColor;

  inherited;
end;

procedure TfrmCadCatogoriaFundo.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
//  inherited;
  Accept := False;
  if Trim(dbeNome.Text) = '' then
  begin
     MsgDlg('Nome da Categoria não Preenchido','Erro',mtError,[mbOK],0);
     dbeNome.SetFocus;
  end
  else
  if Trim(dbsNivel.Text) = '' then
  begin
     MsgDlg('Nível da Categoria não preenchido','Erro',mtError,[mbOK],0);
     dbsNivel.SetFocus;
  end
  else
    Accept := True;
end;

procedure TfrmCadCatogoriaFundo.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  SelectFirst;
end;

procedure TfrmCadCatogoriaFundo.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));

end;

procedure TfrmCadCatogoriaFundo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryMoeda.Close;
  inherited;
end;

end.
