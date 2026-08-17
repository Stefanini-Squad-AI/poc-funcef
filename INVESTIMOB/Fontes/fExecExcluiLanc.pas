unit fExecExcluiLanc;

//------------------------------------------------------------------------------
//
//	   Consulta e Exclui Lançamentos de Investimentos
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  06/12/2001
//	Data de Término   :
//
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 113136 
Data........: 04/07/2022
Responsável.: Cássio Florencio Rovaroto
Descrição...: Implementação da provisão de custos de imóveis.
--------------------------------------------------------------------------------
Rotina ......: ExcluiAquiParc
SOL..........: 200960
Kintana......: 1943658
Data.........: 26/02/2013
Responsável..: Thiago Melo
Descrição....: Sistema apresenta erro de constraint
--------------------------------------------------------------------------------
Rotina ......: -
SOL..........: 172902/8222
Kintana......: 1577546
Data.........: 05/04/2012
Responsável..: Wylliam Leite da Silva
Descrição....: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Rotina ......: -
SOL..........: 127213
Kintana......: 672023
Data.........: 03/01/2011
Responsável..: Helen V. Bianchi
Descrição....: Add qryLancAquis , ExcluiParc ,uCtrlCafxContab
--------------------------------------------------------------------------------
SOL..........: 141302
Kintana......: 890967
Responsável..: Cássio Rovaroto de Camargo
Data.........: 05/08/2010
Descrição....: Alteração na rotina de Estorno de Acréscimo de Valor,p/ permitir
               o estorno de Decréscimos de Valor
--------------------------------------------------------------------------------}
interface                         

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, CmEventosCadastro,
  ImgList, ComCtrls, FCadastroCSImob, wwriched, uCMClientDataSet,
  uCtrlMovBaixa, uCtrlDomBem, uCtrlMovAcrescimoValor, wwdbdatetimepicker,
  CMDateTimePicker,uCtrlLancamentosImovel,uCtrlCafxContab,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab, uCtrlProvisaoImovel;

type
  TExclui = record
     bExcluiu : boolean;
     sErro: string;
  end;
  TfrmExecExcluiLanc = class(TfrmCadastroCSImob)
    lblRecPag: TLabel;
    lblStatus: TLabel;
    lblEstornado: TLabel;
    dsLancamentos: TwwDataSource;
    qryDESCCUSTORECIMO: TStringField;
    qryFORCLI_DOC: TFloatField;
    qrySTATUS_DOC: TStringField;
    qryPLNPLANIL: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryMOEDA_LANC: TStringField;
    qryCOD_MOEDA: TFloatField;
    qryIDFORCLI: TFloatField;
    qryNF_FORCLI: TStringField;
    qryRS_FORCLI: TStringField;
    qryDATALANCAMENTO: TDateTimeField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryDATA_BAIXA: TDateTimeField;
    qryMESCOMPETENCIA: TFloatField;
    qryANOCOMPETENCIA: TFloatField;
    qryFLGORIGEMLANC: TStringField;
    qryFLGESTORNADO: TFloatField;
    qryFLGINTEGRADO: TFloatField;
    qry_ORIGEMLANC: TStringField;
    qry_MESCOMPETENCIA: TStringField;
    qryRECPAG: TStringField;
    qryVALOR_OM_TOTAL: TFloatField;
    qryVALOR_TOTAL: TFloatField;
    qryIDDOCUMENTO: TFloatField;
    qryNODOCUMENTO: TFloatField;
    qryDOC_CAPCAR: TFloatField;
    qryNUMAPGR: TFloatField;
    qryNOSSONUMERO: TStringField;
    pgcPrincipal: TPageControl;
    tbsGeral: TTabSheet;
    Label5: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label16: TLabel;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    DBedtPortadorForma: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    tbsImovel: TTabSheet;
    DBgrdReajuste: TwwDBGrid;
    tbsMensagem: TTabSheet;
    Label15: TLabel;
    lblDataVencimento: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBedtNomeUsuario: TDBEdit;
    DBedtNomeExtenso: TDBEdit;
    DBedtOrigem: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit9: TDBEdit;
    Panel3: TPanel;
    Label13: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBedtLinha1: TDBEdit;
    DBedtLinha2: TDBEdit;
    DBedtLinha3: TDBEdit;
    DBedtLinha4: TDBEdit;
    DBedtLinha5: TDBEdit;
    DBedtLinha6: TDBEdit;
    DBedtLinha7: TDBEdit;
    DBedtLinha8: TDBEdit;
    DBedtLinha9: TDBEdit;
    Panel2: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit2: TDBEdit;
    DBmemObs: TDBMemo;
    Label26: TLabel;
    Bevel1: TBevel;
    dsObs: TwwDataSource;
    dsMsg: TwwDataSource;
    tbsAlterador: TTabSheet;
    Panel1: TPanel;
    DBgrdAlteradoresDoc: TwwDBGrid;
    dsAlteradoresDoc: TwwDataSource;
    qryFORMA_RECTOPAGTO: TStringField;
    tbsAutorizacao: TTabSheet;
    Panel4: TPanel;
    wwDBGrid1: TwwDBGrid;
    dsAutorizacoes: TwwDataSource;
    wwDBRichEdit1: TwwDBRichEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label27: TLabel;
    qryIDCBANCARIA: TFloatField;
    dsContaBancairia: TwwDataSource;
    DBgrdAlteradoresLanc: TwwDBGrid;
    dsAlteradoresLanc: TwwDataSource;
    Panel5: TPanel;
    wwDBGrid2: TwwDBGrid;
    dsLancImovelxBem: TwwDataSource;
    Label22: TLabel;
    DBEdit3: TDBEdit;
    qryLancImovelXBem: TwwQuery;
    qryLancImovelXBemIXBGRUPO: TStringField;
    qryLancImovelXBemVLRMOV: TFloatField;
    qryLancImovelXBemFLGNUMMOV: TFloatField;
    qryLancImovelXBemDESCTIPOMOVIMENTACAO: TStringField;
    qryLancImovelXBemNome_bem: TStringField;
    qryLancImovelXBemIDBEM: TFloatField;
    qryLancImovelXBemDATALANCAMENTO: TDateTimeField;
    qryLancImovelXBemIDIMOVEL: TFloatField;
    qryLancImovelXBemIDMOVIMENTACAO: TFloatField;
    qryLancImovelXBemIDLANCIMOVEL: TFloatField;
    Panel6: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    edIdImovel: TEdit;
    edtDataBaixa: TCMDateTimePicker;
    Button1: TButton;
    qryLancAquis: TwwQuery;
    qryLancAquisIDLANCIMOVEL: TFloatField;
    qryLancAquisMOEDARECEB: TFloatField;
    qryLancAquisIDIMOVEL: TFloatField;
    qryLancAquisIDCONTRATOIMOVEL: TFloatField;
    qryLancAquisIDPESSOA: TFloatField;
    qryLancAquisPLNCODIGO: TFloatField;
    qryLancAquisIDTIPOCUSTORECIMO: TFloatField;
    qryLancAquisCODDOCUMENTO: TFloatField;
    qryLancAquisDATALANCAMENTO: TDateTimeField;
    qryLancAquisDATAVENCIMENTO: TDateTimeField;
    qryLancAquisVLRLANCPAGAR: TFloatField;
    qryLancAquisVLRLANCOMPAGAR: TFloatField;
    qryLancAquisRECPAG: TStringField;
    qryLancAquisMESREFERENCIA: TFloatField;
    qryLancAquisANOREFERENCIA: TFloatField;
    qryLancAquisMESCOMPETENCIA: TFloatField;
    qryLancAquisANOCOMPETENCIA: TFloatField;
    qryLancAquisFLGAGRUPAR: TStringField;
    qryLancAquisFLGAGRUPADO: TFloatField;
    qryLancAquisFLGTIPOLANCAMENTO: TStringField;
    qryLancAquisMOEDAPAGAR: TFloatField;
    qryLancAquisVLRLANCOMRECEB: TFloatField;
    qryLancAquisVLRLANCRECEB: TFloatField;
    qryLancAquisVLRJUROS: TFloatField;
    qryLancAquisVLRMULTA: TFloatField;
    qryLancAquisVLRCORRECAOMON: TFloatField;
    qryLancAquisTRGDTINCLUSAO: TDateTimeField;
    qryLancAquisTRGUSERINCLUSAO: TStringField;
    qryLancAquisDATACORRECAO: TDateTimeField;
    qryLancAquisFLGMULTACALCULADA: TFloatField;
    qryLancAquisFLGINTEGRADO: TFloatField;
    qryLancAquisIDFORCLI: TFloatField;
    qryLancAquisIDUSUARIOSISTEMA: TFloatField;
    qryLancAquisFLGORIGEM: TFloatField;
    qryLancAquisFLGESTORNADO: TFloatField;
    qryLancAquisFLGORIGEMLANC: TStringField;
    qryLancAquisNODOCUMENTO: TFloatField;
    qryLancAquisFLGERRO: TFloatField;
    qryLancAquisIDADMINIMOVEL: TFloatField;
    qryLancAquisANOPRESTACAO: TFloatField;
    qryLancAquisMESPRESTACAO: TFloatField;
    qryLancAquisFLGIMPORTADO: TFloatField;
    qryLancAquisVLRCOMISSAO: TFloatField;
    qryLancAquisIDRESERVAORCAMEN: TFloatField;
    qryLancAquisIDRATEIODOCUM: TFloatField;
    qryLancAquisIDDOCUMENTO: TFloatField;
    qryLancAquisCODFORMA: TFloatField;
    qryLancAquisREFERENCIAAP: TStringField;
    qryLancAquisOBS: TMemoField;
    qryLancAquisIDPROGRAMA: TFloatField;
    qryLancAquisIDEMPRESA: TFloatField;
    qryLancAquisCODCENTROCUSTO: TStringField;
    qryLancAquisIDLANCREEMBDESP: TFloatField;
    qryLancAquisCODTIPIMOVEL: TStringField;
    qryLancAquisMSGERROINTEGRA: TStringField;
    qryLancAquisCODPORTFORMA: TFloatField;
    qryLancAquisFLGCONCILIADO: TFloatField;
    qryLancAquisCOMPLDOCUMENTO: TStringField;
    qryLancAquisDATALIMITE: TDateTimeField;
    qryLancAquisIDCBANCARIA: TFloatField;
    qryLancAquisIDMODULO: TFloatField;
    qryLancAquisDTINICTBDIARIA: TDateTimeField;
    qryLancAquisDTFIMCTBDIARIA: TDateTimeField;
    qryLancAquisNUMAPALT: TFloatField;
    qryLancAquisDATAEMISSAO: TDateTimeField;
    qryLancAquisNOSSONUMERO: TStringField;
    qryLancAquisIDCONDPAGAQUISPARC: TFloatField;
    qryBens: TwwQuery;
    qryBensSEL_BEM: TFloatField;
    qryBensDESBEM: TStringField;
    qryBensNOME_GRUPO: TStringField;
    qryBensVLR_BEM: TFloatField;
    qryBensIXBGRUPO: TStringField;
    qryBensIDIMOVEL: TFloatField;
    qryBensIDBEM: TFloatField;
    qryBensIMOVEL_EXTENSO: TStringField;
    qryBensCODTIPIMOVEL: TStringField;
    qryBensIMOCODIGO: TStringField;
    qryBensIXBPERCENT: TFloatField;
    qryBensIDGRUPO: TFloatField;
    qryBensIDCONJUNTO: TFloatField;
    qryBensIDLOCALIZACAO: TFloatField;
    qryBensIDRESPONSAVEL: TFloatField;
    tbsParcelas: TTabSheet;
    Panel7: TPanel;
    wwDBGrid3: TwwDBGrid;
    dsLancAquis: TwwDataSource;
    qryImovelXBemBaixa: TwwQuery;
    qryImovelXBemBaixaIMOVEL_EXTENSO: TStringField;
    qryImovelXBemBaixaIMOCODIGO: TStringField;
    qryImovelXBemBaixaIDIMOVEL: TFloatField;
    qryImovelXBemBaixaIDBEM: TFloatField;
    qryImovelXBemBaixaIXBPERCENT: TFloatField;
    qryImovelXBemBaixaIXBGRUPO: TStringField;
    qryImovelXBemBaixaIDGRUPO: TFloatField;
    qryImovelXBemBaixaCODTIPIMOVEL: TStringField;
    qryImovelXBemBaixaIDCONJUNTO: TFloatField;
    qryImovelXBemBaixaIDLOCALIZACAO: TFloatField;
    qryImovelXBemBaixaIDRESPONSAVEL: TFloatField;
    qryImovelXBemBaixaDESBEM: TStringField;
    qryImovelXBemBaixaNOME_GRUPO: TStringField;
    qryImovelXBemBaixaVLR_BEM: TFloatField;
    qryImovelXBemBaixaSEL_BEM: TFloatField;

    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdReajusteTopRowChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBgrdReajusteRowChanged(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryLancImovelXBemCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);


  private { Private declarations }

    CtrlMovBaixa : TCtrlMovBaixa;
    CtrlDomBem   : TCtrlDomBem;
    CtrlMovAcrescimoValor : TCtrlMovAcrescimoValor;

