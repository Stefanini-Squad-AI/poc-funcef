unit FCadClassRiscoRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Wwdbspin, StdCtrls, Mask, wwdbedit, Db, CmEventosCadastro,
  ImgList, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti,
  Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, fcCombo,
  fcColorCombo, wwdblook, FCadastroCSInv, fcLabel, fPreview;

type
  TfrmCadClassRiscoRenFix = class(TfrmCadastroCSInv)
    Label1: TLabel;
    dbeNome: TwwDBEdit;
    dbsNivel: TwwDBSpinEdit;
    Label2: TLabel;
    dbcCor: TfcColorCombo;
    Label3: TLabel;
    dlgCor: TColorDialog;
    qryIDCLASSRISCORENFIX: TFloatField;
    qryNOMECLASSRISCO: TStringField;
    qryNIVELCLASSRISCO: TFloatField;
    qryCORCLASSRISCO: TFloatField;
    sbtnImprime: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnImprimeClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(S: Integer);
  public
    { Public declarations }
  end;

var
  frmCadClassRiscoRenFix: TfrmCadClassRiscoRenFix;

implementation
Uses UDataBase, uMensErro, FDmRelRenFixClasseRisco;
{$R *.DFM}

{ TfrmCadNivelFundo }

procedure TfrmCadClassRiscoRenFix.Sel(S: Integer);
begin
  qry.Close;
  qry.ParamByName('IDCLASSRISCORENFIX').AsInteger := S;
  qry.Open;
  if not qry.IsEmpty then
     dbcCor.SelectedColor :=  TColor(qry.FieldByName('CORCLASSRISCO').AsInteger);
end;

procedure TfrmCadClassRiscoRenFix.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
  Application.CreateForm(TDmRelRenFixClasseRisco,DmRelRenFixClasseRisco);
end;

procedure TfrmCadClassRiscoRenFix.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));

end;

procedure TfrmCadClassRiscoRenFix.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.State = dsInsert Then
     qry.FieldByName('IDCLASSRISCORENFIX').AsInteger := LeUltRegistro(nil, 'CLASSRISCORENFIX');

  if qry.State in [dsInsert, dsEdit] Then
     qry.FieldByName('CORCLASSRISCO').AsInteger := dbcCor.SelectedColor;

  inherited;
end;

procedure TfrmCadClassRiscoRenFix.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
//  inherited;
  Accept := False;
  if Trim(dbeNome.Text) = '' then
  begin
     MsgDlg('Nome da Classe de Risco não Preenchido','Erro',mtError,[mbOK],0);
     dbeNome.SetFocus;
  end
  else
  if Trim(dbsNivel.Text) = '' then
  begin
     MsgDlg('Nível da Classe de Risco não preenchido','Erro',mtError,[mbOK],0);
     dbsNivel.SetFocus;
  end
  else
    Accept := True;
end;

procedure TfrmCadClassRiscoRenFix.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  SelectFirst;
end;

procedure TfrmCadClassRiscoRenFix.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadClassRiscoRenFix.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DmRelRenFixClasseRisco.Free;
end;

procedure TfrmCadClassRiscoRenFix.sbtnImprimeClick(Sender: TObject);
begin
  inherited;
  with DmRelRenFixClasseRisco do
  begin
     qryClasseRiscoRenFix.Open;
     TfrmPreview.CreateModalPreview(Application,
                                    rptClasseRiscoRenFix,
                                    rptClasseRiscoRenFix.PrinterSetup.DocumentName);

     qryClasseRiscoRenFix.Close;
  end;
  sbtnImprime.Down := False;
end;

end.
