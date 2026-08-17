unit FExecReavaliaNovo;

//	-------------------------------------------------------------------------------------------------
//
//	   Reavaliação (nova versão)
//
//	Autor             :  André Pontes
//	Data de Início	   :
//	Data de Término   :
//
//	Modificações	   :  04/10/1999  1) Novo saldo de reavaliação específico do Imobiliário (desprezam-se
//                                     as depreciações e correções) para alimentação de Carteira de Investimentos
//                                  2) Mudança no momento de gravação da ReavaliaXReavalia para evitar
//                                     constraint violation
//                      15/01/2000  3) Correção da gravação do id da Operacao em ReavaliaImovel
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, fcLabel, TEdNum, ExtCtrls, StdCtrls, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TREdit, Mask, wwdbedit, Wwdbspin, wwdbdatetimepicker,
  CMDateTimePicker, fcButton, fcImgBtn, fcShapeBtn, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, mImovelouMestre,
  DBTables, Db, Wwdatsrc, Wwquery;

type
  TfrmExecReavaliaNovo = class(TfrmSairAjudaImob)
    Panel2: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    ntbPrincipal: TNotebook;
    Label7: TLabel;
    Bevel2: TBevel;
    btnContinuaSelecao: TfcShapeBtn;
    btnAtualizar: TfcShapeBtn;
    Bevel3: TBevel;
    btnConfirma: TfcShapeBtn;
    btnVoltar: TfcShapeBtn;
    Panel3: TPanel;
    btnContinuarLanc: TfcShapeBtn;
    lblTitulo: TfcLabel;
    Label42: TLabel;
    DBcboTipoOperacao: TwwDBLookupCombo;
    DBedtDataOper: TCMDateTimePicker;
    Label15: TLabel;
    Label6: TLabel;
    edtFavorecido: TEdit;
    btnBuscaForCli: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    DBcboGrupo: TwwDBLookupCombo;
    molImovelouMestre1: TmolImovelouMestre;
    Bevel1: TBevel;
    qryBemResult: TwwQuery;
    qryBemResultNOME_IMOVEL: TStringField;
    qryBemResult_GRUPO: TStringField;
    qryBemResultDESBEM: TStringField;
    qryBemResultPERCENT_DESMEMBRA: TFloatField;
    qryBemResultIDIMOVEL_RESULT: TFloatField;
    qryBemResultIDBEM_ORIGEM: TFloatField;
    qryBemResultIXBGRUPO: TStringField;
    qryBemResultCC_ORIGINAL: TFloatField;
    qryBemResultCC_DESMEMBRA: TFloatField;
    qryBemResultIDBEM_RESULT: TFloatField;
    qryBemResultIDMOVIMENTACAO_DESMEMBRA: TFloatField;
    qryBemResultNO_IMOVEL_RESULT: TFloatField;
    qryBemResultPLACA_RESULT: TFloatField;
    dsBemResult: TwwDataSource;
    updBemResult: TUpdateSQL;
    DBgrdLancamentos: TwwDBGrid;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label2: TLabel;
    Bevel4: TBevel;

    procedure DBcboGrupoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure molImovelouMestre1btnBuscaImovelClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  end;



var
  frmExecReavaliaNovo: TfrmExecReavaliaNovo;



implementation
{$R *.DFM}



procedure TfrmExecReavaliaNovo.DBcboGrupoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // se for preenchido um grupo, limpa a seleção de Imóvel
   if DBcboGrupo.LookupValue <> '' then molImovelouMestre1.btnLimpaImovel.Click;
end;



procedure TfrmExecReavaliaNovo.molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
begin
   inherited;

   molImovelouMestre1.btnBuscaImovelClick(Sender);

   // se for escolhido um Imóvel (ou Mestre), limpa a seleção de grupo
   if molImovelouMestre1.edtImovel.Text <> '' then DBcboGrupo.LookupValue := '';
end;



end.