//Ricardo Cristiano - SOL : 1465767 Kintana : 672023 - Alteração de lugar para melhorar performance na entrada da tela

    CafxContab  : TCtrlCafxContab;
    ExcluiParc  : Integer;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
    CtrlProvisaoImovel : TCtrlProvisaoImovel; // Cássio Rovaroto - SIG nº 113136

    procedure ExibeStatus;
    function  ExcluiAquisicao: TExclui;
    function  ExcluiAlienacao: TExclui;
    function  ExcluiAcrescimo: TExclui;
    //Helen - SOL : 127213 Kintana : 672023
    function  ExcluiAquiParc: TExclui;

    function  ExcluiBem : Boolean;


  public { Public declarations }
    iDocumento: Int64;
    procedure Seleciona;

  end;



var
  frmExecExcluiLanc: TfrmExecExcluiLanc;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, dImobiliario, dLookImobiliario, uFuncoesImob,
   DMS, DCAF, dLancImovel, dEventoImovel, uCAF, uComunsImobiliario, uModuloInvestImob,
   FProgresso;



procedure TfrmExecExcluiLanc.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   // redesenha o form na volta do MontaSelect
   Repaint;
   // se houve busca, abre a query principal com apenas o registro buscado
   if dtmMS.MS_Lancamento.RetornouValor then begin
      iDocumento := StrToInt(dtmMS.MS_Lancamento.ValoresChave[6]);
      Seleciona;
      sbtnApagar.Enabled := True;
   end;
end;



procedure TfrmExecExcluiLanc.ExibeStatus;
var
   sRecPag, sStatus : string;
begin
   lblRecPag.Visible    := False;
   lblStatus.Visible    := False;
   lblEstornado.Visible := False;

   qryLancAquis.Close;
   qryLancAquis.ParamByName('IDIMOVEL').Value := dtmLancImovel.qryLancImovelIDIMOVEL.AsInteger ;
   qryLancAquis.Open;
   if not qryLancAquis.eof then
      tbsParcelas.TabVisible := True
   else
      tbsParcelas.TabVisible := False;

   // Não Integrado
   if ( (qryCODDOCUMENTO.IsNull) and (qryPLNCODIGO.IsNull) ) then begin

      lblEstornado.Caption := 'Não Integrado';
      lblEstornado.Visible := True;

   end else begin

      // Só integrado com Contabilidade
      if (qryCODDOCUMENTO.IsNull) then begin // não integra capcar

         lblEstornado.Caption := 'Contabilizado';
         lblEstornado.Visible := True;

      end else begin

         // RecPag ---------------------------------------------------------------------------------
         sRecPag := qryRECPAG.AsString;
         if length(sRecPag) > 0 then begin

            case sRecPag[1] of
               'R':
               begin
                  lblRecPag.Caption    := 'a Receber';
                  lblRecPag.Font.Color := clNavy;
               end;

               'P':
               begin
                  lblRecPag.Caption    := 'a Pagar';
                  lblRecPag.Font.Color := clMaroon;
               end;
            end;

            lblRecPag.Visible := True;
         end;

         // Estornado ------------------------------------------------------------------------------
         if (qryFLGESTORNADO.asInteger = 1) then begin

            lblEstornado.Caption := 'Estornado';
            lblEstornado.Visible := True;

         end else begin

            lblEstornado.Visible := False;

            // Status ---------------------------------------------------------------------------------
            sStatus := qrySTATUS_DOC.AsString;

            if sStatus = '2' then begin
               lblStatus.Caption    := 'já Baixado';
               lblStatus.Font.Color := clNavy;
            end else begin
               lblStatus.Caption    := 'em Aberto';
               lblStatus.Font.Color := clMaroon;
            end;

            lblStatus.Visible := True;
         end;
      end;
   end;
end;



procedure TfrmExecExcluiLanc.sbtnProcurarClick(Sender: TObject);
begin
   dtmMS.MS_Lancamento.Executar;
   CmeCadastro.Find(Self);

   sbtnProcurar.Down := False;
   pnlFundo.Enabled  := True;
end;



procedure TfrmExecExcluiLanc.FormShow(Sender: TObject);
begin
   LimpaParametros(dtmLancImovel.qryLancImovel);
   qry.Close;
   inherited;
end;



procedure TfrmExecExcluiLanc.qryCalcFields(DataSet: TDataSet);
var
   sOrigem : String;
begin
   Case qryMESCOMPETENCIA.asInteger of
       1: qry_MESCOMPETENCIA.asString := 'Janeiro';
       2: qry_MESCOMPETENCIA.asString := 'Fevereiro';
       3: qry_MESCOMPETENCIA.asString := 'Março';
       4: qry_MESCOMPETENCIA.asString := 'Abril';
       5: qry_MESCOMPETENCIA.asString := 'Maio';
       6: qry_MESCOMPETENCIA.asString := 'Junho';
       7: qry_MESCOMPETENCIA.asString := 'Julho';
       8: qry_MESCOMPETENCIA.asString := 'Agosto';
       9: qry_MESCOMPETENCIA.asString := 'Setembro';
      10: qry_MESCOMPETENCIA.asString := 'Outubro';
      11: qry_MESCOMPETENCIA.asString := 'Novembro';
      12: qry_MESCOMPETENCIA.asString := 'Dezembro';
   end;

   // prenche a origem do lançamento (nome extenso)
   sOrigem := qryFLGORIGEMLANC.asString;
   if sOrigem <> '' then begin
      qry_ORIGEMLANC.AsString := OrigemLancamento(sOrigem[1]);
   end else begin
      qry_ORIGEMLANC.AsString := '';
   end;
end;




procedure TfrmExecExcluiLanc.DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
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



