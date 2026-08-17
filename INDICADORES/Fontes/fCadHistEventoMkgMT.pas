unit fCadHistEventoMkgMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE HISTORICO DE EVENTOS DE MARKETING  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  22/05/2002
//      Data de Término :  22/05/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, uCMTypes, mImovel,
  uCtrlEventoMkg, FCadastroMT;

type
  TfrmCadHistEventoMkgMT = class(TFrmCadastroMTImob)
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cmdtIni: TCMDateTimePicker;
    cmdtFim: TCMDateTimePicker;
    CdsIDHISTEVENTO: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsIDEVENTO: TFloatField;
    CdsDATAINICIO: TDateTimeField;
    CdsDATAFIM: TDateTimeField;
    CdsNOME_EXTENSO: TStringField;
    DBcboEvento: TwwDBLookupCombo;
    molImovel1: TmolImovel;
    cdsEvento: TCMClientDataSet;
    cdsEventoIDEVENTO: TFloatField;
    cdsEventoDESCRICAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlEventoMkg     : TCtrlEventoMkg;
    function VerificaPreenchimento : Boolean;

  public
    { Public declarations }
  end;

var
  frmCadHistEventoMkgMT: TfrmCadHistEventoMkgMT;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

{ TfrmCadHistEventoMkg }

procedure TfrmCadHistEventoMkgMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlEventoMkg     := TCtrlEventoMkg.Create;
  CtrlEventoMkg.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlEventoMkg.CdsHistEventoMkg := Cds;

  // Carrega cds de Lookup
  cdsEvento.Data := CtrlEventoMkg.LookupEventoMkg;
end;

procedure TfrmCadHistEventoMkgMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  if MontaSelect.RetornouValor then begin
     Cds.Data := CtrlEventoMkg.SelecionaHistEventoMkg( StrToInt(MontaSelect.ValoresChave[0]) );
     molImovel1.iImovel        := CdsIDIMOVEL.AsInteger;
     molImovel1.edtImovel.Text := CdsNOME_EXTENSO.AsString;
  end;
end;

procedure TfrmCadHistEventoMkgMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  molImovel1.btnBuscaImovel.SetFocus;
end;

procedure TfrmCadHistEventoMkgMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  molImovel1.btnBuscaImovel.SetFocus;
end;

procedure TfrmCadHistEventoMkgMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsIDIMOVEL.AsFloat := molImovel1.iImovel;
  Accept := CtrlEventoMkg.GravaHistEventoMkg;
end;

procedure TfrmCadHistEventoMkgMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoMkg.GravaHistEventoMkg;
end;

procedure TfrmCadHistEventoMkgMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadHistEventoMkgMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if molImovel1.iImovel <= 0 then
        raise EValidacao.CreateVal('Selecione um Imóvel',molImovel1.btnBuscaImovel);

     if DBcboEvento.LookupValue = '' then
        raise EValidacao.CreateVal('Selecione um Evento',DBcboEvento);

     if cmdtIni.Text = '' then
        raise EValidacao.CreateVal('Informe a data inicial do Evento',cmdtIni);

     if cmdtFim.Text = '' then
        raise EValidacao.CreateVal('Informe a data final do Evento',cmdtFim);
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

procedure TfrmCadHistEventoMkgMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro quando for edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then begin
    Cds.Data := CtrlEventoMkg.SelecionaHistEventoMkg( cdsIDHISTEVENTO.AsInteger );
    molImovel1.iImovel        := CdsIDIMOVEL.AsInteger;
    molImovel1.edtImovel.Text := CdsNOME_EXTENSO.AsString;
  end;
end;

end.
