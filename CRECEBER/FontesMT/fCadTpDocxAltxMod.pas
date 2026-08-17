unit fCadTpDocxAltxMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlTPDOCXALTXMODULO, Mask, wwdbedit, Wwdotdot, Wwdbcomb, dBaseDados, usistema,
  wwdblook, uCmSqlParams;

type
  TfrmCadTpDocxAltxMod = class(TFrmCadastroMT)
    CdsModulo: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    Label1: TLabel;
    Label2: TLabel;
    DblkTipoDocumento: TwwDBLookupCombo;
    DblkModulo: TwwDBLookupCombo;
    CdsModuloIDMODULO: TFloatField;
    CdsModuloNOMEMODULO: TStringField;
    CdsTipoDocCODTIPDOC: TFloatField;
    CdsTipoDocDESCRICAO: TStringField;
    CdsAlteradores: TCMClientDataSet;
    dblkAltJuros: TwwDBLookupCombo;
    Label3: TLabel;
    CdsAlteradoresCODALTERADOR: TFloatField;
    CdsAlteradoresDESCRICAO: TStringField;
    Label4: TLabel;
    DblkAltDescontos: TwwDBLookupCombo;
    Label5: TLabel;
    DblkAltOutros: TwwDBLookupCombo;
    Label6: TLabel;
    DblkAltAbatimentos: TwwDBLookupCombo;
    Bevel1: TBevel;
    CdsIDTPDOCXALTXMOD: TFloatField;
    CdsTIPODOC2: TFloatField;
    CdsIDMODULO: TFloatField;
    CdsCODALTJUROS: TFloatField;
    CdsCODALTOUTROS: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
  private
    { Private declarations }
    CtrlTPDOCXALTXMODULO : TCtrlTPDOCXALTXMODULO;

    sCODALTABAT, sTIPODOC, sCODALTDESC, sCODALTJUROS, sCODALTOUTROS, sIDMODULO : String;

    procedure MsgErro( sMsg : string );
  public
    { Public declarations }
  end;

var
  frmCadTpDocxAltxMod: TfrmCadTpDocxAltxMod;

implementation

{$R *.DFM}

procedure TfrmCadTpDocxAltxMod.FormCreate(Sender: TObject);
begin
  inherited;

  sTIPODOC       := '';
  sCODALTDESC    := '';
  sCODALTJUROS   := '';
  sCODALTOUTROS  := '';
  sIDMODULO      := '';
  sCODALTABAT    := '';
  CtrlTPDOCXALTXMODULO := TCtrlTPDOCXALTXMODULO.Create;
  CtrlTPDOCXALTXMODULO.Initialize(DtmBaseDados.dbBaseDados,true,
                                  Sistema.ConnectionType,Sistema.ConnectionSide,
                                  Sistema.AppRemoteServer, True, MsgErro );

  cdsModulo.Data      := CtrlTPDOCXALTXMODULO.ListaModulos;
  cdsTipoDoc.Data     := CtrlTPDOCXALTXMODULO.ListaTipoDoc;
  cds.data            := CtrlTPDOCXALTXMODULO.ListaAteradores(-1, -1);
  CdsAlteradores.Data := CtrlTPDOCXALTXMODULO.ListaTipoAlt;

  CtrlTPDOCXALTXMODULO.cds := cds;
end;



procedure TfrmCadTpDocxAltxMod.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.retornouValor then
  begin
    cds.Data := CtrlTPDOCXALTXMODULO.ListaAteradores(StrToIntDef(MontaSelect.ValoresChave[6], -1),
                                                     StrToIntDef(MontaSelect.ValoresChave[1], -1));
  end;
end;

procedure TfrmCadTpDocxAltxMod.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if trim(DblkModulo.text) = '' then
  begin
    showMessage('O campo Módulo não pode ser vazio');
    DblkModulo.setFocus;
    exit;
  end;

  if trim(DblkTipoDocumento.text) = '' then
  begin
    showMessage('O campo Tipo de Documento não pode ser vazio');
    DblkTipoDocumento.setFocus;
    exit;
  end;

  Accept := CtrlTPDOCXALTXMODULO.GravaTPDOCXALTXMODULO(strToInt(DblkModulo.lookupValue),
                                                       strToInt(DblkTipoDocumento.LookupValue),
                                                       strToIntDef(dblkAltJuros.LookupValue, 0),
                                                       strToIntDef(DblkAltDescontos.LookupValue, 0),
                                                       strToIntDef(DblkAltAbatimentos.LookupValue, 0),
                                                       strToIntDef(DblkAltOutros.LookupValue, 0));

end;

procedure TfrmCadTpDocxAltxMod.MsgErro(sMsg: string);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadTpDocxAltxMod.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if trim(DblkModulo.text) = '' then
  begin
    showMessage('O campo Módulo não pode ser vazio');
    DblkModulo.setFocus;
    exit;
  end;

  if trim(DblkTipoDocumento.text) = '' then
  begin
    showMessage('O campo Tipo de Documento não pode ser vazio');
    DblkTipoDocumento.setFocus;
    exit;
  end;

  Accept := CtrlTPDOCXALTXMODULO.GravaTPDOCXALTXMODULO(strToInt(DblkModulo.lookupValue),
                                                       strToInt(DblkTipoDocumento.LookupValue),
                                                       strToIntDef(dblkAltJuros.LookupValue, 0),
                                                       strToIntDef(DblkAltDescontos.LookupValue, 0),
                                                       strToIntDef(DblkAltAbatimentos.LookupValue, 0),
                                                       strToIntDef(DblkAltOutros.LookupValue, 0));

end;

procedure TfrmCadTpDocxAltxMod.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTPDOCXALTXMODULO.GravaTPDOCXALTXMODULO(strToInt(sIDMODULO),
                                                       strToInt(sTIPODOC),
                                                       strToIntDef(sCODALTJUROS, 0),
                                                       strToIntDef(sCODALTDESC, 0),
                                                       strToIntDef(sCODALTABAT,0),
                                                       strToIntDef(sCODALTOUTROS,0));

end;

procedure TfrmCadTpDocxAltxMod.CmeCadastroDelete(Sender: TObject);
begin
  sTIPODOC      := DblkTipoDocumento.LookupValue;
  sCODALTDESC   := dblkAltDescontos.LookupValue;
  sCODALTJUROS  := dblkAltJuros.LookupValue;
  sCODALTABAT   := dblkAltAbatimentos.LookupValue;
  sCODALTOUTROS := DblkAltOutros.LookupValue;
  sIDMODULO     := DblkModulo.lookupValue;
  inherited;
end;

end.
