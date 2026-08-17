unit FEstornaReavaliacao;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 113136
Data........: 04/07/2022 
Responsável.: Cássio Florencio Rovaroto
Descrição...: Implementação da provisão de custos de imóveis.
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina.............: DesfazReavaliacao
//N. SIG.............: 46687
//Data da Alteração..: 26/02/2019
//Alteração Form.....: fEstornaRevaliacao
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na forma de estorno de reavaliação a partir de 2019. 
//***************************************************************************************
Rotina......: -
Nº SIG......: 38385
Data........: 23/01/2017
Responsável.: Peterson Victor
Descrição...: Alteração do Commit
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8222
Nº KINTANA..: 1577546
Data........: 02/04/2012
Responsável.: Wylliam Leite da Silva
Descrição...: Bloqueio para data bloqueada na contabilidade
--------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, TREdit, Grids, Wwdbigrd, Wwdbgrid,
  mFornecedor, wwdbdatetimepicker, CMDateTimePicker, mImovelouMestre,
  wwdblook, fcButton, fcImgBtn, fcShapeBtn, fcLabel, DBTables, Db, uCmClientDataSet,
  Wwdatsrc, Wwquery, uCtrlMovReavaliacao, uCtrlMovBaixa, uCtrlDomBem, {uCtrlCafObra}uCtrlImobObra,
  uCmSqlParams, DBClient,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab, uCtrlProvisaoImovel;

type
  TfrmEstornaReavaliacao = class(TfrmSairAjudaImob)
    Panel1: TPanel;
    lblTitulo: TfcLabel;
    ntbPrincipal: TNotebook;
    Bevel2: TBevel;
    Label15: TLabel;
    Label1: TLabel;
    Bevel4: TBevel;
    btnContinua: TfcShapeBtn;
    btnAtualizar: TfcShapeBtn;
    DBcboGrupo: TwwDBLookupCombo;
    molImovelouMestre1: TmolImovelouMestre;
    edtDataEstorno: TCMDateTimePicker;
    molFornecedor1: TmolFornecedor;
    Panel2: TPanel;
    dbgImovel: TwwDBGrid;
    pProgress: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    Label2: TLabel;
    Label3: TLabel;
    edtDataReavalia: TCMDateTimePicker;
    Bevel1: TBevel;
    btnVoltar: TfcShapeBtn;
    btnConfirmar: TfcShapeBtn;
    qryImovel: TwwQuery;
    dsImovel: TwwDataSource;
    updImovel: TUpdateSQL;
    qryImovelIDIMOVEL: TFloatField;
    qryImovelIMOVEL_EXTENSO: TStringField;
    qryImovelDATAREAVALIACAO: TDateTimeField;
    qryImovelESTORNA: TFloatField;
    btnSeleciona: TSpeedButton;
    btnLimpa: TSpeedButton;
    qryImovelIDAVALIADOR: TFloatField;
    qryImovelRAZAOSOCIAL: TStringField;
    cbApagaImovel: TCheckBox;
    Label9: TLabel;
    qryEstornaBaixa: TwwQuery;
    qryEstornaBaixaIDBEM: TFloatField;
    qryEstornaInc: TwwQuery;
    qryEstornaIncIDIMOVEL: TFloatField;
    qryEstornaIncIDBEM: TFloatField;
    cdsVerificaTipoReaval: TCMClientDataSet;
    sqlVerificaTipoReaval: TCMSqlParams;
    procedure btnContinuaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);
    procedure dbgImovelDblClick(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure DBcboGrupoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbgImovelCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgImovelTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    CtrlDomBem         : TCtrlDomBem; 
    CtrlMovBaixa       : TCtrlMovBaixa;
    //CtrlCafObra        : TCtrlCafObra;
    CtrlCafObra        : TCtrlImobObra;
    CtrlMovReavaliacao : TCtrlMovReavaliacao;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
    CtrlProvisaoImovel: TCtrlProvisaoImovel; // Cássio Rovaroto -  SIG nº 113136
    
    procedure AbreQueries;
    procedure AbreQueryImoveis;
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
    function  VerificaPreenchimentoSelecao : Boolean;
    function  DesfazReavaliacao: Boolean;

  public
    { Public declarations }
  end;

var
  frmEstornaReavaliacao: TfrmEstornaReavaliacao;
   bPeriodo : Boolean; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
implementation

uses UFuncoesImob, uSistema, dLookImobiliario, DCAF, 
     uComunsImobiliario, uVerificaPreenchimento, uMensErro, uDataBase, dEventoImovel,
     dImobiliario, dBaseDados, uModuloImobiliario;
{$R *.DFM}

procedure TfrmEstornaReavaliacao.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlMovBaixa       := TCtrlMovBaixa.Create;
   CtrlDomBem         := TCtrlDomBem.Create;
   //CtrlCafObra        := TCtrlCafObra.Create;
   CtrlCafObra        := TCtrlImobObra.Create;
   CtrlMovReavaliacao := TCtrlMovReavaliacao.Create;
   CtrlMovBaixa.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
   CtrlDomBem.InitializeAs( CtrlMovBaixa );
   CtrlCafObra.InitializeAs( CtrlMovBaixa );
   CtrlMovReavaliacao.InitializeAs( CtrlMovBaixa );
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlDomBem);
   //Cássio Rovaroto - SIG nº 113136 - Início
   CtrlProvisaoImovel := TCtrlProvisaoImovel.Create;
   CtrlProvisaoImovel.InitializeAs(CtrlDomBem);
   //Cássio Rovaroto - SIG nº 113136 - Fim

