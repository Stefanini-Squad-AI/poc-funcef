{--------------------------------------------------------------------------------------------------
Nº SIG......: 19587
Data........: 06/05/2016
Responsável.: Peterson Victor
Descrição...: Alteração da regra de privilegio para lançamentos
----------------------------------------------------------------------------------------------------
Nº SOL......: 262615/17834
Nº PPM......: 1115918
Data........: 20/10/2015
Responsável.: Peterson Victor
Descrição...: Melhora da usabilidade da funcionalidade
----------------------------------------------------------------------------------------------------
Nº SOL......: 257649
Nº PPM......: 963188
Data........: 13/07/2015
Responsável.: Petri Nocentini
Descrição...: Campo com nome errado
--------------------------------------------------------------------------------------------------
Rotina......: .dfm, montaselect, proc_ReplicarCadMovRateio, DBcboGrupoRateioFluxoExit
Nº SOL......: 210181-15348
Nº KINTANA..: 2051446
Data........: 12/11/2013
Responsável.: Edilaine Ferraresi
Descrição...: Identificação pre-rateio
----------------------------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SOL......: 136203/13102
Nº KINTANA..: 1980710
Data........: 16/04/2012
Responsável.: Thiago Melo
Descrição...: Não está inserindo informação de RECPAG na tabela FLUXOORCADO
----------------------------------------------------------------------------------------------------
Rotina......: CmeCadastroBeforeConfirma, VerificaPreenchimento
Nº SOL......: 162240
Nº KINTANA..: 1378222
Data........: 12/11/2011
Responsável.: Otacilio Aquino
Descrição...: Ajustar a Rotina de fluxo de caixa
{ --------------------------------------------------------------------------------------------------
Rotina......: CmeCadastroBeforeConfirma, VerificaPreenchimento
Nº SOL......: 128685
Nº KINTANA..: 692049
Data........: 06/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: - Implementação do Rateio Pré-definido
---------------------------------------------------------------------------------------------------}
{
Rotina.............: CmeCadastroBeforeConfirma, CmeCadastroFind, CmeCadastroInsert,
                     CmeCadastroDelete, sbtnInserirClick, bbtnConfirmarClick,
                     bbtnCancelarClick, dblcLinhasFluxoCloseUp, dblcLinhasFluxoEnter,
                     dblcTipoRDCloseUp, dblcTipoRDEnter
N. Sol.............: 115673
N. Kintana.........: 542579
Data...............: 06/07/2009
Responsável........: Marilza Colpani
Descrição..........: - Tornar não obrigatório o preenchimento dos campos:
                   Tipo de Recebimento/Desembolso e Tipo de Documento;
                     - Torna-se obrigatório preencher apenas um dos dois campos:
                   Linha do Fluxo ou Tipo de Recebimento/Desembolso;
                     - Quando houver apenas um registro no campo Fluxo de Caixa,
                   este deverá estar preenchido no momento de abertura da tela,
                   caso exista mais de um, o usuário escolherá a opção desejada.

********************************************************************************

Rotina............:
N. Sol.............: 54393
N. Kintana......: 523368
Data...............: 14/04/2009
Responsável...: Ricardo Alves
Descrição........: Permissão de inclusão de fluxos orçamentários sem restrição
  de datas para usuários pertencentes ao grupo TESOURARIA.
}


// Alterações:
{---------------------------------------------------------------------------------------------------
Data      : 19/04/2006
Autor     : Rodolpho da Silva
Pendencia : 18422
Descrição : Capturar as mensagems de erro da Ctrl
----------------------------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 07/03/2006
Autor     : Rodolpho da Silva
Pendencia : 19904
Descrição : Passar a validar data de lançamento pela rotina da disponibilidade
            financeira, que também valida o bloqueio do período contábil, caso
            o CFinan integre com a Contabilidade
----------------------------------------------------------------------------------------------------
Rotina    : BeforeConfirma
Data      : 31/03/2005
Autor     : Rodolpho da Silva
Pendencia : 18809
Descrição : Ajuste nos atributos de valores aos campos CODTIPRECDES e RECPAG
----------------------------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 17/02/2005
Autor     : Rodolpho da Silva
Pendencia : 18393
Descrição : Permitir somente inserções em dias úteis
----------------------------------------------------------------------------------------------------
Rotina    : Divs
Data      : 30/11/04
Autor     : Alex Pereira
Pendencia : 18035
Descrição : Eliminar do resultado da query os recebimentos / desembolsos que
            não estejam contidos em nenhuma linha do fluxo de caixa
----------------------------------------------------------------------------------------------------
Rotina    : Divs
Autor(a)  : Alex Pereira
Data      : 20/11/2004
Pendência : 18112
Descriçao : Ratear o Fluxo Orçado por um critério para segregação.
            Verificar Relaciomamentos válidos entre plano e patro
----------------------------------------------------------------------------------------------------
Rotina    : MontaSelect
Autor(a)  : Gleyber
Data      : 18/08/2003
Pendência : 14620
Descriçao : Incluída a pesquisa por usuário.
----------------------------------------------------------------------------------------------------
Rotina    : -
Autor(a)  : André Pontes
Data      : 15/08/2003
Pendência : 14648
Descriçao : Ajuste do TabOrder dos controles
---------------------------------------------------------------------------------------------------}

unit FMovimFluxoOrcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  DBCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit, wwdblook,
  uCtrlMovimFluxoOrc, uCtrlListTercFinanc, uCtrlParamFinanc, uDiasUteis,
  uCmSqlParams, ComCtrls, wwriched,
  uCtrlSegregacao, uCtrlPlanPrevContabPatro, uVerificaPreenchimento,
  uCtrlFinanc, uCtrlPadroes, CMDBLookupCombo,
  uCtrlGrupoRateioFluxo, DBTables, Wwquery, uCMTypes;

type
  { // Edilaine - SOL 210181-15348 / KTN 2051446 - passado para control
  TDados  = record
              Atividade      : Double;
              CRespon        : String;
              FluxoCaixa     : Double; // Marilza Colpani - SOL:115673/KTN:542579
              LinhaFluxo     : Double; // Marilza Colpani - SOL:115673/KTN:542579
              TipoRecDes     : String;
              DataLanc       : TDateTime;
              Valor          : Double; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino
              CodTipDoc      : Double;
              IDPlanoPrev    : Double;
              IDPatro        : Double;
              Observacao     : String;
              FlgSimulaAtivo : String;
              RecPag         : String;
              CodRel         : Double; // Kintana 1378222  SOL 115673 Otacilio
          end;
  } // Edilaine - SOL 210181-15348 / KTN 2051446 - fim


  TfrmMovimFluxoOrcMT = class(TFrmCadastroMT)
    FlgPermiteLancamentos: TCheckBox;
    lblUnidNegoc: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    lblCentroRespon: TLabel;
    dblcCentroRespon: TwwDBLookupCombo;
    lblData: TLabel;
    lblTipoRD: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    Label1: TLabel;
    DBEdNomeUsuario: TDBEdit;
    Label2: TLabel;
    DBEdData: TDBEdit;
    cdsTipoRecDes: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsUnidNeg: TCMClientDataSet;
    cdsTipoDoc: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    dblcTipoRD: TwwDBLookupCombo;
    Label4: TLabel;
    cdsLinhaFluxo: TCMClientDataSet;
    dblcLinhasFluxo: TwwDBLookupCombo;
    Label6: TLabel;
    dbmObs: TDBMemo;
    cdsSegregaCriter: TCMClientDataSet;
    lblValorDet: TLabel;
    dbeValor: TDBRealEdit;
    Label19: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    Label18: TLabel;
    dblcPatrocinador: TwwDBLookupCombo;
    Bevel1: TBevel;
    Bevel2: TBevel;
    CdsFluxoCaixa: TCMClientDataSet;
    dsFluxoCaixa: TDataSource;
    lblRateio: TLabel;
    DBcboGrupoRateioFluxo: TwwDBLookupCombo;
    cdsGrupoRateioFluxo: TCMClientDataSet;
    cdsGrupoRateioFluxoIDGRUPORATEIOFLUXO: TFloatField;
    cdsGrupoRateioFluxoGRRFDESCRICAO: TStringField;
    cdsPadraoRateioFluxo: TCMClientDataSet;
    qryAux: TwwQuery;
    Label3: TLabel;
    dbeIdRateio: TDBEdit;
    FlgInclusaoAlteracaoExclusao: TCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure dblcCentroResponChange(Sender: TObject);
    procedure dblcTipoRDChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    //procedure dblcMoedaExit(Sender: TObject); // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcLinhasFluxoChange(Sender: TObject);
    procedure dblcLinhasFluxoEnter(Sender: TObject);
    procedure dblcTipoRDEnter(Sender: TObject);
    procedure dblcTipoDocurmentoEnter(Sender: TObject);
    procedure dblcLinhasFluxoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure cboFluxoCaixaCloseUp(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dsFluxoCaixaDataChange(Sender: TObject; Field: TField);
    procedure cboFluxoCaixaDropDown(Sender: TObject);
    procedure dblcCentroResponCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCentroResponDropDown(Sender: TObject);
    procedure DBcboGrupoRateioFluxoExit(Sender: TObject);
    procedure dblcLinhasFluxoExit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure DBcboGrupoRateioFluxoKeyPress(Sender: TObject;
      var Key: Char);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure dblcPatrocinadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcPlanoPrevKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private { Private declarations }

    CtrlMovimFluxoOrc       : TCtrlMovimFluxoOrc;
    CtrlListTerceiros       : TCtrlListTercFinanc;
    CtrlParamFinanc         : TCtrlParamFinanc;
    CtrlSegregacao          : TCtrlSegregacao;
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlFinanc              : TCtrlFinanc;
    CtrlGrupoRateioFluxo    : TCtrlGrupoRateioFluxo; // Alterado por FHBS - SOL: 128685 KTN: 692049

    sPrazoAux, DataPrazo : String;
    rDiasBloqueio : Double;
    lstIdRateio   : TStringList;    // Edilaine - SOL 210181-15348 / KTN 2051446
    blnUsuarioTesouraria: Boolean;  // Edilaine - SOL 210181-15348 / KTN 2051446

    Ultimo : TDados;
    bCliqueComboTRD : Boolean;
    bCliqueComboFlx : Boolean;
    bLinhaFluxoPreenchido:Boolean; // Marilza Colpani - SOL:115673/KTN:542579
    bTRDPreenchido:Boolean;  // Marilza Colpani - SOL:115673/KTN:542579
    sFluxoCaixa: Integer; // Marilza Colpani - SOL:115673/KTN:542579
    sCentroRespon: String; //Marilza Colpani - SOL:115673/KTN:542579

    function VerificaPreenchimento: Boolean;
    procedure CarregaComboTRD(iIdEmpresa,iIdFluxoCaixa,iCodLinhaFluxo: integer; sCodCentroRespon: string);
    // Marilza Colpani - SOL:115673/KTN:542579
    // Procedure criada para centralizar a limpeza dos campos da tela
    procedure LimpaControles(bPreencherParametro: Boolean);
    //function RetornaCodTipRecDes(sCodTipoRecDes, RecPag: string; Idfluxoorcado:Integer): string; //Cassio

    procedure HabilitaRateio(bFlag: Boolean); // Alterado por FHBS - SOL: 128685 KTN: 692049
    procedure Ratear; // Alterado por FHBS - SOL: 128685 KTN: 692049

    // Atualizar Fluxos de Caixa que foram duplicados a partir desse
    function func_AtualizarFluxoDuplicado(Reg: TDados; Atividade, FluxoCaixa, LinhaFluxo, Valor, CodTipDoc,
                                          IDPlanoPrev, IDPatro: Double; DataProgramada: TDate;
                                          CRespon, TipoRecDes, Observacao, RecPag, FlgSimulaAtivo : String): Boolean;

    // Verifica se existe Fluxo que foram gerados junto com a atual na tela
    function func_VerificaFluxoExistente(Reg: TDados): Boolean;

    procedure proc_ReplicarCadMovRateio(Atividade, FluxoCaixa, LinhaFluxo, Valor, CodTipDoc, IDPlanoPrev, IDPatro: Double;
                                  CRespon, TipoRecDes, Observacao, RecPag : String; DataLanc: TDateTime; var CodRel: Double);

    function  ValidaUsuario  : boolean;    // Edilaine - SOL 210181-15348 / KTN 2051446
    procedure ValidaBloqueio;              // Edilaine - SOL 210181-15348 / KTN 2051446

  public  { Public declarations }

    constructor Create(AOwner: TComponent; sPrazo: String); reintroduce;


  end;

var
  frmMovimFluxoOrcMT: TfrmMovimFluxoOrcMT;

implementation

{$R *.DFM}

uses
  dBaseDados, uSistema, uMensErro, uCtrlParamIntegra, uMidasUtil,
  FReplicaCadMov, cRelatorio, uReplicarMov;

constructor TfrmMovimFluxoOrcMT.Create(AOwner: TComponent; sPrazo: String);
begin
   sPrazoAux       := sPrazo;
   bCliqueComboTRD := False;
   bCliqueComboFlx := False;

   lstIdRateio   := TStringList.Create;    // Edilaine - SOL 210181-15348 / KTN 2051446

   inherited Create(AOwner);
end;




procedure TfrmMovimFluxoOrcMT.FormCreate(Sender: TObject);
var
   cdsAux : TCMClientDataSet;
begin
   inherited;
   //Inicializa CtrlMovimFluxoOrc
   CtrlMovimFluxoOrc := TCtrlMovimFluxoOrc.Create;
   CtrlMovimFluxoOrc.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlMovimFluxoOrc.cdsFluxoOrcado := cds;

   //Carrega cds de Movimentos - cds
   cds.Data := CtrlMovimFluxoOrc.ListFluxoOrcado(0,Sistema.IdEmpresa, 0); //Vazio  //Teste

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros := TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
   {CtrlSegregacao := TCtrlSegregacao.Create;
   CtrlSegregacao.InitializeAs (CtrlMovimFluxoOrc);
   CtrlSegregacao.GetParams(Sistema.IdEmpresa);
   cdsSegregaCriter.Data := CtrlSegregacao.ListaSegregaCriter;
   dblcSegregaCriter.Enabled := CtrlSegregacao.SegregaVirtual;}
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **

   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.InitializeAs(CtrlMovimFluxoOrc);

   CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.UsaPlanoPatro);
   CtrlFinanc.InitializeAs(Padroes);

   // Alterado por FHBS - SOL: 128685 KTN: 692049
   CtrlGrupoRateioFluxo := TCtrlGrupoRateioFluxo.Create;
   CtrlGrupoRateioFluxo.InitializeAs( Padroes );
   cdsGrupoRateioFluxo.Data := CtrlGrupoRateioFluxo.LookupGrupoRateioFluxo;
   // Fim - Alterado por FHBS

   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino
   CdsFluxoCaixa.Data := CtrlMovimFluxoOrc.ListaFluxoCaixa(1);

   cdsAux := TCMClientDataSet.Create(nil);
   try
      cdsAux.Data := CtrlListTerceiros.ListParamGlobal(Sistema.IdEmpresa);
      dblcCentroRespon.Enabled := (cdsAux.FieldByName('USACRESPON').AsString = 'S');

      //Carrega cds de Unidade de Negócio - cdsUnidNeg
      if (cdsAux.FieldByName('USAABC').AsString = 'S') then
         cdsUnidNeg.Data := CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa, 0, 'A', '')
      else
       begin
          cdsUnidNeg.Data := CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,
                                                               cdsAux.FieldByName('UNIDNEGOC').AsFloat, '', '');
          dblcUnidNegoc.Enabled:=False;
       end;

      if (cdsAux.FieldByName('USACRESPON').AsString = 'S') then
        begin
          //Carrega o cds de Centros de Responsabilidade com todos os centros de Responsabilidade
          //permitidos ao usuário corrente.
          //Caso o mesmo não tenha nenhuma restrição de centro de responsabilidade cadastrada,
          //todos os centros de responsabilidade serão carregados
          cdsCentroRespon.Data     := CtrlListTerceiros.ListCentroResponxUsuarioAtivos(Sistema.IdEmpresa, Sistema.IdUsuario);
          dblcCentroRespon.Enabled := (cdsCentroRespon.RecordCount > 1);
          dblcCentroRespon.Update;

          //Carrega cds de Tipo de Rec/Des - cdsTipoRecDes
          cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(-1, '', '', 0); //Vazio

          {cdsTipoRecDes.Data   := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
                                                                             '', '', 0,
                                                                             False);}
        end
      else
        begin
          // Recupera apenas os centros de responsabilidade ativos}
          cdsCentroRespon.Data := CtrlListTerceiros.ListCentroRespon(Sistema.IdEmpresa, 'A', 'S', '9999999999', ParamIntegra.PlanoCentroRespon);
          dblcCentroRespon.Update;
          cdsTipoRecDes.Data   := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa, dblcCentroRespon.LookupValue, '', -1, False);
                                    {CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
                                                                             '9999999999', 'E', 0,
                                                                             true);}
          dblcCentroRespon.Enabled := False;
        end;

   finally
      cdsAux.Free;
   end;

   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino
   //Carrega cds de Tipo de Documento - cdsTipoDoc
   //cdsTipoDoc.Data := CtrlListTerceiros.ListTipoDoc('');

   if (Sistema.UsaPlanoPatro) then
   begin
      //Carrega cds de Plano Proveidenciário - cdsPlanoPrev
      cdsPlanoPrev.Data := CtrlListTerceiros.ListPlanoPrev;

      //Carrega cds de Patrocinador
      cdsPatrocinador.Data := CtrlListTerceiros.ListPatrocinador;
   end;

   //Carrega cds de Moeda - cdsMoeda
   cdsMoeda.Data := CtrlListTerceiros.ListMoeda(0,True);

   //Carrega cds de Linhas de Fluxo
   cdsLinhaFluxo.Data := CtrlMovimFluxoOrc.ListLinhasFluxo(Sistema.IdEmpresa, '', -1);
   //cdsLinhaFluxo.Data:=CtrlMovimFluxoOrc.ListLinhasFluxo(-1,'',-1);

   //Inicializa CtrlParamFinanc
   CtrlParamFinanc := TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados, True);
   LimpaControles(False);

   cdsAux := TCMClientDataSet.Create(nil);
   try
      cdsAux.Data := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);

      if (sPrazoAux='C') then
         begin
            if cdsaux.FieldByName('DTCURTOPZ').asFloat=0 then
               rDiasBloqueio := cdsAux.FieldByName('DIASBLOQORCCP').AsFloat
            else
               DataPrazo:=formatdatetime('DD/MM/YYYY',cdsaux.FieldByname('DTCURTOPZ').AsDateTime);
               Self.Caption := 'Movimentação do Fluxo Orçado de Curto Prazo';
               HelpContext  := 90025;
               bbtnAjuda.HelpContext:=90025;
         end
      else
      if (sPrazoAux = 'M') then
        begin
          if cdsaux.FieldByName('DTMEDIOPZ').asFloat=0 then
            rDiasBloqueio:=cdsAux.FieldByName('DIASBLOQORCMP').AsFloat
          else
            DataPrazo:=formatdatetime('DD/MM/YYYY',cdsaux.FieldByname('DTMEDIOPZ').AsDateTime);

          // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
          //Self.Caption := 'Movimentação do Fluxo Orçado de Médio Prazo';
          Self.Caption := 'Movimentação do Fluxo Previsto';
          // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
          HelpContext  := 90028;
          bbtnAjuda.HelpContext := 90028;
        end
      else
      if (sPrazoAux='L') then
       begin
          if cdsaux.FieldByName('DTLONGOPZ').asFloat=0 then
            rDiasBloqueio:=cdsAux.FieldByName('DIASBLOQORCLP').AsFloat
          else
            DataPrazo:=formatdatetime('DD/MM/YYYY',cdsaux.FieldByname('DTLONGOPZ').AsDateTime);

          Self.Caption := 'Movimentação do Fluxo Orçado de Longo Prazo';
          HelpContext  := 90032;
          bbtnAjuda.HelpContext := 90032;
       end;

      // Peterson Victor - SIG 19587 inicio
      { 
      // Edilaine - SOL 210181-15348 / KTN 2051446 - removido da Verifica
      // usuários do cgrupo TESOURARIA podem modificar independente do bloqueio de datas
      cdsAux.Data := CtrlMovimFluxoOrc.VerificaUsuarioxTesouraria( Sistema.idUsuario );
      blnUsuarioTesouraria := not cdsAux.IsEmpty;
      // Edilaine - SOL 210181-15348 / KTN 2051446 - fim
      }
      // Peterson Victor - SIG 19587 Fim

   finally
      cdsAux.Free;
   end;

   MontaSelect.Filtro.Add('FLUXOORCADO.IDPESSOA = ' + FloatToStr(Sistema.IdEmpresa));
   MontaSelect.Filtro.Add('FLUXOORCADO.PRAZO = '''  + sPrazoAux + '''');




end;




procedure TfrmMovimFluxoOrcMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlMovimFluxoOrc.Free;
   CtrlListTerceiros.Free;
   CtrlParamFinanc.Free;
   Action:=caFree;
   CtrlSegregacao.Free;
   CtrlPlanPrevContabPatro.Free;
   CtrlGrupoRateioFluxo.Free; // Alterado por FHBS - SOL: 128685 KTN: 692049

   lstIdRateio.free;     // Edilaine - SOL 210181-15348 / KTN 2051446

   FreeAndNil(CtrlFinanc);

   inherited;
end;




procedure TfrmMovimFluxoOrcMT.dblcCentroResponChange(Sender: TObject);
begin
   //Carrega cdsTipoRecDes
  if not (cds.State in [dsInsert,dsEdit]) then
    Exit;


  //dblcLinhasFluxo.Clear;

    // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
    //dblcTipoDocurmento.Clear; // Marilza Colpani - SOL:115673/KTN:542579
    // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **

    //cboFluxoCaixa.KeyValue:=0; // Marilza Colpani - SOL:115673/KTN:542579

  //if cboFluxoCaixa.KeyValue > 1 then
  //if CdsFluxoCaixa.RecordCount > 1 then
    //cboFluxoCaixa.KeyValue:=0;      18/08/2009

  if (Cds.RecordCount > 1) then
  begin
    dblcLinhasFluxo.Text    := '';
    dblcTipoRD.Text         := '';
    // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
    //dblcTipoDocurmento.Text := '';
    // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
    //cboFluxoCaixa.KeyValue := '';
   end;

  cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa, dblcCentroRespon.LookupValue, '', -1, False);
  dblcTipoRD.Clear;
  dblcTipoRD.Text := '';
end;




procedure TfrmMovimFluxoOrcMT.dblcTipoRDChange(Sender: TObject);
begin
{   if not(cds.State in [dsInsert,dsEdit]) or bCliqueComboFlx then Exit;

   bCliqueComboTRD := True;
   try
      dblcTipoDocurmento.LookupValue := '';
      dblcTipoDocurmento.Clear;

//      if cds.State in [dsEdit] then begin
//        dblcLinhasFluxo.LookupValue := '';
//        dblcLinhasFluxo.Clear;
//      end;

   finally
      bCliqueComboTRD := False;
   end;
   //dblcLinhasFluxo.Text := '';
   }
end;




procedure TfrmMovimFluxoOrcMT.dblcLinhasFluxoChange(Sender: TObject);
begin
//  if not(cds.State in [dsInsert,dsEdit]) or bCliqueComboTRD then Exit;
//
//   bCliqueComboFlx:=True;
//   try
//   dblcTipoDocurmento.Value:='';
   //      dblcTipoDocurmento.LookupValue := '';
//      dblcTipoDocurmento.Clear;

//      dblcTipoRD.Clear;
//      dblcTipoDocurmento.text := '';
//   finally
//      bCliqueComboFlx:=False;
//   end;
   //dblcTipoDocurmento.Text := ''; //Marilza           

end;




// Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
{procedure TfrmMovimFluxoOrcMT.dblcMoedaExit(Sender: TObject);
begin
   inherited;
   if Trim(dblcMoeda.Text) = '' then
    begin
       dbeValorMoeda.Value:=0;
       dbeValorMoeda.Enabled:=False;
       dbeValor.Enabled:=True;
    end
   else
    begin
       dbeValor.Value := 0;
       dbeValor.Enabled:=False;
       dbeValorMoeda.Enabled:=True;
       dbeValorMoeda.SetFocus;
    end;
end;}
// Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **



procedure TfrmMovimFluxoOrcMT.CmeCadastroInsert(Sender: TObject);
begin
//   if (Cds.State <> dsEdit) and (Cds.Active = True) then
//    cboFluxoCaixa.KeyValue := '';
   inherited;
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
   //dbeValorMoeda.Value   := 0;
   //dbeValorMoeda.Enabled := False;
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **

   //dbeValor.Value := 0;
   //dbeValor.Enabled := True;

   cds.FieldByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
   cds.FieldByName('PRAZO').AsString          := sPrazoAux;

   HabilitaRateio(False); // Alterado por FHBS - SOL: 128685 KTN: 692049

   //Recupera Dados
   with Ultimo do
   begin
     if (((Atividade     = 0)    and
         (CRespon        = '')   and
         (FluxoCaixa     = 0)    and
         (LinhaFluxo     = 0)    and
         (TipoRecDes     = '')   and
         (DataLanc       = Date) and
         (CodTipDoc      = 0)    and
         (IDPlanoPrev    = 0)    and
         (IDPatro        = 0)    and
         (Observacao     = '')   and
         (FlgSimulaAtivo = '')) or (DBcboGrupoRateioFluxo.LookupValue <> '')) then
       LimpaControles( True )  // Marilza Colpani - SOL:115673/KTN:542579
     else
       LimpaControles( false );  // Edilaine - SOL 210181-15348 / KTN 2051446

      if DBcboGrupoRateioFluxo.LookupValue = '' then // Alterado por FHBS - SOL: 128685 KTN: 692049
      begin
        cds.FieldByName('UNIDNEGOC').AsFloat         := Atividade;
        cds.FieldByName('CODCENTRORESPON').AsString  := CRespon;
        Cds.FieldByName('IDFLUXOCAIXA').Value        := FluxoCaixa;
        Cds.FieldByName('CODLINHAFLUXO').Value       := LinhaFluxo;
        cds.FieldByName('CODTIPRECDES').AsString     := TipoRecDes;
        cds.FieldByName('DATAPROGRAMADA').AsDateTime := DataLanc;
        cds.FieldByName('CODTIPDOC').AsFloat         := CodTipDoc;
        cds.FieldByName('OBSERVACAO').AsString       := Observacao;
        cds.FieldByName('FLGSIMULAATIVO').AsString   := 'N';
        Cds.FieldByName('CODREL').AsFloat            := CodRel;

        Cds.FieldByName('IDENTIFICADORDERATEIO').AsString := '';    // Edilaine - SOL 210181-15348 / KTN 2051446

        dblcUnidNegoc.lookupValue := FloatToStr(Atividade);       // Edilaine - SOL 210181-15348 / KTN 2051446

        if Sistema.UsaPlanoPatro then
         begin
            cds.FieldByName('IDPLANOPREV').AsFloat := IDPlanoPrev;
            cds.FieldByName('IDPATRO').AsFloat     := IDPatro;
         end;
      end;
   end;

  // Alterado por FHBS - SOL: 128685 KTN: 692049
  DBcboGrupoRateioFluxo.Enabled     := True;
  DBcboGrupoRateioFluxo.LookupValue := '';
  // Fim - Alterado por FHBS


  if dblcUnidNegoc.Enabled then
  begin
    dblcUnidNegoc.SetFocus;
    dblcUnidNegoc.SelStart := length(dblcUnidNegoc.Text)+1;
  end
  else if dblcCentroRespon.Enabled then
     dblcCentroRespon.SetFocus
  else
     dblcTipoRD.SetFocus;

  {if cdsTipoRecDes.IsEmpty then
    cdsTipoRecDes.Data   := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
                                                                             '', '', 0,
                                                                             False);}

end;




procedure TfrmMovimFluxoOrcMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   //cboFluxoCaixa.KeyValue := ''; //Marilza - limpar o combo Fluxo de Caixa caso o usuário escolha Alterar um registro, desista, Cancele e opte por Inserir um novo
   if MontaSelect.RetornouValor then
   begin
      //dblcSegregaCriter.Clear;   //teste 21/08/2009
      cds.Close;
      cdsTipoRecDes.Close;

      // Carrega o cds principal
      cds.Data := CtrlMovimFluxoOrc.ListFluxoOrcado(StrToFloat(MontaSelect.ValoresChave[0]),
                                                    Sistema.IdEmpresa,
                                                    // SOL 162240 Kintana 1378222  Otacilio
                                                    -1{StrToInt(MontaSelect.ValoresChave[1])});

      // Lista os centros de responsabilidade
      cdsCentroRespon.Data         := CtrlListTerceiros.ListCentroResponxUsuarioAtivos(Sistema.IdEmpresa, Sistema.IdUsuario);
      dblcCentroRespon.LookupValue := cds.FieldByName('CODCENTRORESPON').AsString;
      dblcCentroRespon.Update;

      // Marilza Colpani - SOL:115673/KTN:542579
      //Lista o Fluxo de Caixa
      //if cboFluxoCaixa.KeyValue <> '' then

      //  cboFluxoCaixa.KeyValue := Cds.FieldByName('IDFLUXOCAIXA').AsFloat;
      //else
       // cboFluxoCaixa.KeyValue := '';


      // Lista Tipo Rec/Des
      //cdsTipoRecDes.Data := CtrlListTerceiros.ListaTipoRecDesxCRespFromFluxo(Sistema.IdEmpresa,
      //                                                                       dblcCentroRespon.LookupValue);
      cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa, Trim(Cds.FieldByName('CODTIPRECDES').AsString), '', -1, False);

      //Marilza - Locate criado para trazer o tipo de receb/desemb. de acordo com o fluxo de caixa
      if cdsTipoRecDes.Locate('CODTIPRECDES;RECPAG', VarArrayOf([cds.FieldByName('CODTIPRECDES').AsString, Cds.FieldByName('RECPAG').asString]), []) then
        dblcTipoRD.Text := cdsTipoRecDes.FieldByName('DESCRICAO').AsString;
      dblcTipoRD.Update;

      //dblcTipoRD.LookupValue := cds.FieldByName('CODTIPRECDES').AsString;
      //dblcTipoRD.LookupValue := RetornaCodTipRecDes(cds.FieldByName('CODTIPRECDES').AsString, Cds.FieldByName('RECPAG').asString, Cds.FieldbyName('IDFLUXOORCADO').AsInteger);

      // Lista os tipos de documento
      cdsTipoDoc.Filtered := False;
      cdsTipoDoc.Filter   := 'RECPAG = ' + QuotedStr(cds.FieldByName('RECPAG').AsString);
      cdsTipoDoc.Filtered := True;

      // Marilza Colpani - SOL:115673/KTN:542579
      CdsFluxoCaixa.Data := CtrlMovimFluxoOrc.ListaFluxoCaixa(Cds.fieldbyname('IDPESSOA').AsInteger);

      // Ponteira a linha do fluxo
      dblcLinhasFluxo.LookupValue := Trim(cds.FieldByName('CODLINHAFLUXO' {'CODTIPRECDES'}).AsString);  // xxx
      dblcLinhasFluxo.Update;
   end
   else
     cds.data := CtrlMovimFluxoOrc.ListFluxoOrcado(0,Sistema.IdEmpresa, 0);  // Edilaine - SOL 210181-15348 / KTN 2051446
end;

procedure TfrmMovimFluxoOrcMT.CmeCadastroEdit(Sender: TObject);
begin
  //inherited; //comentado, pois estava cancelando a ultima alteração

  // Edilaine - SOL 210181-15348 / KTN 2051446
  try
    // se não for da tesouraria, faz validações
    if (not blnUsuarioTesouraria) then
    begin
      if not ValidaUsuario() then
      begin
         bbtnCancelarClick(bbtnCancelar);
         Abort;
       end;

       // valida bloqueio
       ValidaBloqueio();
    end;

   except
      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Erro ao verificar preenchimento', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         bbtnCancelarClick(bbtnCancelar);
         abort;
      end;
   end;
  // Edilaine - SOL 210181-15348 / KTN 2051446


  if (Cds.FieldByName('IDENTIFICADORDERATEIO').AsString <> '') or (Cds.FieldByName('IDENTIFICADORDERATEIO').AsFloat <> 0) then
  begin
    MsgDlg('Não é possível alterar este registro, pois trata-se de documento '+#10+#13+
           'com rateio pré-definido. Favor excluir e inserir novamente.', 'Informação', mtInformation, [mbOk], 0);
    bbtnCancelarClick(bbtnCancelar);
    Abort;
  end;
  // Edilaine - SOL 210181-15348 / KTN 2051446 - fim


  Ultimo.Atividade  := cdsUnidNeg.FieldByName('UNIDNEGOC').AsFloat;
  Ultimo.CRespon    := cdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
  Ultimo.FluxoCaixa := 1;

  if dblcLinhasFluxo.Text <> '' then
    Ultimo.LinhaFluxo := cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').AsInteger
  else
    Ultimo.LinhaFluxo := 0;

  if dblcTipoRD.Text <> '' then
    Ultimo.TipoRecDes  := cdsTipoRecDes.FieldByName('CODTIPRECDES').AsString
  else
    Ultimo.TipoRecDes      := '';


  Ultimo.DataLanc  := cds.FieldByName('DATAPROGRAMADA').AsDateTime;
  Ultimo.Valor     := Cds.FieldByName('VALOR').AsFloat;
  Ultimo.CodTipDoc := 0;

  Ultimo.IDPlanoPrev    := cdsPlanoPrev.FieldByName('IDPLANOPREV').AsFloat;
  Ultimo.IDPatro        := cdsPatrocinador.FieldByName('IDPESSOA').AsInteger;
  Ultimo.Observacao     := Cds.FieldByName('OBSERVACAO').AsString;
  Ultimo.FlgSimulaAtivo := Cds.FieldByName('FLGSIMULAATIVO').AsString;
  Ultimo.RecPag         := cdsTipoRecDes.FieldByName('RECPAG').AsString;

  if Cds.FieldByName('CODREL').AsFloat = 0 then
    Ultimo.CodRel := Cds.FieldByName('IDFLUXOORCADO').AsFloat
  else
    Ultimo.CodRel := Cds.FieldByName('CODREL').AsFloat;
end;

procedure TfrmMovimFluxoOrcMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   if cds.State in [dsInsert,dsEdit] then
    begin
       Accept := VerificaPreenchimento;

       if Accept then
       begin
          If dblcTipoRD.Value <> '' then  // Marilza Colpani - SOL:115673/KTN:542579
          begin
            cds.FieldByName('CODTIPRECDES').AsString := cdsTipoRecDes.FieldByName('CODTIPRECDES').AsString;
            cds.FieldByName('RECPAG').AsString       := cdsTipoRecDes.FieldByName('RECPAG').AsString;
          end;
       end;

       //Teste Má
//       if dblcTipoRD.Value = '' then
//       begin
//         Cds.FieldByName('FLGFLUXOORCADO').AsString := 'N';
//         Cds.FieldByName('CODLINHAFLUXO').Value     :=  0
//       end
//       else
//       begin
//         cds.FieldByName('FLGFLUXOORCADO').AsString := 'S';
//         cds.FieldByName('CODLINHAFLUXO').Value     :=  cdsTipoRecDes.FieldByName('CODLINHAFLUXO').Value;
//       end;

        //Guarda Dados do último registro inserido
       //para ser reaproveitado no próximo registro
       {with Ultimo do
       begin
          Atividade  := StrToFloat(dblcUnidNegoc.LookupValue);
          CRespon    := dblcCentroRespon.LookupValue;


          FluxoCaixa := StrToFloat('1'{CdsFluxoCaixa.FieldByName('IDFLUXOCAIXA').AsString );} // Marilza Colpani - SOL:115673/KTN:542579

          //teste 27/07 - inicio
          //if StrToFloat(dblcLinhasFluxo.LookupValue) <> 0 then

          //if dblcLinhasFluxo.Text <> '' then
          //  LinhaFluxo := StrToFloat(dblcLinhasFluxo.LookupValue); //Marilza Colpani - SOL:115673/KTN:542579

           //dblcLinhasFluxo.LookupValue := FloatToStr(Ultimo.LinhaFluxo);
           // := StrToIntDef(dblcLinhasFluxo.LookupValue,0); // Marilza Colpani - SOL:115673/KTN:542579
          //else
           // LinhaFluxo := 0;

           //17/08/09 - código comentado, pois estava limpando o combo Tipo de Rec/Desemb. qdo alterada a data
//          if dblcTipoRD.Text <> '' then
//            dblcTipoRD.LookupValue := Ultimo.TipoRecDes
//            //TipoRecDes := dblcTipoRD.LookupValue
//          else
//            TipoRecDes := '';
//
         // if dblcTipoRD.Text <> '' then
          //  TipoRecDes := dblcTipoRD.LookupValue;

         // DataLanc  := dbeDataLanc.Date;
         // Valor     := dbeValor.Value;
         // CodTipDoc := 0;
//          if (dblcTipoDocurmento.LookupValue <> '') then
//            CodTipDoc  := StrToFloat(dblcTipoDocurmento.LookupValue)
//          else


          // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
          {if (dblcTipoDocurmento.LookupValue <> '') then
            CodTipDoc  := StrToFloat(dblcTipoDocurmento.LookupValue)
          else
          begin
            cdsTipoDoc.FieldByName('CODTIPDOC').isnull;
            dblcTipoDocurmento.LookupValue := '';
            CodTipDoc := 0;
          end;}
          // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **


         // Observacao := cds.FieldByName('OBSERVACAO').AsString;
         // if Sistema.UsaPlanoPatro then
         // begin
         //    IDPlanoPrev := StrToFloat(dblcPlanoPrev.LookupValue);
         //    IDPatro     := StrToFloat(dblcPatrocinador.LookupValue);
         // end;
       //end;}

       // Alterado por FHBS - SOL: 128685 KTN: 692049
       if (DBcboGrupoRateioFluxo.LookupValue <> '') and (Accept) and (cds.State in [dsInsert]) then
         Ratear;
       // Fim - Alterado por FHBS

    end;
    inherited;
end;




procedure TfrmMovimFluxoOrcMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;

   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  Accept := CtrlMovimFluxoOrc.AplicaAtualFluxoOrc(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   StrToIntDef(''{dblcSegregaCriter.LookupValue}, -1),
                                                   ultimo);  // Edilaine - SOL 210181-15348 / KTN 2051446

   if not Accept then
     MsgDlg('Não foi possível inserir o registro. ' + #13 +
            'Motivo: ' + CtrlMovimFluxoOrc.MessageInfo,'Erro',mtError,[mbOk],0);

end;




procedure TfrmMovimFluxoOrcMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
   Accept:=CtrlMovimFluxoOrc.AplicaAtualFluxoOrc(Sistema.IdEmpresa,
                                                 Sistema.IdModulo,
                                                 Sistema.IdUsuario,
                                                 StrToIntDef(''{dblcSegregaCriter.LookupValue}, -1),
                                                 ultimo);   // Edilaine - SOL 210181-15348 / KTN 2051446

   if not Accept then
     MsgDlg('Não foi possível alterar o registro. ' + #13 +
            'Motivo: ' + CtrlMovimFluxoOrc.MessageInfo,'Erro',mtError,[mbOk],0);

  // LimpaControles(False); //Marilza
end;





procedure TfrmMovimFluxoOrcMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;

   // Edilaine - SOL 210181-15348 / KTN 2051446
   if func_VerificaFluxoExistente(Ultimo) then
      Ultimo.bApagaReplica := MessageBox(Handle, 'Deseja efetuar a exclusão para os próximos meses cadastrados?',
                                         PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = mrYes;

   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
   Accept := CtrlMovimFluxoOrc.AplicaAtualFluxoOrc(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   StrToIntDef( ''{dblcSegregaCriter.LookupValue}, -1),
                                                   ultimo);        // Edilaine - SOL 210181-15348 / KTN 2051446

  if not Accept then
     MsgDlg('Não foi possível excluir o registro. ' + #13 +
            'Motivo: ' + CtrlMovimFluxoOrc.MessageInfo,'Erro',mtError,[mbOk],0);

   cds.Data := CtrlMovimFluxoOrc.ListFluxoOrcado(0, Sistema.IdEmpresa, 0);
   //Marilza Colpani - SOL:115673/KTN:542579 - quando excluía não estava limpando os campos na tela.
   cds.Data:= CtrlMovimFluxoOrc.ListFluxoOrcado(-1, Sistema.IdEmpresa, 0);
   LimpaControles(False);
end;



function TfrmMovimFluxoOrcMT.VerificaPreenchimento: Boolean;
var
  sCaption, strSQL : String;
  cdsTesouraria: TCMClientDataSet;
begin
   Result := False;
   try
       sCaption := 'Erro';

       if (DBcboGrupoRateioFluxo.LookupValue = '') then // Alterado por FHBS - SOL: 128685 KTN: 692049
       begin

         if Trim(dblcUnidNegoc.Text) = '' then
           raise EValidacao.CreateVal('Obrigatório preencher a Atividade',  dblcUnidNegoc);

         if Trim(dblcCentroRespon.Text) = '' then
           raise EValidacao.CreateVal('Obrigatório preencher o Centro de Responsabilidade', dblcCentroRespon);

         // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
         // Marilza Colpani - SOL:115673/KTN:542579
         //if Trim(cboFluxoCaixa.Text) = '' then
         //raise EValidacao.CreateVal('Obrigatório preencher o Fluxo de Caixa', cboFluxoCaixa);
         // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **

         // Marilza Colpani - SOL:115673/KTN:542579
          // Se o campo Linha de Fluxo estiver preenchido o campo Tipo Receb./Desemb. nao precisa, vice-versa
          if (Trim(dblcLinhasFluxo.Text) = '') and (Trim(dblcTipoRD.Text) = '') then
         // begin
            raise EValidacao.CreateVal('Obrigatório preencher Linha do Fluxo ou Tipo de Recebimento/Desembolso', dblcTipoRD);
            //MsgDlg('Obrigatório preencher Linha de Fluxo ou Tipo de Recebimento/Desembolso', 'Segregação de Recursos', mtWarning, [mbOk], 0);
            //exit;
          //end;

         // Marilza Colpani - SOL:115673/KTN:542579
         //Validação comentada para atender esta solicitação
         //if Trim(dblcTipoRD.Text) = '' then
         //  raise EValidacao.CreateVal('Obrigatório preencher o Tipo de Recebimento/Desembolso', dblcTipoRD);




         //Bruno Bastos - SOL 115673 - Kintana 542579
         //Validação comentada para atender esta solicitação
         //if Trim(dblcTipoDocurmento.Text) = '' then
           //raise EValidacao.CreateVal('Obrigatório preencher o Tipo de Documento', dblcTipoDocurmento);

       end;

       if (DBcboGrupoRateioFluxo.LookupValue = '') then // Alterado por FHBS - SOL: 128685 KTN: 692049
       begin

         if Sistema.UsaPlanoPatro then
         begin
           if Trim(dblcPatrocinador.Text) = '' then
             raise EValidacao.CreateVal('Obrigatório preencher a Patrocinadora', dblcPatrocinador);

           if Trim(dblcPlanoPrev.Text) = '' then
             raise EValidacao.CreateVal('Obrigatório preencher o Plano Previdenciário', dblcPlanoPrev);

            if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(Cds.FieldByName('IDPATRO').AsInteger, Cds.FieldByName('IDPLANOPREV').AsInteger) then
            begin
              //dblcTipoRD.Text      := '';
              //dblcLinhasFluxo.Text := '';
              raise EValidacao.CreateVal('Não existe relacionamento entre Patrocinadora e Plano escolhidos!', dblcPlanoPrev);
            end;
         end;

         // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
         {if CtrlSegregacao.SegregaVirtual then
         begin
           sCaption := 'Segregação';

           if (CtrlSegregacao.PlanoPrevAdm = Cds.FieldByName('IDPLANOPREV').AsInteger) or
              (CtrlSegregacao.PlanoPrevComum = Cds.FieldByName('IDPLANOPREV').AsInteger) or
              (CtrlSegregacao.PatroComum = Cds.FieldByName('IDPATRO').AsInteger) then begin

             if (not((CtrlSegregacao.PlanoPrevAdm = Cds.FieldByName('IDPLANOPREV').AsInteger) or
                (CtrlSegregacao.PlanoPrevComum = Cds.FieldByName('IDPLANOPREV').AsInteger))) or
                (CtrlSegregacao.PatroComum <> Cds.FieldByName('IDPATRO').AsInteger) then
               raise EValidacao.CreateVal('Escolhendo o Plano "Comum" / "Adminitrativo" a Patrocinadora deve ser a "Comum", e vice-versa!', dblcPlanoPrev);

             // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
             {if dblcSegregaCriter.Text <> '' then begin
                if (CtrlSegregacao.PlanoPrevAdm = Cds.FieldByName('IDPLANOPREV').AsInteger) and
                   (not CtrlSegregacao.SegregaOrAdm) then
                  raise EValidacao.CreateVal('O Plano "Administrativo" não é segregado na origem, o critério para segregação de recursos não pode ser escolhido!', dblcSegregaCriter);

                if (CtrlSegregacao.PlanoPrevComum = Cds.FieldByName('IDPLANOPREV').AsInteger) and
                   (not CtrlSegregacao.SegregaOrComum) then
                  raise EValidacao.CreateVal ('O Plano "Comum" não é segregado na origem, o critério para segregação de recursos não pode ser escolhido!', dblcSegregaCriter);

             end
             else
             begin
                if (CtrlSegregacao.PlanoPrevAdm = Cds.FieldByName('IDPLANOPREV').AsInteger) and
                   (CtrlSegregacao.SegregaOrAdm) then
                  raise EValidacao.CreateVal ('O Plano "Adminisrativo" é segregado na origem, o critério para segregação de recursos é obrigatório!', dblcSegregaCriter);

                if (CtrlSegregacao.PlanoPrevComum = Cds.FieldByName('IDPLANOPREV').AsInteger) and
                   (CtrlSegregacao.SegregaOrComum) then
                  raise EValidacao.CreateVal ('O Plano "Comum" é segregado na origem, o critério para segregação de recursos é obrigatório!', dblcSegregaCriter);
             end;
             // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
           end
           else
           begin
             if dblcSegregaCriter.Text <> '' then
               raise EValidacao.CreateVal ('O Critério para segregação só pode ser escolhido no plano "Comum" ou "Administrativo"!', dblcSegregaCriter);
           end;}
       //end;
         // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
       end;

       if Trim(dbeDataLanc.Text) = '' then
         raise EValidacao.CreateVal('Obrigatório preencher a Data do Vencimento', dbeDataLanc);

       if DiasUteis.Feriado(Sistema.IdEmpresa, dbeDataLanc.Date, True, True) then
         raise EValidacao.CreateVal('A data de Lançamento é um Feriado', dbeDataLanc);

       if not DiasUteis.DiaUtil(Sistema.IdEmpresa, dbeDataLanc.Date, True, False, False) then
         raise EValidacao.CreateVal('A data de lançamento não é um dia útil!', dbeDataLanc);

       // Edilaine - SOL 210181-15348 / KTN 2051446 - pasado para o formcreate
       // usuários do cgrupo TESOURARIA podem modificar independente
       // do bloqueio de datas
       // Ricardo A. SOL 54393 KTN: 523368
       {strSQL := 'SELECT IDUSUARIO FROM GRUPOACESSO GA, GRUPOUSU GU WHERE' +
         ' GA.NOMEGRUPO = ''TESOURARIA''' +
         ' AND GU.IDUSUARIO = ' + IntToStr( Sistema.IdUsuario ) +
         ' AND GA.IDGRUPO = GU.IDGRUPO';
       cdsTesouraria := TCMClientDataSet.Create( nil );
       try
         cdsTesouraria.Data := CtrlMovimFluxoOrc.getDataPacket( strSQL );
         blnUsuarioTesouraria := not cdsTesouraria.IsEmpty;
       finally
         FreeAndNil( cdsTesouraria );
       end;
       } // Edilaine - SOL 210181-15348 / KTN 2051446 - fim


       // Edilaine - SOL 210181-15348 / KTN 2051446
       if not blnUsuarioTesouraria then
          ValidaBloqueio();


       if (DBcboGrupoRateioFluxo.LookupValue = '') then // Alterado por FHBS - SOL: 128685 KTN: 692049
       begin
         // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
         //if Trim(dblcMoeda.Text) <> '' then begin
         //  if (dbeValorMoeda.Value = 0) then
         //    raise EValidacao.CreateVal('Obrigatório preencher o Valor em Outra Moeda', dbeValorMoeda);
         //end else begin
           if dbeValor.Value = 0 then
             raise EValidacao.CreateVal('Obrigatório preencher o Valor em Moeda Corrente', dbeValor);
         //end;
         // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
         
       end
       else
       begin
         if dbeValor.Value = 0 then
           raise EValidacao.CreateVal('Obrigatório preencher o Valor em Moeda Corrente', dbeValor);
       end;

       // Edilaine - SOL 210181-15348 / KTN 2051446
       if (DBcboGrupoRateioFluxo.LookupValue <> '') and (dbmObs.Lines.Text = '') then
          raise EValidacao.CreateVal('Para cadastro de movimentações com pré-rateio definido'+#10+#13+
                                     'é necessário preencher o campo de observação', dbmObs);

   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Erro ao verificar preenchimento', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;




