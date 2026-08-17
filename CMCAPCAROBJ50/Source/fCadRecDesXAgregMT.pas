//========================================================================================
// Analista : Marcus Oliveira
// Pendencia: 24035
// Descrição: Não permitir o relacionamento de 2 impostos com o mesmo código de imposto
// Data     : 14/01/2007
//========================================================================================
// Alteração: andre tavares - pendência 15380 - 31/07/2004  - De Para

unit fCadRecDesXAgregMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, Buttons, StdCtrls, wwdblook,
  CMDBLookupCombo, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  uCtrlTipRecdesxtipagre, uCtrlTiporecebdesemb, uCtrlPrograma, uCtrlCentroCusto,
  uCtrlParamIntegra, uSistema, DBasedados, uVerificaPreenchimento, uMensErro,
  FCadastroGridMTCMCapCar;

type
  TfrmCadRecDesXAgregMT = class(TfrmCadastroGridMTCMCapCar)
    panFiltro: TPanel;
    CdsTipoRD: TCMClientDataSet;
    CdsCentCust: TCMClientDataSet;
    CdsPrograma: TCMClientDataSet;
    Label1: TLabel;
    CmbTipoDesemb: TCMDBLookupCombo;
    Label2: TLabel;
    CmbCentCusto: TCMDBLookupCombo;
    Label3: TLabel;
    CmbPrograma: TCMDBLookupCombo;
    PnlCtrls: TPanel;
    BtnIncluiDesemb: TSpeedButton;
    BtnIncluiTodosDesemb: TSpeedButton;
    BtnExcluiAllDesembAssoc: TSpeedButton;
    BtnExcluiDesembAssoc: TSpeedButton;
    PnlDesemb: TPanel;
    PnlTitDesemb: TPanel;
    GrdTipDesemb: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    DsCdsImpAgreg: TwwDataSource;
    CdsImpAgreg: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    CMSqlParams2: TCMSqlParams;
    sqlValCPMF: TCMSqlParams;
    procedure BtnIncluiTodosDesembClick(Sender: TObject);
    procedure BtnExcluiAllDesembAssocClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmbTipoDesembCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbGrdDblClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmbCentCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmbProgramaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure BtnIncluiDesembClick(Sender: TObject);
    procedure BtnExcluiDesembAssocClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlTiporecebdesemb: TCtrlTiporecebdesemb;
    CtrlTipRecdesxtipagre: TCtrlTipRecdesxtipagre;
    CtrlPrograma: TCtrlPrograma;
    CtrlCentroCusto: TCtrlCentroCusto;

    Procedure InsereDirEsq;
    Procedure InsereEsqDir;
    function VerificaPreenchimento: boolean;
  public
    { Public declarations }
  end;

var
  frmCadRecDesXAgregMT: TfrmCadRecDesXAgregMT;

implementation

{$R *.DFM}

procedure TfrmCadRecDesXAgregMT.InsereDirEsq;
begin
  Cds.Append;

  //Marcus Oliveira
  cds.FieldByName('CODIMPOSTO').AsInteger := CdsImpAgreg.FieldByName('CODIMPOSTO').AsInteger;
  cds.FieldByName('CODTIPOCUSTAGREG').asinteger := CdsImpAgreg.FieldByName('CODTIPOCUSTAGREG').asinteger;
  cds.FieldByName('DESCCUSTAGREG').asstring := CdsImpAgreg.FieldByName('DESCCUSTAGREG').asstring;
  cds.FieldByName('RECPAG').AsString := ParamIntegra.RecPag;
  cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  cds.FieldByName('CODTIPRECDES').AsString := Trim(CmbTipoDesemb.LookupValue);
  If CmbCentCusto.Text = '' Then
    cds.FieldByName('CODCENTROCUSTO').Clear
  Else
    cds.FieldByName('CODCENTROCUSTO').AsString := CmbCentCusto.LookupValue;
  cds.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
  If CmbPrograma.Text = '' Then
    cds.FieldByName('IDPROGRAMA').Clear
  Else
    cds.FieldByName('IDPROGRAMA').AsInteger := StrToIntDef(CmbPrograma.LookupValue, 0);
  cds.Post;
  CdsImpAgreg.Delete;
