unit FExecAquisicaoVista;
{--------------------------------------------------------------------------------
Rotina......: -
Nº SIG......: 29025
Data........: 09/09/2016
Responsável.: William Moreira da Silva
Descrição...: Processo não prossegue
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 212226
Nº KINTANA..: 2037651
Data........: 08/04/2014
Responsável.: Helio Lima Custódio
Descrição...: Incluir Campo de Vida Útil e salvar os dados em histórico
de vida útil e atualização da taxa de depreciacao.
--------------------------------------------------------------------------------
Rotina...........: CadastraCAF
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 04/12/2013
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8222
Nº KINTANA..: 1577546
Data........: 28/03/2012
Responsável.: Wylliam Leite da Silva
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------
SOL..........: 164246
Kintana......: 1409423
Responsável..: Helen V. Bianchi
Data.........: 05/09/2011
Descrição....: Add para aparecer apenas os Grupos Contábeis Ativos
-------------------------------------------------------------------------------}

interface

uses     
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, mImovelouMestre,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, fcButton, fcImgBtn,
  fcShapeBtn, fcLabel, ComCtrls, mImovel, Mask, DBCtrls, mImovelInativo,
  Db, Wwdatsrc, DBTables, Wwquery, mFornecedor, TREdit, wwdbedit, Wwdotdot,
  Wwdbcomb, mLocalizacao, mClasseBem, Wwdbspin, uCMClientDataSet, uCtrlDomBem,
  uCtrlImobLancamento, dbClient, uCtrlPadroes,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab,

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  uCtrlHistoricoVidaUtil;

type
  TfrmExecAquisicaoVista = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
    qryGruposContabeis: TwwQuery;
    dsGruposContabeis: TwwDataSource;
    updGruposContabeis: TUpdateSQL;
    qryGruposContabeisIDGRUPO: TFloatField;
    qryGruposContabeisNOME: TStringField;
    qryGruposContabeisCLASSE: TStringField;
    qryGruposContabeisVALOR: TFloatField;
    qryGruposContabeisPERCENT: TFloatField;
    ntbPrincipal: TNotebook;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    btnContinuaSelecao: TfcShapeBtn;
    btnAtualizar: TfcShapeBtn;
    edtDataAquisicao: TCMDateTimePicker;
    DBcboTipoImovel: TwwDBLookupCombo;
    molImovelInativo1: TmolImovelInativo;
    Label1: TLabel;
    Bevel4: TBevel;
    Label2: TLabel;
    Panel1: TPanel;
    fcShapeBtn4: TfcShapeBtn;
    wwDBGrid1: TwwDBGrid;
    edtTotalGrupo: TRealEdit;
    fcShapeBtn8: TfcShapeBtn;
    edtTotalCompra: TRealEdit;
    Label6: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label8: TLabel;
    Bevel5: TBevel;
    edtNumDocumento: TEdit;
    DBcboFormaRecPag: TwwDBLookupCombo;
    edtReferenciaAP: TEdit;
    DBcboCentroCusto: TwwDBLookupCombo;
    fcShapeBtn1: TfcShapeBtn;
    btnConfirma: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
    molFornecedor1: TmolFornecedor;
    fcShapeBtn3: TfcShapeBtn;
    Label11: TLabel;
    edtVlrOper: TRealEdit;
    lblContaBancaria: TLabel;
    dbCboContaBancaria: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    molLocalizacao1: TmolLocalizacao;
    molClasseBem1: TmolClasseBem;
    qryGruposContabeisPLACACAF: TFloatField;
    qryGruposContabeisFLGSEMPLACA: TFloatField;
    qryGruposContabeisDEPRECIACAO: TFloatField;
    qryGruposContabeisPERCENT_EFETIVO: TFloatField;
    Label52: TLabel;
    DBcboSituacao: TwwDBLookupCombo;
    qryGruposContabeisNOME_BEM: TStringField;
    qryGruposContabeisGRUPO_BEM: TStringField;
    qryUpdImovel: TwwQuery;
    Label22: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    edtDataLanc: TCMDateTimePicker;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    Label14: TLabel;
    memObs: TMemo;
    Label7: TLabel;
    meObsEvento: TMemo;
    cbDepAquisicao: TCheckBox;
    cdsHistoricoVidaUtil: TCMClientDataSet;
    cdsHistoricoVidaUtilVIDAUTIL: TFloatField;
    cdsHistoricoVidaUtilTXDEP_ANO: TFloatField;
    cdsHistoricoVidaUtilTXDEP_MES: TFloatField;
    cdsHistoricoVidaUtilVIGENTE: TStringField;
    cdsHistoricoVidaUtilTRGDTINCLUSAO: TDateTimeField;
    cdsHistoricoVidaUtilTRGUSERINCLUSAO: TStringField;
    cdsHistoricoVidaUtilHistVidaUtilIDIMOVEL: TFloatField;
    cdsHistoricoVidaUtilHIST_EVENTO: TStringField;
    wwDataSource1: TwwDataSource;
    StaticText1: TStaticText;
    wwDBspnVidaUtil: TwwDBSpinEdit;
    Meses: TStaticText;
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure DBgrdBemCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemTopRowChanged(Sender: TObject);
    procedure fcShapeBtn8Click(Sender: TObject);
    procedure fcShapeBtn4Click(Sender: TObject);
    procedure fcShapeBtn3Click(Sender: TObject);
    procedure fcShapeBtn2Click(Sender: TObject);
    procedure molFornecedor1btnBuscaFornClick(Sender: TObject);
    procedure DBcboFormaRecPagCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure molClasseBem1btnBuscaClasseBemClick(Sender: TObject);
    procedure molImovelInativo1btnBuscaImovelClick(Sender: TObject);
    procedure DBcboTipoImovelChange(Sender: TObject);


  private { Private declarations }
    iDocumento    : integer;

    CtrlDomBem : TCtrlDomBem;
    //Cássio - SOL 92381 KINTANA 394180
    CtrlImobLancamento: TCtrlImobLancamento;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    //Helio - SOL Nº 212226 KINTANA Nº 2037651
    CtrlHistoricoVidaUtil : TCtrlHistoricoVidaUtil;

    procedure AbreQueries;
    procedure FechaQueries;

    function VerificaPreenchimentoOper: boolean;
    function VerificaPreenchimentoAP: boolean;
    function TotalizaGrupo: Boolean;
    function RateiaGrupos: Boolean;
    function CadastraCAF : Boolean;
    procedure VerificaContaBancaria;
    procedure PreenchePlacaCAF;
    procedure CalculaCamposVirtuais;
  public { Public declarations }

  end;



