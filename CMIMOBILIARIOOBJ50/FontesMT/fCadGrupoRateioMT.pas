unit fCadGrupoRateioMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE GRUPOS DE RATEIO  ( MT )
//
//      Módulo          :  Comuns Imobiliário
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  30/09/2002
//      Data de Término :  01/10/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls2, Mask, DBCtrls,
  uCMTypes, uCtrlGrupoRateio, uCtrlImovel, mImovelAtivo, TREdit, fProgresso;

type
  TfrmCadGrupoRateioMT = class(TFrmCadastroMestreDetMTImob)
    Label1: TLabel;
    DBedtNomeGrupo: TDBEdit;
    Label21: TLabel;
    DBedtCodigo: TDBEdit2;
    Label3: TLabel;
    lblQuantImoveis: TLabel;
    CdsIDGRUPORATEIO: TFloatField;
    CdsGRRDESCRICAO: TStringField;
    CdsIMOCODIGO: TStringField;
    CdsIDMODULO: TFloatField;
    CdsDet: TCMClientDataSet;
    CdsDetDSC_IMOVEL: TStringField;
    CdsDetIDGRUPORATEIO: TFloatField;
    CdsDetIDIMOVEL: TFloatField;
    CdsDetGXIPERCENTRATEIO: TFloatField;
    CdsDetIMOCODIGO: TStringField;
    molImovelAtivo1: TmolImovelAtivo;
    Label10: TLabel;
    dbedtPercent: TDBRealEdit;
    Label2: TLabel;
    edtTotalRateio: TDBRealEdit;
    Label4: TLabel;
    Toolbar972: TToolbar97;
    sbtnCalcularAre: TToolbarButton97;
    sbtnReplicar: TToolbarButton97;
    CdsDetCODTIPIMOVEL: TStringField;
    sbtnInsMultSelect: TToolbarButton97;
    sbtnCalcularCtb: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnReplicarClick(Sender: TObject);
    procedure sbtnCalcularAreClick(Sender: TObject);
    procedure sbtnInsMultSelectClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure sbtnCalcularCtbClick(Sender: TObject);
  private
    { Private declarations }
    CtrlGrupoRateio : TCtrlGrupoRateio;
    CtrlImovel      : TCtrlImovel;
    cdsVerifImovel  : TCMClientDataSet;

    procedure Progresso (vParams: array of variant);    
    procedure SelecionaMestreDetalhe (const iIdGrupoRateio : Integer);
    function  TotalRateio : Extended;
    function  VerificaPreenchimento : Boolean;
    function  VerificaPreenchimentoDetalhe : Boolean;
    function  ImovelNoGrupo(const iIdImovel:Integer) : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadGrupoRateioMT: TfrmCadGrupoRateioMT;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uVerificaPreenchimento, dMS;

{$R *.DFM}

procedure TfrmCadGrupoRateioMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlGrupoRateio := TCtrlGrupoRateio.Create;
  CtrlImovel      := TCtrlImovel.Create;

  CtrlGrupoRateio.idEmpresa := Sistema.IdEmpresa;
  CtrlGrupoRateio.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                             ComunsImobiliario.MensErroMT);
  CtrlImovel.InitializeAs( CtrlGrupoRateio );

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlGrupoRateio.CdsGrupoRateio  := Cds;
  CtrlGrupoRateio.CdsGrupoxImovel := CdsDet;

  // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.
  CdsDet.CreateDataSet;

  // Adiciona filtro do módulo ao monta select
  MontaSelect.Filtro.Add('IDMODULO = ' + IntToStr(Sistema.IdModulo));

  // Cria o Cds para Verificação do imóvel no grupo
  cdsVerifImovel := TCMClientDataSet.Create( nil );

  CtrlGrupoRateio.Progresso := Progresso;  
end;

procedure TfrmCadGrupoRateioMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlGrupoRateio );
  FreeAndNil( CtrlImovel );
  inherited;
end;

procedure TfrmCadGrupoRateioMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // Os botões de Replica e Calculo não foram herdados
  if (Cds.IsEmpty) or (cmeCadastro.Operacao in[opInserir, opAlterar]) then begin
    sbtnReplicar.Enabled := False;
    sbtnCalcularAre.Enabled := False;
    sbtnCalcularCtb.Enabled := False;
  end else begin
    sbtnReplicar.Enabled := True;
    sbtnCalcularAre.Enabled := True;
    sbtnCalcularCtb.Enabled := True;    
  end;
end;

