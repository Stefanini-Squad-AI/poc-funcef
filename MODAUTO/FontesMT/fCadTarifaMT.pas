{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Andre Mesquita                  }
{                                                       }
{*******************************************************}

unit fCadTarifaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, wwdblook,
  Wwdotdot, Wwdbcomb, Mask, wwdbedit, uCmSqlParams,
  uCtrlDstTarifa, TREdit, wwdbdatetimepicker, CMDateTimePicker, uCtrlMoeda,
  CMProcura;

type
  TfrmCadTarifaMT = class(TFrmCadastroMestreDetMT)
    dbedDescricao: TwwDBEdit;
    lblDescricao: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    lblMoeda: TLabel;
    dbrgTipo: TDBRadioGroup;
    qryValores: TCMSqlParams;
    tsCargo: TTabSheet;
    cdsMoeda: TCMClientDataSet;
    cdsValores: TCMClientDataSet;
    cdsValoresIDDSTTARIFA: TFloatField;
    cdsValoresDATADSTVALORES: TDateTimeField;
    cdsValoresVLRDST: TFloatField;
    qryTarifas: TCMSqlParams;
    cdsTarifaXCargo_NS: TCMClientDataSet;
    dsTarifaXCargo_NS: TwwDataSource;
    cdsTarifaXCargo_S: TCMClientDataSet;
    dsTarifaXCargo_S: TwwDataSource;
    pnlAssociacao: TPanel;
    pnlNaoAssociados: TPanel;
    pnlAssociados: TPanel;
    pnlBotoesAssociacao: TPanel;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    gridCNA: TwwDBGrid;
    gridCA: TwwDBGrid;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    qryCargosNS: TCMSqlParams;
    qryCargoS: TCMSqlParams;
    CMSqlParams1: TCMSqlParams;
    cdsMoedaMOECODIGO: TFloatField;
    cdsMoedaMOEDESC: TStringField;
    cdsMoedaMOESIGLA: TStringField;
    CMDateTimePicker1: TCMDateTimePicker;
    Label4: TLabel;
    dbredValor: TDBRealEdit;
    Label5: TLabel;
    cdsTarifaXCargo_SIDCARGO: TFloatField;
    cdsTarifaXCargo_STITULO: TStringField;
    cdsTarifaXCargo_SIDDSTTARIFA: TFloatField;
    chkEdicaoLivre: TDBCheckBox;
    Bevel1: TBevel;
    qryPrincipal: TCMSqlParams;
    CmeDetalheCargoSelecionado: TCmEventosCadastro;
    ProcuraCidade: TCMProcura;
    Label1: TLabel;
    MontaSelectCidade: TMontaSelect;
    dbrgDiasSemana: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure cdsTarifaXCargo_NSAfterScroll(DataSet: TDataSet);
    procedure cdsTarifaXCargo_SAfterScroll(DataSet: TDataSet);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheCargoSelecionadoAtualizaBotoes(Sender: TObject);
    procedure pnlControlesDetEnter(Sender: TObject);
  private
    idDstTarifa   : Integer;
    iIndTipo      : Integer;
    ctrlDstTarifa : TCtrlDSTTarifa;
    ctrlMoeda     : TCtrlMoeda;
    procedure CarregaConsulta(const idTarifa, idIndTipo : Integer);
    function validarFormulario : Boolean;
    procedure adicionarCargo(const Todos : Boolean = False);
    procedure removerCargo(const Todos : Boolean = False);
    procedure atualizarBotaoCargo;
  public
    { Public declarations }
  end;

var
  frmCadTarifaMT: TfrmCadTarifaMT;

implementation

{$R *.DFM}

uses uCtrlPadroes, DBaseDados, uSistema, uMensErro, uCMTypes;

procedure TfrmCadTarifaMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa o Controlador Principal
  ctrlDstTarifa := TCtrlDstTarifa.Create;
  ctrlDstTarifa.Initialize
  (
     DtmBaseDados.DbBaseDados,
     True,
     Sistema.ConnectionType,
     Sistema.ConnectionSide,
     Sistema.AppRemoteServer,
     True );
  cds.Data                := ctrlDstTarifa.ListTarifa(-2);
  cdsValores.Data         := ctrlDstTarifa.ListValores(-1);
  cdsTarifaXCargo_NS.Data := ctrlDstTarifa.ListCargosNaoAssociados(-1,-1);
  cdsTarifaXCargo_S.Data  := ctrlDstTarifa.ListCargosAssociados(-1,-1);

  // Inicializa o Controlador de MOEDA e carrega o CDS
  ctrlMoeda := TCtrlMoeda.Create;
  ctrlMoeda.InitializeAs(ctrlDstTarifa);
  cdsMoeda.Data := ctrlMoeda.ListaMoeda;

  // Completa a referência do controlador, vinculando os CDS's da TELA
  // aos CDS's do Controlador
  ctrlDstTarifa.CdsDstTarifa       := cds;
  ctrlDstTarifa.CdsDstValores      := cdsValores;
  ctrlDstTarifa.cdsDstTarifaXCargo := cdsTarifaXCargo_S;