var
  frmExecAquisicaoVista: TfrmExecAquisicaoVista;



implementation
{$R *.DFM}
uses
   dBaseDados, uDataBase, dMS, dLookImobiliario, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
   dImobiliario, dLancImovel, uFuncoesImob, uSistema, UDocumento, uMolduras, uModuloInvestImob,
   uDiasInUteis, dCAF, UEventoImovel, uCAF, uModuloImobiliario;


procedure TfrmExecAquisicaoVista.AbreQueries;
var
   sFormaAnt      : string;
   sCCAnt         : string;
   sTipoOperAnt   : string;
   sCarteiraAnt   : string;
   sTipoImovelAnt : string;
   sRecDesAnt     : string;
begin
   // Tipo de Imóvel -------------------------------------------------------------------------------
   sTipoImovelAnt := '';
   if DBcboTipoImovel.LookupValue <> '' then sTipoImovelAnt := DBcboTipoImovel.LookupValue;
   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Close;
   dtmLookImobiliario.qryLookTipoImovel.Open;
   DBcboTipoImovel.LookupValue := sTipoImovelAnt;
   // ----------------------------------------------------------------------------------------------

   // Forma de Pagamento ---------------------------------------------------------------------------
   sFormaAnt := '';
   if DBcboFormaRecPag.LookupValue <> '' then sFormaAnt := DBcboFormaRecPag.LookupValue;

   with dtmLookImobiliario.qryLookFormaRecPag do begin
      LimpaParametros(dtmLookImobiliario.qryLookFormaRecPag);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString     := 'P';
      Open;
   end;
   if DBcboFormaRecPag.LookupValue = '' then DBcboFormaRecPag.LookupValue := sFormaAnt;
   // ----------------------------------------------------------------------------------------------

   // Centro de Custo ------------------------------------------------------------------------------
   sCCAnt := '';
   if DBcboCentroCusto.LookupValue <> '' then sCCAnt := DBcboCentroCusto.LookupValue;

   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
      Open;
   end;
   if DBcboCentroCusto.LookupValue = '' then DBcboCentroCusto.LookupValue := sCCAnt;
   if DBcboCentroCusto.LookupValue = '' then begin
      if ModuloImobiliario.InvestImob.sCodCentroCusto <> '' then begin
         DBcboCentroCusto.LookupValue := ModuloImobiliario.InvestImob.sCodCentroCusto;
      end;
   end;

   // Tipo de Despesa ------------------------------------------------------------------------------
   if DBcboTipoRecDes.LookupValue <> '' then
        sRecDesAnt := DBcboTipoRecDes.LookupValue
   else sRecDesAnt := IntToStr(ModuloImobiliario.InvestImob.iIdDespAquisicao);

   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PRECCUSTO').AsString  := 'C';
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      ParamByName('NAO_ACRESCIMO_VALOR').AsString := 'SIM';
      Open;
   end;
   if length(trim(sRecDesAnt)) > 0 then DBcboTipoRecDes.LookupValue := sRecDesAnt;


   // SITUACAO
   dtmLookImobiliario.qryLookSituacao.Open;
   DBcboSituacao.LookupValue := inttostr(ModuloImobiliario.InvestImob.iIdSituacao);
end;


procedure TfrmExecAquisicaoVista.FechaQueries;
begin
   dtmLookImobiliario.qryLookTipoImovel.Close;
   dtmLookImobiliario.qryLookFormaRecPag.Close;
   dtmLookImobiliario.qryLookContaBancaria.Close;
   dtmLookImobiliario.qryLookCentroCusto.Close;
   dtmLookImobiliario.qryLookSituacao.Close;
end;



function TfrmExecAquisicaoVista.VerificaPreenchimentoOper: boolean;
begin
   Result := False;

   try

      if ( (molImovelInativo1.iImovel <= 0) or (molImovelInativo1.edtImovel.Text = '') ) then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel!', molImovelInativo1.btnBuscaImovel);

      if DBcboTipoImovel.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar Tipo do Imóvel!', DBcboTipoImovel);

      if edtDataAquisicao.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Operação!', edtDataAquisicao);

      //Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataAquisicao.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataAquisicao);
      //Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

      if edtVlrOper.Value = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Valor da Operação!', edtVlrOper);

      if molLocalizacao1.edtLocalizacao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Localização para o CAF!', molLocalizacao1.btnBuscaLocalizacao);

      if molClasseBem1.edtClasseBem.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Classe do Bem para o CAF!', molClasseBem1.btnBuscaClasseBem);

      if DBcboSituacao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Situação do Bem para o CAF!', DBcboSituacao);

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



procedure TfrmExecAquisicaoVista.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   if VerificaPreenchimentoOper then begin

      // OBRIGA a conversão
      if RateiaGrupos then begin
         ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
      end;

   end;
end;