end;

procedure TfrmEstornaReavaliacao.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlMovBaixa );
  FreeAndNil( CtrlDomBem );
  FreeAndNil( CtrlCafObra );
  FreeAndNil( CtrlMovReavaliacao );
  FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  FreeAndNil(CtrlProvisaoImovel); //Cássio Rovaroto - SIG nº 113136
  inherited;
end;


procedure TfrmEstornaReavaliacao.AbreQueries;
begin
   // Abre Grupo Rateio
   LimpaParametros(dtmLookImobiliario.qryLookGrupoRateio);
   dtmLookImobiliario.qryLookGrupoRateio.ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
   dtmLookImobiliario.qryLookGrupoRateio.Open;

   edtDataReavalia.Text := '';
   molImovelouMestre1.edtImovel.Clear;
   molImovelouMestre1.lblImovelouMestre.Caption := '';
end;

procedure TfrmEstornaReavaliacao.FormShow(Sender: TObject);
begin
   inherited;
   AbreQueries;
   ntbPrincipal.PageIndex := 0;
end;

procedure TfrmEstornaReavaliacao.btnAtualizarClick(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;

procedure TfrmEstornaReavaliacao.DBcboGrupoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   // se for preenchido um grupo, limpa a seleção de Imóvel
   if DBcboGrupo.LookupValue <> '' then begin
      molImovelouMestre1.btnLimpaImovel.Click;
   end;
end;

procedure TfrmEstornaReavaliacao.molImovelouMestre1btnBuscaImovelClick(
  Sender: TObject);
begin
   inherited;
   molImovelouMestre1.btnBuscaImovelClick(Sender);
   // se for escolhido um Imóvel (ou Mestre), limpa a seleção de grupo
   if molImovelouMestre1.edtImovel.Text <> '' then begin
      DBcboGrupo.LookupValue := '';
   end;
end;

procedure TfrmEstornaReavaliacao.AbreQueryImoveis;
begin
   with qryImovel do begin
      LimpaParametros(qryImovel);
      ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
      if DBcboGrupo.LookupValue <> '' then
         ParamByName('PIDGRUPORATEIO').AsInteger := StrToInt(DBcboGrupo.LookupValue);
      if molImovelouMestre1.edtImovel.Text <> '' then begin
         if molImovelouMestre1.iMestre = -1 then
              ParamByName('PIDIMOVELMESTRE').AsInteger := molImovelouMestre1.iImovel
         else ParamByName('PIDIMOVEL').AsInteger := molImovelouMestre1.iImovel;
      end;

      if molFornecedor1.iFornecedor > 0 then
         ParamByName('PIDAVALIADOR').AsInteger := molFornecedor1.iFornecedor;

      if edtDataReavalia.Text <> '' then
         ParamByName('PDATAREAVALIACAO').AsDateTime := edtDataReavalia.DateTime;
      Open;
   end;
end;

procedure TfrmEstornaReavaliacao.btnContinuaClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimentoSelecao then begin
      AbreQueryImoveis;
      ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
   end;
end;

function TfrmEstornaReavaliacao.VerificaPreenchimentoSelecao : Boolean;
begin
   Result := False;
   try
      if edtDataEstorno.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Estorno!', edtDataEstorno);

         // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if  edtDataReavalia.Text <> '' then
      begin
           if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataReavalia.Text) then
           begin
              bPeriodo := true;
              raise EValidacao.CreateVal('Período bloqueado pela Contabilidade - Data reavaliação !', edtDataReavalia);
           end;
      end; 
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataEstorno.Text) then
      begin
         bPeriodo := true;
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade - Data Estorno!', edtDataEstorno);
      end;

         // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

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

