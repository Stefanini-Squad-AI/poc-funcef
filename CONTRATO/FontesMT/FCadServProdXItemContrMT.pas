{-------------------------------------------------------------------------------
---------------------- ALTERAÇÕES / IMPLEMENTAÇÕES -----------------------------
--------------------------------------------------------------------------------
Solicitação ....: WO3701
Data............: 09/10/2023
Responsável.....: Everson Cunha
Descrição.......: Inclusão do campo FLAGATIVO.
--------------------------------------------------------------------------------
SIG.............: 120458
Data............: 28/10/2021
Responsável.....: Ewerton Beltramini
Descrição.......: Correção na exclusão dos registros das parcelas.
--------------------------------------------------------------------------------
SIG.............: 116050
Data............: 24/05/2021
Responsável.....: Edilaine
Descrição.......: Reiniciar parcelas com novo aditamento
--------------------------------------------------------------------------------
SIG.............: 115585
Data............: 18/05/2021
Responsável.....: Cássio Florencio Rovaroto
Descrição.......: Retirada do campo "Possui cessão de mão de obra".
--------------------------------------------------------------------------------
SIG.............: 113368
Data............: 08/03/2021
Responsável.....: Ewerton Beltramini
Descrição.......: Correção de erro ao tentar apagar um registro.
--------------------------------------------------------------------------------
SIG.............: 113455
Data............: 02/03/2021
Responsável.....: Taffarel Sevaybriker
Descrição.......: Ao alterar o número de parcelas, buscar sempre pelo maior
                  aditamento quando houver algum cadastrado.
--------------------------------------------------------------------------------
SIG.............: 84083
Data............: 06/08/2020
Responsável.....: Ewerton Beltramini
Descrição.......: Ajuste para inserção das parcelas na tabela CTRLPARCELAMEDICAO
                  quando houver alterações na quantidades de parcelas.
--------------------------------------------------------------------------------
SIG.............: 78503
Data............: 27/11/2018
Responsável.....: Taffarel Sevaybriker
Descrição.......: Ajuste para inserção das parcelas na tabela CTRLPARCELAMEDICAO
--------------------------------------------------------------------------------
SIG.............: 67505
Data............: 11/05/2018
Responsável.....: Darivaldo Alencar
Descrição.......: Atualizado chaves da tabela CTRLPARCELAMEDICAO após update na
                  tabela OBJETOSXITEMCONTR
--------------------------------------------------------------------------------
Rotina             : FormCreate, CmeCadastroFind, CmeCadastroBeforeConfirma,
 										 dblcServicoProdutoChange, CmeCadastroInsert,
                     CmeCadastroEdit, CmeCadastroAtualizaBotoes,
                     CmeCadastroCancel
N. SIG..........   : 23656.58467
Data da Alteração: : 01/110/2017
Alteração Form:    : FCadServProdXItemContrMT
Responsável:       : Cássio Rovaroto
Descrição.......   : Inclusão do campo "Possui cessão de mão de obra".
--------------------------------------------------------------------------------
SIG.............: 56199
Data............: 17/10/2017
Responsável.....: Andre Imakawa
Descrição.......: Chamada da função ExisteMedicao, deve ser feita apenas em
                  DsEdit
--------------------------------------------------------------------------------
SIG.............: SIG49931
Data............: 16/08/2017
Responsável.....: Fernando Xavier
Descrição.......: Impossibilidade de alterar o item, mesmo quando não há medição
                  lançada.
--------------------------------------------------------------------------------
N. Sol..........: 264089
PPM.............: 1134273
Data............: 03/11/2015
Responsável.....: Peterson Victor
Descrição.......: Incluido parametro na chamada da função
                  CtrlServProdxItemContr.ListRateio
--------------------------------------------------------------------------------
N. Sol..........: 218909/16724
N. PPM..........: 588170
Data............: 20/02/2015
Responsável.....: Felipe A. Santos
Descrição.......: Retirada a opção diária e adicionado as opções trimestral
                  e semestral no campo Frequência das parcelas, alteração
                  somente no dfm.
--------------------------------------------------------------------------------
Nº SOL......: 200778
Nº KINTANA..: 1953121
Data........: 04/03/2013
Responsável.: Otacilio
Descrição...: Valor do campo Sub-Despesa estava duplicado.
--------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
Rotina      : CmeCadastroConfirma, 
SOL         : 185450
KINTANA     : 1745675
Responsável : Edilaine Ferraresi
Data        : 15/08/2012
Descrição   : Tratamento da mensagem de violação de integridade
--------------------------------------------------------------------------------
Pendência   : 26187
Responsável : Gustavo Mendes
Data        : 28/04/2008
Descrição   : Ao excluir um contrado ocorre um erro de Constraint que impede que
              o processo de concluir, Esse erro consistia na não obrigatoriedade
              de gravação de uma centro de custo, assim não aparecia o rateio.
--------------------------------------------------------------------------------
Responsável : Daniel Simões
Data        : 03/05/2006
Pendência   : 18064
Descrição   : Implementação da visualização das datas de última geração e último
              vencimento das parcelas...
--------------------------------------------------------------------------------
Responsável : Daniel Simões
Data        : 25/04/2006
Pendência   : 19344
Descrição   : Passa a deixar gravar o campo medida em branco. Propriedade da
              combo dblcMedida "AllowClearKey" marcada como True...
--------------------------------------------------------------------------------
 Andre tavares - pendência 17968 - 10/01/2005 - Verifica o relacionamento
                                                PlanoprevContabil x Patro
--------------------------------------------------------------------------------
Responsável: Daniel Simões
Data:        26/01/2006
Pendência:   15266
Solução:     1. Adicionado o Plano vigente na query da função "ListCentroCusto".
             2. Adicionado o Código Externo na query da função "ListCentroCusto"
                e adicionado também o mesmo campo na combo "dblcCentroCusto".
--------------------------------------------------------------------------------
Analista : Bruno Bastos
Pendência: 18606
Data     : 16/02/2005 a 16/02/2005
Descrição: Não guardar o campo IdAnterior quando o componente for o dblcMedida
--------------------------------------------------------------------------------
Analista : Marchetti
Pendência: 16455
Data     : 03/09/2004 a 10/09/2004
Descrição: criação de campo com o IDAnterior na logaditamento
--------------------------------------------------------------------------------}

unit FCadServProdXItemContrMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
  wwdblook, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, TREdit, DBCtrls, Mask, wwdbedit, Wwdbspin,
  uCmSqlParams, uCtrlServProdxItemContr, uCtrlContratos, uCtrlItemContratual,
  uCtrlListTercContratos, uCtrlServProdXItem, uCtrlParamAditamento,
  FCadAditamentoMT, uCtrlAditamento, uCtrlResponsavel, uCMTypes, uCtrlParamIntegra,
  CMProcuraMask, DBTables, CMDBLookupCombo,
  uCtrlCtrlParcelaMedicao, Wwquery // Felipe A. Santos SOL 218909/16724 PPM 588170
  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  //, UCtrlOrcamento
  //FIM   - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  ;

const
   rZeroAbsoluto = 0.0000001;

type
  TLookAditamento = Record
    iIdLookup     : Integer;
    sNomeLookup   : String;
    sVlrAnterior  : String;
end;