procedure TfrmCadGrupoRateioMT.SelecionaMestreDetalhe(const iIdGrupoRateio: Integer);
begin
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  Cds.Data    := CtrlGrupoRateio.LookupGrupoRateio( -1, iIdGrupoRateio );
  CdsDet.Data := CtrlGrupoRateio.LookupGrupoxImovel( iIdGrupoRateio );
  TotalRateio;
end;

procedure TfrmCadGrupoRateioMT.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco
  SelecionaMestreDetalhe( -2 );
  inherited;
  // Carrega Defaults
  CdsIDMODULO.AsInteger := Sistema.IdModulo;
  dbedtCodigo.SetFocus;
end;

procedure TfrmCadGrupoRateioMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  // Para consertar alguns registros sem o modulo gravado
  if CdsIDMODULO.IsNull then CdsIDMODULO.AsInteger := Sistema.IdModulo;
  dbedtCodigo.SetFocus;
end;

procedure TfrmCadGrupoRateioMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     SelecionaMestreDetalhe( StrToInt(MontaSelect.ValoresChave[0]) );
  end;
end;

procedure TfrmCadGrupoRateioMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlGrupoRateio.GravaGrupoRateio;
end;

procedure TfrmCadGrupoRateioMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlGrupoRateio.ExcluiGrupoRateio;
  if Accept then SelecionaMestreDetalhe( -2 );
end;

procedure TfrmCadGrupoRateioMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // Retorna os valores originais antes da alteração
  SelecionaMestreDetalhe( CdsIDGRUPORATEIO.AsInteger );
end;

procedure TfrmCadGrupoRateioMT.CmeDetalheConfirma(Sender: TObject);
begin
  if cdsDet.State in [dsInsert,dsEdit] then begin
     if VerificaPreenchimentoDetalhe then begin
        CdsDetIDIMOVEL.AsInteger    := molImovelAtivo1.iImovel;
        CdsDetDSC_IMOVEL.AsString   := molImovelAtivo1.edtImovel.Text;
        CdsDetIMOCODIGO.AsString    := molImovelAtivo1.sImoCodigo;
        CdsDetCODTIPIMOVEL.AsString := molImovelAtivo1.sCodTipoImo;
        inherited;
     end;
  end else begin
     inherited;
  end;
end;

function TfrmCadGrupoRateioMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if dbedtCodigo.Text = '' then
        raise EValidacao.CreateVal('Informe o Código do Grupo', DBedtCodigo);

     if dbedtNomeGrupo.Text = '' then
        raise EValidacao.CreateVal('Informe a Nome do Grupo', dbedtNomeGrupo);
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

function TfrmCadGrupoRateioMT.VerificaPreenchimentoDetalhe: Boolean;
begin
  Result := False;
  try
     if molImovelAtivo1.iImovel <= 0 then
        raise EValidacao.CreateVal('Selecione um Imóvel', molImovelAtivo1.btnBuscaImovel);

     if ImovelNoGrupo( molImovelAtivo1.iImovel ) then
        raise EValidacao.CreateVal('O imóvel selecionado já pertence ao grupo', molImovelAtivo1.btnBuscaImovel);
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

procedure TfrmCadGrupoRateioMT.CmeDetalheInsert(Sender: TObject);
begin
  molImovelAtivo1.btnLimpaImovelClick( Self );
  
  // Carrega o cds para posterior verificação do imovel, pela ImovelNoGrupo
  cdsVerifImovel.Data := cdsDet.Data;
  inherited;
end;

procedure TfrmCadGrupoRateioMT.CmeDetalheEdit(Sender: TObject);
begin
  // carrega o frame com o conteúdo do registro
  molImovelAtivo1.iImovel        := CdsDetIDIMOVEL.AsInteger;
  molImovelAtivo1.edtImovel.Text := CdsDetDSC_IMOVEL.AsString;
  molImovelAtivo1.sImoCodigo     := CdsDetIMOCODIGO.AsString;
  molImovelAtivo1.sCodTipoImo    := CdsDetCODTIPIMOVEL.AsString;

  // Carrega o cds para posterior verificação do imovel, pela ImovelNoGrupo
  cdsVerifImovel.Data := cdsDet.Data;
  inherited;
end;

procedure TfrmCadGrupoRateioMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;


procedure TfrmCadGrupoRateioMT.dbgrdDetTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsDet.IndexFieldNames := AFieldName;
end;

procedure TfrmCadGrupoRateioMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição 
  if cmeCadastro.Operacao = opAlterar then
     SelecionaMestreDetalhe( CdsIDGRUPORATEIO.AsInteger );
end;