end;

procedure TfrmCadTarifaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ctrlDstTarifa.GravarDstTarifa;
end;

procedure TfrmCadTarifaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // se houve busca, abre a query principal com apenas o registro selecionado
  with MontaSelect do
    begin
      if retornouValor then
        begin
          // Recolhe os valores de retorno
          if (ValoresChave[0] <> '') then
            idDstTarifa := StrToInt(ValoresChave[0]);
          // end if
          if (ValoresChave[1] <> '') then
            iIndTipo    := StrToInt(ValoresChave[1]);
          // end if
          
          // Carrega CDS's com base nos valores de retorno
          CarregaConsulta(idDstTarifa, iIndTipo);
          //
          pgctrlDetalhe.ActivePage := tbsDet;
          tbcDetalhe.TabIndex := 0;
        end;
      // end if
    end;
  // end with

end;

procedure TfrmCadTarifaMT.sbtnAdicionarClick(Sender: TObject);
begin
  adicionarCargo;
end;

procedure TfrmCadTarifaMT.sbtnRemoverClick(Sender: TObject);
begin
  removerCargo;
end;

procedure TfrmCadTarifaMT.sbtnAdicionarTudoClick(Sender: TObject);
begin
  adicionarCargo(True);
end;

procedure TfrmCadTarifaMT.sbtnRemoverTudoClick(Sender: TObject);
begin
  removerCargo(True);
end;

procedure TfrmCadTarifaMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ctrlMoeda);
  inherited;
end;

procedure TfrmCadTarifaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if ctrlDstTarifa.existeFilho(idDstTarifa) then
    begin
      MsgDlg('Não é possível excluir esta tarifa.'+#13+
             'Exitem valores/cargos dependentes. ','Aviso',mtWarning,[mbOk],0);
      Accept := False;
    end
  else
    CmeCadastroApplyInsert(sender,accept);
end;

procedure TfrmCadTarifaMT.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  atualizarBotaoCargo;
end;

procedure TfrmCadTarifaMT.cdsTarifaXCargo_NSAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CmeDetalheAtualizaBotoes(Self);
end;

procedure TfrmCadTarifaMT.cdsTarifaXCargo_SAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CmeDetalheAtualizaBotoes(Self);
end;

procedure TfrmCadTarifaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
 // Recarrega o cds com o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then
    CarregaConsulta(idDstTarifa, iIndTipo)
  else
    if cmeCadastro.Operacao = opInserir then
      CarregaConsulta(-2, -1);
  // end if
end;

procedure TfrmCadTarifaMT.CarregaConsulta(const idTarifa,
  idIndTipo: Integer);
begin
  Cds.Data                := ctrlDstTarifa.ListTarifa(idTarifa);
  cdsValores.Data         := ctrlDstTarifa.ListValores(idTarifa);
  cdsTarifaXCargo_S.Data  := ctrlDstTarifa.ListCargosAssociados(idIndTipo, idTarifa);
  cdsTarifaXCargo_NS.Data := ctrlDstTarifa.ListCargosNaoAssociados(idIndTipo, idTarifa);
end;

function TfrmCadTarifaMT.validarFormulario: Boolean;
begin
  Result := False;
  if dbrgTipo.ItemIndex < 0 then
    begin
      MsgDlg('Tipo de Tarifa é obrigatório!','Informação',mtInformation,[mbOk],0);
      exit;
    end;
  // end if

  if (trim(dbedDescricao.Text) = '') then
    begin
      MsgDlg('Descrição é obrigatória!','Informação',mtInformation,[mbOk],0);
      exit;
    end;
  // end if

  if (trim(dblcMoeda.Text) = '') then
    begin
      MsgDlg('Moeda é obrigatória!','Informação',mtInformation,[mbOk],0);
      exit;
    end;
  // end if

  Result := True;
end;

procedure TfrmCadTarifaMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := validarFormulario;
end;

procedure TfrmCadTarifaMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CarregaConsulta(-2, -1);
end;

procedure TfrmCadTarifaMT.AdicionarCargo(const Todos : Boolean = False);

  procedure Adicionar;
  begin
    // inclui o registro no grid de Associados e exclui de Não-Associado
    gridCA.DataSource.DataSet.Append;
    gridCA.DataSource.DataSet.FieldByName('IDDSTTARIFA').AsInteger := idDstTarifa;
    gridCA.DataSource.DataSet.FieldByName('IDCARGO').AsInteger :=
      gridCNA.DataSource.DataSet.FieldByName('IDCARGO').AsInteger;
    gridCA.DataSource.DataSet.FieldByName('TITULO').AsString :=
      gridCNA.DataSource.DataSet.FieldByName('TITULO').AsString;
    gridCA.DataSource.DataSet.Post;
    if not Todos then
      gridCNA.DataSource.DataSet.Delete;
  end;