procedure TfrmEstornaReavaliacao.btnSelecionaClick(Sender: TObject);
begin
   inherited;
   // Marca todos os imóveis para estorno
   qryImovel.DisableControls;
   qryImovel.First;
   while not qryImovel.eof do begin
      qryImovel.Edit;
      qryImovelESTORNA.AsInteger := 1;
      qryImovel.Post;
      qryImovel.Next;
   end;
   qryImovel.First;
   qryImovel.EnableControls;
end;

procedure TfrmEstornaReavaliacao.btnLimpaClick(Sender: TObject);
begin
  inherited;
   // Desmarca todos os imóveis para estorno
   qryImovel.DisableControls;
   qryImovel.First;
   while not qryImovel.eof do begin
      qryImovel.Edit;
      qryImovelESTORNA.Clear;
      qryImovel.Post;
      qryImovel.Next;
   end;
   qryImovel.First;
   qryImovel.EnableControls;
end;

procedure TfrmEstornaReavaliacao.dbgImovelDblClick(Sender: TObject);
begin
   inherited;
   // Marca / desmarca o imóvel para estorno
   if not qryImovel.IsEmpty then begin
      qryImovel.Edit;
      qryImovelESTORNA.AsInteger := (qryImovelESTORNA.AsInteger Xor 1);
      qryImovel.Post;
   end;
end;

procedure TfrmEstornaReavaliacao.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;
   case ntbPrincipal.PageIndex of
      0 : lblTitulo.Caption := 'Desfazer Reavaliação de Imóveis [ Seleção ]';
      1 : lblTitulo.Caption := 'Desfazer Reavaliação de Imóveis [ Imóveis ]';
   end;
end;

procedure TfrmEstornaReavaliacao.btnVoltarClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;


