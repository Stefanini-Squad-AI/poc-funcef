unit fCadBaixaContraAlteradorMT;
{*******************************************************}
{ Analista Responsável: Helen V. Bianchi                }
{ Atualizado Em: 09/10/2011                             }
{ SOL: 136341 Kintana : 815095                          } 
{*******************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, wwdblook, Mask, wwdbedit, Provider, DBTables, Wwquery,
  dBaseDados, uSistema, uMensErro, uMidasUtil, uCtrlBaixaContraAlterador,
  uComunsImobiliario, uVerificaPreenchimento, Wwdotdot, Wwdbcomb, uCmSqlParams,
  DBCtrls,uCtrlTipoAlterador,uCtrlTipoImovel;

type
  TfrmCadBaixaContraAlteradorMT = class(TfrmCadastroGridMTImob)
    CMSqlParams1: TCMSqlParams;
    CdsTipoImovel: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    CdsAlterador: TCMClientDataSet;
    CdsAlteradorDESCRICAO: TStringField;
    CdsAlteradorCODALTERADOR: TFloatField;
    dsAlterador: TwwDataSource;
    Label1: TLabel;
    DBLkTipoImovel: TwwDBLookupCombo;
    Label2: TLabel;
    DBcboAlterador: TwwDBLookupCombo;
    CdsIDBAIXACONTRA: TFloatField;
    CdsACRESDECRES: TStringField;
    CdsCODTIPIMOVEL: TStringField;
    CdsCODALTERADOR: TFloatField;
    CdsIDMODULO: TFloatField;
    CdsVACRESDECRE: TStringField;
    CdsDESCRICAO: TStringField;
    dbRadioAcre_Desc: TDBRadioGroup;
    cdsVerificaBaixaContraAlt: TCMClientDataSet;
    cdsVerificaBaixaContraAltIDBAIXACONTRA: TFloatField;
    cdsVerificaBaixaContraAltACRESDECRES: TStringField;
    cdsVerificaBaixaContraAltCODTIPIMOVEL: TStringField;
    cdsVerificaBaixaContraAltCODALTERADOR: TFloatField;
    cdsVerificaBaixaContraAltIDMODULO: TFloatField;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CdsBeforeScroll(DataSet: TDataSet);
    procedure dbRadioAcre_DescChange(Sender: TObject);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlTipoAlterador: TCtrlTipoalterador;
    CtrlTipoImovel: tCtrlTipoImovel;
    CtrlBaixaContraAlterador: TCtrlBaixaContraAlterador;

  public
    { Public declarations }
  end;

var
  frmCadBaixaContraAlteradorMT: TfrmCadBaixaContraAlteradorMT;
  sIdBaixaContra : String;
implementation

{$R *.DFM}

{ TfrmCadBaixaContraAlteradorMT }

procedure TfrmCadBaixaContraAlteradorMT.FazerRefresh;
begin
  inherited;
  cds.Data := CtrlBaixaContraAlterador.LookupBaixaContraAlterador('', Sistema.Idmodulo);
end;

procedure TfrmCadBaixaContraAlteradorMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  CdsIDMODULO.Value := Sistema.IdModulo;
  //I - Insert / U - Update / D - Delete
  Accept := CtrlBaixaContraAlterador.GravaBaixaContraAlterador('I');
end;

procedure TfrmCadBaixaContraAlteradorMT.FormCreate(Sender: TObject);
begin
  Icon := Application.Icon;
  CtrlBaixaContraAlterador := tCtrlBaixaContraAlterador.Create;
  CtrlBaixaContraAlterador.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlBaixaContraAlterador.CdsBaixaContraAlterador := Cds;

  CtrlTipoAlterador := TCtrlTipoAlterador.Create;
  CtrlTipoAlterador.InitializeAs(CtrlBaixaContraAlterador);
  CdsAlterador.Data := CtrlTipoAlterador.ListTipoImovel_AcDes('','');

  CtrlTipoImovel := TCtrlTipoImovel.Create;
  CtrlTipoImovel.InitializeAs(CtrlBaixaContraAlterador);
  CdsTipoImovel.Data := CtrlTipoImovel.LookupTipoImovel;
  sIdBaixaContra := '0';
  FazerRefresh;
end;

procedure TfrmCadBaixaContraAlteradorMT.CmeCadastroEdit(Sender: TObject);
begin
  //Cds.Data := CtrlBaixaContraAlterador.LookupBaixaContraAlterador(CdsCODTIPIMOVEL.AsString,Sistema.IdModulo);
  if CdsACRESDECRES.Value = 'A' then
     CdsAlterador.Data := CtrlTipoAlterador.ListTipoImovel_AcDes('D',DBLkTipoImovel.Text)
  else
     CdsAlterador.Data := CtrlTipoAlterador.ListTipoImovel_AcDes('C',DBLkTipoImovel.Text);
  DBcboAlterador.Enabled := True;
  inherited;
end;

procedure TfrmCadBaixaContraAlteradorMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlBaixaContraAlterador);
  FreeAndNil(CtrlTipoAlterador);
  FreeAndNil(CtrlTipoImovel);
  inherited;
