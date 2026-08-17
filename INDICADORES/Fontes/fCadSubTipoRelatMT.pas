unit fCadSubTipoRelatMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE SUBTIPO DE RELATORIOS  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  20/05/2002
//      Data de Término :  21/05/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMTImob, StdCtrls, Mask, wwdbedit, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  Wwdbspin, DBCtrls, wwdblook, mIndicador, uCMTypes,
  uCtrlTipoIndicador, FCadastroMestreDetMT;

type
  TfrmCadSubTipoRelatMT = class(TFrmCadastroMestreDetMTImob)
    dbedtDescricao: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbrgTipo: TDBRadioGroup;
    Label4: TLabel;
    dbspnOrdem: TwwDBSpinEdit;
    DBcboTipoIndicador: TwwDBLookupCombo;
    CdsIDSUBTIPO: TFloatField;
    CdsIDTIPO: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsTipo: TCMClientDataSet;
    CdsTipoIDTIPO: TFloatField;
    CdsTipoDESCRICAO: TStringField;
    cdsDet: TCMClientDataSet;
    cdsDetIDGRPINDICADOR: TFloatField;
    cdsDetIDSUBTIPO: TFloatField;
    cdsDetIDINDICADOR: TFloatField;
    cdsDetTIPOLANCA: TStringField;
    cdsDetORDEM: TFloatField;
    cdsDetDSC_TIPOLANCA: TStringField;
    cdsDetDSC_INDICADOR: TStringField;
    molIndicador1: TmolIndicador;
    lblReport: TLabel;
    dbedtReport: TwwDBEdit;
    CdsIDREPORTS: TFloatField;
    dbedtOrigemCM: TwwDBEdit;
    CdsORIGEMCM: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
    CtrlTipoIndicador    : TCtrlTipoIndicador;

    procedure SelecionaMestreDetalhe(const iId: Integer);
    function  VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadSubTipoRelatMT: TfrmCadSubTipoRelatMT;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

{ TfrmCadSubTipoRelat }

procedure TfrmCadSubTipoRelatMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlTipoIndicador    := TCtrlTipoIndicador.Create;

  CtrlTipoIndicador.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlTipoIndicador.CdsSubTipoIndicador := Cds;
  CtrlTipoIndicador.CdsGrpIndicador     := CdsDet;

  // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.
  CdsDet.CreateDataSet;

  // Carrega o Cds de Lookup com os valores dos devidos CtrlObjects
  CdsTipo.Data := CtrlTipoIndicador.LookupTipoIndicador;
end;


procedure TfrmCadSubTipoRelatMT.SelecionaMestreDetalhe(const iId: Integer);
begin
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  Cds.Data    := CtrlTipoIndicador.LookupSubTipoIndicador( iId );
  CdsDet.Data := CtrlTipoIndicador.LookupGrpIndicador( iId );
end;


procedure TfrmCadSubTipoRelatMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     SelecionaMestreDetalhe( StrToInt(MontaSelect.ValoresChave[0]) );
  end;
end;

procedure TfrmCadSubTipoRelatMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoIndicador.GravaSubTipoIndicador;
end;

procedure TfrmCadSubTipoRelatMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoIndicador.ExcluiSubTipoIndicador;
  if Accept then SelecionaMestreDetalhe( -2 );
end;

procedure TfrmCadSubTipoRelatMT.CmeDetalheConfirma(Sender: TObject);
begin
  if cdsDet.State in [dsInsert,dsEdit] then begin
     if molIndicador1.iIndicador > 0 then begin
        cdsDetIDINDICADOR.AsInteger  := molIndicador1.iIndicador;
        cdsDetDSC_INDICADOR.AsString := molIndicador1.sIndicador;
        if dbrgTipo.ItemIndex = 0 then
             cdsDetDSC_TIPOLANCA.AsString := 'PREVISTO'
        else cdsDetDSC_TIPOLANCA.AsString := 'REALIZADO';
        inherited;
     end else begin
        MsgDlg('Selecione um Indicador','Aviso',mtWarning,[mbOK],0);
     end;
  end else begin
     inherited;
  end;
end;

procedure TfrmCadSubTipoRelatMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  molIndicador1.edtIndicador.Text := '';
  molIndicador1.iIndicador        := -1;
  dbrgTipo.ItemIndex              := 0;
end;

procedure TfrmCadSubTipoRelatMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  SelecionaMestreDetalhe( CdsIDSUBTIPO.AsInteger );
end;

procedure TfrmCadSubTipoRelatMT.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco
  SelecionaMestreDetalhe( -2 );
  inherited;
  dbcboTipoIndicador.SetFocus;
end;

procedure TfrmCadSubTipoRelatMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbcboTipoIndicador.SetFocus;
end;

procedure TfrmCadSubTipoRelatMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadSubTipoRelatMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if DBcboTipoIndicador.LookupValue = '' then
        raise EValidacao.CreateVal('Selecione o Tipo de Relatório',DBcboTipoIndicador);

     if dbedtDescricao.Text = '' then
        raise EValidacao.CreateVal('Informe a Descrição do Subtipo de Relatório',dbedtDescricao);
  except
     on ev : EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;
  end;
  Result := True;
end;

procedure TfrmCadSubTipoRelatMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o Registro quando for alteração ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then SelecionaMestreDetalhe( cdsIDSUBTIPO.AsInteger );
end;

procedure TfrmCadSubTipoRelatMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  molIndicador1.iIndicador := cdsDetIDINDICADOR.AsInteger;
  molIndicador1.sIndicador := cdsDetDSC_INDICADOR.AsString;
  molIndicador1.edtIndicador.Text := cdsDetDSC_INDICADOR.AsString;
end;

procedure TfrmCadSubTipoRelatMT.dbgrdDetTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsDet.IndexFieldNames := AFieldName;
end;

end.