type
  TfrmCadServProdXItemContrMT = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dblcContrato: TwwDBLookupCombo;
    Label3: TLabel;
    dblcItem: TwwDBLookupCombo;
    Label4: TLabel;
    edtpDataBase: TCMDateTimePicker;
    tbsServicoProduto: TTabSheet;
    tbsParcelas: TTabSheet;
    tbsObservacao: TTabSheet;
    GroupBoxPropriedades: TGroupBox;
    lblDescMoeda: TLabel;
    Label9: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    dblcMedida: TwwDBLookupCombo;
    GroupBoxTolerancia: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    dbspToleranciaMaisObjeto: TwwDBSpinEdit;
    DBRadioGroupTipoTolerancia: TDBRadioGroup;
    dbspToleranciaMenosObjeto: TwwDBSpinEdit;
    GroupBoxValores: TGroupBox;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeValorUnitarioObjeto: TDBRealEdit;
    dbeValorTotalObjeto: TDBRealEdit;
    dbeQtdeItem: TDBRealEdit;
    Label12: TLabel;
    dbtpDataInicioCobranca: TCMDateTimePicker;
    Label13: TLabel;
    dbeNumeroMedicoes: TDBRealEdit;
    dbrgFrequencia: TDBRadioGroup;
    Label14: TLabel;
    dbeIntervalo: TDBRealEdit;
    Label15: TLabel;
    dbeNumeroParcelas: TDBRealEdit;
    memObs: TDBMemo;
    Label21: TLabel;
    dblcCentroCusto: TwwDBLookupCombo;
    lblPrograma: TLabel;
    dblcPrograma: TwwDBLookupCombo;
    Label20: TLabel;
    dbePercentualRateio: TDBRealEdit;
    Label28: TLabel;
    spTeste: TCMSqlParams;
    cdsRateios: TCMClientDataSet;
    cdsServicoProduto: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    cdsMedida: TCMClientDataSet;
    cdsContratos: TCMClientDataSet;
    cdsItemContratual: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    cdsPrograma: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    cdsAditamento: TCMClientDataSet;
    cdsAtividadeNeg: TCMClientDataSet;
    cdsLogAditamento: TCMClientDataSet;
    Label7: TLabel;
    cdsResponsavel: TCMClientDataSet;
    dblcResponsavel: TwwDBLookupCombo;
    Label5: TLabel;
    dblcServicoProduto: TwwDBLookupCombo;
    lblPlanoPrevC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    lblPatroC: TLabel;
    dblcPatroC: TwwDBLookupCombo;
    Label16: TLabel;
    DBcboUnidNegocio: TwwDBLookupCombo;
    SqlPlanPrevContabPatro: TCMSqlParams;
    CdsPlanPrevContabPatro: TCMClientDataSet;
    cdsRateiosIDRATEIOCCUSTO: TFloatField;
    cdsRateiosIDEMPRESA: TFloatField;
    cdsRateiosIDCONTRATO: TFloatField;
    cdsRateiosIDOBJETO: TFloatField;
    cdsRateiosIDITEM: TFloatField;
    cdsRateiosIDPESSOA: TFloatField;
    cdsRateiosUNIDNEGOC: TFloatField;
    cdsRateiosIDPATRO: TFloatField;
    cdsRateiosIDPLANOPREV: TFloatField;
    cdsRateiosIDPROGRAMA: TFloatField;
    cdsRateiosCODCENTROCUSTO: TStringField;
    cdsRateiosPERCRATEIOCONTR: TFloatField;
    cdsRateiosIDPLANOORCAMEN: TFloatField;
    cdsRateiosIDCONTAORCAMEN: TStringField;
    cdsRateiosNOMEPROG: TStringField;
    cdsRateiosDESCCC: TStringField;
    cdsRateiosNOME_PATRO: TStringField;
    cdsRateiosNOME_PLANO: TStringField;
    cdsRateiosNOME_UNIDNEGOCIO: TStringField;
    cdsRateiosDIVISOR: TStringField;
    cdsRateiosPLACONTA: TStringField;
    cdsRateiosCONTA: TStringField;
    CMProcuraMaskContasOrcamen: TCMProcuraMask;
    cdsContasOrcamen: TCMClientDataSet;
    ms_contaorc: TMontaSelect;
    sqlContaOrc: TCMSqlParams;
    CMSqlParams1: TCMSqlParams;
    CMSqlParams2: TCMSqlParams;
    Label17: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    Label18: TLabel;
    CMDateTimePicker2: TCMDateTimePicker;
    dbcboFormula: TwwDBLookupCombo;
    Label19: TLabel;
    sqlFormulaOrc: TCMSqlParams;
    cdsFormulaOrc: TCMClientDataSet;
    lblStatus: TLabel;
    Label23: TLabel;
    CboSubDespesa: TCMDBLookupCombo;
    cdsRateiosIDDESPESAORC: TFloatField;
    cdsSubDespesa: TCMClientDataSet;
    sqlSubDespesa: TCMSqlParams;
    cdsCtrlParcelaMedicao: TCMClientDataSet;
