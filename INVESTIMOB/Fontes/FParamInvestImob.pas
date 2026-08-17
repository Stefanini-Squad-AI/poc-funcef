{-------------------------------------------------------------------------------
SOl_KINTANA : 163982/7003_KTN1489901
Data        : 22/11/2011
Autor       : Vinicius Eduardo Nascimento Maciel
Rotina      : recuperaAtividadePerd, qryLookUnidNegocio e
qryLookUnidNegocioPerdida
Descrição   : Foi criada uma rotina para alterar atividades desativadas.
--------------------------------------------------------------------------------}
// Ádler Souza  : 68504 / 22/04/2009
// Observação   : Alteração na Query qryLookCentroRespon, linstando apenas ativos.
{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

	      Parâmetros do Sistema de Administração Imobiliária

	Autor             :  André Pontes
	Data de Início    :  26/01/1999
	Data de Término   :  26/01/1999

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

   Parâmetros:

   IDPESSOA          :  Empresa Proprietária

   CODCENTRORESPON   :  Centro de Responsabilidade default p/ Receitas e Despesas de Imóveis
   UNIDNEGOC         :  Atividade/Projeto default p/ Receitas e Despesas de Imóveis
   CODPORTFORMA      :  Portador-Forma default p/ Receitas e Despesas de Imóveis

   FLGINTEGRACONTAB  :  Indica se o Sistema se integra com Contabilidade
   FLGINTEGRACAPCAR  :  Indica se o Sistema se integra com Contas a Pager e Receber
   FLGINTEGRAATIVO   :  Indica se o Sistema se integra com Ativo Fixo

   FLGALTERAEVENTO   :  Indica se é permitido a um usuário alterar/excluir eventos "automáticos"
                        gerados pelo Sistema
   FLGEVENTOUSUARIO  :  Indica se é permitido a um usuário alterar/excluir eventos não cadastrados
                        pelo mesmo

--------------------------------------------------------------------------------
ALTERAÇÕES / IMLPEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FParamInvestImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook,
  DBCtrls, IvDictio, IvMulti, IvEMulti, Mask, wwdbedit, Wwdbspin,
  CmEventosCadastro, ImgList, mLocalizacao, mClasseBem, uModuloImobiliario;

type
  TfrmParamInvestImob = class(TfrmCadastroCS)
    pgcParametros: TPageControl;
    qryLookUnidNegocio: TwwQuery;
    qryLookCentroRespon: TwwQuery;
    qryLookUnidNegocioUNIDNEGOC: TFloatField;
    qryLookUnidNegocioNOME: TStringField;
    qryLookCentroResponCODCENTRORESPON: TStringField;
    qryLookCentroResponNOME: TStringField;
    qryLookPortadorForma: TwwQuery;
    qryLookPortadorFormaCODPORTFORMA: TFloatField;
    qryLookPortadorFormaDESCRICAO: TStringField;
    qryParamGlobal: TwwQuery;
    qryLookPrograma: TwwQuery;
    tbsGeral: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    DBcboUnidNegocios: TwwDBLookupCombo;
    DBcboPortadorForma: TwwDBLookupCombo;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    DBcboLookCentroCusto: TwwDBLookupCombo;
    Label17: TLabel;
    DBcboPrograma: TwwDBLookupCombo;
    Label18: TLabel;
    qryLookProgramaIDPROGRAMA: TFloatField;
    qryLookProgramaCODPROGRAMA: TStringField;
    qryLookProgramaDESCPROGRAMA: TStringField;
    tbsIntegra: TTabSheet;
    CheckBox1: TDBCheckBox;
    CheckBox5: TDBCheckBox;
    cbIntegraAtivo: TDBCheckBox;
    TabSheet1: TTabSheet;
    molLocalizacao1: TmolLocalizacao;
    molClasseBem1: TmolClasseBem;
    Label52: TLabel;
    DBcboSituacao: TwwDBLookupCombo;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label22: TLabel;
    Label7: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    qryLookDespAquisicao: TwwQuery;
    qryLookRecAlienacao: TwwQuery;
    Label8: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    dbrgDepreciacao: TDBRadioGroup;
    qryIDPESSOA: TFloatField;
    qryFLGINTEGRACAPCAR: TStringField;
    qryFLGINTEGRAATIVO: TStringField;
    qryFLGINTCAFCONT: TStringField;
    qryFLGDIARIO: TStringField;
    qryUNIDNEGOC: TFloatField;
    qryCODCENTRORESPON: TStringField;
    qryCODCENTROCUSTO: TStringField;
    qryIDEMPRESA: TFloatField;
    qryCODPORTFORMA: TFloatField;
    qryIDPROGRAMA: TFloatField;
    qryIDPESSOALOC: TFloatField;
    qryIDLOCALIZACAO: TFloatField;
    qryIDCLASSEBEM: TFloatField;
    qryIDSITUACAO: TFloatField;
    qryIDDESPAQUISICAO: TFloatField;
    qryIDRECALIENACAO: TFloatField;
    qryCODTIPIMOVELOBRA: TStringField;
    qryFLGINTEGRACONTAB: TStringField;
    DBCheckBox1: TDBCheckBox;
    qryFLGREAVBAIXABEM: TStringField;
    qryFLGREAVCRIABEM: TStringField;
    tbsProcessos: TTabSheet;
    GroupBox2: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    qryFLGLOGORELAT: TStringField;
    DBCheckBox4: TDBCheckBox;
    qryFLGTIPONUMERACAO: TFloatField;
    qryFLGPREFIXONUMTER: TStringField;
    qryFLGPREFIXONUMEDI: TStringField;
    qryFLGPREFIXONUMINS: TStringField;
    dbrdgTipoNumeracao: TDBRadioGroup;
    pnlPrefixo: TPanel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    qryLookPortadorFormaFLGATIVO: TStringField;
    GroupBox4: TGroupBox;
    dbChkGeraAutomatico: TDBCheckBox;
    dbChkValidaPreenchimento: TDBCheckBox;
    qryFLGAUTCOD: TStringField;
    qryFLGVALCOD: TStringField;
    qryLookUnidNegocioPerdida: TwwQuery;
    qryLookUnidNegocioPerdidaNOME: TStringField;

    // procedimentos definidos
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);

    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);

    procedure Sel(iEmpresaProp: integer);

    function VerificaPreenchimento: boolean;

    procedure AbreQueries(i: integer);
    procedure FechaQueries;

    // outros procedimentos
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure molLocalizacao1btnBuscaLocalizacaoClick(Sender: TObject);
    procedure molLocalizacao1btnLimpaLocalizacaoClick(Sender: TObject);
    procedure molClasseBem1btnBuscaClasseBemClick(Sender: TObject);
    procedure molClasseBem1btnLimpaClasseBemClick(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure dbrdgTipoNumeracaoClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);


  private { Private declarations }
   function recuperaAtividadePerd(sCodAtividade: String): String;//Vinicius Maciel - SOL 163982/7003 - KTN 1489901
  public { Public declarations }

  end;