procedure TfrmEstornaReavaliacao.btnConfirmarClick(Sender: TObject);
begin
   inherited;
   qryImovel.DisableControls;
   DesabilitaBotoes;
   try
      if MsgDlg('Confirma o Estorno das Reavaliações Selecionadas ?', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then begin
         try
            StartTransacao;
            bPeriodo := False; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
            if DesfazReavaliacao then begin
               CommitTransacao;
               MsgDlg('Reavaliações Desfeitas com Sucesso !', 'Aviso', mtWarning, [mbOk], 0);
               ntbPrincipal.PageIndex := 0;
            end else begin
               RollBackTransacao;
               if bPeriodo = false then // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
                  MsgDlg('Ocorreram ERROS durante o Estorno das Reavaliações', 'Erro', mtError, [mbOk], 0);
            end;
         except
            RollBackTransacao;
            MsgDlg('Ocorreram ERROS durante o Estorno das Reavaliações', 'Erro', mtError, [mbOk], 0);
         end;
      end;
   finally
      HabilitaBotoes;
      EscondeProgresso(ProgressBar, lblProgress, lblContador);
      qryImovel.EnableControls;
   end;
end;

procedure TfrmEstornaReavaliacao.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   btnVoltar.Enabled    := False;
   btnConfirmar.Enabled := False;
   btnSeleciona.Enabled := False;
   btnLimpa.Enabled     := False;
end;

procedure TfrmEstornaReavaliacao.HabilitaBotoes;
begin
   btnVoltar.Enabled    := True;
   btnConfirmar.Enabled := True;
   btnSeleciona.Enabled := True;
   btnLimpa.Enabled     := True;
   Screen.Cursor        := crDefault;
end;


function TfrmEstornaReavaliacao.DesfazReavaliacao : Boolean;
var iQuant, iAtual : Integer;
    sSql : String;
    cdsBemReav, cdsTaxasDep, cdsPlanoPatroxBem, cdsImagem : TCMClientDataSet;
begin
   Result := True;
   iAtual := 1;
   iQuant := qryImovel.RecordCount;
   MostraProgresso(ProgressBar, lblProgress, lblContador, iQuant, 'Desfazendo Reavaliações...');

   qryImovel.First;
   try
      try
         // Instancia os cds necessários para a inclusão do bem
         cdsBemReav        := TCMClientDataSet.Create( nil );
         cdsTaxasDep       := TCMClientDataSet.Create( nil );
         cdsPlanoPatroxBem := TCMClientDataSet.Create( nil );
         cdsImagem         := TCMClientDataSet.Create( nil );
         // Associa os cds locais aos cds do Ctrl
         CtrlDomBem.cds               := cdsBemReav;
         CtrlDomBem.cdsTaxasDep       := cdsTaxasDep;
         CtrlDomBem.cdsPlanoPatroxBem := cdsPlanoPatroxBem;
         CtrlDomBem.cdsImagem         := cdsImagem;

         // Estorna todos as Reavaliações Selecionadas
         while not qryImovel.Eof do begin

            // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
            if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryImovelDATAREAVALIACAO.AsString) then
            begin
                 MsgDlg ('Período bloqueado pela Contabilidade','Aviso',mtWarning,[mbok],0);
                 Result := False;
                 bPeriodo := true;
                 exit;
            end;
            // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
            if qryImovelESTORNA.AsInteger = 1 then begin

               // Abre tabela com os bens reavaliados
               LimpaParametros(dtmCAF.qryReavalia);
               dtmCAF.qryReavalia.ParamByName('PIDIMOVEL').AsInteger := qryImovelIDIMOVEL.AsInteger;
               dtmCAF.qryReavalia.ParamByName('PDATAREAVALIACAO').AsDateTime := qryImovelDATAREAVALIACAO.AsDateTime;
               dtmCAF.qryReavalia.Open;

               // Abre tabela com possíveis inclusões a serem estornadas
               LimpaParametros(qryEstornaInc);
               qryEstornaInc.ParamByName('PIDIMOVEL').AsInteger := qryImovelIDIMOVEL.AsInteger;
               qryEstornaInc.ParamByName('PDATAINCLUSAO').AsDateTime := qryImovelDATAREAVALIACAO.AsDateTime;
               qryEstornaInc.Open;

               // Abre tabelas com possíveis baixas de bens do processo de reavaliação
               LimpaParametros(qryEstornaBaixa);
               qryEstornaBaixa.ParamByName('PIDIMOVEL').AsInteger   := qryImovelIDIMOVEL.AsInteger;
               qryEstornaBaixa.ParamByName('PDATABAIXA').AsDateTime := qryImovelDATAREAVALIACAO.AsDateTime;
               qryEstornaBaixa.Open;

               // Exclui em REAVALIAXREAVALIA todos os bens do imóvel
               try
                  LimpaParametros(dtmCAF.qryDelReavalia);
                  dtmCAF.qryDelReavalia.ParamByName('PIDIMOVEL').AsInteger := qryImovelIDIMOVEL.AsInteger;
                  dtmCAF.qryDelReavalia.ParamByName('PDATAREAVALIACAO').AsDateTime := qryImovelDATAREAVALIACAO.AsDateTime;
                  dtmCAF.qryDelReavalia.ExecSQL;
               except
                  raise Exception.Create('Erro ao atualizar a tabela REAVALIAXREAVALIA');
               end;

               // Estorna cada bem no AtivoFixo
               while not dtmCAF.qryReavalia.Eof do begin

                  // Verifica o método da Reavaliação I ou II
                  sqlVerificaTipoReaval.Prepare;
                  sqlVerificaTipoReaval.ParambyName('IDPESSOA').AsFloat   := Sistema.IdEmpresa;
                  sqlVerificaTipoReaval.ParambyName('IDBEM').AsFloat      := dtmCAF.qryReavaliaIDBEM.AsFloat;
                  sqlVerificaTipoReaval.ParambyName('DATAMOV').AsDateTime := dtmCAF.qryReavaliaDATAREAVALIACAO.AsDateTime;
                  sqlVerificaTipoReaval.Open;
                  CtrlMovReavaliacao.OpenTransaction := False;
                  //Cássio Rovaroto - SIG nº 46687 - Início
                  //if cdsVerificaTipoReaval.IsEmpty then begin  // Método TaxaDep
                  if (cdsVerificaTipoReaval.IsEmpty) and ((Sistema.IdModulo = 54) and (qryImovelDATAREAVALIACAO.AsString < '30/12/2018')) then begin  // Método TaxaDep
                  //Cássio Rovaroto - SIG nº 46687
                     if not CtrlMovReavaliacao.EstornaReavaliacao(Sistema.IdModulo,
                                                                  Sistema.IdEmpresa,
                                                                  Sistema.IdUsuario,
                                                                  dtmCAF.qryReavaliaIDBEM.AsInteger,
                                                                  dtmCAF.qryReavaliaDATAREAVALIACAO.AsDateTime,
                                                                  edtDataEstorno.Date ) then begin
                        raise Exception.Create( CtrlMovReavaliacao.MessageInfo );
                     end;
                  end else begin
                     if not CtrlMovReavaliacao.EstornaReavaliacaoII(Sistema.IdModulo,
                                                                    Sistema.IdEmpresa,
                                                                    Sistema.IdUsuario,
                                                                    dtmCAF.qryReavaliaIDBEM.AsInteger,
                                                                    dtmCAF.qryReavaliaDATAREAVALIACAO.AsDateTime,
                                                                    edtDataEstorno.Date ) then begin
                        raise Exception.Create( CtrlMovReavaliacao.MessageInfo );
                     end;
                  end;

                  //Cássio Rovaroto - SIG nº 113136 - Início
                  // - Estorna a provisão do custo de cada bem, a partir da data de movimentação.
                  if not CtrlProvisaoImovel.EstornaProvisaoCustoImovel(Sistema.IdUsuario,
                                                                       Sistema.IdModulo,
                                                                       Sistema.IdEmpresa,
                                                                       202,
                                                                       dtmCAF.qryReavaliaDATAREAVALIACAO.AsDateTime,
                                                                       True,
                                                                       True,
                                                                       dtmCAF.qryReavaliaIDBEM.AsInteger,
                                                                       ) then
                  begin
                    raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
                  end;
                  //Cássio Rovaroto - SIG nº 113136 - Fim

                  dtmCAF.qryReavalia.Next;
               end;

               // Exclui possíveis inclusões de bens do processo de reavaliação
               if not qryEstornaInc.IsEmpty then begin
                  while not qryEstornaInc.Eof do begin

                     // Exclui em ImovelXBem
                     LimpaParametros(dtmCAF.qryDelImovelxBem);
                     dtmCAF.qryDelImovelxBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
                     dtmCAF.qryDelImovelxBem.ParamByName('PIDIMOVEL').AsInteger := qryEstornaIncIDIMOVEL.AsInteger;
                     dtmCAF.qryDelImovelxBem.ParamByName('PIDBEM').AsInteger    := qryEstornaIncIDBEM.AsInteger;
                     dtmCAF.qryDelImovelxBem.ExecSQL;

                     // Carrega os cds com as informações do bem a ser excluído
                     cdsBemReav.Data        := CtrlDomBem.ListaBem(Sistema.IdEmpresa, qryEstornaIncIDBEM.AsInteger);
                     cdsTaxasDep.Data       := CtrlDomBem.ListaBemxDep(Sistema.IdEmpresa, qryEstornaIncIDBEM.AsInteger);
                     cdsPlanoPatroxBem.Data := CtrlDomBem.ListaPlanoPatroxBem(Sistema.IdEmpresa, qryEstornaIncIDBEM.AsInteger);
                     cdsImagem.Data         := CtrlDomBem.CarregaImagem(-99);

                     // Desabilita a transação do CtrlObject e exclui o bem no CAF
                     CtrlDomBem.OpenTransaction := False;
                     if not CtrlDomBem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa,
                                                          Sistema.IdUsuario, 'R',
                                                          cdsBemReav.FieldByName('VALHISTORICO').AsFloat,
                                                          1 ) then begin
                        raise Exception.create( CtrlDomBem.MessageInfo );
                     end;

                     qryEstornaInc.Next;
                  end;
               end;

               // Estorna possíveis baixas de bens no processo de reavaliação
               if not qryEstornaBaixa.IsEmpty then begin
                  while not qryEstornaBaixa.Eof do begin

                     // Desfaz a alienação dos bens no CAF
                     CtrlMovBaixa.OpenTransaction := False;
                     if not CtrlMovBaixa.EstornaBaixa(Sistema.IdModulo,
                                                      Sistema.IdEmpresa,
                                                      Sistema.IdUsuario,
                                                      qryEstornaBaixaIDBEM.AsInteger,
                                                      qryImovelDATAREAVALIACAO.AsDateTime,
                                                      edtDataEstorno.DateTime ) then
                        raise Exception.create( CtrlMovBaixa.MessageInfo );

                     qryEstornaBaixa.Next;
                  end;
               end;

               // Exclui possíveis lançamentos de reavaliação de obras
               with dtmCAF do begin
                  LimpaParametros(dtmCAF.qryReavaliaObra);
                  qryReavaliaObra.ParamByName('PIDIMOVEL').AsInteger := qryImovelIDIMOVEL.AsInteger;
                  qryReavaliaObra.ParamByName('PDTALANCAMENTO').AsDateTime := qryImovelDATAREAVALIACAO.AsDateTime;
                  qryReavaliaObra.Open;
                  if not qryReavaliaObra.IsEmpty then begin
                     while not qryReavaliaObra.Eof do begin

                        CtrlCafObra.OpenTransaction := False;
                        if not CtrlCafObra.EstornaLancObra( Sistema.IdModulo,
                                                            Sistema.IdEmpresa,
                                                            Sistema.IdUsuario,
                                                            qryReavaliaObraIDCAFOBRA.AsInteger,
                                                            edtDataReavalia.Date,
                                                            edtDataEstorno.Date,
                                                            qryReavaliaObraIDOBRALANC.AsInteger ) then begin
                            raise Exception.Create( CtrlCafObra.MessageInfo );
                        end;

                        qryReavaliaObra.Next;
                     end;
                  end;
               end;

               // Exclui Evento do Imovel
               try
                  with dtmEventoImovel.qryDeleteEventoImovel do begin
                     LimpaParametros(dtmEventoImovel.qryDeleteEventoImovel);
                     ParamByName('PIDIMOVEL').AsInteger  := qryImovelIDIMOVEL.AsInteger;
                     ParamByName('PTIPOEVENTO').AsString := 'RV';
                     ParamByName('PEVIDATA').AsDateTime  := qryImovelDATAREAVALIACAO.AsDateTime;
                     ExecSQL;
                  end;

                  // Remove dados da ultima reavaliação do Cadastro de Imóveis
                  if cbApagaImovel.Checked then begin
                     sSql := 'UPDATE IMOVEL ' +
                             '   SET IMODATAREAVAL = NULL, ' +
                             '       IMOVLRREAVAL  = NULL, ' +
                             '       IMOMOEDAREAVAL = NULL ' +
                             ' WHERE IDIMOVEL = ' + IntToStr(qryImovelIDIMOVEL.AsInteger);
                     if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then begin
                        Result := False;
                        Exit;
                     end;
                  end;
               except
                  raise Exception.Create('Erro ao atualizar a tabela EVENTO / IMOVEL');
               end;
            end;
            qryImovel.Next;

            iAtual := iAtual + 1;
            AndaProgresso(ProgressBar, lblProgress, lblContador, iAtual, iQuant);

            CommitTransacao;   // Peterson Victor SIG38385


            if not (dtmBaseDados.dbBaseDados.InTransaction) then // Peterson Victor SIG38385
             StartTransacao;                                     // Peterson Victor SIG38385


         end;
      except
         on E : Exception do begin
            Result := False;
            MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
   finally
      FreeAndNil( cdsBemReav );
      FreeAndNil( cdsTaxasDep );
      FreeAndNil( cdsPlanoPatroxBem );
      FreeAndNil( cdsImagem );
   end;
end;



procedure TfrmEstornaReavaliacao.dbgImovelCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmEstornaReavaliacao.dbgImovelTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



end.