procedure TfrmExecAquisicaoVista.FormShow(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex := 0;
   Repaint;
   Application.ProcessMessages;
   
   AbreQueries;

   // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
   // na contabilidade e no contas a pagar
   iDocumento     := Documento.GetCodigo(dtmImobiliario.qryAux);

   // preenche o número do documento = id documento 18/07
   edtNumDocumento.Text := FormatFloat('#0', iDocumento);
end;



procedure TfrmExecAquisicaoVista.btnAtualizarClick(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;



procedure TfrmExecAquisicaoVista.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;
   case ntbPrincipal.PageIndex of
      0: lblTitulo.Caption := 'Aquisição à Vista de Imóveis [ Seleção ]';
      1: lblTitulo.Caption := 'Aquisição à Vista de Imóveis [ Bens ]';
      2: lblTitulo.Caption := 'Aquisição à Vista de Imóveis [ AP ]';
   end;

   Repaint;
   Application.ProcessMessages;
end;



procedure TfrmExecAquisicaoVista.DBgrdBemCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmExecAquisicaoVista.DBgrdBemTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecAquisicaoVista.fcShapeBtn8Click(Sender: TObject);
begin
   inherited;
   qryGruposContabeis.CancelUpdates;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TfrmExecAquisicaoVista.fcShapeBtn4Click(Sender: TObject);
begin
   inherited;
   TotalizaGrupo;
end;

function TfrmExecAquisicaoVista.TotalizaGrupo: Boolean;
var
   fTotGrupo, fMaior, fDiferenca, fTotalPercent: Extended;
begin
   qryGruposContabeis.DisableControls;

   fTotGrupo     := 0;
   fTotalPercent := 0;
   fMaior        := 0;
   qryGruposContabeis.First;
   while not qryGruposContabeis.Eof do begin
      if qryGruposContabeisPERCENT.AsFloat <> 0 then begin
         qryGruposContabeis.Edit;
         qryGruposContabeisVALOR.AsFloat := Arredonda(edtTotalCompra.Value * (qryGruposContabeisPERCENT.AsFloat / 100),2);
         qryGruposContabeis.Post;
      end;

      if qryGruposContabeisVALOR.AsFloat > 0 then begin
         if fMaior < qryGruposContabeisVALOR.AsFloat then fMaior := qryGruposContabeisVALOR.AsFloat;

         fTotGrupo   := fTotGrupo + qryGruposContabeisVALOR.AsFloat;
         qryGruposContabeis.Edit;
         qryGruposContabeisPERCENT_EFETIVO.AsFloat := qryGruposContabeisVALOR.AsFloat / edtTotalCompra.Value;
         qryGruposContabeis.Post;
         fTotalPercent := fTotalPercent + qryGruposContabeisPERCENT_EFETIVO.AsFloat;
      end;

      qryGruposContabeis.Next;
   end;

   // apurar o valor da diferença do rateio
   fTotGrupo := ComunsImobiliario.Arredonda(fTotGrupo,2);
   edtTotalGrupo.Value := fTotGrupo;
   fDiferenca := edtTotalCompra.Value - edtTotalGrupo.Value;

   // acertar a diferença no maior grupo
   qryGruposContabeis.First;
   // tolerar uma diferença de no máximo R$ 2,00
   if (fDiferenca >= -2) and (fDiferenca <= 2) then begin
      while (fDiferenca <> 0) do begin
         if qryGruposContabeisVALOR.AsFloat = fMaior then begin
            qryGruposContabeis.Edit;
            qryGruposContabeisVALOR.AsFloat := qryGruposContabeisVALOR.AsFloat + fDiferenca;
            qryGruposContabeis.Post;
            fDiferenca := 0;
         end;
         qryGruposContabeis.Next
      end;
   end else begin
      MsgDlg(FormatFloat ('Verificar valores lançados, apurada diferença de: #,##0.00', fDiferenca),'Aviso',mtwarning,[mbok],0);
   end;

   // acertar diferença percentual, se necessário
   qryGruposContabeis.First;
   while (fTotalPercent <> 1) and (fDiferenca = 0) do begin
      if qryGruposContabeisVALOR.AsFloat = fMaior then begin
         qryGruposContabeis.Edit;
         qryGruposContabeisPERCENT_EFETIVO.AsFloat := qryGruposContabeisPERCENT_EFETIVO.AsFloat + (1 - fTotalPercent);
         qryGruposContabeis.Post;
         fTotalPercent := 1;
      end;
      //William Moreira da Silva - SIG 29025
      qryGruposContabeis.next;
      //William Moreira da Silva - SIG 29025
   end;


   // calcula o total novamente 
   fTotGrupo := 0;
   qryGruposContabeis.First;
   while not qryGruposContabeis.Eof do begin
      fTotGrupo := fTotGrupo + qryGruposContabeisVALOR.AsFloat;
      qryGruposContabeis.Next;
   end;

   fTotGrupo := ComunsImobiliario.Arredonda(fTotGrupo,2);
   edtTotalGrupo.Value := fTotGrupo;
   if edtTotalCompra.Value <> edtTotalGrupo.Value then result := false
   else result := true;

   qryGruposContabeis.EnableControls;

end;

function TfrmExecAquisicaoVista.RateiaGrupos: Boolean;
var
   sParametro, sSql: String;
begin
   sParametro := '';
   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.IsNull then begin
      sParametro := dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOAR.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOAR.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOUTILITARIO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOUTILITARIO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOMAQUINA.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOMAQUINA.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOMOVEL.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOMOVEL.AsString + ',';
   end;

   if sParametro = '' then begin
      MsgDlg('O tipo de imóvel não possui nenhum grupo contábil associado.','Aviso',mtwarning,[mbok],0);
      Result := false;
      exit;
   end else begin
      sParametro := copy(sParametro,1,Length(sParametro)-1);
   end;

   sSql := 'SELECT '+ #13+
           '   G.IDGRUPO, G.NOME, G.CLASSE, G.FLGSEMPLACA, G.DEPRECIACAO, 0 AS PERCENT, 0 AS VALOR, '+#13+
           '   0 AS PERCENT_EFETIVO, -1 AS PLACACAF, ''                         '' AS NOME_BEM, '' '' AS GRUPO_BEM ' + #13 +
           'FROM ' + #13 +
           '   GRUPO G ' + #13 +
           'WHERE ' + #13 +
           '   ( G.FLGIMOVEL = 1 ) ' + #13 +
           '   AND ( TIPO = ''A'' ) ' + #13 +
           '   AND ( G.STATUS = ''A'')' + #13 +  //Helen SOL Nº 164246 KINTANA Nº 1409423
           '   AND ( G.IDGRUPO IN (' + sParametro + ') ) ' + #13 +
           'ORDER BY ' + #13 +
           '   G.NOME, G.CLASSE';


   qryGruposContabeis.SQL.Clear;
   qryGruposContabeis.SQL.Add(sSql);

   qryGruposContabeis.Open;
   CalculaCamposVirtuais;

   if qryGruposContabeis.RecordCount = 1 then begin
      qryGruposContabeis.Edit;
      qryGruposContabeisVALOR.AsFloat := edtVlrOper.Value;
      qryGruposContabeis.Post;
   end;

   edtTotalCompra.Value := edtVlrOper.Value;
   edtTotalGrupo.Value  := 0;
   Result := true;

end;

procedure TfrmExecAquisicaoVista.fcShapeBtn3Click(Sender: TObject);
begin
   inherited;
   edtDataLanc.Date := edtDataAquisicao.Date;
   edtVlrTotal.Value := edtVlrOper.Value;

   // competência default
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(edtDataLanc.date)-1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(edtDataLanc.date);

   if TotalizaGrupo then ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
end;

procedure TfrmExecAquisicaoVista.fcShapeBtn2Click(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TfrmExecAquisicaoVista.VerificaContaBancaria;
begin
   if (molFornecedor1.iFornecedor <> -1) and (DBcboFormaRecPag.LookupValue <> '') and (dtmLookImobiliario.qryLookFormaRecPagFLGDADOSBANCARIOS.AsString = 'S') then begin

      lblContaBancaria.Enabled := true;
      dbCboContaBancaria.Enabled := true;

      LimpaParametros(dtmLookImobiliario.qryLookContaBancaria);
      dtmLookImobiliario.qryLookContaBancaria.ParamByName('PIDPESSOA').AsInteger := molFornecedor1.iFornecedor;
      dtmLookImobiliario.qryLookContaBancaria.Open;
      if dtmLookImobiliario.qryLookContaBancaria.RecordCount > 1 then begin
         dtmLookImobiliario.qryLookContaBancaria.First;
         while not dtmLookImobiliario.qryLookContaBancaria.Eof do begin
            if dtmLookImobiliario.qryLookContaBancariaFLGCONTAPREF.AsInteger = 1 then begin
               dbCboContaBancaria.LookupValue := inttostr(dtmLookImobiliario.qryLookContaBancariaIDCBANCARIA.AsInteger);
               exit;
            end;
            dtmLookImobiliario.qryLookContaBancaria.Next;
         end;
      end else if dtmLookImobiliario.qryLookContaBancaria.RecordCount = 1 then begin
         dbCboContaBancaria.LookupValue := inttostr(dtmLookImobiliario.qryLookContaBancariaIDCBANCARIA.AsInteger);
      end;
   end else begin
      lblContaBancaria.Enabled := false;
      dbCboContaBancaria.Enabled := false;
      dtmLookImobiliario.qryLookContaBancaria.Close;
      dbCboContaBancaria.LookupValue := '';
   end;
end;

procedure TfrmExecAquisicaoVista.molFornecedor1btnBuscaFornClick(
  Sender: TObject);
begin
   inherited;
   molFornecedor1.btnBuscaFornClick(Sender);
   VerificaContaBancaria;
end;

procedure TfrmExecAquisicaoVista.DBcboFormaRecPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   VerificaContaBancaria;
end;

procedure TfrmExecAquisicaoVista.btnConfirmaClick(Sender: TObject);
var auxVidaUtil : Integer; auxTadepAno, auxTaxaDepMes : Extended;//Helio - SOL Nº 212226 KINTANA Nº 2037651
begin
   inherited;

  if VerificaPreenchimentoAP then
  begin

      //Helio - SOL Nº 212226 KINTANA Nº 2037651
      auxVidaUtil := cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger;
      auxTadepAno := CtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorAno(auxVidaUtil);
      auxTaxaDepMes := CtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorMes(auxVidaUtil);

      if wwDBspnVidaUtil.Enabled and
         CtrlHistoricoVidaUtil.VerificaSeModificaExistente(molImovelInativo1.iImovel,
         cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger, auxTadepAno, auxTaxaDepMes) then
      begin
          if MsgDlg('Isso irá alterar a taxa de depreciação do imóvel. Tem certeza que deseja alterar a vida útil?', 'Aviso',
             mtWarning, [mbYes, mbNo], 0) = idNo then
                Exit;
      end;
      //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651
      
      StartTransacao;
      //  Cadastrar tabelas necessárias ao CAF
      try

       //Helio - SOL Nº 212226 KINTANA Nº 2037651
       //somente quando nao for em Construcao ou Terreno
       if (DBcboTipoImovel.LookupValue <> 'CONST') and
          (DBcboTipoImovel.LookupValue <> 'TERR')
       then
       begin
           CtrlHistoricoVidaUtil.GravaHistoricoVidaUtil(
                  molImovelInativo1.iImovel,
                  auxVidaUtil,
                  auxTadepAno,
                  auxTaxaDepMes,
                  'Aquisição à Vista de Imóveis', False);
       end;
       //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

       if CadastraCAF then
       begin
            CommitTransacao;
            MsgDlg ('Aquisição registrada com sucesso.','Informação',mtInformation,[mbok],0);

            // para nova aquisição
            iDocumento           := Documento.GetCodigo(dtmImobiliario.qryAux);
            edtNumDocumento.Text := FormatFloat('#0', iDocumento);

            ntbPrincipal.PageIndex := 0;
            molImovelInativo1.edtImovel.Clear;
       end
       else
       begin
            raise Exception.Create('');
         end;
      except
         RollBackTransacao;
         MsgDlg ('Erro ao se tentar registrar a aquisição.','Aviso',mtWarning,[mbok],0);
      end;
    end;
end;

procedure TfrmExecAquisicaoVista.FormCreate(Sender: TObject);
begin
   inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlDomBem := TCtrlDomBem.Create;
   CtrlDomBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

   //Cássio - SOL 92381 KINTANA 394180 - Início
   //Criação do objeto para utilização de método (VerificaSegregacaoOrigemImovelxBem) 
   CtrlImobLancamento:= TCtrlImobLancamento.Create;
   CtrlImobLancamento.InitializeAs(Padroes);
   //Cássio - SOL 92381 KINTANA 394180 - Fim

   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   CtrlHistoricoVidaUtil := TCtrlHistoricoVidaUtil.Create;

   // Define Defaults
   if ModuloImobiliario.InvestImob.iIdLocalizacao > 0 then begin
      molLocalizacao1.iPessoaLoc   := ModuloImobiliario.InvestImob.iIdPessoaLocalizacao;
      molLocalizacao1.iLocalizacao := ModuloImobiliario.InvestImob.iIdLocalizacao;
      AtribuiMolLocalizacao(molLocalizacao1.iLocalizacao, molLocalizacao1.iPessoaLoc, molLocalizacao1.edtLocalizacao, molLocalizacao1.iResponsavel, molLocalizacao1.sCodCentroCusto);
   end;

   if ModuloImobiliario.InvestImob.iIdClasseBem > 0 then begin
      molClasseBem1.iClasseBem := ModuloImobiliario.InvestImob.iIdClasseBem;
      AtribuiMolClasseBem (molClasseBem1.iClasseBem, molClasseBem1.edtClasseBem);
   end;
   CtrlContab     := TCtrlContab.Create; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   CtrlContab.InitializeAs(Padroes);

   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   CtrlHistoricoVidaUtil.InitializeAs(Padroes);
   CtrlHistoricoVidaUtil.CdsHistoricoVidaUtil := cdsHistoricoVidaUtil;
   //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651
end;

procedure TfrmExecAquisicaoVista.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlDomBem );
  FreeAndNil( CtrlImobLancamento );
  FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  FreeAndNil( CtrlHistoricoVidaUtil );
  
  inherited;
end;


function TfrmExecAquisicaoVista.VerificaPreenchimentoAP: boolean;
begin
   Result := False;

	  try

      if (DBcboTipoRecDes.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Despesa!', DBcboTipoRecDes);

      if ( molFornecedor1.edtNomeFantasia.Text = '' ) then
         raise EValidacao.CreateVal('É necessário indicar o Fornecedor / Favorecido!', molFornecedor1.btnBuscaForn);

      if edtNumDocumento.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Número do Documento!', edtNumDocumento);

      if edtDataVenc.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataVenc.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataVenc);
      //Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

      // verifica se o vencimento escolhido é um dia inútil
      if ModuloImobiliario.AdminImob.bFlgDiaUtilAP then begin
         if DayOfWeek(edtDataVenc.Date) in [1, 7] then
            raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edtDataVenc);
      end;

      // verifica o preenchimento dos campos abrigatórios p/ APs
      if ModuloImobiliario.Adminimob.bFlgUsaAP then begin

         if (DBcboFormaRecPag.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar a Forma de Pagamento!', DBcboFormaRecPag);

         if (length(trim(edtReferenciaAP.Text)) = 0) then
            raise EValidacao.CreateVal('É necessário indicar a Referência / Processo!', edtReferenciaAP);

         if (DBcboCentroCusto.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCusto);

      end;
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


procedure TfrmExecAquisicaoVista.PreenchePlacaCAF;
var sPlaca: string;
    iSeqPlaca : Integer;
    iPlaca    : Integer;
    iPrefixo  : Integer;
begin
   iSeqPlaca := 0;
   // procedimento que preenche o número das placas dos bens, se precisar
   iPrefixo  := 0;
   qryGruposContabeis.First;

   if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) then Inc(iSeqPlaca);

   while not qryGruposContabeis.Eof do begin

      iPlaca := CAF.PlacaCaf(qryGruposContabeisIDGRUPO.AsInteger, molImovelInativo1.iImovel, Sistema.IdEmpresa, qryGruposContabeisFLGSEMPLACA.AsInteger, iSeqPlaca);

      if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) and (iPlaca <> -1) then
      begin
         if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.IsNull) and
            (dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsInteger = qryGruposContabeisIDGRUPO.AsInteger) then begin
            iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumTer);
         end;

         if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.IsNull) and
            (dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsInteger = qryGruposContabeisIDGRUPO.AsInteger) then begin
            iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumEdi);
         end;

         if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.IsNull) and
            (dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsInteger = qryGruposContabeisIDGRUPO.AsInteger) then begin
            iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumIns);
         end;

         iPlaca := StrToInt(IntToStr(iPrefixo) + CompletaInicio(IntToStr(iPlaca), '0',6));
      end;

      qryGruposContabeis.Edit;
      qryGruposContabeisPLACACAF.AsInteger := iPlaca;
      qryGruposContabeis.Post;
      qryGruposContabeis.Next;
      
      if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao <> 1) then Inc(iSeqPlaca);
   end;