var
  frmParamInvestImob: TfrmParamInvestImob;


implementation
{$R *.DFM}
Uses USistema, UMensErro, UDatabase, DBaseDados, uComunsImobiliario, uVerificaPreenchimento,
     FPrincipal, uFuncoesImob, dLookImobiliario, UMolduras, dImobiliario;


procedure TfrmParamInvestImob.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   // só permite alteração
   sbtnInserir.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
   sbtnAlterar.Enabled  := True;
end;


procedure TfrmParamInvestImob.CmeCadastroEdit(Sender: TObject);
begin
   // o primeiro Edit na query será um Insert
   if (qry.IsEmpty) then begin
      qry.Insert;
      qryIDPESSOA.AsInteger := Sistema.idEmpresa;
   end else begin
      inherited; 
   end;
end;



procedure TfrmParamInvestImob.Sel(iEmpresaProp: integer);
begin
  with qry do begin
     LimpaParametros(qry);
     ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
     Open;
     pnlPrefixo.Visible := (FieldByName('FLGTIPONUMERACAO').AsInteger = 1);
  end;
end;


procedure TfrmParamInvestImob.CmeCadastroConfirma(Sender: TObject);
begin
  // Obriga alguns valores ------------------------------------------------------------------------------
  if qry.State in dsEditModes then begin
    qryFLGINTEGRACAPCAR.AsString  := 'S';
    qryFLGINTEGRACONTAB.AsString  := 'S';
    qryIDEMPRESA.AsInteger := Sistema.idEmpresa;
    if qryFLGDIARIO.IsNull then qryFLGDIARIO.AsString := 'N';
  end;
  inherited;
end;


function TfrmParamInvestImob.VerificaPreenchimento: boolean;
begin
   Result := True;

   // Geral  ---------------------------------------------------------------------------
   try
      if qryCODCENTROCUSTO.isNull then
         raise EValidacao.CreateVal('É necessário informar o Centro de Custos', DBcboLookCentroCusto);

      if qryLookPortadorFormaFLGATIVO.AsString = 'N' then
         raise EValidacao.CreateVal('Contas-Caixa x Forma de Cobrança informado está desativado.', DBcboPortadorForma);

   except
      on ev : EValidacao do begin
         Result := False;
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
end;



procedure TfrmParamInvestImob.AbreQueries(i: integer);
begin
   LimpaParametros (qryLookDespAquisicao);
   qryLookDespAquisicao.Open;

   LimpaParametros(qryLookRecAlienacao);
   qryLookRecAlienacao.Open;

   with qryLookCentroRespon do begin
      LimpaParametros(qryLookCentroRespon);
      Params[0].AsInteger := i;
      Open;
   end;

   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      Params[0].AsInteger := i;
      Open;
   end;

   with qryLookUnidNegocio do begin
      LimpaParametros(qryLookUnidNegocio);
      Params[0].AsInteger := i;
      Open;
   end;
   
   with qryLookPortadorForma do begin
      LimpaParametros(qryLookPortadorForma);
      Params[0].AsInteger := i;
      Open;
   end;

   Sel(i);
   LimpaParametros(dtmLookImobiliario.qryLookLocalizacao);
   dtmLookImobiliario.qryLookLocalizacao.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   dtmLookImobiliario.qryLookLocalizacao.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PRECCUSTO').AsString := 'C';
   dtmLookImobiliario.qryLookTipoRecDes.Open;
   dtmLookImobiliario.qryLookSituacao.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;

   qryLookPrograma.Open;