procedure TfrmExecExcluiLanc.DBgrdReajusteTopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecExcluiLanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLancImovel.qryLancImovel.Close;
   qryLancImovelXBem.Close;
   dtmLookImobiliario.qryLookContaBancaria.Close;
   dtmLancImovel.qrySelectAlteraLanc.Close;
   dtmLancImovel.qrySelectAlteraDoc.Close;
   inherited;
end;



procedure TfrmExecExcluiLanc.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   // habilita o painel de fundo (que contém o PageControl - orelhas)
   pnlFundo.Enabled := True;
end;



procedure TfrmExecExcluiLanc.FormCreate(Sender: TObject);
begin
   inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlMovBaixa := TCtrlMovBaixa.Create;
   CtrlDomBem   := TCtrlDomBem.Create;
   CtrlMovAcrescimoValor := TCtrlMovAcrescimoValor.Create;

   CtrlMovBaixa.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
   CtrlDomBem.InitializeAs( CtrlMovBaixa );
   CtrlMovAcrescimoValor.InitializeAs( CtrlMovBaixa );

//Ricardo Cristiano - SOL : 167207 Kintana : 1465767 - Alteração de lugar para melhorar performance na entrada da tela

   CafxContab  := TCtrlCafxContab.Create;
   CafxContab.InitializeAs(CtrlMovBaixa);

   pgcPrincipal.ActivePageIndex := 0;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CafxContab);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
   //Cássio Rovaroto - SIG nº 113136 - Início
   CtrlProvisaoImovel := TCtrlProvisaoImovel.Create;
   CtrlProvisaoImovel.InitializeAs(CafxContab);
   //Cássio Rovaroto - SIG nº 113136 - Fim
end;

procedure TfrmExecExcluiLanc.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlMovBaixa );
  FreeAndNil( CtrlDomBem );
  FreeAndNil( CtrlMovAcrescimoValor );

//Ricardo Cristiano - SOL : 167207 Kintana : 1465767 - Alteração de lugar para melhorar performance na entrada da tela  

  FreeAndNil(CafxContab);
  FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  FreeAndNil(CtrlProvisaoImovel); // Cássio Rovaroto - SIG nº 113136

  inherited;
end;



procedure TfrmExecExcluiLanc.Seleciona;
begin
   Screen.Cursor := crHourGlass;
   pgcPrincipal.ActivePage := tbsGeral;

   // qry com GROUP BY para consolidar o Principal
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PIDDOCUMENTO').AsInteger     := iDocumento;
      Open;
   end;

   // dados bancários
   with dtmLookImobiliario.qryLookContaBancaria do begin
      LimpaParametros(dtmLookImobiliario.qryLookContaBancaria);
      ParamByName('PIDCBANCARIA').AsInteger := qryIDCBANCARIA.AsInteger;
      Open;
   end;

   // Observações
   with dtmLancImovel.qrySelectObsLanc do begin
      LimpaParametros(dtmLancImovel.qrySelectObsLanc);
      ParamByName('PIDDOCUMENTO').AsInteger     := iDocumento;
      Open;
   end;

   // Lançamentos (por Imóvel)
   with dtmLancImovel.qryLancImovel do begin
      LimpaParametros(dtmLancImovel.qryLancImovel);
      ParamByName('PIDPESSOA').AsInteger        := Sistema.idEmpresa;
      ParamByName('PIDDOCUMENTO').AsInteger     := iDocumento;
      Open;
   end;

   // Mensagem do Boleto
   with dtmLancImovel.qrySelectMsgLanc do begin
      LimpaParametros(dtmLancImovel.qrySelectMsgLanc);
      ParamByName('PIDDOCUMENTO').AsInteger     := iDocumento;
      Open;
   end;

   // Alteradores
   if qryFLGINTEGRADO.IsNull then begin                  // lançamentos integrados
      with dtmLancImovel.qrySelectAlteraDoc do begin
         LimpaParametros(dtmLancImovel.qrySelectAlteraDoc);
         ParamByName('PCODDOCUMENTO').AsInteger    := iDocumento;
         Open;
         DBgrdAlteradoresDoc.BringToFront;
      end;
   end else begin                                        // lançamentos não integrados
      with dtmLancImovel.qrySelectAlteraLanc do begin
         LimpaParametros(dtmLancImovel.qrySelectAlteraLanc);
         ParamByName('PIDDOCUMENTO').AsInteger    := iDocumento;
         Open;
         DBgrdAlteradoresLanc.BringToFront;
      end;
   end;

   // Autorização / Conciliação
   with dtmLancImovel.qryConciliaDoc do begin
      LimpaParametros (dtmLancImovel.qryConciliaDoc);
      ParamByName ('PIDDOCUMENTO').AsInteger    := iDocumento;
      Open;
   end;

   ExibeStatus;
   Screen.Cursor := crDefault;
end;

procedure TfrmExecExcluiLanc.DBgrdReajusteRowChanged(Sender: TObject);
begin
   inherited;
   // Abre a tabela de bens para o imóvel selecionado
   if dtmLancImovel.qryLancImovel.Active then begin
      with qryLancImovelXBem do begin
         LimpaParametros(qryLancImovelXBem);
         ParamByName('PIDLANCIMOVEL').AsInteger := dtmLancImovel.qryLancImovelIDLANCIMOVEL.AsInteger;
         Open;
      end;
   end else begin
      qryLancImovelXBem.Close;
   end;
end;

procedure TfrmExecExcluiLanc.sbtnApagarClick(Sender: TObject);
var
   sOrigem : String;
   rExclui : TExclui;
   sDocumento : String; //Helen - SOL : 127213 Kintana : 672023