procedure TfrmMovimFluxoOrcMT.dblcLinhasFluxoEnter(Sender: TObject);
begin
  inherited;
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
   {cdsLinhaFluxo.Data := CtrlMovimFluxoOrc.ListLinhasFluxo(Sistema.IdEmpresa,
                                                           dblcCentroRespon.LookupValue,
                                                           StrToIntDef(cboFluxoCaixa.KeyValue,0)); // Marilza Colpani - SOL:115673/KTN:542579 - alteração do LookupValue por KeyValue
   }
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
end;




procedure TfrmMovimFluxoOrcMT.dblcTipoRDEnter(Sender: TObject);
begin
   inherited;
   //if Trim(dblcLinhasFluxo.LookupValue) = '' then
   //cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(-1, '', '', 0); //Vazio
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
   {CarregaComboTRD(Sistema.IdEmpresa,
                   StrToIntDef('1',-1),  // Marilza Colpani - SOL:115673/KTN:542579 - alteração do LookupValue por KeyValue
                   StrToIntDef(dblcLinhasFluxo.LookupValue,0),
                   dblcCentroRespon.LookupValue);}
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
end;




procedure TfrmMovimFluxoOrcMT.dblcTipoDocurmentoEnter(Sender: TObject);
var
   sRecPag: string;