end;



procedure TfrmParamInvestImob.FechaQueries;
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;

   dtmLookImobiliario.qryLookCentroCusto.Close;
   dtmLookImobiliario.qryLookSituacao.Close;
end;



procedure TfrmParamInvestImob.FormShow(Sender: TObject);
begin
   inherited;
   pgcParametros.ActivePage := tbsIntegra;
   Application.ProcessMessages;
   // filtra pela Empresa Proprietária
   AbreQueries(Sistema.idEmpresa);
   //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
   if((DBcboUnidNegocios.Text = '') and (DBcboUnidNegocios.LookupValue <> '')) then
   DBcboUnidNegocios.Text := recuperaAtividadePerd(DBcboUnidNegocios.LookupValue);
   //Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM
end;



procedure TfrmParamInvestImob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;
   // chama a procedure AposLogin para atualizar as variáveis do Modulo
   ModuloImobiliario.InvestImob.GetParam(sistema.idEmpresa);
   inherited;
end;


procedure TfrmParamInvestImob.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   pgcParametros.ActivePage := tbsIntegra;
end;


procedure TfrmParamInvestImob.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   pgcParametros.ActivePage := tbsIntegra;
end;


procedure TfrmParamInvestImob.molLocalizacao1btnBuscaLocalizacaoClick( Sender: TObject);
begin
   inherited;
   molLocalizacao1.btnBuscaLocalizacaoClick(Sender);
   if molLocalizacao1.edtLocalizacao.Text <> '' then begin
      qryIDLOCALIZACAO.AsInteger := molLocalizacao1.iLocalizacao;
      qryIDPESSOALOC.AsInteger   := molLocalizacao1.iPessoaLoc;
   end;
end;

procedure TfrmParamInvestImob.molLocalizacao1btnLimpaLocalizacaoClick( Sender: TObject);
begin
   inherited;
   molLocalizacao1.btnLimpaLocalizacaoClick(Sender);
   qryIDLOCALIZACAO.Clear;
   qryIDPESSOALOC.Clear;
end;

procedure TfrmParamInvestImob.molClasseBem1btnBuscaClasseBemClick(Sender: TObject);
begin
   inherited;
   molClasseBem1.btnBuscaClasseBemClick(Sender);
   if molClasseBem1.edtClasseBem.Text <> '' then
      qryIDCLASSEBEM.AsInteger := molClasseBem1.iClasseBem;
end;

procedure TfrmParamInvestImob.molClasseBem1btnLimpaClasseBemClick(Sender: TObject);
begin
   inherited;
   molClasseBem1.btnLimpaClasseBemClick(Sender);
   qryIDCLASSEBEM.Clear;
end;

procedure TfrmParamInvestImob.qryAfterOpen(DataSet: TDataSet);
begin
   inherited;
   if not qryIDLOCALIZACAO.IsNull then begin
      molLocalizacao1.iLocalizacao := qryIDLOCALIZACAO.AsInteger;
      molLocalizacao1.iPessoaLoc   := qryIDPESSOALOC.AsInteger;

      AtribuiMolLocalizacao(molLocalizacao1.iLocalizacao,
                            molLocalizacao1.iPessoaLoc,
                            molLocalizacao1.edtLocalizacao,
                            molLocalizacao1.iResponsavel,
                            molLocalizacao1.sCodCentroCusto);
   end;

   if not qryIDCLASSEBEM.IsNull then begin
      molClasseBem1.iClasseBem := qryIDCLASSEBEM.AsInteger;
      AtribuiMolClasseBem(molClasseBem1.iClasseBem, molClasseBem1.edtClasseBem);
   end;
end;



procedure TfrmParamInvestImob.dbrdgTipoNumeracaoClick(Sender: TObject);
begin
   inherited;
   pnlPrefixo.Visible := (dbrdgTipoNumeracao.ItemIndex = 1);
end;


procedure TfrmParamInvestImob.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;

//Vinicius Maciel - SOL 163982/7003 - KTN 1489901
function TfrmParamInvestImob.recuperaAtividadePerd(
  sCodAtividade: String): String;
begin
   with dtmLookImobiliario.qryLookUnidNegocioPerdida do begin
      LimpaParametros(dtmLookImobiliario.qryLookUnidNegocioPerdida);
      ParamByName('pUNIDNEGOC').asInteger := StrToInt(sCodAtividade);
      Open;
      Result := FieldByName('NOME').asString;
   end;
end;
//Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM
end.