end;

procedure TfrmCadBaixaContraAlteradorMT.bbtnConfirmarClick(
  Sender: TObject);
begin
  try
     if  CdsCODTIPIMOVEL.Value = '' then
     begin
         MsgDlg('É necessário preencher o Tipo de Imóvel. ','Aviso',mtWarning,[mbOk],0);
         exit;
     end;
     if  CdsACRESDECRES.Value = '' then
     begin
         MsgDlg('É necessário informar o tipo : Acréscimo ou Desconto. ','Aviso',mtWarning,[mbOk],0);
         exit;
     end;
     if  CdsCODALTERADOR.Value <= 0 then
     begin
         MsgDlg('É necessário informar o Alterador. ','Aviso',mtWarning,[mbOk],0);
         exit;
     end;
     if cds.State in [dsinsert,dsedit] then
     begin
           cdsVerificaBaixaContraAlt.Data :=  CtrlBaixaContraAlterador.VerificaBaixaContraAlterador(
                                                                        CdsCODTIPIMOVEL.Value,
                                                                        CdsACRESDECRES.Value,
                                                                        Sistema.IdModulo);
           if not (cdsVerificaBaixaContraAlt.isEmpty) then
           begin
               if cds.State in [dsedit] then
               begin
                  if cdsVerificaBaixaContraAltIDBAIXACONTRA.Value <> CdsIDBAIXACONTRA.Value then
                     raise EValidacao.CreateVal('Associação de alterador para esse tipo de imóvel já definido.', DBcboAlterador);
               end
               else
                     raise EValidacao.CreateVal('Associação de alterador para esse tipo de imóvel já definido.', DBcboAlterador);
           end;
           MsgDlg('Cadastro Concluído. ','Aviso',mtWarning,[mbOk],0);
     end;
  except
     on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
     end;
  end;
  inherited;
end;

procedure TfrmCadBaixaContraAlteradorMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  //I - Insert / U - Update / D - Delete
  Accept := CtrlBaixaContraAlterador.GravaBaixaContraAlterador('U');
end;

procedure TfrmCadBaixaContraAlteradorMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  //I - Insert / U - Update / D - Delete
  Accept := CtrlBaixaContraAlterador.GravaBaixaContraAlterador('D', sIdBaixaContra);
end;

procedure TfrmCadBaixaContraAlteradorMT.dbGrdTitleButtonClick(  Sender: TObject; AFieldName: String);
begin
  inherited;
  cds.IndexFieldNames  := AFieldName;
end;

procedure TfrmCadBaixaContraAlteradorMT.CdsBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  sIdBaixaContra := CdsIDBAIXACONTRA.asstring  ;
end;

procedure TfrmCadBaixaContraAlteradorMT.dbRadioAcre_DescChange(  Sender: TObject);
begin
  inherited;
  if cds.State in [dsedit, dsinsert] then
  begin
      if (DBLkTipoImovel.Text <> '') then
      begin
         CdsCODALTERADOR.Value := 0 ;
         if dbRadioAcre_Desc.ItemIndex = 0 then
            CdsAlterador.Data := CtrlTipoAlterador.ListTipoImovel_AcDes('D',DBLkTipoImovel.Text)
         else
            CdsAlterador.Data := CtrlTipoAlterador.ListTipoImovel_AcDes('C',DBLkTipoImovel.Text);
         DBcboAlterador.Enabled := True;
      end;
  end;
end;

end.