// Felipe A. Santos - SOL218909/16724 PPM 588170

    QryAux: TwwQuery;   //Ewerton Beltramini - 06/08/2020 - SIG84083
    edtMotivoAltParcela: TEdit;   //Ewerton Beltramini - 06/08/2020 - SIG84083
    LblAltQtdParcela: TLabel;   //Ewerton Beltramini - 06/08/2020 - SIG84083
    qryObsAltParcela: TwwQuery;   //Ewerton Beltramini - 06/08/2020 - SIG84083
    dbchkAtivo: TDBCheckBox;   


    
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;  var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure dblcContratoChange(Sender: TObject);
    procedure dbeQtdeValorExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure dblcServicoProdutoChange(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dblcPlanoPrevCCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPatroCCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CdsBeforeEdit(DataSet: TDataSet);
    procedure dblcCentroCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCentroCustoExit(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcItemChange(Sender: TObject);
    procedure dbeNumeroParcelasExit(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edtMotivoAltParcelaExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CdsAfterPost(DataSet: TDataSet); 
    procedure CdsAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
    CtrlServProdxItemContr       : TCtrlServProdxItemContr;
    CtrlContratos                : TCtrlContratos;
    CtrlItemContratual           : TCtrlItemContratual;
    CtrlServProdxItem            : TCtrlServProdXItem;
    CtrlListTerc                 : TCtrlListTercContratos;
    CtrlAditamento               : TCtrlAditamento;
    CtrlResponsavel              : TCtrlResponsavel;
    CtrlParamAditamento          : TCtrlParamAditamento;
    CtrlCtrlParcelaMedicao       : TCtrlCtrlParcelaMedicao; // Felipe A. Santos - SOL218909/16724 PPM 588170
    rCodigoMoeda                 : Double;

    vLookAditamento : array of TLookAditamento;
    iContratoAnt, iObjetoAnt, iItemAnt : Integer;
    iPlanoOrcamen : Integer;

    cdsVerifRateio : TCMClientDataSet;

    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    //CtrlOrcamento  : TOrcamentoBackMT;
    Procedure GetSubDespesa;
    //FIM   - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

    function  EfetuaAditamento : Boolean;
    function  ExibeTelaAditamento: Boolean;
    function  VerificaRateio(var fSaldo: Extended) : Boolean;
    function  DuplicidadeRateio: Boolean;
    procedure CarregaLookAditamento;
    procedure SelecionaMestreDetalhe( const iContrato, iObjeto, iItem: Double);
    function VerificaPlanoPatro(const idPlanoprev, idPatro :integer): Boolean;
    procedure GetObsAltParcela(); //Ewerton Beltramini - 06/08/2020 - SIG84083

    procedure AtlzChaveCtrlParcelaMedicao;//Darivaldo Alencar SIG67505

  public
    { Public declarations }
    bAlteraParcela : Boolean;   //Ewerton Beltramini - 06/08/2020 - SIG84083
    iQtdParcelas : Integer;     //Ewerton Beltramini - 06/08/2020 - SIG84083

  end;

var
  frmCadServProdXItemContrMT: TfrmCadServProdXItemContrMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, FCadastroMT;

//Ewerton Beltramini - 06/08/2020 - SIG84083 - Inicio...
procedure TfrmCadServProdXItemContrMT.GetObsAltParcela();
begin
  if ( cds.fieldbyname('IDCONTRATO').AsString <> '') then
  begin
        qryObsAltParcela.Close;
        qryObsAltParcela.sql.Clear;
        qryObsAltParcela.SQL.add('Select OBSALTPARCELA from CONTRATOCONTR ');
        qryObsAltParcela.SQL.add('where IDCONTRATO       = ' + cds.fieldbyname('IDCONTRATO').AsString);
        qryObsAltParcela.Open;
        edtMotivoAltParcela.Text := qryObsAltParcela.FieldByName('OBSALTPARCELA').AsString;
  end;
  Application.ProcessMessages;
end;
//Ewerton Beltramini - 06/08/2020 - SIG84083 - Fim.



procedure TfrmCadServProdXItemContrMT.FormCreate(Sender: TObject);
var
   sSQL : String;
begin
   inherited;
   //Inicializa Controls
   CtrlServProdxItemContr := TCtrlServProdxItemContr.Create;
   CtrlServProdxItemContr.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlServProdxItemContr.CdsObjetosxItemContr   := cds;
   CtrlServProdxItemContr.CdsRateioCentroCusto   := cdsRateios;
   CtrlServProdxItemContr.CdsAditamento          := cdsAditamento;
   CtrlServProdxItemContr.CdsLogAditamento       := cdsLogAditamento;
   CtrlServProdxItemContr.CdsCtrlParcelaMedicao  := cdsCtrlParcelaMedicao; // Felipe A. Santos SOL 218909/16724 PPM 588170

   CtrlContratos := TCtrlContratos.Create(Sistema.IdEmpresa, Sistema.IdUsuario);
   CtrlContratos.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlItemContratual := TCtrlItemContratual.Create;
   CtrlItemContratual.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlListTerc := TCtrlListTercContratos.Create;
   CtrlListTerc.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlServProdXItem := TCtrlServProdXItem.Create;
   CtrlServProdXItem.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlAditamento := TCtrlAditamento.Create;
   CtrlAditamento.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlResponsavel := TCtrlResponsavel.Create;
   CtrlResponsavel.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlParamAditamento := TCtrlParamAditamento.Create;
   CtrlParamAditamento.Initialize(dtmBaseDados.dbBaseDados,True);

   // Felipe A. Santos - SOL218909/16724 PPM 588170  - Início
   CtrlCtrlParcelaMedicao := TCtrlCtrlParcelaMedicao.Create;
   CtrlCtrlParcelaMedicao.Initialize(dtmBaseDados.dbBaseDados,True);
   // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim

   //Carrega Cds's
   cds.Data                   := CtrlServProdxItemContr.ListProdServXItem(-1,-1,-1,False); //vazio
   cdsRateios.Data            := CtrlServProdxItemContr.ListRateio(-1,-1,-1,-1,False); //vazio
   cdsServicoProduto.Data     := CtrlServProdXItem.ListServComItem(Sistema.IdEmpresa );
   cdsItemContratual.Data     := CtrlItemContratual.ListItemContratual(-1, -1);  // vazio
   cdsMoeda.Data              := CtrlListTerc.ListMoeda(0,True);
   cdsMedida.Data             := CtrlListTerc.ListMedida('');
   cdsPlanoPrev.Data          := CtrlListTerc.ListPlanoPrev;
   cdsPatrocinador.Data       := CtrlListTerc.ListPatrocinador;
   cdsPrograma.Data           := CtrlListTerc.ListPrograma;
   cdsCentroCusto.Data        := CtrlListTerc.ListCentroCusto(Sistema.IdEmpresa,'A','S',ParamIntegra.PlanoCentroCusto);
   cdsAditamento.Data         := CtrlAditamento.ListAditamento(-1,-1);//vazio
   cdsResponsavel.Data        := CtrlResponsavel.ListResponsavelXPessoa;
   cdsLogAditamento.Data      := CtrlAditamento.ListLogAditamento(-1);//vazio
   cdsAtividadeNeg.Data       := CtrlListTerc.ListUnidNegocio(Sistema.IdEmpresa,0,'A','');
   cdsCtrlParcelaMedicao.Data := CtrlCtrlParcelaMedicao.ListCtrlParcelaMedicao(-1); // Felipe A. Santos - SOL218909/16724 PPM 588170

   //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   //CtrlOrcamento             := TOrcamentoBackMT.Create;
   //cdsSubDespesa.Data        := CtrlOrcamento.ListaSubDespesas(opapDesembolso, '-1', -1);
   GetSubDespesa;
   CboSubDespesa.LookUpTable := cdsSubDespesa;
   //FIM   - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

   sqlContaOrc.Open;
   sqlFormulaOrc.Open;
   iPlanoOrcamen := cdsContasOrcamen.FieldByName('IDPLANOORCAMEN').AsInteger;

   CMProcuraMaskContasOrcamen.Mascara := cdsContasOrcamen.FieldByName('MASCGRUPOORC').AsString;

   ms_contaorc.Filtro.Add('CONTASORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa));
   ms_contaorc.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrcamen));

   sSQL :=
   'SELECT ' + #13 +
   '    P.MASCGRUPOORC, '                                                               + #13 +
   '    C.IDPLANOORCAMEN, '                                                             + #13 +
   '    C.IDCONTAORCAMEN, '                                                             + #13 +
   '    C.NOMECONTAORCAMEN '                                                            + #13 +
   'FROM '                                                                              + #13 +
   '    CONTASORCAMEN C, '                                                              + #13 +
   '    PARAMORCAMENTO P '                                                              + #13 +
   'WHERE '                                                                             + #13 +
   '    C.IDCONTAORCAMEN = :IDCONTAORCAMEN '                                            + #13 +
   'AND C.IDPESSOA       = P.IDPESSOA '                                                 + #13 +
   'AND P.IDPLANOORCAMEN = C.IDPLANOORCAMEN '                                           + #13 +
   'AND P.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrcamen)                                  + #13 +
   'AND P.IDPESSOA       = ' + IntToStr(Sistema.IDEmpresa)                              + #13 +
   'ORDER BY C.NOMECONTAORCAMEN '                                                       + #13;
   cdsContasOrcamen.Close;

   sqlContaOrc.SQL.Text := sSQL;

   pgctrlDetalhe.ActivePageIndex := 0;
   rCodigoMoeda  := 0;

   // Cria o Cds para verificação do Rateio
   cdsVerifRateio := TCMClientDataSet.Create( nil );
   lblStatus.Caption := '';

   //Cássio Rovaroto - SIG nº 115585 - Início
   //Cássio Rovaroto - SIG nº 23656.58467 - Início
   //chkMaoDeObra.Checked := cds.FieldByName('FLGMAODEOBRA').AsString = 'S';
   //chkMaoDeObra.Enabled := False;
   //Cássio Rovaroto - SIG nº 23656.58467 - Fim
end;

procedure TfrmCadServProdXItemContrMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CtrlServProdxItemContr.Free;
  CtrlContratos.Free;
  CtrlItemContratual.Free;
  CtrlListTerc.Free;
  CtrlServProdXItem.Free;
  CtrlAditamento.Free;
  CtrlResponsavel.Free;
  CtrlParamAditamento.Free;
  cdsVerifRateio.Free;
  CtrlCtrlParcelaMedicao.Free; // Felipe A. Santos - SOL218909/16724 PPM 588170
  inherited;
end;

procedure TfrmCadServProdXItemContrMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   Cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   Cds.FieldByName('TIPOTOLERANCIAOBJETO').AsString := 'P';
   Cds.FieldByName('FREQUENCIA').AsString := 'U';

   cdsContratos.Data   := CtrlContratos.ListContratos(0, True);

   // Zera o cds e vetor de rateio
   cdsVerifRateio.Data := cdsRateios.Data;
   cdsRateios.EmptyDataSet;
   cdsVerifRateio.EmptyDataSet;
   dblcContrato.Enabled := True;
   lblStatus.Caption    := '';

   //Cássio Rovaroto  - SIG nº 115585 - Início
   //Cássio Rovaroto - SIG 23656.58467 - Início
   //chkMaoDeObra.Enabled := True;
   //chkMaoDeObra.Checked := False;
   //Cássio Rovaroto - SIG 23656.58467 - Fim
   //Cássio Rovaroto  - SIG nº 115585 - Fim
end;

procedure TfrmCadServProdXItemContrMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then begin
     SelecionaMestreDetalhe( StrToFloat(MontaSelect.ValoresChave[0]),
                             StrToFloat(MontaSelect.ValoresChave[1]),
                             StrToFloat(MontaSelect.ValoresChave[2]) );

     lblStatus.Caption := MontaSelect.ValoresChave[3];
     lblStatus.Visible := True;

     //Cássio Rovaroto - SIG nº 115585 - Início
     //Cássio - SIG nº 23656.58467 - Início
   	 //chkMaoDeObra.Enabled := True;
   	 //chkMaoDeObra.Checked := Cds.FieldByName('FLGMAODEOBRA').AsString =  'S';
     //chkMaoDeObra.Enabled := False;
     //Cássio - SIG nº 23656.58467 - Fim
     //Cássio Rovaroto - SIG nº 115585 - Fim
   end;

   cdsContratos.Data      := CtrlContratos.ListContratos(0);
end;

procedure TfrmCadServProdXItemContrMT.CmeCadastroDelete(Sender: TObject);
begin
   if ExibeTelaAditamento then
    begin
       inherited;
       if not(CtrlServProdxItemContr.ExclusaoServProdxItemContr) then
        begin
           MsgDlg(CtrlServProdxItemContr.MessageInfo,'Erro',mtError,[mbOK],0);
           Abort;
        end;
    end
   else
    Abort;
end;

procedure TfrmCadServProdXItemContrMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept:=True;
   if (Trim(dblcContrato.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o Campo Contrato','Atenção',mtWarning,[mbOk],0);
       dblcContrato.SetFocus;
       Accept:=False;
       Exit;
    end;

   if (Trim(dblcItem.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o Campo Item','Atenção',mtWarning,[mbOk],0);
       dblcItem.SetFocus;
       Accept:=False;
       Exit;
    end;

   if (Trim(dblcServicoProduto.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o Campo Serviço/Produto','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePageIndex:=0;
       dblcServicoProduto.SetFocus;
       Accept:=False;
       Exit;
    end;

   //Cássio Rovaroto - SIG nº 115585 - Início
   //Cássio Rovaroto - SIG nº 23656.58467 - Início
   //if CmeCadastro.Operacao in [opAlterar, opInserir] then
   //begin
   //	if chkMaoDeObra.Checked then
   // 	Cds.FieldByName('FLGMAODEOBRA').AsString := 'S'
   //	else
   //		Cds.FieldByName('FLGMAODEOBRA').AsString := 'N';
   // end;
   	//Cássio Rovaroto - SIG nº 23656.58467 - Fim
   //Cássio Rovaroto - SIG nº 115585 - Fim

   inherited;
end;

procedure TfrmCadServProdXItemContrMT.CmeCadastroConfirma(Sender: TObject);
begin
  if (cds.State in [dsInsert,dsEdit]) then begin

    //Taffarel - SIG78503 - início
    if (cds.State in [dsInsert]) then begin
       CtrlCtrlParcelaMedicao.InserirCtrlParcelaMedicao(cds, cdsCtrlParcelaMedicao, False);
    end;
    //Taffarel - SIG78503 - fim

    if (cds.State in [dsEdit]) then begin
      if EfetuaAditamento then begin
         if MsgDlg('Registra um novo Aditamento para esta alteração ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
            if not ExibeTelaAditamento then Abort;
         end else begin
            MsgDlg('O registro de aditamento é obrigatório. Alteração não efetuada.','Aviso',mtWarning,[mbOK],0);
            cdsLogAditamento.EmptyDataSet;
            bbtnCancelar.Click;
            Abort;
         end;
      end;

      if not(CdsCtrlParcelaMedicao.IsEmpty) then  //Darivaldo Alencar SIG67505
          AtlzChaveCtrlParcelaMedicao;            //Darivaldo Alencar SIG67505

      if not(CtrlServProdxItemContr.InclusaoAlteracaoServProdxItemContr) then begin
        MsgDlg(CtrlServProdxItemContr.MessageInfo,'Erro',mtError,[mbOK],0);
        bbtnCancelar.Click; // Edilaine - SOL 185450 / KTN 1745675
        Abort;
      end;
    end else if not(CtrlServProdxItemContr.InclusaoAlteracaoServProdxItemContr) then begin
      MsgDlg(CtrlServProdxItemContr.MessageInfo,'Erro',mtError,[mbOK],0);
      bbtnCancelar.Click;   // Edilaine - SOL 185450 / KTN 1745675
      Abort;
    end;
  end;

  inherited;
end;

procedure TfrmCadServProdXItemContrMT.CmeDetalheInsert(Sender: TObject);
var fSaldoRateio : Extended;
begin
   if VerificaRateio(fSaldoRateio) then begin

     // Iguala o Cds de verificação de duplicidade de rateio
     cdsVerifRateio.Data := cdsRateios.Data;

     inherited;

     cdsRateios.FieldByName('PERCRATEIOCONTR').AsFloat := fSaldoRateio;
     if (rCodigoMoeda <> 0) then
       cdsRateios.FieldByName('MOECODIGO').AsFloat := rCodigoMoeda;
   end else begin
     bbtnVoltarDet.Click;
   end;
end;

procedure TfrmCadServProdXItemContrMT.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := True;

   // Gustavo Mendes - 26187
   if (Trim(dblcCentroCusto.Text) = '') then begin
      MsgDlg('Obrigatório preencher o Centro de Custo','Atenção',mtWarning,[mbOk],0);
      pgctrlDetalhe.ActivePageIndex := 2;
      dblcCentroCusto.SetFocus;
      Accept := False;
      Exit;
   end;
   // Gustavo Mendes - 26187

   if Sistema.UsaPlanoPatro then begin
      if Trim(dblcPrograma.Text) = '' then begin
         MsgDlg('Obrigatório preencher o Programa','Erro',mtError,[mbOk],0);
         pgctrlDetalhe.ActivePageIndex := 2;
         dblcPrograma.SetFocus;
         Accept := False;
         Exit;
      end;

      if Trim(dblcPlanoPrevC.Text) = '' then begin
         MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
         pgctrlDetalhe.ActivePageIndex := 2;
         dblcPlanoPrevC.SetFocus;
         Accept := False;
         Exit;
      end;

      if Trim(dblcPatroC.Text) = '' then begin
         MsgDlg('Obrigatório preencher a Patrocinadora','Erro',mtError,[mbOk],0);
         pgctrlDetalhe.ActivePageIndex := 2;
         dblcPatroC.SetFocus;
         Accept := False;
         Exit;
      end;

      if not CtrlListTerc.ExistePlanoxPatro( cdsRateios.FieldByName('IDPLANOPREV').AsInteger,
                                             cdsRateios.FieldByName('IDPATRO').AsInteger) then begin
         MsgDlg('Não existe relacionamento entre a Patrocinadora e o Plano escolhidos','Erro',mtError,[mbOk],0);
         pgctrlDetalhe.ActivePageIndex := 2;
         dblcPatroC.SetFocus;
         Accept := False;
         Exit;
      end;

      if DuplicidadeRateio then begin
         MsgDlg('Já existe rateio cadastrado para os parâmetros informado','Erro',mtError,[mbOk],0);
         pgctrlDetalhe.ActivePageIndex := 2;
         dblcCentroCusto.SetFocus;
         Accept := False;
         Exit;
      end;
   end;

   inherited;
end;


procedure TfrmCadServProdXItemContrMT.CmeDetalheConfirma(Sender: TObject);
begin
   if cdsRateios.State in [dsInsert,dsEdit] then begin
      cdsRateios.FieldByName('IDEMPRESA').AsFloat   := Sistema.IdEmpresa;
      cdsRateios.FieldByName('IDPESSOA').AsFloat    := Sistema.IdEmpresa;
      cdsRateios.FieldByName('DESCCC').AsString     := dblcCentroCusto.Text;
      cdsRateios.FieldByName('NOMEPROG').AsString   := dblcPrograma.Text;
      cdsRateios.FieldByName('NOME_PLANO').AsString := dblcPlanoPrevC.Text;
      cdsRateios.FieldByName('NOME_PATRO').AsString := dblcPatroC.Text;
      cdsRateios.FieldByName('NOME_UNIDNEGOCIO').AsString := DBcboUnidNegocio.Text;
      cdsRateios.FieldByName('IDPLANOORCAMEN').AsInteger := iPlanoOrcamen;
   end;
   inherited;
end;



procedure TfrmCadServProdXItemContrMT.dblcContratoChange(Sender: TObject);
begin
   if not(cds.State in [dsInsert,dsEdit]) then Exit;
   Cds.FieldByName('DATABASEITEM').AsDateTime:=cdsContratos.FieldByName('DATABASECONTRATO').AsDateTime;
   Cds.FieldByName('UNIDNEGOC').AsFloat:=cdsContratos.FieldByName('UNIDNEGOC').AsFloat;
end;

procedure TfrmCadServProdXItemContrMT.dblcServicoProdutoChange(Sender: TObject);
Var sErro : String;//SIG49931
begin
  if (Cds.State = dsEdit) then // Andre Imakawa - SIG 56199
  Begin
    //SIG49931 Inicio
    sErro := CtrlServProdxItemContr.ExisteMedicao(StrToFloat(MontaSelect.ValoresChave[0]),
                                                  StrToFloat(MontaSelect.ValoresChave[1]),
                                                  StrToFloat(MontaSelect.ValoresChave[2]) );

    if (trim(sErro) <> '') and (Cds.State = dsEdit) then
    begin
        MsgDlg(sErro,'Erro',mtInformation,[mbOK],0);
        bbtnCancelarClick(Self);
        exit;
    end;
    //SIG49931 Final
  end;

   inherited;
   if (cds.State in [dsInsert, dsEdit]) and (dblcServicoProduto.LookupValue <> '') then begin
      cdsItemContratual.Data := CtrlServProdXItem.ListServProdXItem(Sistema.IdEmpresa,
                                                                    StrToFloat(dblcServicoProduto.LookupValue), 0);


      //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
      GetSubDespesa;
      //cdsSubDespesa.Data := CtrlOrcamento.ListaSubDespesas(opapDesembolso,
      //                                                     cdsServicoProduto.FieldByName('CODTIPRECDES').AsString,
      //                                                     cdsContratos.FieldByName('IDFORCLI').AsInteger,
      //                                                     Sistema.IdEmpresa);
      //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

      //Cássio Rovaroto -  SIG nº 23656.58467
      //chkMaoDeObra.Enabled := cdsServicoProduto.FieldByName('TIPOOBJETO').asString = 'S' //Cássio Rovaroto - SIG nº 115585
   end;
   
end;



procedure TfrmCadServProdXItemContrMT.dbeQtdeValorExit(Sender: TObject);
begin
   dbeValorTotalObjeto.Value:=dbeQtdeItem.Value*dbeValorUnitarioObjeto.Value;
end;

function TfrmCadServProdXItemContrMT.ExibeTelaAditamento: Boolean;
var
  sStatusContrato: string;
   frmAux : TfrmCadAditamentoMT;
  bExecutaAditamento : Boolean;
begin
   frmAux:=TfrmCadAditamentoMT.Create(Self);
   try
    Result := True;
    sStatusContrato := CtrlContratos.StatusContrato(Cds.FieldByName('IDCONTRATO').AsFloat);//26187
    bExecutaAditamento := (sStatusContrato <> 'E') and (sStatusContrato <> 'N') and (sStatusContrato <> '');//26187

    if bExecutaAditamento then//26187
    begin
      cdsAditamento.EmptyDataSet;
      //cdsCtrlParcelaMedicao.EmptyDataSet; // Felipe A. Santos SOL 218909/16724 PPM 588170 //Taffarel - SIG78503

      frmAux.cdsAditamento.Data:=cdsAditamento.Data;

      // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
      frmAux.cdsCtrlParcelaMedicao.Data := cdsCtrlParcelaMedicao.Data;
      frmAux.cdsServProdXItemContr.Data := cds.Data;
      // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

      frmAux.rIdContrato:=Cds.FieldByName('IDCONTRATO').AsFloat;

      frmAux.Caption:='Aditamento do Contrato '+dblcContrato.Text;
      frmAux.ShowModal;
      Result:=(frmAux.ModalResult=mrOk);
      if Result then
      begin
        cdsAditamento.Data:=frmAux.cdsAditamento.Data;

        // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
        cdsCtrlParcelaMedicao.Data := frmAux.cdsCtrlParcelaMedicao.Data; //Taffarel - SIG78503     //edilaine SIG116050
        cds.Data := frmAux.cdsServProdXItemContr.Data;
        // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim
      end;
    end;
   finally
      //Ewerton Beltramini - 08/03/2021 - SIG 113368 - (Linha comentada abaixo)
      //frmAux.Free;

   end;
end;

procedure TfrmCadServProdXItemContrMT.dsDetDataChange(Sender: TObject; Field: TField);
begin
   inherited;
   if cdsRateios.RecordCount = 0 then rCodigoMoeda := 0;
   lblDescMoeda.Enabled := (cdsRateios.RecordCount = 0);
   dblcMoeda.Enabled    := (cdsRateios.RecordCount = 0);
end;


procedure TfrmCadServProdXItemContrMT.CarregaLookAditamento;
var i,y : Integer;
begin
  vLookAditamento := nil;
  y := 0;
  // Busca o texto original de todos os combos da tela
  for i := 0 to (ComponentCount - 1) do begin
    // wwDBLookup
    if TObject(Components[i]).ClassType = TwwDBLookupCombo then begin
      SetLength(vLookAditamento, y+1);

      ///Bruno Bastos - Pend. 18606 - 16/02/2005 - Início
      if (TwwDBLookupCombo(Components[i]).LookupValue <> '') and
         (TwwDBLookupCombo(Components[i]).Name        <> 'dblcMedida') then
      ///Bruno Bastos - Pend. 18606 - 16/02/2005 - Fim
         vLookAditamento[y].iIdLookup    := StrToInt(TwwDBLookupCombo(Components[i]).LookupValue);
      // Fim Marchetti - Pendência: 16455

      vLookAditamento[y].sNomeLookup  := TwwDBLookupCombo(Components[i]).Name;
      vLookAditamento[y].sVlrAnterior := TwwDBLookupCombo(Components[i]).Text;
      Inc(y);
    end;
    // DBRadioGroup
    if TObject(Components[i]).ClassType = TDBRadioGroup then begin
      if TDBRadioGroup(Components[i]).ItemIndex >= 0 then begin
        SetLength(vLookAditamento, y+1);
        vLookAditamento[y].sNomeLookup  := TDBRadioGroup(Components[i]).Name;
        vLookAditamento[y].sVlrAnterior := TDBRadioGroup(Components[i]).Items.Strings[TDBRadioGroup(Components[i]).ItemIndex];
        Inc(y);
      end;
    end;
  end;
end;

function TfrmCadServProdXItemContrMT.EfetuaAditamento: Boolean;
var cdsRegistra,cdsAntigo : TCMClientDataSet;
    sCampo, sAnterior, sAtual : String;
    iIDAnterior : Integer;
    i,y : Integer;
begin
  Result := False;
  try
    cdsLogAditamento.EmptyDataSet;
    cdsRegistra := TCmClientDataSet.Create( nil );
    cdsAntigo   := TCmClientDataSet.Create( nil );

    // Verifica se o contrato está em status de Aprovado ( inclusive RAD )
    if CtrlContratos.StatusContrato(cdsContratos.FieldByName('IDCONTRATO').AsFloat) <> 'A' then exit;

    cdsRegistra.Data := CtrlParamAditamento.ListParamAditamento('OBJETOSXITEMCONTR', True);
    if not cdsRegistra.IsEmpty then begin

      // Abre contrato anterior
      cdsAntigo.Data := CtrlServProdxItemContr.ListProdServXItem(iContratoAnt,
                                                                 iObjetoAnt,
                                                                 iItemAnt,
                                                                 False);

      // Verifica se houve alteração em algum campo parametrizado
      while not cdsRegistra.Eof do begin
        sCampo    := cdsRegistra.FieldByName('FIELDNAME').AsString;
        sAnterior := cdsAntigo.FieldByName(sCampo).AsString;
        sAtual    := cds.FieldByName(sCampo).AsString;

        if sAnterior <> sAtual then begin

          // Busca o texto do combo quando o campo for assiciado a este componente
          for i := 0 to (ComponentCount - 1) do begin

             iIDAnterior := 0;
             // verifica campos lookup
             if ( (TObject(Components[i]).ClassType = TwwDBLookupCombo) and (TwwDBLookupCombo(Components[i]).DataField = sCampo) ) then begin

                // altera o id anterior pelo texto armazenado no lookup
                for y := 0 to Length(vLookAditamento) - 1 do begin
                  if vLookAditamento[y].sNomeLookup = TwwDBLookupCombo(Components[i]).Name then begin
                    sAnterior := vLookAditamento[y].sVlrAnterior;
                    // Marchetti - Pendência: 16455
                    iIDAnterior := vLookAditamento[y].iIdLookup;
                    // Fim Marchetti - Pendência: 16455

                    Break;
                  end;
                end;
                // altera o id atual pelo texto do lookup
                sAtual := TwwDBLookupCombo(Components[i]).Text;
             end;

             // verifica campos radio group
             if ( (TObject(Components[i]).ClassType = TDBRadioGroup) and (TDBRadioGroup(Components[i]).DataField = sCampo) ) then begin

                // altera o id anterior pelo texto armazenado no lookup
                for y := 0 to Length(vLookAditamento) - 1 do begin
                  if vLookAditamento[y].sNomeLookup = TDBRadioGroup(Components[i]).Name then begin
                    sAnterior := vLookAditamento[y].sVlrAnterior;
                    Break;
                  end;
                end;
                // altera o id atual pelo texto do lookup
                sAtual := TDBRadioGroup(Components[i]).Items.Strings[TDBRadioGroup(Components[i]).ItemIndex];
             end;
          end;

          Result := True;
          cdsLogAditamento.Insert;
          cdsLogAditamento.FieldByName('IDCONTRATO').AsInteger := iContratoAnt;
          cdsLogAditamento.FieldByName('IDOBJETO').AsInteger   := iObjetoAnt;
          cdsLogAditamento.FieldByName('IDITEM').AsInteger     := iItemAnt;
          cdsLogAditamento.FieldByName('IDDDFIELD').AsInteger  := cdsRegistra.FieldByName('IDDDFIELD').AsInteger;
          cdsLogAditamento.FieldByName('VLRANTERIOR').AsString := sAnterior;
          cdsLogAditamento.FieldByName('VLRATUAL').AsString    := sAtual;

          // Marchetti - Pendência: 16455
          if iIDAnterior > 0 then
             cdsLogAditamento.FieldByName('IDANTERIOR').AsInteger := iIDAnterior;
          // Fim Marchetti - Pendência: 16455


          cdsLogAditamento.Post;
        end;
        cdsRegistra.Next;
      end;
    end;
  finally
    FreeAndNil( cdsRegistra );
    FreeAndNil( cdsAntigo );
  end;
end;

procedure TfrmCadServProdXItemContrMT.SelecionaMestreDetalhe(const iContrato, iObjeto, iItem: Double);
begin
  cdsRateios.Close;
  cdsRateios.Data := CtrlServProdxItemContr.ListRateio(iContrato, iObjeto, iItem, Sistema.IdEmpresa,False);

  cdsItemContratual.Data := CtrlServProdXItem.ListServProdXItem(Sistema.IdEmpresa, iObjeto, 0);

  Cds.Close;
  Cds.Data := CtrlServProdxItemContr.ListProdServXItem(iContrato, iObjeto, iItem, False);

  CdsCtrlParcelaMedicao.close;                                                                         //Darivaldo Alencar SIG67505
  CdsCtrlParcelaMedicao.Data := CtrlCtrlParcelaMedicao.ListParcelaMedicao(iContrato, iObjeto, iItem);  //Darivaldo Alencar SIG67505

  CarregaLookAditamento;

  // Iguala o cds para verificar os rateios, evitando duplicidade
  cdsVerifRateio.Data := cdsRateios.Data;

  iContratoAnt := cds.FieldByName('IDCONTRATO').AsInteger;
  iObjetoAnt   := cds.FieldByName('IDOBJETO').AsInteger;
  iItemAnt     := cds.FieldByName('IDITEM').AsInteger;
end;

procedure TfrmCadServProdXItemContrMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o cds com o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then SelecionaMestreDetalhe( Cds.FieldByName('IDCONTRATO').AsFloat,
                                                                   Cds.FieldByName('IDOBJETO').AsFloat,
                                                                   Cds.FieldByName('IDITEM').AsFloat);
end;

function TfrmCadServProdXItemContrMT.VerificaRateio(var fSaldo: Extended): Boolean;
var fTotal : Extended;
begin
  fTotal := 0;
  cdsRateios.DisableControls;
  cdsRateios.First;
  while not cdsRateios.Eof do begin
    fTotal := fTotal + cdsRateios.FieldByName('PERCRATEIOCONTR').AsFloat;
    cdsRateios.Next;
  end;
  cdsRateios.EnableControls;
  fSaldo := 100 - fTotal;

  if fTotal < 100 then
       Result := True
  else Result := False;
end;


function TfrmCadServProdXItemContrMT.DuplicidadeRateio: Boolean;
begin
   Result := False;
   cdsVerifRateio.First;
   while not cdsVerifRateio.Eof do begin
      if (cdsVerifRateio.RecNo <> cdsRateios.RecNo ) and
         (cdsVerifRateio.FieldbyName('CODCENTROCUSTO').AsString = cdsRateios.FieldByName('CODCENTROCUSTO').AsString ) and
         (cdsVerifRateio.FieldbyName('IDPROGRAMA').AsInteger    = cdsRateios.FieldByName('IDPROGRAMA').AsInteger    ) and
         (cdsVerifRateio.FieldbyName('IDPLANOPREV').AsInteger   = cdsRateios.FieldByName('IDPLANOPREV').AsInteger   ) and
         (cdsVerifRateio.FieldbyName('IDPATRO').AsInteger       = cdsRateios.FieldByName('IDPATRO').AsInteger       ) and
         (cdsVerifRateio.FieldbyName('UNIDNEGOC').AsInteger     = cdsRateios.FieldByName('UNIDNEGOC').AsInteger     ) then begin
         Result := True;
         Exit;
      end;
      cdsVerifRateio.Next;
   end;
end;


procedure TfrmCadServProdXItemContrMT.sbtnInsDetClick(Sender: TObject);
var sSaldoRateio : Extended;
begin
  if VerificaRateio( sSaldoRateio ) then begin
    inherited;
  end else begin
    MsgDlg('Percentual de Rateio entre Centros de Custo já totaliza 100%','Aviso',mtWarning,[mbOK],0);
    sbtnInsDet.Down := False;
  end;
end;

procedure TfrmCadServProdXItemContrMT.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  // Iguala o Cds de verificação de duplicidade de rateio
  cdsVerifRateio.Data := cdsRateios.Data;
end;

procedure TfrmCadServProdXItemContrMT.CmeDetalheEdit(Sender: TObject);
Begin
  // Iguala o Cds de verificação de duplicidade de rateio
  cdsVerifRateio.Data := cdsRateios.Data;
  inherited;
end;

// início - andre tavares - pendência 17968 - 10/01/2005
procedure TfrmCadServProdXItemContrMT.dblcPlanoPrevCCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (trim(dblcPlanoPrevC.text) <> '') and (trim(dblcPatroC.text) <> '') then
  if not VerificaPlanoPatro(strToInt(dblcPlanoPrevC.lookupValue), strToInt(dblcPatroC.lookupValue)) then
  begin
    MsgDlg('Plano e Patro Não Relacionados','Erro',mtError,[mbOK],0);
    dblcPlanoPrevC.Text := '';
    if dblcPlanoPrevC.canFocus then dblcPlanoPrevC.setFocus;
  end;
end;

function TfrmCadServProdXItemContrMT.VerificaPlanoPatro(const idPlanoprev, idPatro: integer): Boolean;
begin
  result := false;
  cdsPlanPrevContabPatro.Close;
  SqlPlanPrevContabPatro.Prepare;
  SqlPlanPrevContabPatro.ParamByName('IDPLANOPREV').asInteger := idPlanoprev;
  SqlPlanPrevContabPatro.ParamByName('IDPATRO').asInteger     := idPatro;
  SqlPlanPrevContabPatro.Open;
  result := not cdsPlanPrevContabPatro.IsEmpty;
end;

procedure TfrmCadServProdXItemContrMT.dblcPatroCCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (trim(dblcPlanoPrevC.text) <> '') and (trim(dblcPatroC.text) <> '') then
  if not VerificaPlanoPatro(strToInt(dblcPlanoPrevC.lookupValue), strToInt(dblcPatroC.lookupValue)) then
  begin
    MsgDlg('Plano e Patro Não Relacionados','Erro',mtError,[mbOK],0);
    dblcPatroC.Text := '';
    if dblcPatroC.canFocus then dblcPatroC.setFocus;
  end;
end;
// fim - andre tavares - pendência 17968 - 10/01/2005

procedure TfrmCadServProdXItemContrMT.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
   inherited;
   sbtnAlterar.Enabled := cdsContratos.FieldByName('FLGFIMCONTRATO').AsString <> 'E';
   sbtnApagar.Enabled  := sbtnAlterar.Enabled;
end;

procedure TfrmCadServProdXItemContrMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblcContrato.Enabled := True;

  if cdsContratos.FieldByName('FLGFIMCONTRATO').AsString <> 'E' then
  begin
     dblcContrato.Enabled := False;
  end;

  //chkMaoDeObra.Enabled := True;  //Cássio Rovaroto - SIG nº 23656.57467 //Cássio Rovaroto - SIG nº 115585 - Início
end;

procedure TfrmCadServProdXItemContrMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
   SelecionaMestreDetalhe( StrToFloat(MontaSelect.ValoresChave[0]),
                           StrToFloat(MontaSelect.ValoresChave[1]),
                           StrToFloat(MontaSelect.ValoresChave[2]) );
   lblStatus.Caption := MontaSelect.ValoresChave[3];
  end;
  lblStatus.Visible := True;

  cdsContratos.Data      := CtrlContratos.ListContratos(0);
  //Cássio Rovaroto - SIG nº 115585 - Início
  //Cássio Rovaroto - SIG nº 23656.57467 - Início
  //chkMaoDeObra.Checked := Cds.FieldByName('FLGMAODEOBRA').AsString =  'S';
  //chkMaoDeObra.Enabled := False;
  //Cássio Rovaroto - SIG nº 23656.57467 - Fim
  //Cássio Rovaroto - SIG nº 115585 - Fim
end;


procedure TfrmCadServProdXItemContrMT.FormDestroy(Sender: TObject);
begin
  inherited;

  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  //FreeAndNil(CtrlOrcamento);
  //FIM   - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

end;

procedure TfrmCadServProdXItemContrMT.GetSubDespesa;
Const
  ///
  _PARAM_ID          = ':ID_';
  _PARAM_Fornecedor  = ':Fornecedor_';
  _PARAM_Empresa     = ':Empresa_';
  _PARAM_CentroCusto = ':CentroCusto_';

   ///
  _Select_Desembolso = ' Select DISTINCT ' // Otacilio SOL 200778 KTN 1953121
                     + '    D.SUBDESPESA,'
                     + '    CASE WHEN F.RAZAOSOCIAL IS NULL'
                     + '         THEN D.SUBDESPESA'
                     + '         ELSE F.RAZAOSOCIAL || '' - '' || D.SUBDESPESA'
                     + '    END DESCSUBDESPESA,'
                     + '    D.IdDespesaOrc,'
                     + '    R.CodTiPrecDes,'
                     + '    R.Idgrupoorcamen,'
                     + '    G.CodGrupoOrc,'
                     + '    SubStr(G.CodGrupoOrc, 1, P.TamCod2) GrupoContas,'
                     + '    R.Codcentrocusto CentroCusto,'
                     // + '    R.PlaConta,'  // Otacilio SOL 200778 KTN 1953121
                     // + '    SubStr(R.PlaConta, 4, 1) TipoDespesa,' // Otacilio SOL 200778 KTN 1953121
                     + '    D.IDFORNECEDOR '
                     // + '    R.IDTIPORDXCCXCONTA' // Otacilio SOL 200778 KTN 1953121
                     + ' From'
                     + '    Tipordxccxconta R,'
                     + '    DespesaOrcamentaria D,'
                     + '    GrupoOrcamen G,'
                     + '    Paramorcamento P,'
                     + '    PESSOA F' //FORNECEDOR
                     + ' Where D.Idgrupoorcamen   = R.Idgrupoorcamen'
                     + '   And G.Idgrupoorcamen   = D.Idgrupoorcamen'
                     + '   And P.IDPESSOA         = d.idpessoa'
                     + '   And P.IDPLANOORCAMEN   = g.idplanoorcamen'
                     + '   And R.IdEmpresa        = ' + _PARAM_Empresa
                     + '   And R.CodTiPrecDes     = ' + #39 + _PARAM_ID + #39
                     + '   And F.IDPESSOA(+)      = D.IDFORNECEDOR'
                     + '   And (D.IDFORNECEDOR    = ' + _PARAM_Fornecedor
                     + '    OR  D.IDFORNECEDOR    = -1)'
                     + '   AND R.CodCentroCusto   = ' + #39 + _PARAM_CentroCusto + #39
                     + '   And D.FLGSTATUSDESPESA = ''A'' '
                     ;
  {_Select_Desembolso = ' Select'
                     + '    D.SUBDESPESA,'
                     + '    D.IdDespesaOrc,'
                     + '    T.CodTiPrecDes,'
                     + '    T.Idgrupoorcamen,'
                     + '    G.CodGrupoOrc,'
                     + '    SubStr(G.CodGrupoOrc, 1, P.TamCod2) GrupoContas,'
                     + '    T.Codcentrocusto CentroCusto,'
                     + '    T.PlaConta,'
                     + '    SubStr(T.PlaConta, 4, 1) TipoDespesa,'
                     + '    D.IDFORNECEDOR,'
                     + '    T.IDTIPORDXCCXCONTA'
                     + ' From'
                     + '    Tipordxccxconta T,'
                     + '    DespesaOrcamentaria D,'
                     + '    GrupoOrcamen G,'
                     + '    Paramorcamento P'
                     + ' Where D.Idgrupoorcamen   = T.Idgrupoorcamen'
                     + '   And G.Idgrupoorcamen   = D.Idgrupoorcamen'
                     + '   And P.IDPESSOA         = d.idpessoa'
                     + '   And P.IDPLANOORCAMEN   = g.idplanoorcamen'
                     + '   And T.IdEmpresa        = ' + _PARAM_Empresa
                     //+ '   And T.CodTiPrecDes     = ' + #39 + _PARAM_ID + #39
                     + '   And T.CodTiPrecDes     = ' + _PARAM_ID
                     + '   And D.IDFORNECEDOR     = ' + _PARAM_Fornecedor
                     + '   And D.FLGSTATUSDESPESA = ''A'' ';
                     }
////////
Var
  _Sql : String;
begin

  _Sql := _Select_Desembolso;

  _Sql := StringReplace(_Sql, _PARAM_ID,          cdsServicoProduto.FieldByName('CODTIPRECDES').AsString, [rfReplaceAll]);
  _Sql := StringReplace(_Sql, _PARAM_Fornecedor,  cdsContratos.FieldByName('IDFORCLI').AsString         , [rfReplaceAll]);
  _Sql := StringReplace(_Sql, _PARAM_Empresa,     FloatToStr(Sistema.IdEmpresa)                         , [rfReplaceAll]);
  _Sql := StringReplace(_Sql, _PARAM_CentroCusto, cdsRateios.FieldByName('CODCENTROCUSTO').AsString     , [rfReplaceAll]);

  CdsSubDespesa.Close;
  sqlSubDespesa.SQL.Text := _SQL;
  sqlSubDespesa.Open;

end;

procedure TfrmCadServProdXItemContrMT.CdsBeforeEdit(DataSet: TDataSet);
begin
  inherited;

  //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  GetSubDespesa;
  
end;

procedure TfrmCadServProdXItemContrMT.dblcCentroCustoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  GetSubDespesa;
end;

procedure TfrmCadServProdXItemContrMT.dblcCentroCustoExit(Sender: TObject);
begin
  inherited;
  //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  GetSubDespesa;
end;
//SIG49931 inicio
procedure TfrmCadServProdXItemContrMT.dblcItemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  //SIG49931
  pgctrlDetalhe.ActivePage := tbsDet ;
  sbtnAltDetClick(Self);
  bbtnOkDetClick(Self);
  pgctrlDetalhe.ActivePage := tbsServicoProduto;
  //SIG49931

  inherited;

end;
//SIG49931 final
procedure TfrmCadServProdXItemContrMT.dblcItemChange(Sender: TObject);
Var sErro : String;//SIG49931
begin
  if (Cds.State = dsEdit) then  // Andre Imakawa - SIG 56199
  Begin
    //SIG49931 Inicio
    sErro := CtrlServProdxItemContr.ExisteMedicao(StrToFloat(MontaSelect.ValoresChave[0]),
                                                  StrToFloat(MontaSelect.ValoresChave[1]),
                                                  StrToFloat(MontaSelect.ValoresChave[2]) );

    if (trim(sErro) <> '') and (Cds.State = dsEdit) then
    begin
        MsgDlg(sErro,'Erro',mtInformation,[mbOK],0);
        bbtnCancelarClick(Self);
        exit;
    end;
    //SIG49931 Final
  end;
  inherited;
end;

//Darivaldo Alencar SIG67505 -inicio
procedure TfrmCadServProdXItemContrMT.AtlzChaveCtrlParcelaMedicao;
var
  bAlterou: boolean;
begin
  if (cds.state in [dsEdit])then
   begin
     bAlterou:= False;
     CdsCtrlParcelaMedicao.First;
     while not(CdsCtrlParcelaMedicao.Eof) do
        begin
           if (CdsCtrlParcelaMedicao.FieldByName('IDITEM').asFloat <> Cds.FieldByName('IDITEM').asFloat)or
              (CdsCtrlParcelaMedicao.FieldByName('IDOBJETO').asFloat <> Cds.FieldByName('IDOBJETO').asFloat)  then
               begin
                 bAlterou:= True;
                 CdsCtrlParcelaMedicao.Edit;
                 if (CdsCtrlParcelaMedicao.FieldByName('IDITEM').asFloat <> Cds.FieldByName('IDITEM').asFloat) then
                     CdsCtrlParcelaMedicao.FieldByName('IDITEM').asFloat := Cds.FieldByName('IDITEM').asFloat;

                 if (CdsCtrlParcelaMedicao.FieldByName('IDOBJETO').asFloat <> Cds.FieldByName('IDOBJETO').asFloat) then
                     CdsCtrlParcelaMedicao.FieldByName('IDOBJETO').asFloat := Cds.FieldByName('IDOBJETO').asFloat;

                 CdsCtrlParcelaMedicao.Post;
               end;

           CdsCtrlParcelaMedicao.Next;
        end;
        CdsCtrlParcelaMedicao.First;

        if bAlterou then
           CdsCtrlParcelaMedicao.Edit;
   end;
end;
//Darivaldo Alencar SIG67505 -inicio

procedure TfrmCadServProdXItemContrMT.dbeNumeroParcelasExit(
  Sender: TObject);
begin
 //Ewerton Beltramini - 06/08/2020 - SIG84083 - Inicio...
 if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) Then //Cds.State in [dsInsert,dsEdit] then
 begin
      bAlteraParcela := False;
      if cds.State = DsEdit then
      begin
            QryAux.Close;
            QryAux.sql.Clear;
            QryAux.SQL.add(' select max(PARCELANUM) as QTD_PARCELA,   ');
            QryAux.SQL.add('        max(VENCIMENTO) as UltVencimento, ');
            QryAux.SQL.add('        max(IDADITAMENTO) as UltAditamento'); //TAES - SIG113455
            QryAux.SQL.add('   from CTRLPARCELAMEDICAO                ');
            QryAux.SQL.add('where IDCONTRATO       = ' + cds.fieldbyname('IDCONTRATO').AsString);
            QryAux.SQL.add('  and IDITEM           = ' + cds.fieldbyname('IDITEM').AsString);
            QryAux.SQL.add('  and IDOBJETO         = ' + cds.fieldbyname('IDOBJETO').AsString);
            QryAux.SQL.add('  and NVL(IDADITAMENTO, 1) = ( select max(NVL(IDADITAMENTO, 1)) '); //TAES - SIG113455
            QryAux.SQL.add('                   from CTRLPARCELAMEDICAO  ');
            QryAux.SQL.add('                  where IDCONTRATO       = ' + cds.fieldbyname('IDCONTRATO').AsString);
            QryAux.SQL.add('                    and IDITEM           = ' + cds.fieldbyname('IDITEM').AsString);
            QryAux.SQL.add('                    and IDOBJETO         = ' + cds.fieldbyname('IDOBJETO').AsString + ')');
            QryAux.Open;

            if QryAux.Recordcount > 0 then
            begin
                  if (cds.fieldbyname('NUMPARCELAS').Value <> QryAux.FieldByName('QTD_PARCELA').Value ) then
                  begin
                       edtMotivoAltParcela.text := '';
                       if (cds.fieldbyname('NUMPARCELAS').Value > QryAux.FieldByName('QTD_PARCELA').Value) then
                           edtMotivoAltParcela.Text := 'Acréscimo de ' + IntToStr(abs(QryAux.FieldByName('QTD_PARCELA').AsInteger - cds.fieldbyname('NUMPARCELAS').AsInteger)) + ' Parcelas.'
                       else if (cds.fieldbyname('NUMPARCELAS').Value < QryAux.FieldByName('QTD_PARCELA').Value) then
                                      edtMotivoAltParcela.Text := 'Decréscimo de ' + IntToStr(abs(QryAux.fieldbyname('QTD_PARCELA').AsInteger - cds.FieldByName('NUMPARCELAS').AsInteger)) + ' Parcelas.';

                       LblAltQtdParcela.Enabled    := True;
                       edtMotivoAltParcela.Enabled := True;
                       edtMotivoAltParcela.SetFocus;
                       Exit;
                      
                  end
                  else if (cds.fieldbyname('NUMPARCELAS').Value = QryAux.FieldByName('QTD_PARCELA').Value ) then
                  begin
                       GetObsAltParcela();
                       LblAltQtdParcela.Enabled := False;
                       edtMotivoAltParcela.Enabled := False;
                  end;
            end;
      end;
  end;
  //Ewerton Beltramini - 06/08/2020 - SIG84083 - Fim
  inherited;

end;

procedure TfrmCadServProdXItemContrMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  iQtdParcelas := cds.fieldbyname('NUMPARCELAS').Value;
end;

procedure TfrmCadServProdXItemContrMT.bbtnConfirmarClick(Sender: TObject);
var iCont, iIdAditamento: Integer;    //Ewerton Beltramini - 06/08/2020 - SIG84083
    dUltVencimento, dUltVencimentoAux : String;  //Ewerton Beltramini - 06/08/2020 - SIG84083
begin
  //Ewerton Beltramini - 06/08/2020 - SIG84083 - Inicio...
  iIdAditamento := 0; //TAES - SIG113455

  if bAlteraParcela then
  begin
       if (trim(edtMotivoAltParcela.text) = '') or (length(trim(edtMotivoAltParcela.text)) <= 2) or (edtMotivoAltParcela.Enabled = False)  then
       begin
             if MsgDlg('Para salvar a alteração, preencha corretamente o campo "Motivo Alteração da Quantidade de Parcelas"','Confirmação',mtConfirmation,[mbOk],0) = mrYes then
             begin
                  LblAltQtdParcela.Enabled := True;
                  edtMotivoAltParcela.Enabled := True;
                  edtMotivoAltParcela.SetFocus;
                  exit;
             end;
       end;
       
       iCont:= QryAux.FieldByName('QTD_PARCELA').AsInteger;
       dUltVencimento := formatDateTime('dd/mm/yyyy',QryAux.FieldByName('UltVencimento').AsDateTime);

       if not(QryAux.FieldByName('UltAditamento').IsNull) then
         iIdAditamento := QryAux.FieldByName('UltAditamento').AsInteger; //TAES - SIG113455

       if cds.fieldbyname('NUMPARCELAS').Value > iCont then
       begin

             case dbrgFrequencia.ItemIndex of
                  0:   dUltVencimentoAux:= formatDateTime('dd/mm/yyyy',QryAux.FieldByName('UltVencimento').AsDateTime);  //Única
                  1:   dUltVencimentoAux:= formatDateTime('dd/mm/yyyy',IncMonth(QryAux.FieldByName('UltVencimento').AsDateTime,1));  //Mensal
                  2:   dUltVencimentoAux:= formatDateTime('dd/mm/yyyy',IncMonth(QryAux.FieldByName('UltVencimento').AsDateTime,3));  //Trimestral
                  3:   dUltVencimentoAux:= formatDateTime('dd/mm/yyyy',IncMonth(QryAux.FieldByName('UltVencimento').AsDateTime,6));  //Semestral
                  4:   dUltVencimentoAux:= formatDateTime('dd/mm/yyyy',IncMonth(QryAux.FieldByName('UltVencimento').AsDateTime,12));  //Anual
             end;

             //TAES - início - SIG113455
             //QryAux.Close;
             //QryAux.sql.Clear;
             //QryAux.SQL.add('select * from CTRLPARCELAMEDICAO ');
             //QryAux.SQL.add('where IDCONTRATO       = ' + cds.fieldbyname('IDCONTRATO').AsString);
             //QryAux.SQL.add('  and IDITEM           = ' + cds.fieldbyname('IDITEM').AsString);
             //QryAux.SQL.add('  and IDOBJETO         = ' + cds.fieldbyname('IDOBJETO').AsString);
             //QryAux.SQL.add('  and vencimento       = ' + QuotedStr(dUltVencimento));
             //QryAux.Open;
             //iIdAditamento :=  QryAux.FieldByName('IDADITAMENTO').AsInteger;
             //TAES - fim - SIG113455

             repeat

                    Inc(iCont);
                    QryAux.Close;
                    QryAux.sql.Clear;
                    QryAux.SQL.add(' INSERT INTO CTRLPARCELAMEDICAO C (IDPARCMEDICAO,  ');
                    QryAux.SQL.add('        IDMEDICAO,                                 ');
                    QryAux.SQL.add('        IDCONTRATO,                                ');
                    QryAux.SQL.add('        IDITEM,                                    ');
                    QryAux.SQL.add('        IDOBJETO,                                  ');
                    QryAux.SQL.add('        PARCELANUM,                                ');
                    QryAux.SQL.add('        VENCIMENTO,                                ');
                    QryAux.SQL.add('        FLGPARCELAMEDIDA,                          ');
                    QryAux.SQL.add('        IDADITAMENTO)                              ');
                    QryAux.SQL.add(' VALUES(SEQCTRLPARCELAMEDICAO.NEXTVAL,             ');
                    QryAux.SQL.add('        NULL,                                      ');
                    QryAux.SQL.add(         cds.fieldbyname('IDCONTRATO').AsString + ',');
                    QryAux.SQL.add(         cds.fieldbyname('IDITEM').AsString     + ',');
                    QryAux.SQL.add(         cds.fieldbyname('IDOBJETO').AsString   + ',');
                    QryAux.SQL.add(         IntToStr(iCont)                       + ',');
                    QryAux.SQL.add('        TO_DATE(' + QuotedStr(dUltVencimentoAux) + ',' + QuotedStr('DD/MM/YYYY') + '),');
                    QryAux.SQL.add('        0,'                                         );

                    if(iIdAditamento <> 0) then
                      QryAux.SQL.add(         IntToStr(iIdAditamento)                + ')')
                    else
                      QryAux.SQL.add(' NULL)'); //TAES - SIG113455

                    QryAux.ExecSql;
                    
                    case dbrgFrequencia.ItemIndex of
                        0:   dUltVencimentoAux:= dUltVencimentoAux;  //Única
                        1:   dUltVencimentoAux:= formatDateTime('dd/mm/yyyy',IncMonth(StrToDate(dUltVencimentoAux),1));  //Mensal
                        2:   dUltVencimentoAux:= formatDateTime('dd/mm/yyyy',IncMonth(StrToDate(dUltVencimentoAux),3));  //Trimestral
                        3:   dUltVencimentoAux:= formatDateTime('dd/mm/yyyy',IncMonth(StrToDate(dUltVencimentoAux),6));  //Semestral
                        4:   dUltVencimentoAux:= formatDateTime('dd/mm/yyyy',IncMonth(StrToDate(dUltVencimentoAux),12));  //Anual
                    end;

             until (iCont >= cds.fieldbyname('NUMPARCELAS').Value);

             QryAux.Close;
             QryAux.sql.Clear;
             QryAux.SQL.add('Update CONTRATOCONTR ');
             QryAux.SQL.add('Set OBSALTPARCELA = ' + QuotedStr(Trim(edtMotivoAltParcela.Text)));
             QryAux.SQL.add('where IDCONTRATO       = ' + cds.fieldbyname('IDCONTRATO').AsString);
             QryAux.ExecSQL;

       end
       else if cds.fieldbyname('NUMPARCELAS').Value < iCont then
       begin
             if MsgDlg('A Quantidade de Parcelas já cadastrada(s) (' + IntToStr(iCont) +
                       ') é diferente da quantidade informada (' + cds.fieldbyname('NUMPARCELAS').AsString + ')! '
                        + #13 + 'Deseja apagar as parcelas já cadastradas e apenas deixar a nova quantidade de parcelas informada?"'
//                      + #13 + '(Atenção, apenas parcelas não medidas e com o ano do vencimento igual ou maior ao ano corrente poderam ser apagadas!)'  //SIG120458  (Retirada restrição)
                       ,'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then
             begin
                   QryAux.Close;
                   QryAux.sql.Clear;
                   QryAux.SQL.add('select * from CTRLPARCELAMEDICAO ');
                   QryAux.SQL.add('where IDCONTRATO       = ' + cds.fieldbyname('IDCONTRATO').AsString);
                   QryAux.SQL.add('  and IDITEM           = ' + cds.fieldbyname('IDITEM').AsString);
                   QryAux.SQL.add('  and IDOBJETO         = ' + cds.fieldbyname('IDOBJETO').AsString);
                   QryAux.SQL.add('  and vencimento       = ' + QuotedStr(dUltVencimento));
                   QryAux.Open;
                   iIdAditamento :=  QryAux.FieldByName('IDADITAMENTO').AsInteger;

                   QryAux.Close;
                   QryAux.sql.Clear;
                   QryAux.SQL.add('DELETE FROM CTRLPARCELAMEDICAO ');
                   QryAux.SQL.add('where IDCONTRATO       = ' + cds.fieldbyname('IDCONTRATO').AsString);
                   QryAux.SQL.add('  and IDITEM           = ' + cds.fieldbyname('IDITEM').AsString);
                   QryAux.SQL.add('  and IDOBJETO         = ' + cds.fieldbyname('IDOBJETO').AsString);
                   //Ewerton Beltramini - 28/10/2021 - SIG120458
                   //QryAux.SQL.add('  and to_char(vencimento,' + QuotedStr('yyyy') + ') >= to_char(sysdate,' + QuotedStr('YYYY') + ')'); //SIG120458 (Retirada restrição)
                   //QryAux.SQL.add('  and IDADITAMENTO     = ' +  IntToStr(iIdAditamento));                                 //SIG120458
                   QryAux.SQL.add('  and ((IDADITAMENTO = ' +  IntToStr(iIdAditamento) + ') or (IDADITAMENTO is null)) ');   //SIG120458
                   QryAux.SQL.add('  and idmedicao is null ');
                   QryAux.SQL.add('  and parcelanum > ' + cds.fieldbyname('NUMPARCELAS').AsString);
                   QryAux.ExecSQL;

                   QryAux.Close;
                   QryAux.sql.Clear;
                   QryAux.SQL.add('Update CONTRATOCONTR ');
                   QryAux.SQL.add('Set OBSALTPARCELA  = ' + QuotedStr(Trim(edtMotivoAltParcela.Text)));
                   QryAux.SQL.add('where IDCONTRATO  = ' + cds.fieldbyname('IDCONTRATO').AsString);
                   QryAux.ExecSQL;

             end else
             begin
                  dbeNumeroParcelas.SetFocus;
                  Abort;
             end;
       end;
  end;
  bAlteraParcela:= False;
  edtMotivoAltParcela.text := '';
  LblAltQtdParcela.Enabled := False;
  edtMotivoAltParcela.Enabled := False;
  //Ewerton Beltramini - 06/08/2020 - SIG84083 - Fim

  inherited;

  //Ewerton Beltramini - 18/08/2020 - SIG84083 - Inicio..
  //Para forçar o campo a atualizar após a mudança.... 
  dbeNumeroParcelas.DataSource :=  ds;
  dbeNumeroParcelas.DataField := 'NUMPARCELAS';
  Application.ProcessMessages;
  //Ewerton Beltramini - 18/08/2020 - SIG84083 - Fim


end;





//Ewerton Beltramini - 06/08/2020 - SIG84083 - Inicio...
procedure TfrmCadServProdXItemContrMT.edtMotivoAltParcelaExit(
  Sender: TObject);
begin
  inherited;
  if (cds.fieldbyname('NUMPARCELAS').Value <> QryAux.FieldByName('QTD_PARCELA').Value ) then
  begin
       if (trim(edtMotivoAltParcela.text) = '') or (length(trim(edtMotivoAltParcela.text)) <= 2)  then
       begin
             if MsgDlg('A Quantidade de Parcelas já cadastrada(s) (' + QryAux.FieldByName('QTD_PARCELA').AsString +
                       ') é diferente da quantidade informada (' + cds.fieldbyname('NUMPARCELAS').AsString + ')! ' + #13 +
                       'Para salvar a alteração, preencha corretamente o campo "Motivo Alteração da Quantidade de Parcelas"' + #13 +
                       'Deseja prosseguir com a alteração?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then
             begin
                  LblAltQtdParcela.Enabled := True;
                  edtMotivoAltParcela.Enabled := True;
                  edtMotivoAltParcela.SetFocus;
                  exit;
             end
             else
             begin
                  GetObsAltParcela();
                  LblAltQtdParcela.Enabled := False;
                  edtMotivoAltParcela.Enabled := False;
                  cds.fieldbyname('NUMPARCELAS').Value := iQtdParcelas;
                  exit;
             end;
       end
       else
       begin
            bAlteraParcela := True;
       end;           
  end;

end;
//Ewerton Beltramini - 06/08/2020 - SIG84083 - Fim.
procedure TfrmCadServProdXItemContrMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bAlteraParcela := False; //Ewerton Beltramini - 06/08/2020 - SIG84083
  GetObsAltParcela();      //Ewerton Beltramini - 06/08/2020 - SIG84083
end;

procedure TfrmCadServProdXItemContrMT.CdsAfterPost(DataSet: TDataSet);
begin
  inherited;
  GetObsAltParcela(); //Ewerton Beltramini - 06/08/2020 - SIG84083
end;

procedure TfrmCadServProdXItemContrMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  GetObsAltParcela(); //Ewerton Beltramini - 06/08/2020 - SIG84083
end;

end.