begin
   inherited;

   if Trim(dblcTipoRD.Text) <> '' then
      sRecPag := cdsTipoRecDes.FieldByName('RECPAG').AsString
   else
      sRecPag := 'X';

   cdsTipoDoc.Filtered := False;
   cdsTipoDoc.Filter   := 'RECPAG = ' + QuotedStr(sRecPag);
   cdsTipoDoc.Filtered := True;
end;




procedure TfrmMovimFluxoOrcMT.CarregaComboTRD(iIdEmpresa, iIdFluxoCaixa, iCodLinhaFluxo: integer; sCodCentroRespon: string);
begin

   {cdsTipoRecDes.Data := CtrlListTerceiros.ListaTipoRecDesxCRespFromFluxo(iIdEmpresa,
                                                                          sCodCentroRespon,
                                                                          iIdFluxoCaixa,
                                                                          iCodLinhaFluxo);}
//   dblcTipoRD.text :='';
end;




procedure TfrmMovimFluxoOrcMT.dblcLinhasFluxoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if modified then
   begin
     // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
    // CarregaComboTRD(Sistema.IdEmpresa,
    //                 StrToIntDef('1'{CdsFluxoCaixa.FieldByName('IDFLUXOCAIXA').AsString},-1), // Marilza Colpani - SOL:115673/KTN:542579 - alteração do LookupValue por KeyValue
    //                 StrToIntDef(dblcLinhasFluxo.LookupValue,0),
    //                 dblcCentroRespon.LookupValue);

     //dblcTipoRD.LookupValue := cdsTipoRecDes.FieldByName('CODTIPRECDES').AsString;
     //cboFluxoCaixa.keyvalue := '';   //Marilza - teste 24/07
     if dblcLinhasFluxo.text <> '' then
       bLinhaFluxoPreenchido:=True;

       //dblcTipoRD.Clear;
       //dblcTipoDocurmento.Clear;
     // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
   end;