begin
   inherited;
   if not qryDATA_BAIXA.IsNull then begin
      MsgDlg('Lançamento já foi baixado, não pode mais ser excluído!','Aviso',mtWarning,[mbOk],0);
      Exit;
   end;

   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   if DBEdit16.Text <> '' then
   Begin
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DBEdit16.Text) then
        Begin
           MsgDlg ('Período bloqueado pela Contabilidade - Data Lançamento','Aviso',mtWarning,[mbok],0);
           Exit;
      End;
   End;

   if DBEdit17.Text <> '' then
   Begin
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DBEdit17.Text) then
        Begin
           MsgDlg ('Período bloqueado pela Contabilidade - Data Vencimento','Aviso',mtWarning,[mbok],0);
           Exit;
      End;
   End;

   if DBEdit18.Text <> '' then
   Begin
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DBEdit18.Text) then
        Begin
           MsgDlg ('Período bloqueado pela Contabilidade - Data Baixa','Aviso',mtWarning,[mbok],0);
           Exit;
      End;
   End;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

   if MsgDlg('Confirma a Exclusão do Lançamento?','Confirma',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin

      // Exclui o Lançamento baseado na Origem
      sOrigem := qryFLGORIGEMLANC.asString;
      case sOrigem[1] of
         'O': begin   // lançamentos de obras
                 MsgDlg('O lançamento de obras so pode ser excluído em Lançamento de Obras.', 'Informação', mtInformation, [mbOK], 0);
              end;

               // Exclui Aquisições a Vista
         'C' : begin
                  rExclui := ExcluiAquisicao;
                  if rExclui.bExcluiu then begin
                     MsgDlg('Exclusão realizada com sucesso!','Informação',mtInformation,[mbOk],0);
                     iDocumento := -1;
                     Seleciona;
                  end else begin
                     MsgDlg('Não foi possível excluir o lançamento.'+#13#10+rExclui.sErro,'Erro',mtError,[mbOk],0);
                  end;
               end;

               // Exclui Alienação a Vista
         'S' : begin
                  rExclui := ExcluiAlienacao;
                  if rExclui.bExcluiu then begin
                     MsgDlg('Exclusão realizada com sucesso!','Informação',mtInformation,[mbOk],0);
                     iDocumento := -1;
                     Seleciona;
                  end else begin
                     MsgDlg('Não foi possível excluir o lançamento.'+#13#10+rExclui.sErro,'Erro',mtError,[mbOk],0);
                  end;
               end;
         //Helen - SOL : 127213 Kintana : 672023
         'B' : begin
                  qryLancAquis.first;
                  sDocumento := '';
                  while not qryLancAquis.eof do
                  begin
                      //Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
                      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo, qryLancAquisDATALANCAMENTO.AsString) then
                        Begin
                           MsgDlg ('Período bloqueado pela Contabilidade - Data Lançamento','Aviso',mtWarning,[mbok],0);
                           Exit;
                      End;
                      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo, qryLancAquisDATAVENCIMENTO.AsString) then
                        Begin
                           MsgDlg ('Período bloqueado pela Contabilidade - Data Vencimento','Aviso',mtWarning,[mbok],0);
                           Exit;
                      End;
                      //Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
                      sDocumento := sDocumento + qryLancAquisNODOCUMENTO.AsString + ', '  ;
                      qryLancAquis.next;
                  end;
                  if MsgDlg('Os documentos: ' + sDocumento + 'foram gerados em conjunto na aquisição parcelada.Confirma a exclusão de todos os documentos?','Confirma',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                  begin
                      ExcluiParc := 0;
                      rExclui    := ExcluiAquiParc;
                      if (rExclui.bExcluiu) and (ExcluiParc = 0) then
                      begin
                         MsgDlg('Exclusão realizada com sucesso!','Informação',mtInformation,[mbOk],0);
                         iDocumento := -1;
                         Seleciona;
                      end else
                      begin
                         MsgDlg('Não foi possível excluir o lançamento.'+#13#10+rExclui.sErro,'Erro',mtError,[mbOk],0);
                      end;
                  end
                  else
                  begin
                      iDocumento := -1;
                      Seleciona;
                  end;
               end;
         //Helen - SOL : 127213 Kintana : 672023 - Fim

         // Exclui Acréscimo de Valor
         //Cássio - SOL Nº  KINTANA Nº - Início
        //Inclusão do parâmetro X, que indica um Decréscimo de Valor
         'A','X' : begin
                  rExclui := ExcluiAcrescimo;
                  if rExclui.bExcluiu then begin
                     MsgDlg('Exclusão realizada com sucesso!','Informação',mtInformation,[mbOk],0);
                     iDocumento := -1;
                     Seleciona;
                  end else begin
                     MsgDlg('Não foi possível excluir o lançamento.'+#13#10+rExclui.sErro,'Erro',mtError,[mbOk],0);
                  end;
               end;
      else
         MsgDlg('Tipo de Lançamento não permite exclusão!','Aviso',mtWarning,[mbOk],0);
      end;
   end;
end;

function TfrmExecExcluiLanc.ExcluiAcrescimo: TExclui;
var iChave : Integer;
    sMsg   : string;
    cdsBem, cdsTaxasDep, cdsPlanoPatroxBem, cdsImagem : TCMClientDataSet;
begin
   Result.bExcluiu := True;
   Result.sErro := '';
   qryLancImovelXBem.DisableControls;
   dtmLancImovel.qryLancImovel.DisableControls;
   try
      try
         StartTransacao;

         // Instancia os cds necessários para a inclusão do bem
         cdsBem            := TCMClientDataSet.Create( nil );
         cdsTaxasDep       := TCMClientDataSet.Create( nil );
         cdsPlanoPatroxBem := TCMClientDataSet.Create( nil );
         cdsImagem         := TCMClientDataSet.Create( nil );
         // Associa os cds locais aos cds do Ctrl
         CtrlDomBem.cds               := cdsBem;
         CtrlDomBem.cdsTaxasDep       := cdsTaxasDep;
         CtrlDomBem.cdsPlanoPatroxBem := cdsPlanoPatroxBem;
         CtrlDomBem.cdsImagem         := cdsImagem;

         // abrir qryLancImovelXBem - com o filtro de documento;
         LimpaParametros(qryLancImovelXBem);
         qryLancImovelXBem.ParamByName('PIDDOCUMENTO').AsInteger := dtmLancImovel.qryLancImovelIDDOCUMENTO.AsInteger;
         qryLancImovelXBem.Open;

         while not qryLancImovelXBem.Eof do begin
            { Definir qual é o tipo do lançamento:
               1 - Entrada com controle total
               9 - Acréscimo de valor
            }
            if qryLancImovelXBemFLGNUMMOV.AsInteger = 1 then begin   // entrada com controle total
               // Exclui em ImovelxBem
               try
                  iChave := qryLancImovelXBemIDIMOVEL.AsInteger;
                  with dtmCaf.qryDelImovelxBem do begin
                     LimpaParametros(dtmCaf.qryDelImovelxBem);
                     ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
                     ParamByName('PIDIMOVEL').AsInteger := iChave;
                     ParamByName('PIDBEM').AsInteger    := qryLancImovelXBemIDBEM.AsInteger;
                     ExecSQL;
                  end;
               except
                  raise Exception.create('Erro ao excluir a tabela IMOVELXBEM');
               end;

               // é necessario excluir a lancimovelxbem porque logo abaixo o bem é excluído
               try
                  iChave := qryLancImovelXBemIDLANCIMOVEL.AsInteger;
                  with dtmCaf.qryDelLancImovelxBem do begin
                     LimpaParametros(dtmCaf.qryDelLancImovelxBem);
                     ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
                     ParamByName('PIDLANCIMOVEL').AsInteger := iChave;
                     ParamByName('PIDBEM').AsInteger        := qryLancImovelXBemIDBEM.AsInteger;
                     ExecSQL;
                  end;
               except
                  raise Exception.create('Erro ao excluir a tabela LANCIMOVELXBEM');
               end;

               // Carrega os cds com as informações do bem a ser excluído
               cdsBem.Data            := CtrlDomBem.ListaBem(Sistema.IdEmpresa, qryLancImovelXBemIDBEM.AsInteger);
               cdsTaxasDep.Data       := CtrlDomBem.ListaBemxDep(Sistema.IdEmpresa, qryLancImovelXBemIDBEM.AsInteger);
               cdsPlanoPatroxBem.Data := CtrlDomBem.ListaPlanoPatroxBem(Sistema.IdEmpresa, qryLancImovelXBemIDBEM.AsInteger);
               cdsImagem.Data         := CtrlDomBem.CarregaImagem(-99);

               // Desabilita a transação do CtrlObject e exclui o bem no CAF
               CtrlDomBem.OpenTransaction := False;
               if not CtrlDomBem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa,
                                                    Sistema.IdUsuario, 'R',
                                                    cdsBem.FieldByName('VALHISTORICO').AsFloat,
                                                    1 ) then begin
                  raise Exception.create(CtrlDomBem.MessageInfo);
               end;
            end else begin                                           // acrescimo de valor
               try
                  iChave := qryLancImovelXBemIDLANCIMOVEL.AsInteger;
                  with dtmCaf.qryDelLancImovelxBem do begin
                     LimpaParametros(dtmCaf.qryDelLancImovelxBem);
                     ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
                     ParamByName('PIDLANCIMOVEL').AsInteger := iChave;
                     ParamByName('PIDBEM').AsInteger        := qryLancImovelXBemIDBEM.AsInteger;
                     ExecSQL;
                  end;
               except
                  raise Exception.create('Erro ao excluir a tabela LANCIMOVELXBEM');
               end;

               // pegar o id do acrescimo
               LimpaParametros(dtmCAF.qryLookAcrescimoValor);
               dtmCAF.qryLookAcrescimoValor.ParamByName('PIDMOVIMENTACAO').AsInteger := qryLancImovelXBemIDMOVIMENTACAO.AsInteger;
               dtmCAF.qryLookAcrescimoValor.Open;
               iChave := dtmCAF.qryLookAcrescimoValorIDACRESCIMO.AsInteger;

               CtrlMovAcrescimoValor.OpenTransaction := False;
               if not CtrlMovAcrescimoValor.EstornaAcrescimoValor(Sistema.IdModulo,
                                                                  Sistema.IdEmpresa,
                                                                  Sistema.IdUsuario,
                                                                  qryLancImovelXBemIDBEM.AsInteger,
                                                                  iChave,
                                                                  qryLancImovelXBemDATALANCAMENTO.AsDateTime,
                                                                  Date() ) then begin
                  raise Exception.create(CtrlMovAcrescimoValor.MessageInfo);
               end;
            end;

            // Exclui Evento do Imovel
            try
               with dtmEventoImovel.qryDeleteEventoImovel do begin
                  LimpaParametros(dtmEventoImovel.qryDeleteEventoImovel);
                  ParamByName('PIDIMOVEL').AsInteger  := qryLancImovelXBemIDIMOVEL.AsInteger;
                  ParamByName('PEVIDATA').AsDateTime  := qryLancImovelXBemDATALANCAMENTO.AsDateTime;
                  ParamByName('PVALOR').AsFloat       := qryLancImovelXBemVLRMOV.AsFloat;
                  ParamByName('PTIPOEVENTO').AsString := 'AC';
                  ExecSQL;
               end;
            except
               raise Exception.create('Erro ao excluir o EVENTOIMOVEL');
            end;

            //Cássio Rovaroto - SIG nº 113136 - Início
            //Exclui Provisão de Custo.
            if not CtrlProvisaoImovel.EstornaProvisaoCustoImovel(Sistema.IdUsuario,
                                                                 Sistema.IdModulo,
                                                                 Sistema.IdEmpresa,
                                                                 202,
                                                                 qryLancImovelXBemDATALANCAMENTO.AsDateTime,
                                                                 True,
                                                                 True,
                                                                 qryLancImovelXBemIDBEM.AsInteger)  then
              raise Exception.Create(CtrlProvisaoImovel.MessageInfo);                                                                 
            //Cássio Rovaroto - SIG nº 113136 - Fim

            qryLancImovelXBem.Next;
         end;

         // Se não ocorreram erros na funçao do AtivoFixo, continua a excluir
         if Result.bExcluiu = True then begin

            // Exclui Lançamentos Imovel
            sMsg := '';
            if FuncoesImob.ExcluiLancImovel(dtmLancImovel.qryLancImovelIDDOCUMENTO.AsInteger,
                                            dtmLancImovel.qryLancImovelPLNCODIGO.AsInteger,
                                            dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime,
                                            (not dtmLancImovel.qryLancImovelCODDOCUMENTO.IsNull),
                                            (not dtmLancImovel.qryLancImovelPLNCODIGO.IsNull),
                                            sMsg) = 1 then begin
               raise Exception.Create(sMsg); // não consegui excluir = cai no except
            end;

            CommitTransacao;
         end;
      except
         on E : Exception do begin
            RollBackTransacao;
            Result.bExcluiu := False;
            Result.sErro    := E.message;
         end;
      end;
   finally
      FreeAndNil( cdsBem );
      FreeAndNil( cdsTaxasDep );
      FreeAndNil( cdsPlanoPatroxBem );
      FreeAndNil( cdsImagem );
      qryLancImovelXBem.EnableControls;
      dtmLancImovel.qryLancImovel.EnableControls;
   end;
end;


function TfrmExecExcluiLanc.ExcluiAquisicao: TExclui;
var iChave : Integer;
    sMsg: string;
    cdsBem, cdsTaxasDep, cdsPlanoPatroxBem, cdsImagem, cdsPlanoPatroxVigenciaBem : TCMClientDataSet;
begin
   Result.bExcluiu := True;
   Result.sErro := '';
   try
      try
         StartTransacao;

         // Exclui os bens do imóvel relacionado no documento
         // Exclui em LancImovelxBem
         try
            iChave := dtmLancImovel.qryLancImovelIDLANCIMOVEL.AsInteger;
            with dtmCaf.qryDelLancImovelxBem do begin
               LimpaParametros(dtmCaf.qryDelLancImovelxBem);
               ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
               ParamByName('PIDLANCIMOVEL').AsInteger := iChave;
               ExecSQL;
            end;
         except
            raise Exception.create('Erro ao excluir em LANCIMOVELXBEM');
         end;

         iChave := dtmLancImovel.qryLancImovelIDIMOVEL.AsInteger;

         // abre uma query imovelxbem antes de exclui-la
         LimpaParametros (dtmCaf.qryImovelxBem);
         dtmCaf.qryImovelxBem.ParamByName('PIDIMOVEL').AsInteger := iChave;
         dtmCaf.qryImovelxBem.Open;

         // Exclui em ImovelxBem
         try
            with dtmCaf.qryDelImovelxBem do begin
               LimpaParametros(dtmCaf.qryDelImovelxBem);
               ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
               ParamByName('PIDIMOVEL').AsInteger := iChave;
               ExecSQL;
            end;
         except
            raise Exception.create('Erro ao excluir em IMOVELXBEM');
         end;

         // Exclui Evento do Imovel
         try
            with dtmEventoImovel.qryDeleteEventoImovel do begin
               LimpaParametros(dtmEventoImovel.qryDeleteEventoImovel);
               ParamByName('PIDIMOVEL').AsInteger  := iChave;
               ParamByName('PTIPOEVENTO').AsString := 'AQ';
               ExecSQL;
            end;
         except
            raise Exception.create('Erro ao excluir em EVENTOIMOVEL');
         end;

         // Atualiza o Imóvel
         try
            with dtmCaf.qryUpdImovel do begin
               LimpaParametros (dtmCaf.qryUpdImovel);
               ParamByName ('PCODTIPIMOVEL').AsString    := '';
               ParamByName ('PIMODATACOMPRA').AsDateTime := Date();
               ParamByName ('PIMOVLRCOMPRA').AsFloat     := 0;
               ParamByName ('PIMOMOEDACOMPRA').AsInteger := Modulo.iMoedaCorrente;
               ParamByName ('PIDIMOVEL').AsInteger       := iChave;
               ParamByName ('PFLGSTATUS').AsString       := '';
               ParamByName ('PFLGATIVO').AsInteger       := 0;
               ExecSQL;
            end;
         except
            raise Exception.create('Erro ao atualizar a tabela IMOVEL');
         end;

         // Instancia os cds necessários para a inclusão do bem
         cdsBem                    := TCMClientDataSet.Create( nil );
         cdsTaxasDep               := TCMClientDataSet.Create( nil );
         cdsPlanoPatroxBem         := TCMClientDataSet.Create( nil );
         cdsImagem                 := TCMClientDataSet.Create( nil );
         cdsPlanoPatroxVigenciaBem := TCMClientDataSet.Create( nil );

         // Associa os cds locais aos cds do Ctrl
         CtrlDomBem.cds               := cdsBem;
         CtrlDomBem.cdsTaxasDep       := cdsTaxasDep;
         CtrlDomBem.cdsPlanoPatroxBem := cdsPlanoPatroxBem;
         CtrlDomBem.cdsImagem         := cdsImagem;

         // Estorna a Entrada no AtivoFixo para cada bem do imovel ( Retorna -1 )
         with dtmCaf.qryImovelxBem do
         begin
            First;
            while not eof do
            begin
               // Carrega os cds com as informações do bem a ser excluído
               cdsBem.Data                    := CtrlDomBem.ListaBem(Sistema.IdEmpresa, dtmCaf.qryImovelXBemIDBEM.AsInteger);
               cdsTaxasDep.Data               := CtrlDomBem.ListaBemxDep(Sistema.IdEmpresa, dtmCaf.qryImovelXBemIDBEM.AsInteger);
               cdsPlanoPatroxBem.Data         := CtrlDomBem.ListaPlanoPatroxBem(Sistema.IdEmpresa, dtmCaf.qryImovelXBemIDBEM.AsInteger);
               cdsImagem.Data                 := CtrlDomBem.CarregaImagem(-99);
               cdsPlanoPatroxVigenciaBem.Data := CtrlDomBem.ListaPlanoPatroxVigenciaBem(dtmCaf.qryImovelXBemIDBEM.AsInteger);

              //Cássio - SOL 107352 KINTANA 482365 - Inicio
              //Exclui da tabela PLANOPATROXVIGENCIABEM
              CtrlDomBem.ExcluiPlanoPatroxVigenciaBem(cdsPlanoPatroxVigenciaBem.FieldByName('IDBEM').AsInteger);

               // Desabilita a transação do CtrlObject e exclui o bem no CAF
               CtrlDomBem.OpenTransaction := False;
               if not CtrlDomBem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa,
                                                    Sistema.IdUsuario, 'R',
                                                    cdsBem.FieldByName('VALHISTORICO').AsFloat,
                                                   1 ) then
              begin
                  raise Exception.create(CtrlDomBem.MessageInfo);
               end;
               Next;
            end;
         end;
         //Cássio - SOL 107352 KINTANA 482365 - Fim

         // Se não ocorreram erros na funçao do AtivoFixo, continua a excluir
         if Result.bExcluiu = True then begin
            dtmCaf.qryImovelxBem.First;
            iChave := dtmCaf.qryImovelxBemIDCONJUNTO.AsInteger;

            // Exclui em RateioDepreciação
            try
               LimpaParametros(dtmCaf.qryDelRateioDepreciacao);
               dtmCaf.qryDelRateioDepreciacao.ParamByName('PIDEMPRESA').AsInteger  := Sistema.IdEmpresa;
               dtmCaf.qryDelRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger := iChave;
               dtmCaf.qryDelRateioDepreciacao.ExecSQL;

               // Exclui em Conjunto
               LimpaParametros(dtmCaf.qryDelConjunto);
               dtmCaf.qryDelConjunto.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
               dtmCaf.qryDelConjunto.ParamByName('PIDCONJUNTO').AsInteger := iChave;
               dtmCaf.qryDelConjunto.ExecSQL;
            except
               raise Exception.create('Erro ao excluir o conjunto do CAF');
            end;

            // Exclui Restante
            if FuncoesImob.ExcluiLancImovel(dtmLancImovel.qryLancImovelIDDOCUMENTO.AsInteger,
                                            dtmLancImovel.qryLancImovelPLNCODIGO.AsInteger,
                                            dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime,
                                            (not dtmLancImovel.qryLancImovelCODDOCUMENTO.IsNull),
                                            (not dtmLancImovel.qryLancImovelPLNCODIGO.IsNull),
                                            sMsg) = 1 then begin
               raise Exception.create(sMsg);
            end;

            CommitTransacao;
            dtmCaf.qryImovelxBem.Close;
         end;
      except
         on E : Exception do begin
            RollBackTransacao;
            Result.bExcluiu := False;
            Result.sErro := E.message;
         end;
      end;
   finally
      FreeAndNil( cdsBem );
      FreeAndNil( cdsTaxasDep );
      FreeAndNil( cdsPlanoPatroxBem );
      FreeAndNil( cdsImagem );
   end;
end;


function TfrmExecExcluiLanc.ExcluiAlienacao: TExclui;
var iChave, iTotReg, iPos : Integer;
    sMsg: string;
    vIDBens : Array of integer;
    i : Integer;
begin
   Result.bExcluiu := True;
   Result.sErro := '';
   try
      try
         StartTransacao;

         // Exibe caixa de dialogo com a barra de progresso
         frmProgresso.MostraFormProgresso('Verificando os bens alienados...',False,False);
         Application.ProcessMessages;

         // abrir qryLancImovelXBem - com o filtro de documento;
         LimpaParametros(qryLancImovelXBem);
         qryLancImovelXBem.ParamByName('PIDDOCUMENTO').AsInteger := dtmLancImovel.qryLancImovelIDDOCUMENTO.AsInteger;
         qryLancImovelXBem.Open;

         // Preenche vetor com os bens alienados
         iPos    := 0;
         iTotReg := qryLancImovelXBem.RecordCount;
         SetLength(vIDBens, iTotReg);
         while not qryLancImovelXBem.Eof do begin
           // Anda Progresso
           iPos := iPos + 1;
           frmProgresso.AndaFormProgresso( iPos, iTotReg );
           vIDBens[iPos-1] := qryLancImovelXBemIDBEM.AsInteger;
           qryLancImovelXBem.Next;
         end;

         frmProgresso.MostraFormProgresso('Estornando a baixa dos bens...',False,False,False);
         Application.ProcessMessages;

         // Desabilita a transação do CtrlObject
         CtrlMovBaixa.OpenTransaction := False;

         // Desfaz a alienação dos bens no CAF
         for i := 0 to Length(vIdBens) - 1 do begin
            if not CtrlMovBaixa.EstornaBaixa(Sistema.IdModulo,
                                             Sistema.IdEmpresa,
                                             Sistema.IdUsuario,
                                             vIdBens[i],
                                             qryDATALANCAMENTO.AsDateTime,
                                             Date() ) then
               raise Exception.create(CtrlMovBaixa.MessageInfo);
         end;
         // Desfaz o lançamento de cada imóvel alienado
         frmProgresso.MostraFormProgresso('Atualizando o Status dos imóveis alienados...',False,False);
         Application.ProcessMessages;

         dtmLancImovel.qryLancImovel.DisableControls;
         dtmLancImovel.qryLancImovel.First;
         iTotReg := dtmLancImovel.qryLancImovel.RecordCount;
         iPos    := 0;
         while not dtmLancImovel.qryLancImovel.Eof do begin
            iChave := dtmLancImovel.qryLancImovelIDIMOVEL.AsInteger;

            // Anda Progresso
            iPos := iPos + 1;
            frmProgresso.AndaFormProgresso( iPos, iTotReg );

            // Exclui Evento do Imovel
            try
               with dtmEventoImovel.qryDeleteEventoImovel do begin
                  LimpaParametros(dtmEventoImovel.qryDeleteEventoImovel);
                  ParamByName('PIDIMOVEL').AsInteger  := iChave;
                  ParamByName('PTIPOEVENTO').AsString := 'CA';
                  ExecSQL;
               end;
            except
               raise Exception.create('Erro ao excluir o EVENTOIMOVEL');
            end;

            // Atualiza o Status do Imóvel
            try
               with dtmCaf.qryUpdStatusImovel do begin
                  LimpaParametros (dtmCaf.qryUpdStatusImovel);
                  ParamByName ('PIDIMOVEL').AsInteger := iChave;
                  ParamByName ('PFLGSTATUS').AsString := 'N';
                  ParamByName ('PFLGATIVO').AsInteger := 1;
                  ExecSQL;
               end;
            except
               raise Exception.create('Erro ao atualizar o STATUS do imovel');
            end;

            // Exclui LançamentoImovelxBem
            try
               with dtmCaf.qryDelLancImovelxBem do begin
                  iChave := dtmLancImovel.qryLancImovelIDLANCIMOVEL.AsInteger;
                  LimpaParametros(dtmCaf.qryDelLancImovelxBem);
                  ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
                  ParamByName('PIDLANCIMOVEL').AsInteger := iChave;
                  ExecSQL;
               end;
            except
               raise Exception.create('Erro ao excluir o LANCIMOVELXBEM');
            end;

            dtmLancImovel.qryLancImovel.Next;
         end;

         // Exibe caixa de dialogo com a barra de progresso
         frmProgresso.MostraFormProgresso('Excluindo o Documento...',False,False);
         frmProgresso.AndaFormProgresso( 1,1 );
         Application.ProcessMessages;

         // Exclui Restante
         if FuncoesImob.ExcluiLancImovel(qryIDDOCUMENTO.AsInteger,
                                         qryPLNCODIGO.AsInteger,
                                         qryDATALANCAMENTO.AsDateTime,
                                         (not qryCODDOCUMENTO.IsNull),
                                         (not qryPLNCODIGO.IsNull),
                                         sMsg) = 1 then begin
            raise Exception.create(sMsg);
         end;
         CommitTransacao;
      except
         on E : Exception do begin
            RollBackTransacao;
            Result.bExcluiu := False;
            Result.sErro    := E.message;
         end;
      end;
   finally
      dtmLancImovel.qryLancImovel.EnableControls;
      frmProgresso.EscondeFormProgresso;
   end;
end;

procedure TfrmExecExcluiLanc.qryLancImovelXBemCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryLancImovelXBemNOME_BEM.AsString := CAF.GrupoExtenso(qryLancImovelXBemIXBGRUPO.AsString);

end;



function TfrmExecExcluiLanc.ExcluiBem: Boolean;
var iChave, iTotReg, iPos : Integer;
    sMsg: string;
    vIDBens : Array of integer;
    i : Integer;
begin
   Result := True;
   try
      try
         StartTransacao;

         // Exibe caixa de dialogo com a barra de progresso
         frmProgresso.MostraFormProgresso('Verificando os bens alienados...',False,False);
         Application.ProcessMessages;

         // abrir qryLancImovelXBem - com o filtro de documento;
         LimpaParametros(dtmCAF.qryImovelXBem);
         dtmCAF.qryImovelXBem.ParamByName('PIDIMOVEL').AsInteger := StrToInt(edIdImovel.Text);
         dtmCAF.qryImovelXBem.Open;

         // Preenche vetor com os bens alienados
         iPos    := 0;
         iTotReg := dtmCAF.qryImovelXBem.RecordCount;
         SetLength(vIDBens, iTotReg);
         while not dtmCAF.qryImovelXBem.Eof do begin
           Inc(iPos);
           vIDBens[iPos-1] := dtmCAF.qryImovelXBemIDBEM.AsInteger;
           dtmCAF.qryImovelXBem.Next;
         end;

         frmProgresso.MostraFormProgresso('Estornando a baixa dos bens...',False,False,False);
         Application.ProcessMessages;

         // Desfaz a alienação dos bens no CAF
         CtrlMovBaixa.OpenTransaction := False;
         for i := 0 to Length(vIdBens) - 1 do begin
            if not CtrlMovBaixa.EstornaBaixa(Sistema.IdModulo,
                                             Sistema.IdEmpresa,
                                             Sistema.IdUsuario,
                                             vIdBens[i],
                                             edtDataBaixa.Date,
                                             Date() ) then
               raise Exception.create(CtrlMovBaixa.MessageInfo);
         end;

         CommitTransacao;
      except
         on E : Exception do begin
            RollBackTransacao;
            Result := False;
         end;
      end;
   finally
      dtmLancImovel.qryLancImovel.EnableControls;
      frmProgresso.EscondeFormProgresso;
   end;
end;

procedure TfrmExecExcluiLanc.Button1Click(Sender: TObject);
begin
  inherited;
  ExcluiBem;
end;

function TfrmExecExcluiLanc.ExcluiAquiParc: TExclui;
var iOperacao, iBem , iGrupo : Integer;
    iChave , iCodErro,iExercicio, iPeriodo  : Integer;
    sMsg              : string;   fValVenda : Extended;
    sContaContabil,sContaDestino  ,sSql   : String;
    cdsBem, cdsTaxasDep, cdsPlanoPatroxBem, cdsImagem, cdsPlanoPatroxVigenciaBem: TCMClientDataSet;
    ParamContab : TParamContabeis; dDataMov : TDateTime;
   //Ricardo Cristiano - SOL : 167207 Kintana : 1465767 - Alteração de lugar para melhorar performance na entrada da tela
   //Helen - SOL : 127213 Kintana : 672023
   CtrlLancamentosImovel : TCtrlLancamentosImovel;
begin
   Screen.Cursor := crHourGlass;
   Result.bExcluiu := True;
   Result.sErro    := '';
   dDataMov        := 0;
   iBem            := 0;

   //Ricardo Cristiano - SOL : 167207 Kintana : 1465767 - Alteração de lugar para melhorar performance na entrada da tela
   // Helen - SOL: 127213 KTN: 672023
   CtrlLancamentosImovel := TCtrlLancamentosImovel.Create(Sistema.IDEmpresa,Sistema.IDModulo, Sistema.IdUsuario,SisTema.IDEspAcesso,Sistema.UsaPlanoPatro);
   CtrlLancamentosImovel.InitializeAs(CtrlMovBaixa);


   iOperacao := CtrlLancamentosImovel.VerificaCondPagParc(dtmLancImovel.qryLancImovelIDLANCIMOVEL.AsInteger);
   if iOperacao = 5 then
   begin
       Result.bExcluiu := False ;
       Result.sErro    := 'Existem Documentos já baixados (Aquisição Parcelada).';
   end
   else
   begin
       try
             StartTransacao;
             qryImovelXBemBaixa.Close;
             qryImovelXBemBaixa.ParamByName('PIDIMOVEL').AsInteger := CtrlLancamentosImovel.iIdImovelParc;
             qryImovelXBemBaixa.Open;

             qryLancAquis.Close;
             qryLancAquis.ParamByName('IDIMOVEL').Value := CtrlLancamentosImovel.iIdImovelParc  ;
             qryLancAquis.Open;
             qryLancAquis.First;
             CtrlLancamentosImovel.DelAquisParc(qryLancAquisIDIMOVEL.AsInteger);
             while  not qryLancAquis.eof do
             begin
                 try
                    try
                       // Exclui os bens do imóvel relacionado no documento
                       // Exclui em LancImovelxBem
                       try
                          iChave := qryLancAquisIDLANCIMOVEL.AsInteger; //  dtmLancImovel.qryLancImovelIDLANCIMOVEL.AsInteger;
                          with dtmCaf.qryDelLancImovelxBem do begin
                             LimpaParametros(dtmCaf.qryDelLancImovelxBem);
                             ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
                             ParamByName('PIDLANCIMOVEL').AsInteger := iChave;
                             ExecSQL;
                          end;
                       except
                          raise Exception.create('Erro ao excluir em LANCIMOVELXBEM');
                       end;
                       iChave := qryLancAquisIDIMOVEL.AsInteger;// dtmLancImovel.qryLancImovelIDIMOVEL.AsInteger;
                       // abre uma query imovelxbem antes de exclui-la
                       LimpaParametros (dtmCaf.qryImovelxBem);
                       dtmCaf.qryImovelxBem.ParamByName('PIDIMOVEL').AsInteger := iChave;
                       dtmCaf.qryImovelxBem.Open;

                       // Exclui Evento do Imovel
                       try
                          with dtmEventoImovel.qryDeleteEventoImovel do begin
                             LimpaParametros(dtmEventoImovel.qryDeleteEventoImovel);
                             ParamByName('PIDIMOVEL').AsInteger  := iChave;
                             ParamByName('PTIPOEVENTO').AsString := 'AQ';
                             ExecSQL;
                          end;
                       except
                          raise Exception.create('Erro ao excluir em EVENTOIMOVEL');
                       end;

                       // Atualiza o Imóvel
                       try
                          with dtmCaf.qryUpdImovel do begin
                             LimpaParametros (dtmCaf.qryUpdImovel);
                             ParamByName ('PCODTIPIMOVEL').AsString    := '';
                             ParamByName ('PIMODATACOMPRA').AsDateTime := Date();
                             ParamByName ('PIMOVLRCOMPRA').AsFloat     := 0;
                             ParamByName ('PIMOMOEDACOMPRA').AsInteger := Modulo.iMoedaCorrente;
                             ParamByName ('PIDIMOVEL').AsInteger       := iChave;
                             ParamByName ('PFLGSTATUS').AsString       := '';
                             ParamByName ('PFLGATIVO').AsInteger       := 0;
                             ExecSQL;
                          end;
                       except
                          Result.bExcluiu := False ;
                          raise Exception.create('Erro ao atualizar a tabela IMOVEL');
                       end;

                       // Instancia os cds necessários para a inclusão do bem
                       cdsBem                    := TCMClientDataSet.Create( nil );
                       cdsTaxasDep               := TCMClientDataSet.Create( nil );
                       cdsPlanoPatroxBem         := TCMClientDataSet.Create( nil );
                       cdsImagem                 := TCMClientDataSet.Create( nil );
                       cdsPlanoPatroxVigenciaBem := TCMClientDataSet.Create( nil );

                       // Associa os cds locais aos cds do Ctrl
                       CtrlDomBem.cds               := cdsBem;
                       CtrlDomBem.cdsTaxasDep       := cdsTaxasDep;
                       CtrlDomBem.cdsPlanoPatroxBem := cdsPlanoPatroxBem;
                       CtrlDomBem.cdsImagem         := cdsImagem;

                       // Estorna a Entrada no AtivoFixo para cada bem do imovel ( Retorna -1 )
                       with dtmCaf.qryImovelxBem do
                       begin
                          First;
                          if dtmCaf.qryImovelXBemIDBEM.AsInteger > 0 then
                             iBem   :=  dtmCaf.qryImovelXBemIDBEM.AsInteger;

                          while not eof do
                          begin
                             // Carrega os cds com as informações do bem a ser excluído
                             cdsBem.Data                    := CtrlDomBem.ListaBem(Sistema.IdEmpresa, dtmCaf.qryImovelXBemIDBEM.AsInteger);
                             cdsTaxasDep.Data               := CtrlDomBem.ListaBemxDep(Sistema.IdEmpresa, dtmCaf.qryImovelXBemIDBEM.AsInteger);
                             cdsPlanoPatroxBem.Data         := CtrlDomBem.ListaPlanoPatroxBem(Sistema.IdEmpresa, dtmCaf.qryImovelXBemIDBEM.AsInteger);
                             cdsImagem.Data                 := CtrlDomBem.CarregaImagem(-99);
                             cdsPlanoPatroxVigenciaBem.Data := CtrlDomBem.ListaPlanoPatroxVigenciaBem(dtmCaf.qryImovelXBemIDBEM.AsInteger);

                            //Exclui da tabela PLANOPATROXVIGENCIABEM
                            CtrlDomBem.ExcluiPlanoPatroxVigenciaBem(cdsPlanoPatroxVigenciaBem.FieldByName('IDBEM').AsInteger);

                            if (iOperacao = 2) or (iOperacao = 3) then
                            begin
                                  dDataMov := CtrlLancamentosImovel.VerificaMov(iBem);
                                  if dDataMov > 0 then
                                  begin
                                     if (not CafxContab.VerificaPeriodoContabil(Sistema.IdEmpresa,
                                                                  dDataMov,
                                                                  iExercicio,
                                                                  iPeriodo)) or
                                                                 (iOperacao = 3)
                                                                 then
                                     begin
                                            CtrlMovBaixa.OpenTransaction := False;
                                        if not CtrlMovBaixa.ExecutaBaixa(54,    // módulo 54 - investimob
                                                                             Sistema.IdEmpresa,
                                                                             Sistema.IdUsuario,
                                                                             dtmCaf.qryImovelXBemIDBEM.AsInteger,
                                                                             3,                 // 3 - Diversas
                                                                             CtrlLancamentosImovel.UltimaMov(dtmCaf.qryImovelXBemIDBEM.AsInteger),
                                                                             0,                 // tipo de proporção: 0 - percentual
                                                                             100,               // baixa 100 %
                                                                             0,
                                                                             'Exclusão Aquisição Parc.',
                                                                             '',
                                                                             0 ) then   // deprec. pro rata na data -1
                                        begin
                                               ExcluiParc := 1;
                                               Result.bExcluiu := False ;
                                               raise Exception.create( CtrlMovBaixa.MessageInfo );
                                               //Ricardo Cristiano - SOL : 167207 Kintana : 1465767 - Alteração de lugar para melhorar performance na entrada da tela
                                               // Helen - SOL: 127213 KTN: 672023
                                               FreeAndNil( CtrlLancamentosImovel );
                                               exit;
                                        end;
                                     end
                                     else
                                     begin
                                           // Exclui em ImovelxBem
                                           try
                                              with dtmCaf.qryDelImovelxBem do begin
                                                 LimpaParametros(dtmCaf.qryDelImovelxBem);
                                                 ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
                                                 ParamByName('PIDIMOVEL').AsInteger := iChave;
                                                 ExecSQL;
                                              end;
                                           except
                                              ExcluiParc := 1;
                                              raise Exception.create('Erro ao excluir em IMOVELXBEM');
                                              Result.bExcluiu := False;
                                           end;
                                           // Desabilita a transação do CtrlObject e exclui o bem no CAF
                                           CtrlDomBem.OpenTransaction := False;
                                           if not CtrlDomBem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa,
                                                                                Sistema.IdUsuario, 'R',
                                                                                cdsBem.FieldByName('VALHISTORICO').AsFloat,
                                                                               1 ) then
                                          begin
                                              ExcluiParc := 2;
                                           end;
                                     end;
                                  end
                                  else
                                  begin
                                        // Exclui em ImovelxBem
                                        try
                                           with dtmCaf.qryDelImovelxBem do begin
                                                LimpaParametros(dtmCaf.qryDelImovelxBem);
                                                ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
                                                ParamByName('PIDIMOVEL').AsInteger := iChave;
                                                ExecSQL;
                                           end;
                                        except
                                           raise Exception.create('Erro ao excluir em IMOVELXBEM');
                                        end;
                                        // Desabilita a transação do CtrlObject e exclui o bem no CAF
                                        CtrlDomBem.OpenTransaction := False;
                                        if not CtrlDomBem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa,
                                                                                Sistema.IdUsuario, 'R',
                                                                                cdsBem.FieldByName('VALHISTORICO').AsFloat,
                                                                               1 ) then
                                        begin
                                              raise Exception.create(CtrlDomBem.MessageInfo);
                                              Result.bExcluiu := False;
                                              ExcluiParc := 1;
                                        end;
                                  end;

                            end
                            else
                            begin
                                // Exclui em ImovelxBem
                                try
                                   with dtmCaf.qryDelImovelxBem do begin
                                        LimpaParametros(dtmCaf.qryDelImovelxBem);
                                        ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
                                        ParamByName('PIDIMOVEL').AsInteger := iChave;
                                        ExecSQL;
                                   end;
                                except
                                   raise Exception.create('Erro ao excluir em IMOVELXBEM');
                                end;
                                // Desabilita a transação do CtrlObject e exclui o bem no CAF
                                CtrlDomBem.OpenTransaction := False;
                                if not CtrlDomBem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa,
                                                                        Sistema.IdUsuario, 'R',
                                                                        cdsBem.FieldByName('VALHISTORICO').AsFloat,
                                                                       1 ) then
                                begin
                                      raise Exception.create(CtrlDomBem.MessageInfo);
                                      Result.bExcluiu := False;
                                      ExcluiParc := 1;
                                end;
                            end;
                               Next;
                            end;
                       end;
                       // Se não ocorreram erros na funçao do AtivoFixo, continua a excluir
                       if (Result.bExcluiu = True) And (ExcluiParc = 0) then
                       begin
                          dtmCaf.qryImovelxBem.First;
                          iChave := dtmCaf.qryImovelxBemIDCONJUNTO.AsInteger;

                          // Exclui em RateioDepreciação
                          try
                             LimpaParametros(dtmCaf.qryDelRateioDepreciacao);
                             dtmCaf.qryDelRateioDepreciacao.ParamByName('PIDEMPRESA').AsInteger  := Sistema.IdEmpresa;
                             dtmCaf.qryDelRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger := iChave;
                             dtmCaf.qryDelRateioDepreciacao.ExecSQL;

                             // Exclui em Conjunto
                             LimpaParametros(dtmCaf.qryDelConjunto);
                             dtmCaf.qryDelConjunto.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
                             dtmCaf.qryDelConjunto.ParamByName('PIDCONJUNTO').AsInteger := iChave;
                             dtmCaf.qryDelConjunto.ExecSQL;
                          except
                             raise Exception.create('Erro ao excluir o conjunto do CAF');
                             Result.bExcluiu := False;
                          end;
                          // Exclui Restante
                          if FuncoesImob.ExcluiLancImovel(qryLancAquisIDDOCUMENTO.AsInteger,
                                                          qryLancAquisPLNCODIGO.AsInteger,
                                                          qryLancAquisDATALANCAMENTO.AsDateTime,
                                                          (not qryLancAquisCODDOCUMENTO.IsNull),
                                                          (not qryLancAquisPLNCODIGO.IsNull),
                                                          sMsg) = 1     then
                          begin
                              ExcluiParc := 1;  Result.bExcluiu := False ;
                              raise Exception.Create(sMsg); // não consegui excluir = cai no except
                          end;

                       end;

                    except
                      ExcluiParc := 1;
                      raise Exception.Create(sMsg); // não consegui excluir = cai no except
                    end;
                 finally
                    FreeAndNil( cdsBem );
                    FreeAndNil( cdsTaxasDep );
                    FreeAndNil( cdsPlanoPatroxBem );
                    FreeAndNil( cdsImagem );
                 end;
                 qryLancAquis.next;
             end;
       if ExcluiParc = 2 then
       begin
            qryImovelXBemBaixa.First;
            RollBackTransacao;
            StartTransacao;
            CtrlLancamentosImovel.DelAquisParc(qryLancAquisIDIMOVEL.AsInteger);
            while not qryImovelXBemBaixa.eof do
            begin
               CtrlMovBaixa.OpenTransaction := False;
               if not CtrlMovBaixa.ExecutaBaixa(54,    // módulo 54 - investimob
                                               Sistema.IdEmpresa,
                                               Sistema.IdUsuario,
                                               qryImovelXBemBaixaIDBEM.AsInteger,
                                               3,                 // 3 - Diversas
                                               CtrlLancamentosImovel.UltimaMov(qryImovelXBemBaixaIDBEM.AsInteger),
                                               0,                 // tipo de proporção: 0 - percentual
                                               100,               // baixa 100 %
                                               0,
                                               'Baixa - Exclusão Aquisição Parc.',
                                               '',
                                               0 ) then   // deprec. pro rata na data -1
               begin
                 ExcluiParc := 1;  Result.bExcluiu := False ;
                 raise Exception.create( CtrlMovBaixa.MessageInfo );
                 //Ricardo Cristiano - SOL : 167207 Kintana : 1465767 - Alteração de lugar para melhorar performance na entrada da tela
                 // Helen - SOL: 127213 KTN: 672023
                 FreeAndNil( CtrlLancamentosImovel );
                 exit;
               end
               else
               begin
                    ExcluiParc := 0;
               end;
               qryImovelXBemBaixa.Next;
            end;

            // Exclui Restante
            qryLancAquis.first;
            while not qryLancAquis.eof do
            begin
                    dtmCaf.qryImovelXBem.First;
                    while not dtmCaf.qryImovelXBem.eof do
                    begin
                        if dtmCaf.qryImovelXBemIDBEM.AsInteger > 0 then
                           iBem   :=  dtmCaf.qryImovelXBemIDBEM.AsInteger;

                           // Carrega os cds com as informações do bem a ser excluído
                           cdsBem.Data                    := CtrlDomBem.ListaBem(Sistema.IdEmpresa, dtmCaf.qryImovelXBemIDBEM.AsInteger);
                           cdsTaxasDep.Data               := CtrlDomBem.ListaBemxDep(Sistema.IdEmpresa, dtmCaf.qryImovelXBemIDBEM.AsInteger);
                           cdsPlanoPatroxBem.Data         := CtrlDomBem.ListaPlanoPatroxBem(Sistema.IdEmpresa, dtmCaf.qryImovelXBemIDBEM.AsInteger);
                           cdsImagem.Data                 := CtrlDomBem.CarregaImagem(-99);
                           cdsPlanoPatroxVigenciaBem.Data := CtrlDomBem.ListaPlanoPatroxVigenciaBem(dtmCaf.qryImovelXBemIDBEM.AsInteger);

                          //Exclui da tabela PLANOPATROXVIGENCIABEM
                          CtrlDomBem.ExcluiPlanoPatroxVigenciaBem(cdsPlanoPatroxVigenciaBem.FieldByName('IDBEM').AsInteger);

                         iChave := dtmCaf.qryImovelxBemIDCONJUNTO.AsInteger;
                         // Exclui em RateioDepreciação
                         try
                           LimpaParametros(dtmCaf.qryDelRateioDepreciacao);
                           dtmCaf.qryDelRateioDepreciacao.ParamByName('PIDEMPRESA').AsInteger  := Sistema.IdEmpresa;
                           dtmCaf.qryDelRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger := iChave;
                           dtmCaf.qryDelRateioDepreciacao.ExecSQL;

                           // Exclui em Conjunto
                           LimpaParametros(dtmCaf.qryDelConjunto);
                           dtmCaf.qryDelConjunto.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
                           dtmCaf.qryDelConjunto.ParamByName('PIDCONJUNTO').AsInteger := iChave;
                           dtmCaf.qryDelConjunto.ExecSQL;
                         except
                           raise Exception.create('Erro ao excluir o conjunto do CAF');
                           Result.bExcluiu := False;
                         end;
                         dtmCaf.qryImovelXBem.Next;
                   end;
                   if (not qryLancAquisCODDOCUMENTO.IsNull) then
                   begin //se documento estiver integrado  - Exclui documento
                      sSql := 'DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = '+ qryLancAquisCODDOCUMENTO.AsString;
                      if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                      begin
                         raise Exception.Create('Erro ao excluir LANCTODOCUM');
                         ExcluiParc := 1;  Result.bExcluiu := False ;
                      end;
                      sSql := 'DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO = '+ qryLancAquisCODDOCUMENTO.AsString;
                      if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                      begin
                         raise Exception.Create('Erro ao excluir RATEIODOCUM');
                         ExcluiParc := 1;  Result.bExcluiu := False ;
                      end;
                      sSql := 'DELETE FROM CCBAIXASXDOCUM WHERE CODDOCUMENTO = '+ qryLancAquisCODDOCUMENTO.AsString;
                      if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                      begin
                         raise Exception.Create('Erro ao excluir CCBAIXASXDOCUM');
                         ExcluiParc := 1; Result.bExcluiu := False ;
                      end;
                    end;
                    sSql := 'DELETE FROM LANCIMOVELXBEM WHERE IDLANCIMOVEL = '+ qryLancAquisIDLANCIMOVEL.AsString;
                    if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                    begin
                          raise Exception.Create('Erro ao excluir LANCIMOVELXBEM');
                          ExcluiParc := 1;  Result.bExcluiu := False ;
                    end;

                    // Thiago Melo SOL 200960 Kintana 1943658 INI
                    sSql := 'DELETE FROM RATEIOLANCAMENTOSIMOVEL WHERE IDLANCIMOVEL = '+ qryLancAquisIDLANCIMOVEL.AsString;
                    if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                    begin
                          raise Exception.Create('Erro ao excluir RATEIOLANCAMENTOSIMOVEL');
                          ExcluiParc := 1;  Result.bExcluiu := False ;
                    end;    

                    sSql := 'DELETE FROM LANCAMENTOSIMOVEL WHERE IDLANCIMOVEL = '+ qryLancAquisIDLANCIMOVEL.AsString;
                    if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                    begin
                          raise Exception.Create('Erro ao excluir LANCAMENTOSIMOVEL');
                          ExcluiParc := 1;  Result.bExcluiu := False ;
                    end;
                    // Thiago Melo SOL 200960 Kintana 1943658 FIM

                    if (not qryLancAquisCODDOCUMENTO.IsNull) then
                    begin
                        sSql := 'DELETE FROM DOCUMENTO WHERE CODDOCUMENTO = '+ qryLancAquisCODDOCUMENTO.AsString;
                        if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                        begin
                           raise Exception.Create('Erro ao excluir DOCUMENTO');
                           ExcluiParc := 1; Result.bExcluiu := False ;
                        end;
                    end;
                    sSql := 'UPDATE IMOVEL SET FLGATIVO = 0 WHERE IDIMOVEL = '+ qryLancAquisIDIMOVEL.AsString;
                    if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
                    begin
                          raise Exception.Create('Erro ao excluir IMOVEL');
                          ExcluiParc := 1; Result.bExcluiu := False ;
                    end;
                   qryLancAquis.next;
            end;
       end;
       qryImovelXBemBaixa.close;
       if ExcluiParc = 1 then
       begin
          RollBackTransacao;
       end
       else
         CommitTransacao;
       dtmCaf.qryImovelxBem.Close;
       except
             on E : Exception do begin
                    RollBackTransacao;
                    Result.bExcluiu := False;
                    Result.sErro := E.message;
                 end;
       end;
   end;
   Screen.Cursor := crDefault;
   //Ricardo Cristiano - SOL : 167207 Kintana : 1465767 - Alteração de lugar para melhorar performance na entrada da tela
   // Helen - SOL: 127213 KTN: 672023
   FreeAndNil( CtrlLancamentosImovel );
end;

end.
