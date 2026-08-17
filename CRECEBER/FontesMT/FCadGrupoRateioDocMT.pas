// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
//------------------------------------------------------------------------------


unit FCadGrupoRateioDocMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
   Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls2, Mask, DBCtrls,
   uCMTypes, uCtrlGrupoRateio, TREdit, FCadastroMestreDetMT,
   CMDBLookupCombo, wwdblook, uCmSqlParams, uCtrlParamIntegra;

type
   TfrmCadGrupoRateioDocMT = class(TFrmCadastroMestreDetMT)
      Label1: TLabel;
      DBedtNomeGrupo: TDBEdit;
      Label3: TLabel;
      lblQuantImoveis: TLabel;
      CdsDet: TCMClientDataSet;
      Label10: TLabel;
      dbedtPercent: TDBRealEdit;
      edtTotalRateio: TDBRealEdit;
      Label4: TLabel;
      lblUnidNegoc: TLabel;
      lblCentroRespon: TLabel;
      lblTipoRD: TLabel;
      Label6: TLabel;
      DBcboUnidNegoc: TwwDBLookupCombo;
      DBcboCentroRespon: TwwDBLookupCombo;
      DBcboTipoRD: TwwDBLookupCombo;
      DBcboCentCusto: TwwDBLookupCombo;
      Label13: TLabel;
      DBcboPrograma: TCMDBLookupCombo;
      Label11: TLabel;
      Label12: TLabel;
      DBcboPlano: TCMDBLookupCombo;
      DBcboPatro: TCMDBLookupCombo;
      sqlProgramaPrev: TCMSqlParams;
      CdsProgramaPrev: TCMClientDataSet;
      sqlCentroCusto: TCMSqlParams;
      CdsCentroCusto: TCMClientDataSet;
      sqlUnidNegoc: TCMSqlParams;
      cdsUnidNegoc: TCMClientDataSet;
      sqlCentroRespon: TCMSqlParams;
      CdsCentroRespon: TCMClientDataSet;
      CdsPatroPrev: TCMClientDataSet;
      sqlPatroPrev: TCMSqlParams;
      sqlPlanoPrev: TCMSqlParams;
      CdsPlanoPrev: TCMClientDataSet;
      sqlTipoRD: TCMSqlParams;
      CdsTipoRD: TCMClientDataSet;
      sqlCds: TCMSqlParams;
      sqlCdsDet: TCMSqlParams;
      Label2: TLabel;
      CdsIDGRUPORATEIO: TFloatField;
      CdsIDMODULO: TFloatField;
      CdsGRRDESCRICAO: TStringField;
      CdsDetIDPADRRATEIODOC: TFloatField;
      CdsDetIDGRUPORATEIO: TFloatField;
      CdsDetIDPROGRAMA: TFloatField;
      CdsDetDESCPROGRAMA: TStringField;
      CdsDetIDEMPRESAPROP: TFloatField;
      CdsDetRECPAG: TStringField;
      CdsDetCODTIPRECDES: TStringField;
      CdsDetTIPODESEMBOLSO: TStringField;
      CdsDetCODCENTROCUSTO: TStringField;
      CdsDetCENTROCUSTO: TStringField;
      CdsDetCODCENTRORESPON: TStringField;
      CdsDetCENTRORESPON: TStringField;
      CdsDetUNIDNEGOC: TFloatField;
      CdsDetUNIDNEGOCIO: TStringField;
      CdsDetIDPATRO: TFloatField;
      CdsDetPATRO: TStringField;
      CdsDetIDPLANOPREV: TFloatField;
      CdsDetPLANPREV: TStringField;
      CdsDetPERCENTRATEIO: TFloatField;

      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure CmeDetalheConfirma(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure dbgrdDetTitleButtonClick(Sender: TObject; AFieldName: String);
      procedure CmeCadastroAfterConfirma(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure DBcboUnidNegocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CdsDetBeforePost(DataSet: TDataSet);
      procedure DBcboCentroResponCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoRDCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboCentCustoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboProgramaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure CdsDetAfterPost(DataSet: TDataSet);

   private  // Private declarations

      CtrlGrupoRateio : TCtrlGrupoRateio;

      procedure SelecionaMestreDetalhe(const IDGrupoRateio: Integer);
      function  TotalRateio : Extended;
      function  VerificaPreenchimento : Boolean;
      function  VerificaPreenchimentoDetalhe : Boolean;

      procedure AbreQueries;
      procedure Totaliza;

   public   // Public declarations

      procedure MensErroMT(sMessageInfo: String);


   end;



var
  frmCadGrupoRateioDocMT: TfrmCadGrupoRateioDocMT;



implementation
{$R *.DFM}
uses
   dBaseDados, uDatabase, uMensErro, uSistema, uVerificaPreenchimento;




procedure TfrmCadGrupoRateioDocMT.AbreQueries;
begin
   if not(sqlUnidNegoc.Prepared) then sqlUnidNegoc.Prepare;
   sqlUnidNegoc.ParamByName('PIDPESSOA').AsFloat    := Sistema.IDEmpresa;
   sqlUnidNegoc.Open;

   if not(sqlCentroRespon.Prepared) then sqlCentroRespon.Prepare;
   sqlCentroRespon.ParamByName('PIDPESSOA').AsFloat := Sistema.IDEmpresa;
   sqlCentroRespon.Open;

   if not(sqlTipoRD.Prepared) then sqlTipoRD.Prepare;
   sqlTipoRD.ParamByName('PIDPESSOA').AsFloat := Sistema.IDEmpresa;
   sqlTipoRD.Open;

   if not(sqlCentroCusto.Prepared) then sqlCentroCusto.Prepare;
   sqlCentroCusto.ParamByName('PIDEMPRESA').AsFloat := Sistema.IDEmpresa;
   sqlCentroCusto.Open;

   sqlProgramaPrev.Open;
   sqlPlanoPrev.Open;
   sqlPatroPrev.Open;
end;



procedure TfrmCadGrupoRateioDocMT.FormCreate(Sender: TObject);
begin
   inherited;
   edtTotalRateio.Value := 0;
   // Cria e inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlGrupoRateio := TCtrlGrupoRateio.Create;

   CtrlGrupoRateio.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              MensErroMT);

   // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
   // no CtrlObject
   CtrlGrupoRateio.CdsGrupoRateio      := Cds;
   CtrlGrupoRateio.CdsPadraoRateioDoc  := CdsDet;

   // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.
   CdsDet.CreateDataSet;

   // Adiciona filtro do módulo ao monta select
   MontaSelect.Filtro.Add('IDMODULO = ' + IntToStr(Sistema.IdModulo));



end;



procedure TfrmCadGrupoRateioDocMT.FormDestroy(Sender: TObject);
begin
   FreeAndNil( CtrlGrupoRateio );
   inherited;
end;



procedure TfrmCadGrupoRateioDocMT.SelecionaMestreDetalhe(const IDGrupoRateio: Integer);
begin
   // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
   Cds.Data    := CtrlGrupoRateio.LookupGrupoRateio(-1, IDGrupoRateio);
   CdsDet.Data := CtrlGrupoRateio.LookupPadraoRateioDoc(IDGrupoRateio, Sistema.IDEmpresa);

   TotalRateio;
end;



procedure TfrmCadGrupoRateioDocMT.CmeCadastroInsert(Sender: TObject);
begin
   // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco
   SelecionaMestreDetalhe( -2 );

   // bug do padrão
//   Cds.Close;
//   Cds.CreateDataSet;

   inherited;

   // Carrega Defaults
   Cds.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
   if DBedtNomeGrupo.CanFocus then DBedtNomeGrupo.SetFocus;
end;



procedure TfrmCadGrupoRateioDocMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   // Para consertar alguns registros sem o modulo gravado
   if Cds.FieldByName('IDMODULO').IsNull then Cds.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
   if DBedtNomeGrupo.CanFocus then DBedtNomeGrupo.SetFocus;
end;



procedure TfrmCadGrupoRateioDocMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then SelecionaMestreDetalhe( StrToInt(MontaSelect.ValoresChave[0]) );
end;



procedure TfrmCadGrupoRateioDocMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;

   // bug do padrão
   if (Cds.State = dsbrowse) then Cds.Edit;  // bug padrão

   Accept := CtrlGrupoRateio.GravaGrupoRateio;
end;



procedure TfrmCadGrupoRateioDocMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlGrupoRateio.ExcluiGrupoRateio;
   if Accept then SelecionaMestreDetalhe( -2 );
end;



procedure TfrmCadGrupoRateioDocMT.CmeCadastroCancel(Sender: TObject);
begin
   inherited;

   // Retorna os valores originais antes da alteração
   SelecionaMestreDetalhe( Cds.FieldByname('IDGRUPORATEIO').AsInteger );
end;



procedure TfrmCadGrupoRateioDocMT.CmeDetalheConfirma(Sender: TObject);
begin
   if cdsDet.State in [dsInsert, dsEdit] then
   begin
      if VerificaPreenchimentoDetalhe then inherited;
   end
   else
   begin
     inherited;
   end;
end;



function TfrmCadGrupoRateioDocMT.VerificaPreenchimento: Boolean;
begin
   Result := False;
   try

      if dbedtNomeGrupo.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Nome do Grupo!', DBedtNomeGrupo);


      if not(VerificaLinhaGrid(dbgrdDet.DataSource.DataSet,
                               7, // Tag dos campos chave
                               8, // Tag dos campos vazios
                               'Rateio',
                               False)) then
      begin
         raise EValidacao.CreateVal('Houve preenchimento incorreto do Rateio! Favor verificar.', DBedtNomeGrupo);
      end;

   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;



function TfrmCadGrupoRateioDocMT.VerificaPreenchimentoDetalhe: Boolean;
begin
   Result := False;
   try

      if DBcboUnidNegoc.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Atividade / Projeto!', DBcboUnidNegoc);

      if DBcboCentroRespon.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade!', DBcboCentroRespon);

      if DBcboCentCusto.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentCusto);

      if DBcboTipoRD.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Desembolso!', DBcboTipoRD);

      if DBcboPrograma.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Programa!', DBcboPrograma);

      if DBcboPlano.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Plano Previdencial!', DBcboPlano);

      if DBcboPatro.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Patrocinadora!', DBcboPatro);

      if dbedtPercent.Value <= 0 then
         raise EValidacao.CreateVal('É necessário indicar o Percentual de Rateio!', dbedtPercent);

   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;



procedure TfrmCadGrupoRateioDocMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadGrupoRateioDocMT.dbgrdDetTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   inherited;
   cdsDet.IndexFieldNames := AFieldName;
end;



procedure TfrmCadGrupoRateioDocMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
   inherited;

   // Recarrega o registro após a edição ( bug do padrão )
   if cmeCadastro.Operacao = opAlterar then SelecionaMestreDetalhe(Cds.FieldByname('IDGRUPORATEIO').AsInteger);
end;



function TfrmCadGrupoRateioDocMT.TotalRateio: Extended;
var
   iQtde, iPerc : Extended;
begin
   with cdsDet do
   begin
      DisableControls;
      First;
      iQtde := RecordCount;
      iPerc := 0;

      while not(EOF) do
      begin
         iPerc := iPerc + CdsDet.FieldByName('PERCENTRATEIO').AsFloat;
         Next;
      end;

      First;

      EnableControls;
   end;

   edtTotalRateio.Value := iPerc;
end;



procedure TfrmCadGrupoRateioDocMT.FormShow(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;




procedure TfrmCadGrupoRateioDocMT.CdsDetBeforePost(DataSet: TDataSet);
begin
   inherited;

   CdsDet.FieldByName('RECPAG').AsString         := 'R';
   CdsDet.FieldByName('IDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;

end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
procedure TfrmCadGrupoRateioDocMT.DBcboUnidNegocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('UNIDNEGOCIO').AsString := DBcboUnidNegoc.Text;
end;

procedure TfrmCadGrupoRateioDocMT.DBcboCentroResponCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('CENTRORESPON').AsString := DBcboCentroRespon.Text;
end;

procedure TfrmCadGrupoRateioDocMT.DBcboTipoRDCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('TIPODESEMBOLSO').AsString := DBcboTipoRD.Text;
end;

procedure TfrmCadGrupoRateioDocMT.DBcboCentCustoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('CENTROCUSTO').AsString := DBcboCentCusto.Text;
end;

procedure TfrmCadGrupoRateioDocMT.DBcboProgramaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('DESCPROGRAMA').AsString := DBcboPrograma.Text;
end;

procedure TfrmCadGrupoRateioDocMT.DBcboPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('PLANPREV').AsString := DBcboPlano.Text;
end;

procedure TfrmCadGrupoRateioDocMT.DBcboPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('PATRO').AsString := DBcboPatro.Text;
end;
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



procedure TfrmCadGrupoRateioDocMT.MensErroMT(sMessageInfo: String);
begin
   MsgDlg(sMessageInfo, 'Contas a Pagar', mtWarning, [mbOk], 0);
   Repaint;
end;


procedure TfrmCadGrupoRateioDocMT.Totaliza;
var cdsAux : tcmClientDataset;
begin
  cdsAux := TcmClientDataset.Create(nil);
  cdsAux.Data := cdsDet.Data;
  edtTotalRateio.Value := 0;
  if cdsAux.Active then
  begin
    cdsAux.First;
    while not cdsAux.Eof do
    begin
      edtTotalRateio.Value := edtTotalRateio.Value + cdsAux.FieldByName('PERCENTRATEIO').AsFloat;
      cdsAux.Next;
    end
  end;
  cdsAux.Free;
end;



procedure TfrmCadGrupoRateioDocMT.CdsDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  Totaliza;
end;

end.