end;




procedure TfrmMovimFluxoOrcMT.dblcTipoRDCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //dblcLinhasFluxo.LookupValue := cdsTipoRecDes.FieldByName('CODLINHAFLUXO').AsString;
  //Marilza - comentado para efeito de teste
  if not bLinhaFluxoPreenchido then
    begin
     // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
     //dblcTipoDocurmento.Value :='';
     //dblcTipoDocurmento.Text  :='';
    end;
    bTRDPreenchido := True;

end;

procedure TfrmMovimFluxoOrcMT.bbtnCancelarClick(Sender: TObject);
begin
//  if (Cds.State <> dsEdit) and (Cds.Active = True) or (Cds.RecordCount >= 2) then
//    cboFluxoCaixa.KeyValue := '';
  inherited;

  // Alterado por FHBS - SOL: 128685 KTN: 692049
  DBcboGrupoRateioFluxo.Enabled     := True;
  DBcboGrupoRateioFluxo.LookupValue := '';
  // Fim - Alterado por FHBS

  LimpaControles(false);    // Edilaine - SOL 210181-15348 / KTN 2051446

  {// Edilaine - SOL 210181-15348 / KTN 2051446
  //Marilza
  dblcUnidNegoc.text    := '';
  dblcCentroRespon.Text := '';
  dblcTipoRD.Text       := '';
  dblcLinhasFluxo.Text  := '';
  dblcLinhasFluxo.Text  := '';
  dblcPatrocinador.Text := '';
  dblcPlanoPrev.Text    := '';
  dbeDataLanc.Text      := '';
  dbeValor.Text         := '';
  DBEdNomeUsuario.Text  := '';
  DBEdData.Text         := '';
  dbmObs.Text           := '';

  Ultimo.Atividade   := 0;
  Ultimo.CRespon     := '';
  Ultimo.FluxoCaixa  := 0;
  Ultimo.LinhaFluxo  := 0;
  Ultimo.TipoRecDes  := '';
  Ultimo.DataLanc    := Date;
  Ultimo.Valor       := 0;
  Ultimo.CodTipDoc   := 0;
  Ultimo.IDPlanoPrev := 0;
  Ultimo.IDPatro     := 0;
  Ultimo.Observacao  := '';
  Ultimo.RecPag      := '';
  Ultimo.CodRel      := 0;
  } // Edilaine - SOL 210181-15348 / KTN 2051446  - fim

  sbtnAlterar.Enabled := False;
  sbtnApagar.Enabled  := False;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;
  dbeDataLanc.Clear;

  //cboFluxoCaixa.KeyValue := ''; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //dblcSegregaCriter.Text := ''; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //dblcTipoDocurmento.Text := ''; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //dblcMoeda.Text := ''; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //dbeValorMoeda.Text := ''; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