end;

procedure TfrmCadRecDesXAgregMT.InsereEsqDir;
begin
  CdsImpAgreg.Append;
  //Marcus Oliveira P.24035
  CdsImpAgreg.FieldByName('CODIMPOSTO').AsInteger := cds.FieldByName('CODIMPOSTO').AsInteger;
  CdsImpAgreg.FieldByName('CODTIPOCUSTAGREG').asinteger := Cds.FieldByName('CODTIPOCUSTAGREG').asinteger;
  CdsImpAgreg.FieldByName('DESCCUSTAGREG').asstring := Cds.FieldByName('DESCCUSTAGREG').asstring;
  CdsImpAgreg.Post;
  Cds.Delete;
end;

procedure TfrmCadRecDesXAgregMT.BtnIncluiTodosDesembClick(Sender: TObject);
begin
  inherited;
  If Not CdsImpAgreg.IsEmpty Then
  Begin
    CdsImpAgreg.First;
    While Not CdsImpAgreg.Eof Do
      InsereDirEsq;
  End;
end;

procedure TfrmCadRecDesXAgregMT.BtnExcluiAllDesembAssocClick(
  Sender: TObject);
begin
  inherited;
  If Not Cds.IsEmpty Then
  Begin
    Cds.First;
    While Not Cds.Eof Do
      InsereEsqDir;
  End;

end;

procedure TfrmCadRecDesXAgregMT.FormCreate(Sender: TObject);
begin
  inherited;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  If ParamIntegra.RecPag = 'P' Then
  Begin
    HelpContext           := 30057;
    bbtnAjuda.HelpContext := 30057;
  End
  Else
  Begin
    // OBS.: Não mexi no Help Context do Contas a Receber...
    HelpContext           := 40077;
    bbtnAjuda.HelpContext := 40077;
  End;
