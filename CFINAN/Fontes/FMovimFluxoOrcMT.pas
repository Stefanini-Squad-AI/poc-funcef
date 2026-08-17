{
Rotina.............: CmeCadastroFind, MontaSelect
N. Sol.............: 121802
N. Kintana.........: 649770
Data...............: 21/10/2009
Responsável........: Marilza Colpani
Descrição..........: Correção da busca de Fluxo/Orçado/Curto/Médio/Longo Prazo -
                    Movimentação.
                     Esta solicitação foi aberta com base no SOL 115673.
********************************************************************************
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
  uCtrlFinanc, uCtrlPadroes, CMDBLookupCombo;

type
  Dados  = record
              Atividade   : Double;
              CRespon     : String;
              FluxoCaixa  : Double; // Marilza Colpani - SOL:115673/KTN:542579
              LinhaFluxo  : Double; // Marilza Colpani - SOL:115673/KTN:542579
              TipoRecDes  : String;
              DataLanc    : TDateTime;
              CodTipDoc   : Double;
              IDPlanoPrev : Double;
              IDPatro     : Double;
              Observacao  : String;
          end;


  TfrmMovimFluxoOrcMT = class(TFrmCadastroMT)
    FlgPermiteLancamentos: TCheckBox;
    lblUnidNegoc: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    lblCentroRespon: TLabel;
    dblcCentroRespon: TwwDBLookupCombo;
    lblData: TLabel;
    lblTipoRD: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    Label3: TLabel;
    dblcTipoDocurmento: TwwDBLookupCombo;
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
    DBMemo1: TDBMemo;
    cdsSegregaCriter: TCMClientDataSet;
    lblMoeda: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    dbeValorMoeda: TDBRealEdit;
    lblValorOutDet: TLabel;
    lblValorDet: TLabel;
    dbeValor: TDBRealEdit;
    Label7: TLabel;
    dblcSegregaCriter: TwwDBLookupCombo;
    Label19: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    Label18: TLabel;
    dblcPatrocinador: TwwDBLookupCombo;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label8: TLabel;
    CdsFluxoCaixa: TCMClientDataSet;
    cboFluxoCaixa: TDBLookupComboBox;
    dsFluxoCaixa: TDataSource;

    procedure FormCreate(Sender: TObject);
    procedure dblcCentroResponChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dblcMoedaExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
 

  private { Private declarations }

    CtrlMovimFluxoOrc       : TCtrlMovimFluxoOrc;
    CtrlListTerceiros       : TCtrlListTercFinanc;
    CtrlParamFinanc         : TCtrlParamFinanc;
    CtrlSegregacao          : TCtrlSegregacao;
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlFinanc              : TCtrlFinanc;

    sPrazoAux, DataPrazo : String;
    rDiasBloqueio : Double;

    Ultimo : Dados;
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

  public  { Public declarations }

    constructor Create(AOwner: TComponent; sPrazo: String); reintroduce;


  end;



var
  frmMovimFluxoOrcMT: TfrmMovimFluxoOrcMT;



implementation
{$R *.DFM}
uses
  dBaseDados, uSistema, uMensErro, uCtrlParamIntegra;




constructor TfrmMovimFluxoOrcMT.Create(AOwner: TComponent; sPrazo: String);
begin
   sPrazoAux:=sPrazo;
   bCliqueComboTRD:=False;
   bCliqueComboFlx:=False;
   inherited Create(AOwner);
end;




procedure TfrmMovimFluxoOrcMT.FormCreate(Sender: TObject);
var
   cdsAux : TCMClientDataSet;
begin
   inherited;

   //Inicializa CtrlMovimFluxoOrc
   CtrlMovimFluxoOrc:=TCtrlMovimFluxoOrc.Create;
   CtrlMovimFluxoOrc.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlMovimFluxoOrc.cdsFluxoOrcado:=cds;

   //Carrega cds de Movimentos - cds
   cds.Data:=CtrlMovimFluxoOrc.ListFluxoOrcado(0,Sistema.IdEmpresa, 0); //Vazio  //Teste

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlSegregacao := TCtrlSegregacao.Create;
   CtrlSegregacao.InitializeAs (CtrlMovimFluxoOrc);
   CtrlSegregacao.GetParams(Sistema.IdEmpresa);
   cdsSegregaCriter.Data := CtrlSegregacao.ListaSegregaCriter;
   dblcSegregaCriter.Enabled := CtrlSegregacao.SegregaVirtual;

   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.InitializeAs(CtrlMovimFluxoOrc);

   CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.UsaPlanoPatro);
   CtrlFinanc.InitializeAs(Padroes);

   CdsFluxoCaixa.Data := CtrlMovimFluxoOrc.ListaFluxoCaixa(Sistema.IdEmpresa);

   cdsAux:=TCMClientDataSet.Create(nil);
   try
      cdsAux.Data:=CtrlListTerceiros.ListParamGlobal(Sistema.IdEmpresa);
      dblcCentroRespon.Enabled:=(cdsAux.FieldByName('USACRESPON').AsString='S');

      //Carrega cds de Unidade de Negócio - cdsUnidNeg
      if (cdsAux.FieldByName('USAABC').AsString='S') then
         cdsUnidNeg.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,0,'A','')
      else
       begin
          cdsUnidNeg.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,
                                                     cdsAux.FieldByName('UNIDNEGOC').AsFloat,'','');
          dblcUnidNegoc.Enabled:=False;
       end;

      if (cdsAux.FieldByName('USACRESPON').AsString='S') then
       begin
          //Carrega o cds de Centros de Responsabilidade com todos os centros de Responsabilidade
          //permitidos ao usuário corrente.
          //Caso o mesmo não tenha nenhuma restrição de centro de responsabilidade cadastrada,
          //todos os centros de responsabilidade serão carregados
          cdsCentroRespon.Data     := CtrlListTerceiros.ListCentroResponxUsuarioAtivos(Sistema.IdEmpresa, Sistema.IdUsuario);
          dblcCentroRespon.Enabled := (cdsCentroRespon.RecordCount>1);

          //Carrega cds de Tipo de Rec/Des - cdsTipoRecDes
          cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(-1,'','',0); //Vazio
       end
      else
       begin
          // Recupera apenas os centros de responsabilidade ativos}
          cdsCentroRespon.Data := CtrlListTerceiros.ListCentroRespon(Sistema.IdEmpresa,'A','S','9999999999', ParamIntegra.PlanoCentroRespon);
          cdsTipoRecDes.Data   := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
                                                                             '9999999999','E',0,
                                                                             true);
          dblcCentroRespon.Enabled := False;
       end;

   finally
      cdsAux.Free;
   end;

   //Carrega cds de Tipo de Documento - cdsTipoDoc
   cdsTipoDoc.Data:=CtrlListTerceiros.ListTipoDoc('');

   if (Sistema.UsaPlanoPatro) then
   begin
      //Carrega cds de Plano Proveidenciário - cdsPlanoPrev
      cdsPlanoPrev.Data:=CtrlListTerceiros.ListPlanoPrev;

      //Carrega cds de Patrocinador
      cdsPatrocinador.Data:=CtrlListTerceiros.ListPatrocinador;
   end;

   //Carrega cds de Moeda - cdsMoeda
   cdsMoeda.Data:=CtrlListTerceiros.ListMoeda(0,True);

   //Carrega cds de Linhas de Fluxo
   cdsLinhaFluxo.Data:=CtrlMovimFluxoOrc.ListLinhasFluxo(Sistema.IdEmpresa,'',-1);
   //cdsLinhaFluxo.Data:=CtrlMovimFluxoOrc.ListLinhasFluxo(-1,'',-1);

   //Inicializa CtrlParamFinanc
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True);
   LimpaControles(False);

   cdsAux:=TCMClientDataSet.Create(nil);
   try
      cdsAux.Data:=CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);

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
       if (sPrazoAux='M') then
        begin
        if cdsaux.FieldByName('DTMEDIOPZ').asFloat=0 then
             rDiasBloqueio:=cdsAux.FieldByName('DIASBLOQORCMP').AsFloat
          else
             DataPrazo:=formatdatetime('DD/MM/YYYY',cdsaux.FieldByname('DTMEDIOPZ').AsDateTime);
             Self.Caption := 'Movimentação do Fluxo Orçado de Médio Prazo';
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
   finally
      cdsAux.Free;
   end;

   MontaSelect.Filtro.Add('FLUXOORCADO.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa));
   MontaSelect.Filtro.Add('FLUXOORCADO.PRAZO = '''+sPrazoAux+'''');
end;




procedure TfrmMovimFluxoOrcMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlMovimFluxoOrc.Free;
   CtrlListTerceiros.Free;
   CtrlParamFinanc.Free;
   Action:=caFree;
   CtrlSegregacao.Free;
   CtrlPlanPrevContabPatro.Free;

   FreeAndNil(CtrlFinanc);

   inherited;
end;




procedure TfrmMovimFluxoOrcMT.dblcCentroResponChange(Sender: TObject);
begin
   //Carrega cdsTipoRecDes
  if not (cds.State in [dsInsert,dsEdit]) then
    Exit;
    dblcTipoRD.Clear;
    dblcLinhasFluxo.Clear;
    dblcTipoDocurmento.Clear; // Marilza Colpani - SOL:115673/KTN:542579

  if (Cds.RecordCount > 1) then
  begin
    dblcLinhasFluxo.Text    := '';
    dblcTipoRD.Text         := '';
    dblcTipoDocurmento.Text := '';
    //cboFluxoCaixa.KeyValue := '';
   end;
end;




procedure TfrmMovimFluxoOrcMT.dblcMoedaExit(Sender: TObject);
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
end;




procedure TfrmMovimFluxoOrcMT.CmeCadastroInsert(Sender: TObject);
begin
//   if (Cds.State <> dsEdit) and (Cds.Active = True) then
//    cboFluxoCaixa.KeyValue := '';
   inherited;
   dbeValorMoeda.Value   := 0;
   dbeValor.Value        := 0;
   dbeValorMoeda.Enabled := False;
   dbeValor.Enabled      := True;

   cds.FieldByName('IDPESSOA').AsInteger:=Sistema.IdEmpresa;
   cds.FieldByName('PRAZO').AsString:=sPrazoAux;

   if dblcUnidNegoc.Enabled then
      dblcUnidNegoc.SetFocus
   else
    if dblcCentroRespon.Enabled then
       dblcCentroRespon.SetFocus
    else
       dblcTipoRD.SetFocus;

   //Recupera Dados
   with Ultimo do
   begin
     if (Atividade = 0) and
       (CRespon = '') and
       (FluxoCaixa  = 0) and
       (LinhaFluxo  = 0) and
       //(LinhaFluxo  = -1) and
       (TipoRecDes  = '') and
       (DataLanc = Date) and
       (CodTipDoc = 0) and
       (IDPlanoPrev = 0) and
       (IDPatro = 0) and
       (Observacao = '') then
       LimpaControles( True );  // Marilza Colpani - SOL:115673/KTN:542579

      cds.FieldByName('UNIDNEGOC').AsFloat         := Atividade;
      cds.FieldByName('CODCENTRORESPON').AsString  := CRespon;
      Cds.FieldByName('IDFLUXOCAIXA').Value        := FluxoCaixa;
      Cds.FieldByName('CODLINHAFLUXO').Value       := LinhaFluxo;
      cds.FieldByName('CODTIPRECDES').AsString     := TipoRecDes;
      cds.FieldByName('DATAPROGRAMADA').AsDateTime := DataLanc;
      cds.FieldByName('CODTIPDOC').AsFloat         := CodTipDoc;
      cds.FieldByName('OBSERVACAO').AsString       := Observacao;
      if Sistema.UsaPlanoPatro then
       begin
          cds.FieldByName('IDPLANOPREV').AsFloat:=IDPlanoPrev;
          cds.FieldByName('IDPATRO').AsFloat:=IDPatro;
       end;
   end;
end;




procedure TfrmMovimFluxoOrcMT.CmeCadastroFind(Sender: TObject);
var
  CodLinhaFluxo : Integer;
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      cds.Close;
      cdsTipoRecDes.Close;

      // Carrega o cds principal
      //Marilza Colpani - SOL:121802/KTN:649770- Inicio
      if MontaSelect.ValoresChave[1] = '' then
        CodLinhaFluxo := -1
      else
        CodLinhaFluxo := StrToInt(MontaSelect.ValoresChave[1]);


      cds.Data := CtrlMovimFluxoOrc.ListFluxoOrcado(StrToFloat(MontaSelect.ValoresChave[0]),
                                                    Sistema.IdEmpresa,  CodLinhaFluxo);
      //Marilza Colpani - SOL:121802/KTN:649770- Fim


      // Lista os centros de responsabilidade
      cdsCentroRespon.Data         := CtrlListTerceiros.ListCentroResponxUsuarioAtivos(Sistema.IdEmpresa, Sistema.IdUsuario);
      dblcCentroRespon.LookupValue := cds.FieldByName('CODCENTRORESPON').AsString;
      dblcCentroRespon.Update;

      // Marilza Colpani - SOL:115673/KTN:542579
      //Lista o Fluxo de Caixa
         cboFluxoCaixa.KeyValue := Cds.FieldByName('IDFLUXOCAIXA').AsFloat;

      // Lista Tipo Rec/Des
      cdsTipoRecDes.Data := CtrlListTerceiros.ListaTipoRecDesxCRespFromFluxo(Sistema.IdEmpresa,
                                                                             dblcCentroRespon.LookupValue);

      //Marilza - Locate criado para trazer o tipo de receb/desemb. de acordo com o fluxo de caixa
      if cdsTipoRecDes.Locate('CODTIPRECDES;RECPAG', VarArrayOf([cds.FieldByName('CODTIPRECDES').AsString, Cds.FieldByName('RECPAG').asString]), []) then
        dblcTipoRD.Text := cdsTipoRecDes.FieldByName('DESCRICAO').AsString;
      dblcTipoRD.Update;

      // Lista os tipos de documento

      cdsTipoDoc.Filtered := False;
      cdsTipoDoc.Filter   := 'RECPAG = ' + QuotedStr(cds.FieldByName('RECPAG').AsString);
      cdsTipoDoc.Filtered := True;

      //Marilza Colpani - SOL:121802/KTN:649770
      dblcTipoDocurmento.LookupValue := Trim(cds.FieldByName('CODTIPDOC').AsString);
      dblcTipoDocurmento.Update;

      // Marilza Colpani - SOL:115673/KTN:542579
      CdsFluxoCaixa.Data := CtrlMovimFluxoOrc.ListaFluxoCaixa(Cds.fieldbyname('IDPESSOA').AsInteger);

      // Ponteira a linha do fluxo
      dblcLinhasFluxo.LookupValue := Trim(cds.FieldByName('CODTIPRECDES').AsString);
      dblcLinhasFluxo.Update;



   end;
end;




procedure TfrmMovimFluxoOrcMT.CmeCadastroEdit(Sender: TObject);
begin
   //inherited; //comentado, pois estava cancelando a ultima alteração

   if dbeValorMoeda.Value = 0 then
   begin
      dbeValorMoeda.Enabled := False;
      dbeValor.Enabled      := True;

      if dbeValor.CanFocus then
         dbeValor.SetFocus;
   end
   else
   begin
      dbeValorMoeda.Enabled := True;
      dbeValor.Enabled      := False;

      if dbeValorMoeda.CanFocus then
         dbeValorMoeda.SetFocus;
   end;

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
            //cds.FieldByName('RECPAG').AsString       :=  'R'; //cdsTipoRecDes.FieldByName('RECPAG').AsString;
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
       with Ultimo do
       begin
          Atividade  := StrToFloat(dblcUnidNegoc.LookupValue);
          CRespon    := dblcCentroRespon.LookupValue;

          if dblcLinhasFluxo.Text <> '' then
          LinhaFluxo := StrToFloat(dblcLinhasFluxo.LookupValue); //Marilza Colpani - SOL:115673/KTN:542579

          if dblcTipoRD.Text <> '' then
            TipoRecDes := dblcTipoRD.LookupValue;
            
          DataLanc   := dbeDataLanc.Date;

          if (dblcTipoDocurmento.LookupValue <> '') then
            CodTipDoc  := StrToFloat(dblcTipoDocurmento.LookupValue)
          else
          begin
            cdsTipoDoc.FieldByName('CODTIPDOC').isnull;
            dblcTipoDocurmento.LookupValue := '';
            CodTipDoc := 0;
          end;

          Observacao := cds.FieldByName('OBSERVACAO').AsString;
          if Sistema.UsaPlanoPatro then
          begin
             IDPlanoPrev := StrToFloat(dblcPlanoPrev.LookupValue);
             IDPatro     := StrToFloat(dblcPatrocinador.LookupValue);
          end;
       end;
       
    end;
    inherited;
end;




procedure TfrmMovimFluxoOrcMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlMovimFluxoOrc.AplicaAtualFluxoOrc(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,

                                                   StrToIntDef(dblcSegregaCriter.LookupValue, -1));

   if not Accept then
     MsgDlg('Não foi possível inserir o registro. ' + #13 +
            'Motivo: ' + CtrlMovimFluxoOrc.MessageInfo,'Erro',mtError,[mbOk],0);
end;




procedure TfrmMovimFluxoOrcMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlMovimFluxoOrc.AplicaAtualFluxoOrc(Sistema.IdEmpresa,
                                                 Sistema.IdModulo,
                                                 Sistema.IdUsuario,
                                                 StrToIntDef(dblcSegregaCriter.LookupValue, -1));

   if not Accept then
     MsgDlg('Não foi possível alterar o registro. ' + #13 +
            'Motivo: ' + CtrlMovimFluxoOrc.MessageInfo,'Erro',mtError,[mbOk],0);

   LimpaControles(False); //Marilza
end;





procedure TfrmMovimFluxoOrcMT.CmeCadastroApplyDelete(sender: TObject;
var Accept: Boolean);
begin
   inherited;
   Accept := CtrlMovimFluxoOrc.AplicaAtualFluxoOrc(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   StrToIntDef(dblcSegregaCriter.LookupValue, -1));

  if not Accept then
     MsgDlg('Não foi possível excluir o registro. ' + #13 +
            'Motivo: ' + CtrlMovimFluxoOrc.MessageInfo,'Erro',mtError,[mbOk],0);

//   cds.Data:=CtrlMovimFluxoOrc.ListFluxoOrcado(0,Sistema.IdEmpresa, 0);
   //Marilza Colpani - SOL:115673/KTN:542579 - quando excluía não estava limpando os campos na tela.  
   cds.Data:=CtrlMovimFluxoOrc.ListFluxoOrcado(-1,Sistema.IdEmpresa, 0);
   LimpaControles(False);
end;



function TfrmMovimFluxoOrcMT.VerificaPreenchimento: Boolean;
var
  sCaption, strSQL : String;
  cdsTesouraria: TCMClientDataSet;
  blnUsuarioTesouraria: Boolean;
begin
   Result := False;
   try
       sCaption := 'Erro';

       if Trim(dblcUnidNegoc.Text) = '' then
         raise EValidacao.CreateVal('Obrigatório preencher a Atividade',  dblcUnidNegoc);

       if Trim(dblcCentroRespon.Text) = '' then
         raise EValidacao.CreateVal('Obrigatório preencher o Centro de Responsabilidade', dblcCentroRespon);

       // Marilza Colpani - SOL:115673/KTN:542579
       if Trim(cboFluxoCaixa.Text) = '' then
       raise EValidacao.CreateVal('Obrigatório preencher o Fluxo de Caixa', cboFluxoCaixa);

        // Marilza Colpani - SOL:115673/KTN:542579
        // Se o campo Linha de Fluxo estiver preenchido o campo Tipo Receb./Desemb. nao precisa, vice-versa
        if (Trim(dblcLinhasFluxo.Text) = '') and (Trim(dblcTipoRD.Text) = '') then
        begin
          //raise EValidacao.CreateVal('Obrigatório preencher Linha de Fluxo ou Tipo de Recebimento/Desembolso', dblcTipoRD);
          MsgDlg('Obrigatório preencher Linha de Fluxo ou Tipo de Recebimento/Desembolso', 'Segregação de Recursos', mtWarning, [mbOk], 0);
          exit;
        end;


       //Bruno Bastos - SOL 115673 - Kintana 542579
       //Validação comentada para atender esta solicitação
       //if Trim(dblcTipoDocurmento.Text) = '' then
         //raise EValidacao.CreateVal('Obrigatório preencher o Tipo de Documento', dblcTipoDocurmento);

       if Trim(dbeDataLanc.Text) = '' then
         raise EValidacao.CreateVal('Obrigatório preencher a Data do Lançamento', dbeDataLanc);

       if DiasUteis.Feriado(Sistema.IdEmpresa,dbeDataLanc.Date,True,True) then
         raise EValidacao.CreateVal('A data de Lançamento é um Feriado', dbeDataLanc);

       if not DiasUteis.DiaUtil(Sistema.IdEmpresa,dbeDataLanc.Date,True,False,False) then
         raise EValidacao.CreateVal('A data de lançamento não é um dia útil!',dbeDataLanc);

       // usuários do cgrupo TESOURARIA podem modificar independente
       // do bloqueio de datas
       // Ricardo A. SOL 54393 KTN: 523368
       strSQL := 'SELECT IDUSUARIO FROM GRUPOACESSO GA, GRUPOUSU GU WHERE' +
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


       if not blnUsuarioTesouraria then
         if DataPrazo = '' then
         begin
           if (dbeDataLanc.Date <= (Date + rDiasBloqueio)) and (rDiasBloqueio <> 0) then
             raise EValidacao.CreateVal ('Não é permitido Inclusões/Alterações dentro da faixa de'+#10+#13+
               '('+FormatFloat('00',rDiasBloqueio)+') dia(s) de Bloqueio!'+#10+#13+
               'Verifique o Número de Dias de Bloqueio nos parâmetros do sistema.',
               dbeDataLanc
               );
         end
         else
           if (dbeDataLanc.Date) <= strtodate(DataPrazo) then
             raise EValidacao.CreateVal ('Não é permitido Inclusões/Alterações dentro da faixa de '+#10+#13+
               '('+  DataPrazo +' ) '+#10+#13+
               'Verifique a Data do  Fluxo de Médio Prazo',
               dbeDataLanc
               );


       if Trim(dblcMoeda.Text) <> '' then begin
         if (dbeValorMoeda.Value = 0) then
           raise EValidacao.CreateVal('Obrigatório preencher o Valor em Outra Moeda', dbeValorMoeda);
       end else begin
         if dbeValor.Value = 0 then
           raise EValidacao.CreateVal('Obrigatório preencher o Valor em Moeda Corrente', dbeValor);
       end;


       if Sistema.UsaPlanoPatro then begin
         if Trim(dblcPlanoPrev.Text)='' then
           raise EValidacao.CreateVal('Obrigatório preencher o Plano Previdenciário', dblcPlanoPrev);

         if Trim(dblcPatrocinador.Text)='' then
           raise EValidacao.CreateVal('Obrigatório preencher o Patrocinador', dblcPatrocinador);

          if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(Cds.FieldByName('IDPATRO').AsInteger, Cds.FieldByName('IDPLANOPREV').AsInteger) then
            raise EValidacao.CreateVal('Não existe relacionamento entre Patrocinadora e Plano escolhidos!', dblcPlanoPrev);
        end;

       if CtrlSegregacao.SegregaVirtual then
       begin
         sCaption := 'Segregação';

         if (CtrlSegregacao.PlanoPrevAdm = Cds.FieldByName('IDPLANOPREV').AsInteger) or
            (CtrlSegregacao.PlanoPrevComum = Cds.FieldByName('IDPLANOPREV').AsInteger) or
            (CtrlSegregacao.PatroComum = Cds.FieldByName('IDPATRO').AsInteger) then begin

           if (not((CtrlSegregacao.PlanoPrevAdm = Cds.FieldByName('IDPLANOPREV').AsInteger) or
              (CtrlSegregacao.PlanoPrevComum = Cds.FieldByName('IDPLANOPREV').AsInteger))) or
              (CtrlSegregacao.PatroComum <> Cds.FieldByName('IDPATRO').AsInteger) then
             raise EValidacao.CreateVal('Escolhendo o Plano "Comum" / "Adminitrativo" a Patrocinadora deve ser a "Comum", e vice-versa!', dblcPlanoPrev);

           if dblcSegregaCriter.Text <> '' then begin
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

         end
         else
         begin
           if dblcSegregaCriter.Text <> '' then
             raise EValidacao.CreateVal ('O Critério para segregação só pode ser escolhido no plano "Comum" ou "Administrativo"!', dblcSegregaCriter);
         end;
       end;

   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Segregação de Recursos', mtWarning, [mbOk], 0);
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
   cdsLinhaFluxo.Data := CtrlMovimFluxoOrc.ListLinhasFluxo(Sistema.IdEmpresa,
                                                           dblcCentroRespon.LookupValue,
                                                           StrToIntDef(cboFluxoCaixa.KeyValue,0)); // Marilza Colpani - SOL:115673/KTN:542579 - alteração do LookupValue por KeyValue
end;




procedure TfrmMovimFluxoOrcMT.dblcTipoRDEnter(Sender: TObject);
begin
   inherited;
   CarregaComboTRD(Sistema.IdEmpresa,
                   StrToIntDef(cboFluxoCaixa.KeyValue,-1),  // Marilza Colpani - SOL:115673/KTN:542579 - alteração do LookupValue por KeyValue
                   StrToIntDef(dblcLinhasFluxo.LookupValue,0),
                   dblcCentroRespon.LookupValue);
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

   cdsTipoRecDes.Data := CtrlListTerceiros.ListaTipoRecDesxCRespFromFluxo(iIdEmpresa,
                                                                          sCodCentroRespon,
                                                                          iIdFluxoCaixa,
                                                                          iCodLinhaFluxo);

end;




procedure TfrmMovimFluxoOrcMT.dblcLinhasFluxoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if modified then
   begin
      CarregaComboTRD(Sistema.IdEmpresa,
                      StrToIntDef(cboFluxoCaixa.KeyValue,-1), // Marilza Colpani - SOL:115673/KTN:542579 - alteração do LookupValue por KeyValue
                      StrToIntDef(dblcLinhasFluxo.LookupValue,0),
                      dblcCentroRespon.LookupValue);

    if dblcLinhasFluxo.text <> '' then
       bLinhaFluxoPreenchido:=True;

       dblcTipoRD.Clear;      
       dblcTipoDocurmento.Clear;


   

   end;
end;




procedure TfrmMovimFluxoOrcMT.dblcTipoRDCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not bLinhaFluxoPreenchido then
    begin
     dblcTipoDocurmento.Value   :='';
     dblcTipoDocurmento.Text :='';
    end;
    bTRDPreenchido:=True;

end;

procedure TfrmMovimFluxoOrcMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL:115673/KTN:542579
  dblcUnidNegoc.text := '';
  dblcCentroRespon.Text := '';
  dblcTipoRD.Text := '';
  dblcLinhasFluxo.Text := '';
  cboFluxoCaixa.KeyValue := '';
  dblcLinhasFluxo.Text := '';
  dblcSegregaCriter.Text := '';
  dblcPatrocinador.Text := '';
  dblcPlanoPrev.Text := '';
  dblcTipoDocurmento.Text := '';
  dbeDataLanc.Text := '';
  dblcMoeda.Text := '';
  dbeValorMoeda.Text := '';
  dbeValor.Text := '';
  DBEdNomeUsuario.Text := '';
  DBEdData.Text :='';

  Ultimo.Atividade   := 0;
  Ultimo.CRespon     := '';
  Ultimo.FluxoCaixa  := 0;
  Ultimo.LinhaFluxo  := 0;
  Ultimo.TipoRecDes  := '';
  Ultimo.DataLanc    := Date;
  Ultimo.CodTipDoc   := 0;
  Ultimo.IDPlanoPrev := 0;
  Ultimo.IDPatro     := 0;
  Ultimo.Observacao  := '';
end;

procedure TfrmMovimFluxoOrcMT.bbtnConfirmarClick(Sender: TObject);
begin
  //Bruno Bastos - Pend. 26399
  //inherited;
  //dblcSegregaCriter.Clear; //teste 21/08/2009
  // Marilza Colpani - SOL:115673/KTN:542579 - Gravar Record
  if cds.State in [dsInsert,dsEdit] then
  begin
    Ultimo.Atividade     := cdsUnidNeg.FieldByName('UNIDNEGOC').AsFloat;
    Ultimo.CRespon       := cdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
    Ultimo.FluxoCaixa    := CdsFluxoCaixa.FieldByName('IDFLUXOCAIXA').Value;

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
          //dblcLinhasFluxo.Text := cdsLinhaFluxo.FieldByName('DESCRICAO').AsString;
          //dblcLinhasFluxo.Update;
      end
    else
    begin
      cds.FieldByName('CODLINHAFLUXO').AsString:='';
      dblcLinhasFluxo.LookupValue := '';
      Ultimo.LinhaFluxo  := 0;
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
      cds.FieldByName('CODTIPRECDES').AsString:='';
      dblcTipoRD.LookupValue := '';
      Ultimo.TipoRecDes  := '';
    end;


    Ultimo.DataLanc      := cds.FieldByName('DATAPROGRAMADA').AsDateTime;

//  if cdsTipoDoc.IsEmpty then
//    Ultimo.CodTipDoc   := cdsTipoDoc.FieldByName('CODTIPDOC').AsFloat
//  else
//    Ultimo.CodTipDoc   := 0;

    if dblcTipoDocurmento.Text <> '' then
      begin
         Ultimo.CodTipDoc   := cdsTipoDoc.FieldByName('CODTIPDOC').AsFloat;
         cds.FieldByName('CODTIPDOC').AsInteger := cdsTipoDoc.FieldByName('CODTIPDOC').AsInteger;
       end
    else
    begin
      cds.FieldByName('CODTIPDOC').Asstring := '';
      dblcTipoDocurmento.LookupValue := '';
      Ultimo.CodTipDoc   := 0;
    end;

    Ultimo.IDPlanoPrev   := cdsPlanoPrev.FieldByName('IDPLANOPREV').AsFloat;
    Ultimo.IDPatro       := cdsPatrocinador.FieldByName('IDPESSOA').AsInteger;
    Ultimo.Observacao    := Cds.FieldByName('OBSERVACAO').AsString;
  end;
  inherited;


end;

procedure TfrmMovimFluxoOrcMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  //Bruno Bastos - Pend. 26399
  dbeDataLanc.Clear; // Marilza Colpani - SOL:115673/KTN:542579
  dblcSegregaCriter.Clear;

  if (CdsFluxoCaixa.RecordCount=1) then
    cboFluxoCaixa.KeyValue := CdsFluxoCaixa.FieldByName('IDFLUXOCAIXA').Value
  else
    Ultimo.FluxoCaixa := cboFluxoCaixa.KeyValue;

end;

// Marilza Colpani - SOL:115673/KTN:542579
// Implementação da nova procedure
procedure TfrmMovimFluxoOrcMT.LimpaControles(bPreencherParametro: Boolean);
begin

  with Ultimo do
  begin
    if bPreencherParametro then
    begin
      if (Atividade = 0) and (cdsUnidNeg.RecordCount=1) then
        Atividade := cdsUnidNeg.FieldByName('UNIDNEGOC').AsFloat;

      if (CRespon = '') and (cdsCentroRespon.RecordCount=1) then
        CRespon   := cdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;

      If (FluxoCaixa = 0) and (CdsFluxoCaixa.RecordCount = 1) then
        FluxoCaixa := CdsFluxoCaixa.FieldByName('IDFLUXOCAIXA').Value
      else
        cboFluxoCaixa.KeyValue := -1;

    end
    else
    begin
      Atividade   := 0;
      CRespon     := '';
      FluxoCaixa  := 0;  // Marilza Colpani - SOL:115673/KTN:542579
      LinhaFluxo  := 0; // Marilza Colpani - SOL:115673/KTN:542579
      TipoRecDes  := '';
      DataLanc    := Date;
      CodTipDoc   := 0;
      IDPlanoPrev := 0;
      IDPatro     := 0;
      Observacao  := '';
    end;
  end;

end;

procedure TfrmMovimFluxoOrcMT.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  cboFluxoCaixa.KeyValue := 0; // Marilza Colpani - SOL:115673/KTN:542579 - alterado de '' para 0
  dblcLinhasFluxo.Text := '';
end;

procedure TfrmMovimFluxoOrcMT.cboFluxoCaixaCloseUp(Sender: TObject);
begin
  inherited;
   // Marilza Colpani - SOL:115673/KTN:542579
   if sFluxoCaixa <> cboFluxoCaixa.KeyValue then
   begin
     dblcLinhasFluxo.Text    := '';
     dblcTipoRD.Text         := '';
     dblcTipoDocurmento.Text := '';
    end;
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
  //Bruno Bastos - Teste - 27/07/2009 - Início
  if cds.FieldByName('CODTIPDOC').AsInteger > 0 then
    dblcTipoDocurmento.LookupValue := cds.FieldByName('CODTIPDOC').AsString;
  //Bruno Bastos - Teste - 27/07/2009 - Fim


end;

procedure TfrmMovimFluxoOrcMT.sbtnProcurarClick(Sender: TObject);
begin

  inherited;
    //Marilza Colpani - SOL:115673/KTN:542579
    bLinhaFluxoPreenchido:=false;
    bTRDPreenchido:=false;
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
  sFluxoCaixa :=  cboFluxoCaixa.KeyValue; //Marilza Colpani - SOL:115673/KTN:542579
end;

procedure TfrmMovimFluxoOrcMT.dblcCentroResponCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
    // Marilza Colpani - SOL:115673/KTN:542579
   if (sCentroRespon <> dblcCentroRespon.LookupValue) and (CdsFluxoCaixa.RecordCount > 1) then
     cboFluxoCaixa.KeyValue:=0;
end;

procedure TfrmMovimFluxoOrcMT.dblcCentroResponDropDown(Sender: TObject);
begin
  inherited;
  sCentroRespon :=  dblcCentroRespon.text; //Marilza Colpani - SOL:115673/KTN:542579
end;

end.
