unit FCadBancosxCodigosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlCodigoscnab, uCtrlModeloscnab, Grids, Wwdbigrd, Wwdbgrid, wwdblook, CMDBLookupCombo,
  DBCtrls, Mask, wwdbedit, DBTables, uCMTypes, CMDatabase, uCmSqlParams,
  FCadastroMT, ComCtrls, TabControlDetalhe, Wwdbspin;

type
  TFrmCadBancosxCodigosMT = class(TFrmCadastroMestreDetMT)
    CdsModeloscnab: TCMClientDataSet;
    CdsAlteradores: TCMClientDataSet;
    SqlAlteradores: TCMSqlParams;
    chkContabAlt: TDBCheckBox;
    dblkAlterador: TwwDBLookupCombo;
    DbIndReceb: TDBCheckBox;
    EdtDescricao: TwwDBEdit;
    EdtCodigo: TwwDBEdit;
    CmbModeloCnab: TCMDBLookupCombo;
    RgTipo: TDBRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    LblTipo: TLabel;
    Label1: TLabel;
    CdsDet: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    CMSqlParams2: TCMSqlParams;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    wwDBEdit3: TwwDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    dblkPortForma: TwwDBLookupCombo;
    sSqlPortadorForma: TCMSqlParams;
    cdsPortadorForma: TCMClientDataSet;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
  private
    { Private declarations }
    CtrlCodigoscnab : TCtrlCodigoscnab;
    CtrlModeloscnab : TCtrlModeloscnab;
  public
    { Public declarations }
  end;

var
  FrmCadBancosxCodigosMT: TFrmCadBancosxCodigosMT;

implementation

uses uMensErro,DBaseDados, uSistema, uModulo, uCtrlParamIntegra;

{$R *.DFM}
{ TFrmCadBancosxCodigosMT }

procedure TFrmCadBancosxCodigosMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     cds.data := CtrlCodigoscnab.ListCodigoscnab(StrToIntDef(MontaSelect.ValoresChave[0],0));
     //início - andré tavares - pendência 21102 - 23/04/2006
     cdsDet.data   := CtrlCodigoscnab.ListCodLiqBaixa(cds.FieldByName('IDMODELOSCNAB').asFloat, ParamIntegra.RecPag);
     sSqlPortadorForma.Prepare;
     sSqlPortadorForma.ParamByName('RECPAG').asString := ParamIntegra.RecPag;
     sSqlPortadorForma.Open;
     //fim - andré tavares - pendência 21102 - 23/04/2006
  End;
end;

procedure TFrmCadBancosxCodigosMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CmbModeloCnab.Enabled := True;
  cds.FieldByName('RECPAG').AsString           := ParamIntegra.RecPag;
  cds.FieldByName('TIPO').AsString             := 'T';
  cds.FieldByName('FLGINDICABAIXA').AsString   := 'N';

  // Rodolpho da Silva - P: 20932 - 21/12/2005
  Cds.FieldByName('FLGCONTABALTERADOR').AsString := 'N';

  If CmbModeloCnab.CanFocus Then CmbModeloCnab.SetFocus;
end;

procedure TFrmCadBancosxCodigosMT.FormCreate(Sender: TObject);
begin
  inherited;
// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.RecPag = 'P' then
  begin
    HelpContext           := 30051;
    bbtnAjuda.HelpContext := 30051;
  end
  else
  begin
    HelpContext           := 40070;
    bbtnAjuda.HelpContext := 40070;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

  MontaSelect.Filtro.Add('MODELOSCNAB.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));

  CtrlCodigoscnab := TCtrlCodigoscnab.Create;
  CtrlCodigoscnab.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlCodigoscnab.cds := cds;

  CtrlCodigoscnab.CdsCodLiqBaixa := cdsDet;

  CtrlModeloscnab := TCtrlModeloscnab.Create;
  CtrlModeloscnab.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  CdsModeloscnab.Data := CtrlModeloscnab.ListModeloscnab(0,  ParamIntegra.RecPag );
  cdsDet.data   := CtrlCodigoscnab.ListCodLiqBaixa(0, ParamIntegra.RecPag); //andré tavares - pendência 21102 - 23/04/2006
  //início - andré tavares - pendência 21102 - 23/04/2006
  sSqlPortadorForma.Prepare;
  sSqlPortadorForma.ParamByName('RECPAG').asString := ParamIntegra.RecPag;
  sSqlPortadorForma.Open;
  //fim - andré tavares - pendência 21102 - 23/04/2006

  cds.Data := CtrlCodigoscnab.listCodigoscnab( -1);

  SqlAlteradores.Prepare;
  SqlAlteradores.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlAlteradores.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlAlteradores.Open;
end;

procedure TFrmCadBancosxCodigosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
CtrlCodigoscnab.free;
CtrlModeloscnab.free;
end;

procedure TFrmCadBancosxCodigosMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := CtrlCodigoscnab.GravarCodigoscnab(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TFrmCadBancosxCodigosMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := CtrlCodigoscnab.GravarCodigoscnab(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TFrmCadBancosxCodigosMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCodigoscnab.GravarCodigoscnab(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TFrmCadBancosxCodigosMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlCodigoscnab.MessageInfo <> '' Then
     MsgDlg(CtrlCodigoscnab.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmCadBancosxCodigosMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin
     //Faz a verificação do preenchimento dos campos
     If (EdtDescricao.Text = '') Then
     Begin
         MsgDlg('Descrição não informada.','Aviso',mtWarning,[mbOk],0);
         if EdtDescricao.CanFocus Then
            EdtDescricao.SetFocus;
         accept := false;
      End;
  End;
end;

procedure TFrmCadBancosxCodigosMT.bbtnOkDetClick(Sender: TObject);
begin
  //início - andré tavares - pendência 21102 - 23/04/2006
  if (not cdsDet.fieldByName('CODPORTFORMA').isNull) and (trim(dblkPortForma.text)<> '')then
    cdsDet.fieldByName('DESPORTFORMA').asString := cdsPortadorForma.fieldByName('DESPORTFORMA').asString
  else begin
    cdsDet.fieldByName('CODPORTFORMA').asString := '';
    cdsDet.fieldByName('DESPORTFORMA').asString := '';
  end;
  //fim - andré tavares - pendência 21102 - 23/04/2006
  inherited;
end;

end.