end;


function TfrmExecAquisicaoVista.CadastraCAF : Boolean;
var iIdConjunto, iIdBem, iPlanilha, iIdLancImovel : integer;
    cdsBem, cdsTaxasDep, cdsPlanoPatroxBem, cdsImagem, cdsPlanoPatroxVigenciaBem : TCMClientDataSet;
    sSQL : String;
    cdsAux: TClientDataSet;
    auxTaxaDep, auxVidaUtil : Extended; //Helio - SOL Nº 212226 KINTANA Nº 2037651
begin
   Result := True;
   cdsPlanoPatroxVigenciaBem := TCMClientDataSet.Create(nil);
   try
      try
          //Cássio - SOL 107352 KINTANA 482365 - Início
         //Inclui o histórico de Segregação do bem
         //cdsHstPercSegregaBem.Data :=  CtrlDomBem.ListaHstPercSegregaImob(molImovelInativo1.iImovel);
         cdsPlanoPatroxVigenciaBem.Data :=  CtrlDomBem.ListaPlanoPatroxVigenciaImob(molImovelInativo1.iImovel);

         // preenche placaCAF
         PreenchePlacaCAF;

         // ATUALIZAR O IMÓVEL
         sSQL :=
         'UPDATE ' + #13 +
         '   IMOVEL ' + #13 +
         'SET ' + #13 +
         '   CODTIPIMOVEL   = :PCODTIPIMOVEL, ' + #13 +
         '   IMODATACOMPRA  = :PIMODATACOMPRA, ' + #13 +
         '   IMOVLRCOMPRA   = :PIMOVLRCOMPRA, ' + #13 +
         '   IMOMOEDACOMPRA = :PIMOMOEDACOMPRA, ' + #13 +
         '   FLGSTATUS      = ''N'', ' + #13 +
         '   FLGATIVO       = 1 ' + #13;

         if ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1 then
         begin
            qryGruposContabeis.First;
            sSQL := sSQL +
            '   ,IMOCODIGO = ' + QuotedStr(Copy(qryGruposContabeisPLACACAF.AsString,2,6)) + #13;
         end;

         sSQL := sSQL +
         'WHERE  ' + #13 +
         '   IDIMOVEL = :PIDIMOVEL ' + #13;

         qryUpdImovel.SQL.Text := sSQL;

         LimpaParametros (qryUpdImovel);
         qryUpdImovel.ParamByName ('PCODTIPIMOVEL').AsString    := DBcboTipoImovel.LookupValue;
         qryUpdImovel.ParamByName ('PIMODATACOMPRA').AsDateTime := edtDataAquisicao.DateTime;
         qryUpdImovel.ParamByName ('PIMOVLRCOMPRA').AsFloat     := edtVlrOper.Value;
         qryUpdImovel.ParamByName ('PIMOMOEDACOMPRA').AsInteger := Modulo.iMoedaCorrente;
         qryUpdImovel.ParamByName ('PIDIMOVEL').AsInteger       := molImovelInativo1.iImovel;
         qryUpdImovel.ExecSQL;

         // Daniel Simões - 22290
         if ( cbDepAquisicao.Checked=True ) then begin
           // registra evento no imóvel
           UEventoImovel.EventoImovel.RegistraEvento(molImovelInativo1.iImovel, 0,
                                                     Sistema.IdUsuario, 0, 0,
                                                     edtDataAquisicao.Date,
                                                     edtDataAquisicao.Date,
                                                     'AQ', 'Aquisição do Imóvel',
                                                     meObsEvento.Text, 0, 0, 0, True)
         end else begin
           UEventoImovel.EventoImovel.RegistraEvento(molImovelInativo1.iImovel, 0,
                                                     Sistema.IdUsuario, 0, 0,
                                                     edtDataAquisicao.Date,
                                                     edtDataAquisicao.Date,
                                                     'AQ', 'Aquisição do Imóvel ( SEM DEPRECIAÇÃO )',
                                                     meObsEvento.Text, 0, 0, 0, True)
         end;

         // gravar lancamentosimovel
         iIdLancImovel := LeUltRegistro(nil,'LANCAMENTOSIMOVEL');
         LimpaParametros (dtmLancImovel.qryLancImovel);

         with dtmLancImovel.qryInsertLancImovel do begin
            ParamByName('PIDLANCIMOVEL').AsInteger := iIdLancImovel;
            ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
            ParamByName('PIDIMOVEL').AsInteger := molImovelInativo1.iImovel;
            ParamByName('PDATALANCAMENTO').AsDateTime := edtDataLanc.DateTime;
            ParamByName('PDATAVENCIMENTO').AsDateTime := edtDataVenc.DateTime;
            ParamByName('PMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
            ParamByName('PANOCOMPETENCIA').AsInteger  := word(trunc(DBspnAno.Value));
            ParamByName('PMESREFERENCIA').AsInteger   := DiasInUteis.ExtraiMes(edtDataAquisicao.DateTime);
            ParamByName('PANOREFERENCIA').AsInteger   := DiasInUteis.ExtraiAno(edtDataAquisicao.DateTime);

            ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);
            ParamByName('PRECPAG').AsString := 'P';
            ParamByName('PMOEDAPAGAR').AsInteger := Modulo.iMoedaCorrente;
            ParamByName('PIDFORCLI').AsInteger := molFornecedor1.iFornecedor;
            ParamByName('PFLGINTEGRADO').AsInteger := 0;
            ParamByName('PFLGORIGEMLANC').AsString := 'C';
            ParamByName('PIDUSUARIOSISTEMA').AsInteger := Sistema.IdUsuario;
            ParamByName('PIDDOCUMENTO').AsInteger := iDocumento;
            ParamByName('PNODOCUMENTO').AsInteger := StrToInt(edtNumDocumento.text);
            ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;

            ParamByName('PVLRLANCPAGAR').AsFloat := edtVlrOper.Value;
            ParamByName('PVLRLANCOMPAGAR').AsFloat := edtVlrOper.Value;

            ParamByName('PCODFORMA').AsInteger := StrToInt(DBcboFormaRecPag.LookupValue);
            ParamByName('PCODCENTROCUSTO').AsString := DBcboCentroCusto.LookupValue;
            ParamByName('PREFERENCIAAP').AsString := edtReferenciaAP.Text;
            if dbCboContaBancaria.Value <> '' then
               ParamByName('PIDCBANCARIA').AsInteger    := StrToInt(dbCboContaBancaria.LookupValue);

            ExecSQL;
         end;

         // insere a Observação na tabela ObsLancImovel
         if length(trim(memObs.Text)) > 0 then FuncoesImob.InsertObsLanc(iDocumento, memObs.Text);

         // cadastro de conjunto
         LimpaParametros(dtmCAF.qryInsConjunto);
         iIdConjunto := LeUltRegistro(nil,'CONJUNTO');
         dtmCAF.qryInsConjunto.ParamByName('PIDCONJUNTO').AsInteger    := iIdConjunto;
         dtmCAF.qryInsConjunto.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
         dtmCAF.qryInsConjunto.ParamByName('PIDLOCALIZACAO').AsInteger := molLocalizacao1.iLocalizacao;
         dtmCAF.qryInsConjunto.ParamByName('PIDRESPONSAVEL').AsInteger := molLocalizacao1.iResponsavel;
         dtmCAF.qryInsConjunto.ParamByName('PDESCCONJUNTO').AsString   := molImovelInativo1.edtImovel.Text;
         dtmCAF.qryInsConjunto.ExecSQL;


         // table rateiodepreciacao
         LimpaParametros(dtmCAF.qryInsRateioDepreciacao);
         dtmCAF.qryInsRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger    := iIdConjunto;
         dtmCAF.qryInsRateioDepreciacao.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
         dtmCAF.qryInsRateioDepreciacao.ParamByName('PCODCENTROCUSTO').AsString := molLocalizacao1.sCodCentroCusto;
         dtmCAF.qryInsRateioDepreciacao.ParamByName('PPARTICIPACAO').AsInteger  := 100;
         dtmCAF.qryInsRateioDepreciacao.ParamByName('PDTAINICIO').AsDateTime    := edtDataAquisicao.DateTime;
         dtmCAF.qryInsRateioDepreciacao.ExecSQL;

         // Instancia os cds necessários para a inclusão do bem
         cdsBem            := TCMClientDataSet.Create( nil );
         cdsTaxasDep       := TCMClientDataSet.Create( nil );
         cdsPlanoPatroxBem := TCMClientDataSet.Create( nil );
         cdsImagem         := TCMClientDataSet.Create( nil );

         // Abre a estrutura do cds vazia
         cdsBem.Data            := CtrlDomBem.ListaBem(Sistema.IdEmpresa, -99);
         cdsTaxasDep.Data       := CtrlDomBem.ListaBemxDep(Sistema.IdEmpresa, -99);
         cdsPlanoPatroxBem.Data := CtrlDomBem.ListaPlanoPatroxBem(Sistema.IdEmpresa, -99);
         cdsImagem.Data         := CtrlDomBem.CarregaImagem(-99);

         // Associa os cds locais aos cds do Ctrl
         CtrlDomBem.cds               := cdsBem;
         CtrlDomBem.cdsTaxasDep       := cdsTaxasDep;

         //Cássio - SOL 92381 KINTANA 394180 - Início
         //Se caso existir Planos Previdenciários definidos no Cadastro do Imóvel,
         //utilizar estes planos na Contabilização dos Bens gerados na Aquisição.
         cdsAux := TCMClientDataSet.Create(nil);
         if CtrlImobLancamento.VerificaSegregacaoOrigemImovelxBem(molImovelInativo1.iImovel, cdsAux) then
          while not cdsAux.Eof do
          begin
            cdsPlanoPatroxBem.Insert;
            cdsPlanoPatroxBem.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
            cdsPlanoPatroxBem.FieldByName('NOMEPATRO').AsString := cdsAux.FieldByName('NOMEPATRO').AsString;
            cdsPlanoPatroxBem.FieldByName('IDPATRO').AsFloat := cdsAux.FieldByName('IDPATRO').AsFloat;
            cdsPlanoPatroxBem.FieldByName('NOMEPLANOPREV').AsString := cdsAux.FieldByName('NOMEPLANO').AsString;
            cdsPlanoPatroxBem.FieldByName('IDPLANOPREV').AsString := cdsAux.FieldByName('IDPLANOPREV').AsString;
            cdsPlanoPatroxBem.FieldByName('PPBPERCRATEIO').AsFloat := cdsAux.FieldByName('PPIPERCENTRATEIO').AsFloat;

            cdsPlanoPatroxBem.Post;
            cdsAux.Next;
         end;
        //Cássio - SOL 92381 KINTANA 394180 - Fim

         CtrlDomBem.cdsPlanoPatroxBem := cdsPlanoPatroxBem;
         CtrlDomBem.cdsImagem         := cdsImagem;

         iPlanilha := 0;
         // executa as entradas dos bens
         qryGruposContabeis.First;
         while not qryGruposContabeis.Eof do begin
            // somente registra no Ativo Fixo bens escolhidos para o imóvel
            if qryGruposContabeisVALOR.AsFloat <> 0 then begin

               // Preenche o Cds de Bem
               cdsBem.EmptyDataSet;
               cdsBem.Insert;
               cdsBem.FieldByName('IDPESSOA').AsInteger       := Sistema.IdEmpresa;
               cdsBem.FieldByName('IDMODULO').AsInteger       := Sistema.IdModulo;
               cdsBem.FieldByName('IDCONJUNTO').AsInteger     := iIdConjunto;
               cdsBem.FieldByName('IDGRUPO').AsInteger        := qryGruposContabeisIDGRUPO.AsInteger;
               cdsBem.FieldByName('IDCLASSEBEM').AsInteger    := molClasseBem1.iClasseBem;
               cdsBem.FieldByName('UNIDNEGOC').AsInteger      := ModuloImobiliario.InvestImob.iUnidNegoc;
               cdsBem.FieldByName('DESBEM').AsString          := molImovelInativo1.edtImovel.Text + ' - ' + qryGruposContabeisNOME_BEM.AsString;
               cdsBem.FieldByName('IDFORNSERV').AsInteger     := molFornecedor1.iFornecedor;
               cdsBem.FieldByName('IDSITUACAO').AsInteger     := StrToInt(DBcboSituacao.LookupValue);
               cdsBem.FieldByName('VALHISTORICO').AsFloat     := qryGruposContabeisVALOR.AsFloat;
               cdsBem.FieldByName('IDOPCIONAL').AsString      := molImovelInativo1.sMestre;
               cdsBem.FieldByName('REGISTRO').AsString        := 'I';
               cdsBem.FieldByName('CONTROLE').AsString        := 'T';
               cdsBem.FieldByName('BAIXATOTAL').AsString      := 'N';
               cdsBem.FieldByName('DTAINCLUSAO').AsDateTime   := edtDataAquisicao.DateTime;
               cdsBem.FieldByName('DTANOTA').AsDateTime       := edtDataAquisicao.DateTime;

               if ( cbDepAquisicao.Checked=True ) then // Daniel Simões - 22290
                 cdsBem.FieldByName('DATAINICIODEP').AsDateTime := edtDataAquisicao.DateTime;

               cdsBem.FieldByName('FLGBEMINTCONTAB').AsInteger:= 1;
               cdsBem.FieldByName('DTACONTAB').AsDateTime     := edtDataAquisicao.DateTime;

               if ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1 then
                  cdsBem.FieldByName('PLACA').AsInteger          := qryGruposContabeisPLACACAF.AsInteger;

               cdsBem.Post;

               // Preenche o Cds da TaxaDep
               cdsTaxasDep.EmptyDataSet;
               cdsTaxasDep.Insert;
               cdsTaxasDep.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
               cdsTaxasDep.FieldByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
               cdsTaxasDep.FieldByName('IDBEMXDEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;

               //Helio - SOL Nº 212226 KINTANA Nº 2037651
               if wwDBspnVidaUtil.Enabled and
                  (cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger > 0) and
                  (qryGruposContabeisGRUPO_BEM.AsString <> 'T') then
               begin
                   auxVidaUtil := cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger*1.0;

                   auxTaxaDep := CtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorMes(auxVidaUtil);

                   cdsTaxasDep.FieldByName('TAXADEP').AsFloat := auxTaxaDep;
               end else
               begin
                   cdsTaxasDep.FieldByName('TAXADEP').AsFloat     := qryGruposContabeisDEPRECIACAO.AsFloat;
               end;
               //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

               if ( cbDepAquisicao.Checked=False ) then // Daniel Simões - 22290
                 cdsTaxasDep.FieldByName('FLGDEPREC').AsInteger := 1;

               cdsTaxasDep.Post;

               CtrlDomBem.OpenTransaction := False;
               CtrlDomBem.qGruposContabeis := qryGruposContabeis; // Vando - SOL 154328-5901 / KTN 1373449
               CtrlDomBem.qGruposContabeis.tag := qryGruposContabeisIDGRUPO.AsInteger; // Vando - SOL 154328-5901 / KTN 1373449
               CtrlDomBem.idImovelHistorico := molImovelInativo1.iImovel; // Vando - SOL 154328-5901 / KTN 1373449
               if CtrlDomBem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa,
                                                Sistema.IdUsuario, 'I',
                                                qryGruposContabeisVALOR.AsFloat, 1 ) then begin
                  iIdBem := CtrlDomBem.IdBem;
               end else begin
                  iIdBem := -1;
                  raise Exception.create(CtrlDomBem.MessageInfo);
               end;

               if not cdsAux.IsEmpty then
               begin
                  cdsPlanoPatroxVigenciaBem.First;
                  while not cdsPlanoPatroxVigenciaBem.Eof do
                  begin
                    CtrlDomBem.GravaPlanoPatroxVigenciaBem(LeUltRegistro(nil, 'PLANOPATROXVIGENCIABEM'),
                                                      cdsPlanoPatroxVigenciaBem.FieldByName('IDPLANOPREV').AsInteger,
                                                      cdsPlanoPatroxVigenciaBem.FieldByName('IDPATRO').AsInteger,
                                                      iIdBem,
                                                      Sistema.idEmpresa,
                                                      cdsPlanoPatroxVigenciaBem.FieldByName('DATAVIGENCIA').AsString,
                                                      cdsPlanoPatroxVigenciaBem.FieldByName('PERCENTRATEIO').AsFloat);
                    cdsPlanoPatroxVigenciaBem.Next;
                  end;
               end;

               // Vando - SOL 154328-5901 / KTN 1373449
               try
                  LimpaParametros (dtmCAF.qryInsImovelxbem);
                  dtmCAF.qryInsImovelxbem.ParamByName('PIDIMOVEL').AsInteger := molImovelInativo1.iImovel;
                  dtmCAF.qryInsImovelxbem.ParamByName('PIDBEM').AsInteger    := iIdBem;
                  dtmCAF.qryInsImovelxbem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
                  dtmCAF.qryInsImovelxbem.ParamByName('PIXBGRUPO').AsString  := qryGruposContabeisGRUPO_BEM.AsString;
                  dtmCAF.qryInsImovelxbem.ExecSQL;
               except
                  LimpaParametros (dtmCAF.qryInsImovelxbem);
               end;
               // Vando - SOL 154328-5901 / KTN 1373449 - fim

               // gravar LANCIMOVELXBEM
               LimpaParametros (dtmCAF.qryInsertLancImovelxbem);
               dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDLANCIMOVEL').AsInteger := iIdLancImovel;
               dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDBEM').AsInteger := iIdBem;
               dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
               dtmCAF.qryInsertLancImovelxbem.ParamByName('PVLRMOV').AsFloat := qryGruposContabeisVALOR.AsFloat;
               dtmCAF.qryInsertLancImovelxbem.ParamByName('PFLGNUMMOV').AsInteger := 1;   // entrada com controle total
               dtmCAF.qryInsertLancImovelxbem.ExecSQL;
            end;
            qryGruposContabeis.Next;
         end;
      except
         on E : Exception do begin
            Result := False;
            MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
   finally
      FreeAndNil( cdsBem );
      FreeAndNil( cdsTaxasDep );
      FreeAndNil( cdsPlanoPatroxBem );
      FreeAndNil( cdsImagem );
      FreeAndNil( cdsAux );
      FreeAndNil( cdsPlanoPatroxVigenciaBem );
   end;