function TfrmCadGrupoRateioMT.TotalRateio: Extended;
var iQtde, iPerc : Extended;
begin
  with cdsDet do begin
    DisableControls;
    First;
    iQtde := RecordCount;
    iPerc := 0;
    while not Eof do begin
      iPerc := iPerc + CdsDetGXIPERCENTRATEIO.AsFloat;
      Next;
    end;
    First;
    EnableControls;
  end;
  edtTotalRateio.Value := iPerc;
  if iQtde = 1 then
       lblQuantImoveis.Caption := FormatFloat('###0', iQtde) + ' Imóvel'
  else lblQuantImoveis.Caption := FormatFloat('###0', iQtde) + ' Imóveis';
end;


procedure TfrmCadGrupoRateioMT.sbtnReplicarClick(Sender: TObject);
var iIdGrupoNovo : Integer;
begin
  inherited;
  if MsgDlg('Confirma a cópia do grupo?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     if CtrlGrupoRateio.ReplicaGrupoRateio( CdsIDGRUPORATEIO.AsInteger, iIdGrupoNovo ) then begin
       SelecionaMestreDetalhe( iIdGrupoNovo );
     end;
  end;
  sbtnReplicar.Down := False;
end;

procedure TfrmCadGrupoRateioMT.sbtnCalcularAreClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma o calculo do rateio pela área dos imóveis?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     if CtrlGrupoRateio.CalculaGrupoRateioAre( CdsIDGRUPORATEIO.AsInteger ) then begin
       SelecionaMestreDetalhe( CdsIDGRUPORATEIO.AsInteger );
     end;
  end;
  sbtnCalcularAre.Down := False;
end;

procedure TfrmCadGrupoRateioMT.sbtnCalcularCtbClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma o calculo do rateio pelo custo contábil atual dos imóveis?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

     CtrlGrupoRateio.CreateThreadProgresso;
     frmProgresso.MostraFormProgresso('Calculando Rateio pelo Valor Contábil...');
     if CtrlGrupoRateio.CalculaGrupoRateioCtb( CdsIDGRUPORATEIO.AsInteger,
                                               CtrlGrupoRateio.ProgressFileName ) then begin
       SelecionaMestreDetalhe( CdsIDGRUPORATEIO.AsInteger );
     end;
     frmProgresso.EscondeFormProgresso;
     CtrlGrupoRateio.FreeThreadProgresso;

  end;
  sbtnCalcularCtb.Down := False;
end;


procedure TfrmCadGrupoRateioMT.sbtnInsMultSelectClick(Sender: TObject);
var iIdImovel : Integer;
begin
  inherited;
  // Carrega o cds para posterior verificação do imovel, pela ImovelNoGrupo
  cdsVerifImovel.Data := cdsDet.Data;

  with dtmMS do begin
    MS_ImovelAtivo.MultiSelect := True;
    MS_ImovelAtivo.Executar;

    if MS_ImovelAtivo.RetornouValor then begin
      Screen.Cursor := crHourGlass;
      while MS_ImovelAtivo.GetNextSelected do begin
        iIdImovel := StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[1]);

        if not ImovelNoGrupo( iIdImovel ) then begin
          cdsDet.Insert;
          CdsDetIDIMOVEL.AsInteger       := iIdImovel;
          CdsDetDSC_IMOVEL.AsString      := MS_ImovelAtivo.ValoresChave[2] + ' - ' + MS_ImovelAtivo.ValoresChave[3];
          CdsDetIMOCODIGO.AsString       := MS_ImovelAtivo.ValoresChave[7];
          CdsDetCODTIPIMOVEL.AsString    := MS_ImovelAtivo.ValoresChave[4];
          CdsDetGXIPERCENTRATEIO.AsFloat := 0;
          CdsDet.Post;
        end;
      end;
      Screen.Cursor := crDefault;
    end;
    MS_ImovelAtivo.MultiSelect := False;
  end;
  sbtnInsMultSelect.Down := False;
end;

function TfrmCadGrupoRateioMT.ImovelNoGrupo( const iIdImovel: Integer): Boolean;
begin
  Result := False;
  if cdsVerifImovel.Locate('IDIMOVEL',iIdImovel,[]) then begin
    if CdsDet.State <> dsEdit then Result := True;
  end;
end;

procedure TfrmCadGrupoRateioMT.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // Atualiza o botão de seleção múltipla que não foi herdado
  sbtnInsMultSelect.Enabled := sbtnInsDet.Enabled;
end;


procedure TfrmCadGrupoRateioMT.Progresso(vParams: array of variant);
begin
  if (vParams[1] = 1) and (High(vParams) = 5) then
       frmProgresso.MostraFormProgresso( vParams[5] )
  else frmProgresso.AndaFormProgresso(vParams[1], vParams[2]);
end;

end.