begin
  if not (cds.State in [dsInsert, dsEdit]) then
    exit;
  // end if

  if todos then
    begin
      gridCNA.DataSource.DataSet.DisableControls;
      gridCA.DataSource.DataSet.DisableControls;
    end;
  // end if

  gridCNA.DataSource.DataSet.First;
  while not gridCNA.DataSource.DataSet.Eof do
    begin
      if todos then
        Adicionar
      else
        if gridCNA.IsSelectedRecord then
          Adicionar;
      // end if
      gridCNA.DataSource.DataSet.Next;
    end;
  // end while

  if todos then
    TCMClientDataSet(gridCNA.DataSource.DataSet).EmptyDataSet;
  // end if

  gridCA.DataSource.DataSet.First;
  gridCNA.DataSource.DataSet.First;

  if todos then
    begin
      gridCNA.DataSource.DataSet.EnableControls;
      gridCA.DataSource.DataSet.EnableControls;
    end;
  // end if
end;

procedure TfrmCadTarifaMT.RemoverCargo(const Todos : Boolean = False);

  procedure Remover;
  begin
    // inclui o registro no grid de Não-Associado e exclui de Associado
    gridCNA.DataSource.DataSet.Append;
    gridCNA.DataSource.DataSet.FieldByName('IDCARGO').AsInteger :=
      gridCA.DataSource.DataSet.FieldByName('IDCARGO').AsInteger;
    gridCNA.DataSource.DataSet.FieldByName('TITULO').AsString :=
      gridCA.DataSource.DataSet.FieldByName('TITULO').AsString;
    gridCNA.DataSource.DataSet.Post;
    if not todos then
      gridCA.DataSource.DataSet.Delete;
  end;

begin
  if not (cds.State in [dsInsert, dsEdit]) then
    exit;
  // end if

  if todos then
    begin
      gridCNA.DataSource.DataSet.DisableControls;
      gridCA.DataSource.DataSet.DisableControls;
    end;
  // end if

  gridCA.DataSource.DataSet.First;
  while not gridCA.DataSource.DataSet.Eof do
    begin
      if todos then
        Remover
      else
        if gridCA.IsSelectedRecord then
          Remover;
      // end if
      gridCA.DataSource.DataSet.Next;
    end;
  // end while

  if todos then
    TCMClientDataSet(gridCA.DataSource.DataSet).EmptyDataSet;
  // end if

  gridCA.DataSource.DataSet.First;
  gridCNA.DataSource.DataSet.First;

  if todos then
    begin
      gridCNA.DataSource.DataSet.EnableControls;
      gridCA.DataSource.DataSet.EnableControls;
    end;
  // end if
end;

procedure TfrmCadTarifaMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if dbrgTipo.ItemIndex < 0 then
    if CmeDetalhe.DataSource.DataSet.State in [dsInsert, dsEdit] then
      CmeDetalhe.Cancel(nil);
end;

procedure TfrmCadTarifaMT.atualizarBotaoCargo;
begin
  if cds.State in [dsInsert, dsEdit] then
    begin
      if (cdsTarifaXCargo_NS.IsEmpty) and
         ((cds.State in [dsInsert, dsEdit])) then
        begin
          sbtnAdicionar.Enabled     := False;
          sbtnAdicionarTudo.Enabled := False;
        end
      else
        begin
          sbtnAdicionar.Enabled     := True;
          sbtnAdicionarTudo.Enabled := True;
        end;
      // end if

      if (cdsTarifaXCargo_S.IsEmpty) and
         ((cds.State in [dsInsert, dsEdit])) then
        begin
          sbtnRemover.Enabled     := False;
          sbtnRemoverTudo.Enabled := False;
        end
      else
        begin
          sbtnRemover.Enabled     := True;
          sbtnRemoverTudo.Enabled := True;
        end;
      // end if
    end;
  // end if
end;

procedure TfrmCadTarifaMT.CmeDetalheCargoSelecionadoAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  atualizarBotaoCargo;
end;

procedure TfrmCadTarifaMT.pnlControlesDetEnter(Sender: TObject);
begin
  inherited;
  dbredValor.ShowHint := dbrgTipo.ItemIndex = 3;
  if dbrgTipo.ItemIndex = 3 then
    dbredValor.Hint := 'Se For Abatimento, Coloque o Valor Negativo'
  else
    dbredValor.Hint := '';
end;

end.