end;

procedure TfrmExecAquisicaoVista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   FechaQueries;
end;

procedure TfrmExecAquisicaoVista.CalculaCamposVirtuais;
var GrupoImobiliario: rGrupoBem;
begin
   qryGruposContabeis.First;
   while not qryGruposContabeis.Eof do begin
      qryGruposContabeis.Edit;
      GrupoImobiliario := CAF.GrupoImobiliario(qryGruposContabeisIDGRUPO.AsInteger,'');
      qryGruposContabeisNOME_BEM.AsString  := GrupoImobiliario.sDescricao;
      qryGruposContabeisGRUPO_BEM.AsString := GrupoImobiliario.sTipoGrupo;
      qryGruposContabeis.Post;
      qryGruposContabeis.Next;
   end;
end;


procedure TfrmExecAquisicaoVista.molClasseBem1btnBuscaClasseBemClick(
  Sender: TObject);
begin
  inherited;
  molClasseBem1.btnBuscaClasseBemClick(Sender);

end;

//Helio - SOL Nº 212226 KINTANA Nº 2037651
procedure TfrmExecAquisicaoVista.molImovelInativo1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelInativo1.btnBuscaImovelClick(Sender);

  cdsHistoricoVidaUtil.Data       := CtrlHistoricoVidaUtil.LookupHistoricoVidaUtilVigente( molImovelInativo1.iImovel );
end;


procedure TfrmExecAquisicaoVista.DBcboTipoImovelChange(Sender: TObject);
begin
  inherited;
   if (DBcboTipoImovel.LookupValue = 'CONST') or
      (DBcboTipoImovel.LookupValue = 'TERR') then
   begin
      wwDBspnVidaUtil.Enabled := False;
   end else
   begin
      wwDBspnVidaUtil.Enabled := True;
   end;
end;
//FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

end.
