// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Nº SIG...........: 84413
//Data da Alteração: 16/05/2019
//Responsável......: Andre Imakawa
//Descrição........: seleção do módulo
//------------------------------------------------------------------------------
//Nº SIG...........: 25312
//Data da Alteração: 16/11/2017
//Responsável......: Andre Imakawa
//Descrição........: Criação do campo FLGMOTIVOCANCEL
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit fcadmotivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, Mask, wwdbedit, cmseldlg, wwidlg, Db, Wwdatsrc,
  DBCtrls, MAHlpBtn, Buttons, ComCtrls, ToolWin, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery, TB97, TB97Ctls, TB97Tlbr,
  CmEventosCadastro, wwDialog, ImgList, IvDictio, IvMulti, IvEMulti,
  FCadastroGrid, MontaSelect, CMProcuraMask, wwdblook;

type
  Tfrmcadmotivo = class(TfrmCadastroGridCS)
    lblmotivo: TLabel;
    dbedDesc: TwwDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    PgContab: TPageControl;
    TabSheet1: TTabSheet;
    grpDebContab: TGroupBox;
    grpCreContab: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    CmpCContabilD: TCMProcuraMaskContabil;
    CmpCContabilDAlt: TCMProcuraMaskContabil;
    CmpCContabilC: TCMProcuraMaskContabil;
    CmpCContabilCAlt: TCMProcuraMaskContabil;
    ChkContab: TDBCheckBox;
    QryAux: TwwQuery;
    ChkFlgMotivoCancel: TDBCheckBox; // Andre Imakawa - SIG 25312
    Lbl_ChkFlgMotivoCancel: TLabel;  // Andre Imakawa - SIG 25312
    qryModulo: TwwQuery;				// Andre Imakawa - SIG 84413
    grpModulo: TGroupBox;				// Andre Imakawa - SIG 84413
    dblkpcmbModulo: TwwDBLookupCombo;	// Andre Imakawa - SIG 84413
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Lbl_ChkFlgMotivoCancelClick(Sender: TObject); // Andre Imakawa - SIG 25312
    procedure ChkContabClick(Sender: TObject);				// Andre Imakawa - SIG 25312
    procedure dblkpcmbModuloChange(Sender: TObject);		// Andre Imakawa - SIG 84413
    procedure qryModuloBeforeScroll(DataSet: TDataSet);		// Andre Imakawa - SIG 84413
  private
    { Private declarations }
    iPlano : integer;
  public
    { Public declarations }
  end;

var
  frmcadmotivo: Tfrmcadmotivo;

implementation

uses UDataBase, UMensErro, usistema;

{$R *.DFM}

procedure Tfrmcadmotivo.FormActivate(Sender: TObject);
begin
  inherited;
  if not qry.Active
  then begin
     qry.Close;
     qry.Open;
  end;
end;

procedure Tfrmcadmotivo.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedDesc.SetFocus;
end;

procedure Tfrmcadmotivo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedDesc.SetFocus;
end;

procedure Tfrmcadmotivo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then Exit;

  qry.Close;	// Andre Imakawa - SIG 84413
  qry.Open;		// Andre Imakawa - SIG 84413
  qry.Locate('IDMOTIVO',StrToInt(MontaSelect.ValoresChave[0]),[loCaseInsensitive]);
end;

procedure Tfrmcadmotivo.qryBeforePost(DataSet: TDataSet);
begin
  inherited;

  
  if Trim(dbedDesc.Text) = ''
  then begin
     MsgDlg('Preencha a Descrição do Motivo.','Erro',mtError,[mbOK],0);
     Abort;
  end;

  if qry.State = dsInsert
  then begin
     qry.FieldByName('IdMotivo').AsInteger := LeUltRegistro(nil,'MOTIVO');

  end;
end;


procedure Tfrmcadmotivo.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure Tfrmcadmotivo.FormCreate(Sender: TObject);
begin
  inherited;
  QryAux.close;
  QryAux.sql.clear;
  QryAux.sql.add(' SELECT PLANO FROM PARAMCONTAB WHERE (IDPESSOA = ' +FloatToStr(sistema.IdEmpresa) + ')');
  QryAux.Open;
  iPlano := QryAux.FieldByName('PLANO').asinteger;

  qryModulo.Close;	// Andre Imakawa - SIG 84413	
  qryModulo.Open;	// Andre Imakawa - SIG 84413

  CmpCContabilD.Plano    := iPlano;
  CmpCContabilC.Plano    := iPlano;
  CmpCContabilCAlt.Plano := iPlano;
  CmpCContabilDAlt.Plano := iPlano;

  ChkFlgMotivoCancel.SendToBack; // Andre Imakawa - SIG 25312

end;

// Andre Imakawa - SIG 25312 - Inicio
procedure Tfrmcadmotivo.Lbl_ChkFlgMotivoCancelClick(Sender: TObject);
begin
  inherited;
  ChkFlgMotivoCancel.Perform(WM_LBUTTONDOWN, 0, 0);
  ChkFlgMotivoCancel.Perform(WM_LBUTTONUP, 0, 0);
  ChkFlgMotivoCancel.SetFocus;

end;

procedure Tfrmcadmotivo.ChkContabClick(Sender: TObject);
begin
  inherited;
  ChkContab.SetFocus;
end;
// Andre Imakawa - SIG 25312 - Fim
// Andre Imakawa - SIG 84413 - Inicio
procedure Tfrmcadmotivo.dblkpcmbModuloChange(Sender: TObject);
begin
  inherited;
  if (qry.State in [dsInsert, dsEdit]) and (bbtnConfirmar.enabled = true) then
  begin
    if dblkpcmbModulo.Text = '' then
      qry.FieldByName('idmodulo').AsString := '';
  end
  else
    exit;
  
end;

procedure Tfrmcadmotivo.qryModuloBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  if (bbtnConfirmar.enabled = false) then
    dblkpcmbModulo.ReadOnly := True
  else
    dblkpcmbModulo.ReadOnly := False;
end;
// Andre Imakawa - SIG 84413 - Fim
end.