end;

procedure TfrmMovimFluxoOrcMT.bbtnConfirmarClick(Sender: TObject);
var sValor: string;
begin
  //Bruno Bastos - Pend. 26399
  //inherited;
  //dblcSegregaCriter.Clear; //teste 21/08/2009
  // Marilza Colpani - SOL:115673/KTN:542579 - Gravar Record

  if not VerificaPreenchimento then
    Exit;

  if cds.State in [dsInsert,dsEdit] then
  begin
    try
      if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

      if cds.State in [dsInsert] then
      begin
        Ultimo.Atividade     := cdsUnidNeg.FieldByName('UNIDNEGOC').AsFloat;
        Ultimo.CRespon       := cdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
        Ultimo.FluxoCaixa    := 1{CdsFluxoCaixa.FieldByName('IDFLUXOCAIXA').Value};

        //teste
        //  if dblcLinhasFluxo.Text <> '' then
        //    Ultimo.LinhaFluxo  := cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').Value
        //  else
        //    Ultimo.LinhaFluxo  := 0;

        //  if not cdsTipoRecDes.IsEmpty then
        //    Ultimo.TipoRecDes  := cdsTipoRecDes.FieldByName('CODTIPRECDES').AsString
        //  else
        //    Ultimo.TipoRecDes  :='';

        if dblcLinhasFluxo.Text <> '' then
          begin
            Ultimo.LinhaFluxo  := cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').AsInteger;
            cds.FieldByName('CODLINHAFLUXO').AsInteger  :=cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').asinteger;
            dblcLinhasFluxo.Text := cdsLinhaFluxo.FieldByName('DESCRICAO').AsString;
            dblcLinhasFluxo.Update;
          end
        else
        begin
          cds.FieldByName('CODLINHAFLUXO').AsString:='';
          dblcLinhasFluxo.LookupValue := '';
          Ultimo.LinhaFluxo := 0;
        end;

        if dblcTipoRD.Text <> '' then
          begin
            Ultimo.TipoRecDes  := cdsTipoRecDes.FieldByName('CODTIPRECDES').AsString;
            cds.FieldByName('CODTIPRECDES').AsInteger  :=cdsTipoRecDes.FieldByName('CODTIPRECDES').asinteger;
            dblcTipoRD.Text := cdsTipoRecDes.FieldByName('DESCRICAO').AsString;
            dblcTipoRD.Update;
          end
        else
        begin
          cds.FieldByName('CODTIPRECDES').AsString := '';
          dblcTipoRD.LookupValue := '';
          Ultimo.TipoRecDes      := '';
        end;


        Ultimo.DataLanc  := cds.FieldByName('DATAPROGRAMADA').AsDateTime;
        Ultimo.Valor     := Cds.FieldByName('VALOR').AsFloat;
        Ultimo.CodTipDoc := 0;

        //  if cdsTipoDoc.IsEmpty then
        //    Ultimo.CodTipDoc   := cdsTipoDoc.FieldByName('CODTIPDOC').AsFloat
        //  else



        // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
        {if dblcTipoDocurmento.Text <> '' then
          begin
             Ultimo.CodTipDoc   := cdsTipoDoc.FieldByName('CODTIPDOC').AsFloat;
             cds.FieldByName('CODTIPDOC').AsInteger := cdsTipoDoc.FieldByName('CODTIPDOC').AsInteger;
           end
        else
        begin
          cds.FieldByName('CODTIPDOC').Asstring := '';
          dblcTipoDocurmento.LookupValue := '';
          Ultimo.CodTipDoc   := 0;
        end;}
        // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **

        Ultimo.IDPlanoPrev    := cdsPlanoPrev.FieldByName('IDPLANOPREV').AsFloat;
        Ultimo.IDPatro        := cdsPatrocinador.FieldByName('IDPESSOA').AsInteger;
        Ultimo.Observacao     := Cds.FieldByName('OBSERVACAO').AsString;
        Ultimo.FlgSimulaAtivo := Cds.FieldByName('FLGSIMULAATIVO').AsString;
        Ultimo.RecPag         := cdsTipoRecDes.FieldByName('RECPAG').AsString;

        // Thiago Melo SOL 13102 KTN 1980710
        if cds.State = dsInsert then begin
          if Trim(DBcboGrupoRateioFluxo.LookupValue) = '' then begin
            Cds.FieldByName('RECPAG').AsString := cdsTipoRecDes.FieldByName('RECPAG').AsString;
          end;
        end;
        // Thiago Melo SOL 13102 KTN 1980710


        { if Trim(DBcboGrupoRateioFluxo.text) = '' then
        if MessageBox(Handle, 'Deseja replicar essa movimentação para os meses seguintes?',
                               PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          try


            frmReplicarCadMov                := TfrmReplicarCadMov.Create(Self);
            frmReplicarCadMov.Atividade      := Ultimo.Atividade;
            frmReplicarCadMov.FluxoCaixa     := Ultimo.FluxoCaixa;
            frmReplicarCadMov.LinhaFluxo     := Ultimo.LinhaFluxo;
            frmReplicarCadMov.Valor          := Ultimo.Valor;
            frmReplicarCadMov.CodTipDoc      := Ultimo.CodTipDoc;
            frmReplicarCadMov.IDPlanoPrev    := Ultimo.IDPlanoPrev;
            frmReplicarCadMov.IDPatro        := Ultimo.IDPatro;
            frmReplicarCadMov.CRespon        := Ultimo.CRespon;
            frmReplicarCadMov.TipoRecDes     := Ultimo.TipoRecDes;
            frmReplicarCadMov.Observacao     := Ultimo.Observacao;
            frmReplicarCadMov.RecPag         := Ultimo.RecPag;
            frmReplicarCadMov.DataLanc       := Ultimo.DataLanc;
            frmReplicarCadMov.FlgSimulaAtivo := Ultimo.FlgSimulaAtivo;
            frmReplicarCadMov.CodRel         := Ultimo.CodRel;
            frmReplicarCadMov.ShowModal;
          finally
            FreeAndNil(frmReplicarCadMov);
          end;
        end;}
      end
      else
      begin
        //if Trim(DBcboGrupoRateioFluxo.Text) = '' then
        if func_VerificaFluxoExistente(Ultimo) then
          if MessageBox(Handle, 'Deseja efetuar a alteração para os próximos meses cadastrados?',
                               PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = mrYes then
          begin
            if not func_AtualizarFluxoDuplicado(Ultimo,
                                                cdsUnidNeg.FieldByName('UNIDNEGOC').AsFloat,
                                                1,
                                                cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').AsInteger,
                                                Cds.FieldByName('VALOR').AsFloat,
                                                0,
                                                Cds.FieldByName('IDPLANOPREV').AsFloat,
                                                Cds.FieldByName('IDPATRO').AsInteger,
                                                Cds.FieldByName('DATAPROGRAMADA').AsDateTime,
                                                Cds.FieldByName('CODCENTRORESPON').AsString,
                                                Cds.FieldByName('CODTIPRECDES').AsString,
                                                Cds.FieldByName('OBSERVACAO').AsString,
                                                Cds.FieldByName('RECPAG').AsString,
                                                Cds.FieldByName('FLGSIMULAATIVO').AsString) then
            Abort;
          end;
      end;

      //sValor  := dbeValor.Text;

      dtmBaseDados.dbBaseDados.Commit;
    except
      on E: Exception do
      begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;

        MsgDlg('ERRO AO GRAVAR. ' + E.Message, 'ERRO', mtError, [mbOk], 0);
        Abort;
      end;
    end;
  end;


  CmeCadastro.Operacao := opAlterar;




  inherited;

  CmeCadastro.Operacao := opIdle;

  LimpaControles(False);

  {dbeValor.Text := sValor;

  if (Cds.FieldByName('NOMEUSUARIO').AsString = '') then
    DBEdNomeUsuario.Text := Sistema.NomeUsuario;

  if (Cds.FieldByName('TRGDTINCLUSAO').AsString = '') then
    DBEdData.Text := DateTimeToStr(Now); }



  {sbtnInserirClick(Self);
  Sleep(1000);
  bbtnCancelarClick(Self);}

  sbtnAlterar.Enabled := False;
  sbtnApagar.Enabled  := False;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;
  dbeDataLanc.Clear;

end;

procedure TfrmMovimFluxoOrcMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;

  //LimpaControles(False);     // Edilaine - SOL 210181-15348 / KTN 2051446

  //Bruno Bastos - Pend. 26399
  //dbeDataLanc.Clear; // Marilza Colpani - SOL:115673/KTN:542579

  // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  {dblcSegregaCriter.Clear;

  if (CdsFluxoCaixa.RecordCount = 1) then
    cboFluxoCaixa.KeyValue := CdsFluxoCaixa.FieldByName('IDFLUXOCAIXA').Value
  else
    //cboFluxoCaixa.KeyValue := Ultimo.FluxoCaixa;
    Ultimo.FluxoCaixa := cboFluxoCaixa.KeyValue; }
  // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **

// Marilza Colpani - SOL:115673/KTN:542579
//  If CdsFluxoCaixa.RecordCount = 1 then
//    cboFluxoCaixa.KeyValue := CdsFluxoCaixa.FieldByName('IDFLUXOCAIXA').Value;

end;

// Marilza Colpani - SOL:115673/KTN:542579
// Implementação da nova procedure
procedure TfrmMovimFluxoOrcMT.LimpaControles(bPreencherParametro: Boolean);
begin

  with Ultimo do
  begin
    if bPreencherParametro then
    begin
      // Edilaine - SOL 210181-15348 / KTN 2051446 - comentado e definido atividade como PADRAO
      {if (Atividade = 0) and (cdsUnidNeg.RecordCount = 1) then
          Atividade := cdsUnidNeg.FieldByName('UNIDNEGOC').AsFloat;}
      Atividade := -1;
      bApagaReplica := false;
      // Edilaine - SOL 210181-15348 / KTN 2051446 - fim

      if (CRespon = '') and (cdsCentroRespon.RecordCount = 1) then
        CRespon := cdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;

        //Marilza - comentado pois ao cancelar e inserir um novo registro estava trazendo o combo preenchido
//      if (LinhaFluxo = 0) and (cdsLinhaFluxo.RecordCount=1) then
//        LinhaFluxo:= cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').Value;

      // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
      {If (FluxoCaixa = 0) and (CdsFluxoCaixa.RecordCount = 1) then
        FluxoCaixa := CdsFluxoCaixa.FieldByName('IDFLUXOCAIXA').Value
      else
        cboFluxoCaixa.KeyValue := -1;}
      // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **

    end
    else
    begin
      Atividade      := -1;  // Edilaine - SOL 210181-15348 / KTN 2051446 - de 0 para -1
      CRespon        := '';
      FluxoCaixa     := 0;  // Marilza Colpani - SOL:115673/KTN:542579
      LinhaFluxo     := 0; // Marilza Colpani - SOL:115673/KTN:542579
      TipoRecDes     := '';
      DataLanc       := Date;
      Valor          := 0;
      CodTipDoc      := 0;
      IDPlanoPrev    := 110; // Peterson Victor SOL 262615/17834 - PPM 1115918
      IDPatro        := 1117723; // Peterson Victor SOL 262615/17834 - PPM 1115918
      Observacao     := '';
      FlgSimulaAtivo := '';
      CodRel         := 0;
      iIdRateio      := 0;       // Edilaine - SOL 210181-15348 / KTN 2051446
      bApagaReplica  := false;   // Edilaine - SOL 210181-15348 / KTN 2051446


      DBcboGrupoRateioFluxo.Clear;
      dblcUnidNegoc.Clear;
      dblcCentroRespon.Clear;
      dblcLinhasFluxo.Clear;
      dblcTipoRD.Clear;
      dblcPatrocinador.Clear;
      dblcPlanoPrev.Clear;
      dbeDataLanc.Clear;
      dbeValor.Text := '0,00';
      dbeIdRateio.text := '';    // Edilaine - SOL 210181-15348 / KTN 2051446
      DBEdNomeUsuario.Clear;
      DBEdData.Clear;
      dbmObs.Clear;


    end;
  end;

end;

procedure TfrmMovimFluxoOrcMT.CmeCadastroDelete(Sender: TObject);
begin
  // Edilaine - SOL 210181-15348 / KTN 2051446
  try
    // se não for usuario da tesouraria faz validação
    if (not blnUsuarioTesouraria) then
    begin
      if not ValidaUsuario() then
         Abort;

       ValidaBloqueio();
    end;

   except
      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Erro ao verificar preenchimento', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
  // Edilaine - SOL 210181-15348 / KTN 2051446

  inherited;
  // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //cboFluxoCaixa.KeyValue := 0; // Marilza Colpani - SOL:115673/KTN:542579 - alterado de '' para 0
  dblcLinhasFluxo.Text := '';
end;

procedure TfrmMovimFluxoOrcMT.cboFluxoCaixaCloseUp(Sender: TObject);
begin
  inherited;
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
   // Marilza Colpani - SOL:115673/KTN:542579
   {if sFluxoCaixa <> cboFluxoCaixa.KeyValue then
   begin
     dblcLinhasFluxo.Text    := '';
     dblcTipoRD.Text         := '';
     dblcTipoDocurmento.Text := '';
   end;}
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
end;

//Cassio
//function TfrmMovimFluxoOrcMT.RetornaCodTipRecDes(sCodTipoRecDes,
//  RecPag: string; idfluxoorcado: Integer): string;
//var
//  sSQL : string;
//begin
////  sSQL := 'SELECT DESCRICAO FROM TIPORECEBDESEMB WHERE codtiprecdes = ' + sCodTipoRecDes + ' AND recpag = ' + QuotedStr(RecPag);
//  sSQL := 'SELECT T.CODTIPRECDES FROM TIPORECEBDESEMB T, FLUXOORCADO F WHERE T.RECPAG = '+ QuotedStr(RecPag) +' AND F.IDFLUXOORCADO = ' + IntToStr(idfluxoorcado)+ ' AND T.CODTIPRECDES = F.CODTIPRECDES';
//  Result := CtrlListTerceiros.GetDataPacket(sSQL);
//end;



procedure TfrmMovimFluxoOrcMT.sbtnAlterarClick(Sender: TObject);
begin


  inherited;
  // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //Bruno Bastos - Teste - 27/07/2009 - Início
  //if cds.FieldByName('CODTIPDOC').AsInteger > 0 then
  //  dblcTipoDocurmento.LookupValue := cds.FieldByName('CODTIPDOC').AsString;
  //Bruno Bastos - Teste - 27/07/2009 - Fim
  // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
end;

procedure TfrmMovimFluxoOrcMT.sbtnProcurarClick(Sender: TObject);
begin

  inherited;
    //Marilza Colpani - SOL:115673/KTN:542579
    bLinhaFluxoPreenchido := False;
    bTRDPreenchido        := False;

    Ultimo.Atividade      := Cds.FieldByName('UNIDNEGOC').AsFloat;
    Ultimo.CRespon        := Cds.FieldByName('CODCENTRORESPON').AsString;
    Ultimo.FluxoCaixa     := Cds.FieldByName('IDFLUXOCAIXA').AsFloat;
    Ultimo.LinhaFluxo     := Cds.FieldByName('CODLINHAFLUXO').AsInteger;
    Ultimo.TipoRecDes     := Cds.FieldByName('CODTIPRECDES').AsString;
    Ultimo.DataLanc       := Cds.FieldByName('DATAPROGRAMADA').AsDateTime;
    Ultimo.Valor          := Cds.FieldByName('VALOR').AsFloat;
    Ultimo.CodTipDoc      := Cds.FieldByName('CODTIPDOC').AsFloat;
    Ultimo.IDPlanoPrev    := Cds.FieldByName('IDPLANOPREV').AsFloat;
    Ultimo.IDPatro        := Cds.FieldByName('IDPESSOA').AsInteger;
    Ultimo.Observacao     := Cds.FieldByName('OBSERVACAO').AsString;
    Ultimo.FlgSimulaAtivo := Cds.FieldByName('FLGSIMULAATIVO').AsString;
    Ultimo.RecPag         := Cds.FieldByName('RECPAG').AsString;
    Ultimo.iIdRateio      := StrToIntDef(cds.FieldByName('IDENTIFICADORDERATEIO').AsString, 0); // Edilaine - SOL 210181-15348 / KTN 2051446

    if Cds.FieldByName('CODREL').AsFloat = 0 then
      Ultimo.CodRel := Cds.FieldByName('IDFLUXOORCADO').AsFloat
    else
      Ultimo.CodRel := Cds.FieldByName('CODREL').AsFloat;



end;

procedure TfrmMovimFluxoOrcMT.dsFluxoCaixaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
 // if ( Field = cdsfluxoCaixa.FieldbyName( 'IDFLUXOCAIXA' )) and
//  if ( cds.State in [ dsInsert, dsEdit ] )  and (CdsFluxoCaixa.RecordCount > 1) then
//  begin
//     //if (CdsFluxoCaixa.RecordCount > 1) then
//       begin
//         dblcLinhasFluxo.Text    := '';
//         dblcTipoRD.Text         := '';
//         dblcTipoDocurmento.Text := '';
//        end;
//  end;
end;

procedure TfrmMovimFluxoOrcMT.cboFluxoCaixaDropDown(Sender: TObject);
begin
  inherited;
  // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //sFluxoCaixa :=  cboFluxoCaixa.KeyValue; //Marilza Colpani - SOL:115673/KTN:542579
end;

procedure TfrmMovimFluxoOrcMT.dblcCentroResponCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
    // Marilza Colpani - SOL:115673/KTN:542579
   //if (sCentroRespon <> dblcCentroRespon.LookupValue) and (CdsFluxoCaixa.RecordCount > 1) then
   //  cboFluxoCaixa.KeyValue:=0;
   // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Fim **
end;

procedure TfrmMovimFluxoOrcMT.dblcCentroResponDropDown(Sender: TObject);
begin
  inherited;
  sCentroRespon :=  dblcCentroRespon.text; //Marilza Colpani - SOL:115673/KTN:542579
end;

// Alterado por FHBS - SOL: 128685 KTN: 692049
procedure TfrmMovimFluxoOrcMT.DBcboGrupoRateioFluxoExit(Sender: TObject);
begin
  inherited;
  if (DBcboGrupoRateioFluxo.LookupValue <> '') then
  begin
    HabilitaRateio(True);

    dblcUnidNegoc.Clear;
    dblcCentroRespon.Clear;
    dblcTipoRD.Clear;
    dblcLinhasFluxo.Clear;
    //dblcSegregaCriter.Clear; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
    //cboFluxoCaixa.KeyValue := -1; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
    dblcPatrocinador.Clear;
    dblcPlanoPrev.Clear;
    //dblcTipoDocurmento.Clear; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
    //dblcMoeda.Clear; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
    //dbeValorMoeda.Clear; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
    dbmObs.Clear;

    cds.FieldByName('IDENTIFICADORDERATEIO').AsFloat := CtrlMovimFluxoOrc.GetCodigoRateio;   // Edilaine - SOL 210181-15348 / KTN 2051446

    dbeDataLanc.SetFocus;
  end
  else
  begin
     HabilitaRateio(False);

     cds.FieldByName('IDENTIFICADORDERATEIO').AsString := '';  // Edilaine - SOL 210181-15348 / KTN 2051446

     if dblcUnidNegoc.Enabled then
        dblcUnidNegoc.SetFocus
     else
      if dblcCentroRespon.Enabled then
         dblcCentroRespon.SetFocus
      else
         dblcTipoRD.SetFocus;
  end;
end;
// Fim - Alterado por FHBS

// Alterado por FHBS - SOL: 128685 KTN: 692049
procedure TfrmMovimFluxoOrcMT.Ratear;
var
  _CdsAux: TCMClientDataSet;
  x: Integer;
  dDataLanc: TDateTime;
  rValor, rSoma, rPercent, OldValor: Double;
  bRateio: Boolean;
  CodRel: Double;
begin
  inherited;
  try
    if DBcboGrupoRateioFluxo.LookupValue <> '' then
    begin
      _CdsAux := TCMClientDataSet.Create(nil);
      try
        if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

        bRateio   := False;
        dDataLanc := dbeDataLanc.Date;
        rValor    := dbeValor.Value;
        rSoma     := 0;
        CodRel    := 0;

        lstIdRateio.Clear;      // Edilaine - SOL 210181-15348 / KTN 2051446

        _CdsAux.Data := CopyClientDataSet(Cds);
        Cds.EmptyDataSet;

        cdsPadraoRateioFluxo.Data := CtrlGrupoRateioFluxo.LookupPadraoRateioFluxo(StrToInt(DBcboGrupoRateioFluxo.LookupValue), Sistema.IDEmpresa);

        if MessageBox(Handle, 'Deseja replicar essa movimentação para os meses seguintes?',
                                 PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          frmReplicarCadMov := TfrmReplicarCadMov.Create(Self);
          frmReplicarCadMov.Tag := 1;
          bRateio := True;
          frmReplicarCadMov.ShowModal;
        end;

        cdsPadraoRateioFluxo.First;
        while not(cdsPadraoRateioFluxo.Eof) do
        begin
          Cds.Insert;

          for x := 0 to (Cds.FieldCount - 1) do
            Cds.Fields[x].Value := _CdsAux.FieldByName(Cds.Fields[x].FieldName).Value;


          // Edilaine - SOL 210181-15348 / KTN 2051446
          {se replicar, ja gera o código do lançamento PAI}
          if (bRateio) and (CodRel = 0) then
          begin
            Cds.FieldByName('IDFLUXOORCADO').Value  := CtrlMovimFluxoOrc.GetCodigoFluxo();
            CodRel := Cds.FieldByName('IDFLUXOORCADO').Value;
          end;
          // Edilaine - SOL 210181-15348 / KTN 2051446 - fim

          Cds.FieldByName('UNIDNEGOC').Value       := cdsPadraoRateioFluxo.FieldByName('UNIDNEGOC').Value;

          //dblcCentroResponDropDown(dblcCentroRespon);
          Cds.FieldByName('CODCENTRORESPON').Value := cdsPadraoRateioFluxo.FieldByName('CODCENTRORESPON').Value;
          //dblcCentroResponCloseUp(dblcCentroRespon, nil, nil, True);

          //cboFluxoCaixaDropDown(cboFluxoCaixa);
          //cboFluxoCaixa.KeyValue := cdsPadraoRateioFluxo.FieldByName('IDFLUXOCAIXA').Value; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
          //cboFluxoCaixaCloseUp(cboFluxoCaixa);

          //dblcLinhasFluxoEnter(dblcLinhasFluxo);
          Cds.FieldByName('CODLINHAFLUXO').Value   := cdsPadraoRateioFluxo.FieldByName('CODLINHAFLUXO').Value;
          //dblcLinhasFluxoCloseUp(dblcLinhasFluxo, nil, nil, True);

          //dblcTipoRDEnter(dblcTipoRD);
          Cds.FieldByName('CODTIPRECDES').Value    := cdsPadraoRateioFluxo.FieldByName('CODTIPRECDES').Value;
          cds.FieldByName('RECPAG').Value          := cdsPadraoRateioFluxo.FieldByName('RECPAG').Value;
          //dblcTipoRDCloseUp(dblcTipoRD, nil, nil, True);

          // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
          //dblcSegregaCriter.LookupValue            := cdsPadraoRateioFluxo.FieldByName('IDSEGREGACRITER').Value;
          Cds.FieldByName('IDPATRO').Value         := cdsPadraoRateioFluxo.FieldByName('IDPATRO').Value;
          Cds.FieldByName('IDPLANOPREV').Value     := cdsPadraoRateioFluxo.FieldByName('IDPLANOPREV').Value;

          //dblcTipoDocurmentoEnter(dblcTipoDocurmento);
          Cds.FieldByName('CODTIPDOC').Value       := cdsPadraoRateioFluxo.FieldByName('CODTIPDOC').Value;

          Cds.FieldByName('MOECODIGO').Value       := cdsPadraoRateioFluxo.FieldByName('MOECODIGO').Value;
          //dblcMoedaExit(dblcMoeda);

          Cds.FieldByName('DATAPROGRAMADA').AsDateTime := dDataLanc;

          rPercent := cdsPadraoRateioFluxo.FieldByName('PERCENTRATEIO').AsFloat / 100;

          if cdsPadraoRateioFluxo.RecNo = cdsPadraoRateioFluxo.RecordCount then
            Cds.FieldByName('VALOR').AsFloat := rValor - rSoma
          else
            Cds.FieldByName('VALOR').AsFloat := CtrlGrupoRateioFluxo.ArredondaParaComparar(rValor * rPercent, 2);

          rSoma := rSoma + Cds.FieldByName('VALOR').AsFloat;

          if bRateio then
          begin
            //CodRel := 0;      // Edilaine - SOL 210181-15348 / KTN 2051446 - comentado
            proc_ReplicarCadMovRateio(Cds.FieldByName('UNIDNEGOC').AsFloat,
                                1,
                                Cds.FieldByName('CODLINHAFLUXO').AsFloat,
                                Cds.FieldByName('VALOR').AsFloat,
                                Cds.FieldByName('CODTIPDOC').AsFloat,
                                Cds.FieldByName('IDPLANOPREV').AsFloat,
                                Cds.FieldByName('IDPATRO').AsFloat,
                                Cds.FieldByName('CODCENTRORESPON').AsString,
                                Cds.FieldByName('CODTIPRECDES').AsString,
                                dbmObs.Text,
                                cds.FieldByName('RECPAG').AsString,
                                Cds.FieldByName('DATAPROGRAMADA').AsDateTime,
                                CodRel);
          end;

          Cds.FieldByName('CODREL').Value := CodRel;


          Cds.Post;

          cdsPadraoRateioFluxo.Next;
        end;

        Cds.First;

        if bRateio then
          MsgDlg('Replicação efetuada com sucesso.', 'Confirmação', mtInformation, [mbOk], 0);

      finally
        if bRateio then
          FreeAndNil(frmReplicarCadMov);

        FreeAndNil(_CdsAux);
      end;
    end;

    dtmBaseDados.dbBaseDados.Commit;
  except
    on E: Exception do
    begin
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('ERRO AO REPLICAR RATEIO. ' + E.Message, 'ERRO', mtError, [mbOk], 0);
    end;
  end;

end;
// Alterado por FHBS - SOL: 128685 KTN: 692049

// Alterado por FHBS - SOL: 128685 KTN: 692049
procedure TfrmMovimFluxoOrcMT.HabilitaRateio(bFlag: Boolean);
begin
  dblcUnidNegoc.Enabled      := not bFlag;
  dblcCentroRespon.Enabled   := not bFlag;
  dblcTipoRD.Enabled         := not bFlag;
  dblcLinhasFluxo.Enabled    := not bFlag;
  //dblcSegregaCriter.Enabled  := not bFlag; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //cboFluxoCaixa.Enabled      := not bFlag; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  dblcPatrocinador.Enabled   := not bFlag;
  dblcPlanoPrev.Enabled      := not bFlag;
  //dblcTipoDocurmento.Enabled := not bFlag; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //dblcMoeda.Enabled          := not bFlag; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //dbeValorMoeda.Enabled      := not bFlag; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino ** Inicio **
  //DBMemo1.Enabled            := not bFlag;
end;
// Fim - Alterado por FHBS

function TfrmMovimFluxoOrcMT.func_AtualizarFluxoDuplicado(Reg: TDados; Atividade, FluxoCaixa, LinhaFluxo, Valor, CodTipDoc,
                                          IDPlanoPrev, IDPatro: Double; DataProgramada: TDate;
                                          CRespon, TipoRecDes, Observacao, RecPag, FlgSimulaAtivo : String): Boolean;
begin
  try

    Result := True;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Text := 'UPDATE FLUXOORCADO F SET F.IDPESSOA          = '    + FloatToStr(FluxoCaixa)             +
                                                ' ,F.CODTIPRECDES    = '    + QuotedStr(TipoRecDes)              +
                                                ' ,F.RECPAG          = '    + QuotedStr(RecPag)                  +
                                                ' ,F.UNIDNEGOC       = '    + FloatToStr(Atividade)              +
                                                ' ,F.CODCENTRORESPON = '    + QuotedStr(CRespon)                 +
                                                ' ,F.PRAZO           = '    + QuotedStr('M')                     +
                                                ' ,F.VALOR           = '    + StringReplace(FloatToStr(Valor), ',', '.', [rfReplaceAll]) +
                                                ' ,F.IDPLANOPREV     = '    + FloatToStr(IDPlanoPrev)            +
                                                ' ,F.IDPATRO         = '    + FloatToStr(IDPatro)                +
                                                ' ,F.CODLINHAFLUXO   = '    + FloatToStr(LinhaFluxo)             +
                                                ' ,F.OBSERVACAO      = '    + QuotedStr(Observacao)              +
                                                ' ,F.FLGSIMULAATIVO  = '    + QuotedStr(FlgSimulaAtivo)          +
                                          ' WHERE F.DATAPROGRAMADA > '      + QuotedStr(DateToStr(Reg.DataLanc)) +
                                                ' AND F.CODREL       = '    + FloatToStr(Reg.CodRel)             ;
                                                {' AND F.IDPESSOA        = ' + FloatToStr(Reg.FluxoCaixa)         +
                                                ' AND ((F.CODTIPRECDES    = ' + QuotedStr(Reg.TipoRecDes)          +
                                                ' ) OR (F.CODTIPRECDES IS NULL)) '                               +
                                                ' AND F.RECPAG          = ' + QuotedStr(Reg.RecPag)              +
                                                ' AND F.UNIDNEGOC       = ' + FloatToStr(Reg.Atividade)          +
                                                ' AND F.CODCENTRORESPON = ' + QuotedStr(Reg.CRespon)             +
                                                ' AND F.IDPLANOPREV     = ' + FloatToStr(Reg.IDPlanoPrev)        +
                                                ' AND F.IDPATRO         = ' + FloatToStr(Reg.IDPatro)            +
                                                ' AND F.CODLINHAFLUXO   = ' + FloatToStr(Reg.LinhaFluxo)         +
                                                ' AND F.FLGSIMULAATIVO  = ' + QuotedStr(Reg.FlgSimulaAtivo) ;}
    qryAux.ExecSQL;

  except
    on E: Exception do
    begin
      Result := False;
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('ERRO AO ATUALIZAR REPLICAÇÃO CADASTRO DE MOVIMENTAÇÃO. ' + E.Message, 'ERRO', mtError, [mbOk], 0);
    end;
  end;

end;

function TfrmMovimFluxoOrcMT.func_VerificaFluxoExistente(
  Reg: TDados): Boolean;
begin
  try
    Result := False;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Text := 'SELECT F.IDFLUXOORCADO FROM CM.FLUXOORCADO F' +
                       ' WHERE F.DATAPROGRAMADA > ' + QuotedStr(DateToStr(Reg.DataLanc)) +
                       ' AND F.CODREL = ' + FloatToStr(Reg.CodRel);
                       {' AND F.IDPESSOA        = '   + FloatToStr(Reg.FluxoCaixa)         +
                       ' AND ((F.CODTIPRECDES    = '  + QuotedStr(Reg.TipoRecDes)        +
                       ' ) OR (F.CODTIPRECDES IS NULL)) '                                +
                       ' AND F.RECPAG          = '  + QuotedStr(Reg.RecPag)              +
                       ' AND F.UNIDNEGOC       = '  + FloatToStr(Reg.Atividade)          +
                       ' AND F.CODCENTRORESPON = '  + QuotedStr(Reg.CRespon)             +
                       ' AND F.IDPLANOPREV     = '  + FloatToStr(Reg.IDPlanoPrev)        +
                       ' AND F.IDPATRO         = '  + FloatToStr(Reg.IDPatro)            +
                       ' AND F.CODLINHAFLUXO   = '  + FloatToStr(Reg.LinhaFluxo)         +
                       ' AND F.FLGSIMULAATIVO  = '  + QuotedStr(Reg.FlgSimulaAtivo) ;}
    qryAux.Open;
    if not qryAux.IsEmpty then
      Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('ERRO AO CONSULTAR CADASTRO DE MOVIMENTAÇÃO. ' + E.Message, 'ERRO', mtError, [mbOk], 0);
    end;
  end;
end;

procedure TfrmMovimFluxoOrcMT.proc_ReplicarCadMovRateio(Atividade, FluxoCaixa,
  LinhaFluxo, Valor, CodTipDoc, IDPlanoPrev, IDPatro: Double; CRespon,
  TipoRecDes, Observacao, RecPag: String; DataLanc: TDateTime; var CodRel: Double);
var iMeses, I: Smallint;
    ICodigo: double;
    dData: TDate;
    IDRateio : double;
begin
  try
    iMeses  := 0;
    ICodigo := 0;

    for I := 1 to iQtdeMesRateiro do
    begin

      // Edilaine - SOL 210181-15348 / KTN 2051446
      if (lstIdRateio.Count < iQtdeMesRateiro) then
      begin
        IdRateio := CtrlMovimFluxoOrc.GetCodigoRateio;
        lstIdRateio.Add( FloatToStr(IdRateio) );
      end
      else
        IDRateio := StrToFloat( lstIdRateio.Strings[i-1] );

      iCodigo := CtrlMovimFluxoOrc.GetCodigoFluxo();

      {// Edilaine - SOL 210181-15348 / KTN 2051446 - comentado
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := 'SELECT CM.SEQFLUXOORCADO.NEXTVAL AS CODIGO FROM DUAL';
      qryAux.Open;
      iCodigo := qryAux.FieldByName('CODIGO').AsInteger;

      {if CodRel = 0 then
        CodRel := iCodigo;
      } // Edilaine - SOL 210181-15348 / KTN 2051446 - fim

      // Inclementa a quantidade de meses selecionados
      dData := IncMonth(DataLanc, I);

      // Se não for dia util acrescentar mais um dia
      while (not DiasUteis.DiaUtil(Sistema.IdEmpresa, dData, True, False, False)) and
            // Se for feriado acrescentar mais um dia
            (not DiasUteis.Feriado(Sistema.IdEmpresa, dData, True, True)) do
        dData := dData + 1;


      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text :=  'INSERT INTO FLUXOORCADO (IDFLUXOORCADO, IDPESSOA, DATAPROGRAMADA, CODTIPRECDES, RECPAG, UNIDNEGOC, ' +
                         'CODCENTRORESPON, PRAZO, VALOR, VALOROUTRAMOEDA, IDPLANOPREV, IDPATRO, CODLINHAFLUXO, ' +
                         'OBSERVACAO, FLGSIMULAATIVO, CODREL, IDENTIFICADORDERATEIO) VALUES ' + // Edilaine - SOL 210181-15348 / KTN 2051446
                         '(:IDFLUXOORCADO, :IDPESSOA, :DATAPROGRAMADA, :CODTIPRECDES, :RECPAG, :UNIDNEGOC, :CODCENTRORESPON, :PRAZO, ' +
                         ':VALOR, :VALOROUTRAMOEDA, :IDPLANPREV, :IDPATRO, :CODLINHAFLUXO, :OBSERVACAO, :FLGSIMULAATIVO, :CODREL, '+
                         ':IDRATEIO)';   // Edilaine - SOL 210181-15348 / KTN 2051446
      qryAux.ParamByName('IDFLUXOORCADO').AsFloat    := iCodigo;
      qryAux.ParamByName('IDPESSOA').AsFloat         := FluxoCaixa;
      qryAux.ParamByName('DATAPROGRAMADA').AsDate    := dData;
      qryAux.ParamByName('CODTIPRECDES').AsString    := TipoRecDes;
      qryAux.ParamByName('RECPAG').AsString          := RecPag;
      qryAux.ParamByName('UNIDNEGOC').AsFloat        := Atividade;
      qryAux.ParamByName('CODCENTRORESPON').AsString := CRespon;
      qryAux.ParamByName('PRAZO').AsString           := 'M';
      qryAux.ParamByName('VALOR').AsFloat            := Valor;
      qryAux.ParamByName('VALOROUTRAMOEDA').AsFloat  := 0;
      qryAux.ParamByName('IDPLANPREV').AsFloat       := IDPlanoPrev;
      qryAux.ParamByName('IDPATRO').AsFloat          := IDPatro;
      qryAux.ParamByName('CODLINHAFLUXO').AsFloat    := LinhaFluxo;
      qryAux.ParamByName('OBSERVACAO').AsString      := Observacao;
      qryAux.ParamByName('FLGSIMULAATIVO').AsString  := 'N';
      qryAux.ParamByName('CODREL').AsFloat           := CodRel;
      qryAux.ParamByName('IDRATEIO').AsFloat         := IDRateio;
      qryAux.ExecSQL;
    end;

  except
    on E: Exception do
    begin
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('ERRO AO REPLICAR RATEIO CADASTRO DE MOVIMENTAÇÃO. ' + E.Message, 'ERRO', mtError, [mbOk], 0);
    end;
  end;

end;

procedure TfrmMovimFluxoOrcMT.dblcLinhasFluxoExit(Sender: TObject);
begin
  inherited;
  //if Trim(dblcLinhasFluxo.LookupValue) = '' then
  //cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa, Trim(cdsTipoRecDes.FieldByName('CODTIPRECDES').AsString), '', -1, True); //Vazio
end;

procedure TfrmMovimFluxoOrcMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  if Ultimo.CodRel = 0 then
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Text := 'SELECT CM.SEQFLUXOORCADO.CURRVAL AS CODIGO FROM DUAL';
    qryAux.Open;

    Ultimo.CodRel := qryAux.FieldByName('CODIGO').AsFloat;
    qryAux.Close;


    if Trim(DBcboGrupoRateioFluxo.text) = '' then
    if MessageBox(Handle, 'Deseja replicar essa movimentação para os meses seguintes?',
                           PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      try


        frmReplicarCadMov                := TfrmReplicarCadMov.Create(Self);
        frmReplicarCadMov.Atividade      := Ultimo.Atividade;
        frmReplicarCadMov.FluxoCaixa     := Ultimo.FluxoCaixa;
        frmReplicarCadMov.LinhaFluxo     := Ultimo.LinhaFluxo;
        frmReplicarCadMov.Valor          := Ultimo.Valor;
        frmReplicarCadMov.CodTipDoc      := Ultimo.CodTipDoc;
        frmReplicarCadMov.IDPlanoPrev    := Ultimo.IDPlanoPrev;
        frmReplicarCadMov.IDPatro        := Ultimo.IDPatro;
        frmReplicarCadMov.CRespon        := Ultimo.CRespon;
        frmReplicarCadMov.TipoRecDes     := Ultimo.TipoRecDes;
        frmReplicarCadMov.Observacao     := Ultimo.Observacao;
        frmReplicarCadMov.RecPag         := Ultimo.RecPag;
        frmReplicarCadMov.DataLanc       := Ultimo.DataLanc;
        frmReplicarCadMov.FlgSimulaAtivo := Ultimo.FlgSimulaAtivo;
        frmReplicarCadMov.CodRel         := Ultimo.CodRel;
        frmReplicarCadMov.ShowModal;
      finally
        FreeAndNil(frmReplicarCadMov);
      end;
    end;
  end;
end;

function TfrmMovimFluxoOrcMT.ValidaUsuario : boolean;
var
   operacao : string;
begin
  Result := true;

  if CmeCadastro.Operacao = opAlterar then
     operacao := 'alteração'
  else
     operacao := 'exclusão';

  if cds.FieldByName('TRGUSERINCLUSAO').AsString <> 'CM'+IntToStr(Sistema.IdUsuario) then
  begin
    MsgDlg('Não é possível realizar a '+operacao+' dessa movimentação '+#10+#13+
           'pois foi cadastrada por usuário '+cds.FieldByName('NOMEUSUARIO').AsString+'.', 'Informação', mtInformation, [mbOk], 0);
    Result := false;
  end;
end;


procedure TfrmMovimFluxoOrcMT.ValidaBloqueio;
begin
  if DataPrazo = '' then
  begin
    if (dbeDataLanc.Date <= (Date + rDiasBloqueio)) and (rDiasBloqueio <> 0) then
       raise EValidacao.CreateVal ('Não é permitido Inclusões/Alterações/Exclusões dentro da faixa de'+#10+#13+
         '('+FormatFloat('00',rDiasBloqueio)+') dia(s) de Bloqueio!'+#10+#13+
         'Verifique o Número de Dias de Bloqueio nos parâmetros do sistema.',
         dbeDataLanc
         );
  end
  else
    if (dbeDataLanc.Date) <= strtodate(DataPrazo) then
       raise EValidacao.CreateVal ('Não é permitido Inclusões/Alterações/Exclusões dentro da faixa de '+#10+#13+
         '('+  DataPrazo +' ) '+#10+#13+
         'Verifique a Data do  Fluxo',
         dbeDataLanc
         );

end;


procedure TfrmMovimFluxoOrcMT.DBcboGrupoRateioFluxoKeyPress(
  Sender: TObject; var Key: Char);
begin
  // Edilaine - SOL 210181-15348 / KTN 2051446
  if key = #27 then
  begin
    DBcboGrupoRateioFluxo.LookupValue := '';
    DBcboGrupoRateioFluxoExit(Sender);
  end;
end;

procedure TfrmMovimFluxoOrcMT.MontaSelectBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
var
  txt : string;
begin
  inherited;
  txt := sqltext;
  txt := stringreplace(txt, ' FLUXOORCADO.OBSERVACAO ', 'SUBSTR(FLUXOORCADO.OBSERVACAO,1,245) ', [rfreplaceall]);
  sqltext := txt;
end;

procedure TfrmMovimFluxoOrcMT.dblcPatrocinadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  inherited;

  // SOL 262615/17834 - PPM 1115918 Inicio
  if Key = VK_UP then
  begin
    if (dblcPatrocinador.Text <> '') then
      dblcPatrocinador.LookupTable.Prior;

    dblcPatrocinador.Text := dblcPatrocinador.LookupTable.FieldByName('RAZAOSOCIAL').AsString;
    dblcPatrocinador.PerformSearch;
  end
  else if Key = VK_DOWN then
  begin
    if (dblcPatrocinador.Text <> '') then
      dblcPatrocinador.LookupTable.Next;
    dblcPatrocinador.Text := dblcPatrocinador.LookupTable.FieldByName('RAZAOSOCIAL').AsString;
    dblcPatrocinador.PerformSearch;
  end;

  Key := 0;
  // SOL 262615/17834 - PPM 1115918 FIM
end;

procedure TfrmMovimFluxoOrcMT.dblcPlanoPrevKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  // SOL 262615/17834 - PPM 1115918 Inicio
  if Key = VK_UP then
  begin
    if (dblcPlanoPrev.Text <> '') then
      dblcPlanoPrev.LookupTable.Prior;

    dblcPlanoPrev.Text := dblcPlanoPrev.LookupTable.FieldByName('NOME').AsString;
    dblcPlanoPrev.PerformSearch;

  end
  else if Key = VK_DOWN then
  begin
    if (dblcPlanoPrev.Text <> '') then
       dblcPlanoPrev.LookupTable.Next;

    dblcPlanoPrev.Text := dblcPlanoPrev.LookupTable.FieldByName('NOME').AsString;
    dblcPlanoPrev.PerformSearch;

  end;

  Key := 0;
  // SOL 262615/17834 - PPM 1115918 Fim

end;

procedure TfrmMovimFluxoOrcMT.FormShow(Sender: TObject);
begin
  inherited;

  blnUsuarioTesouraria := FlgInclusaoAlteracaoExclusao.Enabled; //Peterson Victor - SIG 19587

end;

end.