// Daniel Simões - 25/01/2006 - Início------------------------------------------

  If ParamIntegra.RecPag = 'P' Then
  Begin
    Caption := 'Tipo de Desembolso x Impostos Agregados';
    Label1.Caption := 'Tipos de Desembolso';
  End
  Else
  Begin
    Caption := 'Tipo de Recebimento x Impostos Agregados';
    Label1.Caption := 'Tipos de Recebimento';
  End;

  CtrlTipRecdesxtipagre := TCtrlTipRecdesxtipagre.create;
  CtrlPrograma := TCtrlPrograma.create;
  CtrlCentroCusto := TCtrlCentroCusto.create;
  CtrlTiporecebdesemb := TCtrlTiporecebdesemb.create;

  CtrlTipRecdesxtipagre.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CtrlTiporecebdesemb.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CtrlPrograma.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlCentroCusto.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);

  CdsTipoRD.data := CtrlTiporecebdesemb.ListTiporecebdesemb(ParamIntegra.RecPag, Sistema.idEmpresa, 'A', 'S', '', 'S');

  // início - andre tavares - pendência 15380 - 31/07/2004
  CdsCentCust.data := CtrlCentroCusto.ListaCentroCusto(Sistema.idEmpresa, '', true, 0, '', paramintegra.PlanoCentroCusto, 'A');
  // fim - andre tavares - pendência 15380 - 31/07/2004

  CdsPrograma.data := CtrlPrograma.ListaPrograma;
  CtrlTipRecdesxtipagre.cds := cds;

  If ParamIntegra.RecPag = 'R' Then
    CdsTipoRD.fieldbyname('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; '
  Else
    CdsTipoRD.fieldbyname('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';

  MontaSelect.Filtro.Add('RD.RECPAG = ''' + ParamIntegra.RecPag + '''');
  MontaSelect.Filtro.Add('RD.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  FazerRefresh;
end;

procedure TfrmCadRecDesXAgregMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil (CtrlTiporecebdesemb);
  FreeAndNil (CtrlTipRecdesxtipagre);
  FreeAndNil (CtrlPrograma);
  FreeAndNil (CtrlCentroCusto);

  inherited;
end;

procedure TfrmCadRecDesXAgregMT.FazerRefresh;
var
  sCodTipoDesemb: string;
begin
  inherited;
  if CmbTipoDesemb.Text = '' then
    sCodTipoDesemb := '-99999'   // abrir a grid em branco
  else
    sCodTipoDesemb := Trim(CmbTipoDesemb.Lookupvalue);

  cds.data := CtrlTiprecdesxtipagre.ListTipImpAgrAsso(2, ParamIntegra.RecPag,
      0, Sistema.idEmpresa, sCodTipoDesemb, Trim(CmbPrograma.Lookupvalue), Trim(CmbCentCusto.lookupvalue));

end;

procedure TfrmCadRecDesXAgregMT.CmbTipoDesembCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  FazerRefresh;
end;

procedure TfrmCadRecDesXAgregMT.dbGrdDblClick(Sender: TObject);
begin
  // inherited;

end;

function TfrmCadRecDesXAgregMT.VerificaPreenchimento: boolean;
begin
  Result := true;
  try

    if (CmbTipoDesemb.Text = '') and (ParamIntegra.RecPag = 'P') then
      raise EValidacao.createVal('O tipo de Desembolso é obrigatório!', CmbTipoDesemb);

    if (CmbTipoDesemb.Text = '') and (ParamIntegra.RecPag = 'R') then
      raise EValidacao.createVal('O tipo de Recebimento é obrigatório!', CmbTipoDesemb);

  except
    on ev : EValidacao do
    begin
       Result := false;
       if ev.Show then MsgDlg(ev.message, 'Segregação de Recursos', mtWarning, [mbOk], 0);
       Repaint;
       if ev.Control.CanFocus then ev.Control.SetFocus;
       Exit;
    end;
  end;

end;

procedure TfrmCadRecDesXAgregMT.CmeCadastroFind(Sender: TObject);
begin
  //inherited;
  if MontaSelect.RetornouValor then begin
    CmbTipoDesemb.LookupValue := MontaSelect.ValoresChave[0];
    CmbCentCusto.LookupValue  := MontaSelect.ValoresChave[1];
    CmbPrograma.LookupValue   := MontaSelect.ValoresChave[2];
    FazerRefresh;
  end;
end;

procedure TfrmCadRecDesXAgregMT.CmbCentCustoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  FazerRefresh;
end;

procedure TfrmCadRecDesXAgregMT.CmbProgramaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  FazerRefresh;
end;

procedure TfrmCadRecDesXAgregMT.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

procedure TfrmCadRecDesXAgregMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  panFiltro.Enabled := true;
  FazerRefresh;
end;

procedure TfrmCadRecDesXAgregMT.BtnIncluiDesembClick(Sender: TObject);
begin
  inherited;
  InsereDirEsq
end;

procedure TfrmCadRecDesXAgregMT.BtnExcluiDesembAssocClick(
  Sender: TObject);
begin
  inherited;
  InsereEsqDir;
end;

procedure TfrmCadRecDesXAgregMT.sbtnAlterarClick(Sender: TObject);
begin
  if not VerificaPreenchimento then begin
    sbtnAlterar.Down := false;
  end else begin
    inherited;
    Cds.Cancel;
    panFiltro.Enabled := false;

    cds.data := CtrlTiprecdesxtipagre.ListTipImpAgrAsso(1, ParamIntegra.RecPag,
      0, Sistema.idEmpresa, Trim(CmbTipoDesemb.LookupValue), Trim(CmbPrograma.Lookupvalue), Trim(CmbCentCusto.lookupvalue));

    cdsImpAgreg.data := CtrlTiprecdesxtipagre.ListTipImpAgrNaoAsso(1, ParamIntegra.RecPag, Sistema.idEmpresa,
      Trim(CmbTipoDesemb.Lookupvalue),
      CmbPrograma.lookupvalue,
      Trim(CmbCentCusto.lookupvalue));
  end;

end;

procedure TfrmCadRecDesXAgregMT.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := true;
end;

procedure TfrmCadRecDesXAgregMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
  var
  _cdsCompara , _cdsTela: TClientDataSet;
  sImposto: String;
  cdsAux : TCMClientDataSet;
  sTipoImposto : String;
begin
  inherited;
  CmeCadastro.RepetirInsert := false;
  inherited;

  _cdsCompara := TClientDataSet.Create(nil);
  _cdsTela := TClientDataSet.Create(nil);

  _cdsTela.data := cds.data;
  _cdsCompara.data := _CdsTela.data;

  _cdsTela.First;

  While not (_cdsTela.eof) do
  begin
     if _cdsTela.FieldByName('CODIMPOSTO').AsString <> '' then
     begin
        _cdsCompara.Filtered := False;
        _cdsCompara.Filter   := 'CODIMPOSTO = '+ _cdsTela.FieldByName('CODIMPOSTO').AsString;
        _cdsCompara.Filtered := True;
     end;

     If ( _cdsCompara.RecordCount > 1 ) and (_cdsTela.FieldByName('CODIMPOSTO').AsString <> '') then
      begin
     //Marcus Oliveira 24035 23/03/2007 inicio
        case _cdsTela.FieldByName('CODIMPOSTO').AsInteger of
          1  :  sTipoImposto := 'IRRF' ;
          2  :  sTipoImposto := 'INSS' ;
          15 :  sTipoImposto := 'ISS' ;
          16 :  sTipoImposto := 'PIS' ;
          17 :  sTipoImposto := 'CONFINS' ;
          18 :  sTipoImposto := 'CSLL' ;
          19 :  sTipoImposto := 'PIS/CONFINS/CSLL' ;
          20 :  sTipoImposto := 'CPMF' ;
        end;
     //Marcus Oliveira 24035 23/03/2007 fim.
     end;
     _cdsTela.Next;

  end;

  _cdsCompara.Filtered := False;

  sImposto := 'Impossivel relacionar impostos com o mesmo codigo ('+sTipoImposto+') para o mesmo relacionamento. ';
  //Marcus Oliveira P. 24573 27/02/2007  
  If (sTipoImposto = '') then
  begin
   //Grava
     Accept := CtrlTiprecdesxtipagre.GravarTiprecdesxtipagre(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
     If Not Accept Then
       MsgDlg(CtrlTiprecdesxtipagre.MessageInfo, 'Erro', mtError, [mbOK], 0)
     else
       CmeCadastroCancel(sender);

     If Not Accept Then
       MsgDlg(CtrlTiprecdesxtipagre.MessageInfo, 'Erro', mtError, [mbOK], 0)
     else
       CmeCadastroCancel(sender);
  end
  else
  begin
     Accept := False;
     CtrlTiprecdesxtipagre.MessageInfo := sImposto;
     If Not Accept Then
       MsgDlg(CtrlTiprecdesxtipagre.MessageInfo, 'Erro', mtError, [mbOK], 0)
     else
       CmeCadastroCancel(sender);

  end;

  _cdsTela.Free;
  _cdsCompara.Free;
  //MArcus Oliveira 24035 12/01/2007 fim

  //Marcus Oliveira P. 24573 27/02/2007  inicio
  cdsAux := TCMClientDataSet.Create(nil);

  sqlValCPMF.Prepare;
  sqlValCPMF.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  sqlValCPMF.ClientDataSet := cdsAux;
  sqlValCPMF.Open;

  if ( cdsAux.FieldByName('CODTIPDOCCPMF').AsString = '' ) and (cds.Locate( 'CodImposto',20,[])) then

  begin
    MessageDlg('Para utilizar o imposto CPMF, é necessário ir em ' + #13 +
               'Sistemas \ Configuraçãoes \ Parametro do sistema e selecionar ' + #13 +
               'o Tipo de Documento para CPMF. ', mtError, [mbOK], 0 );

    Accept := false;
  end;
  cdsAux.Free;
end;

end.
