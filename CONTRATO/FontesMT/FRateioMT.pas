{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina........: ProgramaxCCxDesembolso  
N. Atender....: WO15797
Dt Alteração..: 20/02/2025
Responsável...: Paulo Nobre
Descrição.....: Ajustando a rotina para carregar o Desembolso (CODTIPRECDES)
                dentro do cds: cdsRateioxCCDif.
--------------------------------------------------------------------------------
Rotina.............: AtualizaPlanoPatro
N. SIG.............: 117244
Data da Alteração..: 29/06/2021
Responsável........: Edilaine
Descrição..........: Ajuste integração com FDO Digital para rateio na medição
--------------------------------------------------------------------------------
Rotina......: rgpTipoRateioClick
N. SIG......: 115595
Data .......: 20/05/2021
Responsável.: Edilaine
Descrição...: Integração com FDO Digital para rateio de lançamentos de contratos
-----------------------------------------------------------------------------------------------------
N. SIG..........: 49067
Data............: 30/06/2017
Responsável.....: Fábio Sampaio
Descrição.......: Erro no Rateio Diferenciado
--------------------------------------------------------------------------------
N. SIG..........: 27691
Data............: 09/09/2016
Responsável.....: Peterson Victor
Descrição.......: Erro no Rateio Diferenciado
--------------------------------------------------------------------------------
N. Sol..........: 257896
PPM.............: 1014759
Data............: 27/08/2015
Responsável.....: Petri Nocentini
Descrição.......: Informação duplicada em rateio diferenciado na medição de
                  contrato
--------------------------------------------------------------------------------
N. Sol..........: 227975.16197
PPM.............: 430656
Data............: 26/06/2014
Responsável.....: Thiago Melo
Descrição.......: Manter estados das contas ao realizar alteração no rateio
--------------------------------------------------------------------------------
N. Sol..........: 227975
N. Kintana......: 2061959
Data............: 06/06/2014
Responsável.....: Thiago Melo
Descrição.......: Ajustar a montagem da conta orçamentária para verificar saldo
--------------------------------------------------------------------------------
Rotina......: FormCreate, FormDestroy, dblcCentroCustoCloseUp, dblcCentroCustoChange
N. Sol......: 191844
N. Kintana..: 1822119
Data........: 15/07/2013
Responsável.: Edilaine Ferraresi
Descrição...: adicionado seleção de Plano e Patro na parametrizacao de medicao e
              seleção automatica de programa em funçao do desembolso/c. custo
--------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
--------------------------------------------------------------------------------
 Pendência : 17592
 Data      : 23/05/2006
 Autor     : Daniel Simões
 Descrição : Passa a exibir apenas os planos previdenciários ativos na tela de
             rateio ( foi adicionado, após carregar o cds o filtro "ATIVO = 'S'"
             que trará apenas os planos ativos ) ...
--------------------------------------------------------------------------------
 Pendência : 21973
 Data      : 11/04/2006
 Autor     : Daniel Simões Braga
 Descrição : Adicionado o Plano de Centro (IDPLANCENTCUST) de Custo como
             parâmetro na hora de carregar a query de Centro de Custo
             ( cdsCentroCusto ) ...
--------------------------------------------------------------------------------
 Rotina    :
 Data      : 02/03/2005
 Autor     : Andre Tavares
 Pendências: 18749
 Descrição : erro ao inserir um rateio diferenciado
-------------------------------------------------------------------------------}
unit FRateioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, DBClient, uCMClientDataSet, uCmSqlParams, TB97Ctls, ImgList,
  TREdit, wwdblook, uCtrlListTercContratos, uCtrlParamIntegra,
  uCtrlParamContrato  // Edilaine - SOL 191844 / KTN 1822119
  ,uCtrlDocumento; // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

type
  TfrmRateioMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    rgpTipoRateio: TRadioGroup;
    edItem: TEdit;
    edObjeto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dsRateioxCCDif: TDataSource;
    cdsRateioxCCDif: TCMClientDataSet;
    spTeste: TCMSqlParams;
    Panel2: TPanel;
    ImlPadrao: TImageList;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    Panel3: TPanel;
    dbgRateioDiferenciado: TwwDBGrid;
    DBcboUnidNegocio: TwwDBLookupCombo;
    Label16: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    lblPlanoPrevC: TLabel;
    dblcCentroCusto: TwwDBLookupCombo;
    Label21: TLabel;
    lblPrograma: TLabel;
    dblcPrograma: TwwDBLookupCombo;
    lblPatroC: TLabel;
    dblcPatroC: TwwDBLookupCombo;
    lblTipo: TLabel;
    dbePercentualRateio: TDBRealEdit;
    lblPerc: TLabel;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPrograma: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    cdsAtividadeNeg: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    dbgRateioDiferenciadoIButton: TwwIButton;
    sbtnInsDet: TToolbarButton97;
    edQtdeTotal: TDBRealEdit;
    edValorTotal: TDBRealEdit;
    edQtdeNaoRateada: TDBRealEdit;
    edPercNaoRateado: TDBRealEdit;
    edValorNaoRateado: TDBRealEdit;
    Label7: TLabel;
    cdsAux: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure rgpTipoRateioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgRateioDiferenciadoCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure cdsRateioxCCDifAfterPost(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure dblcCentroCustoChange(Sender: TObject);
    procedure dblcCentroCustoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }

    // Ricardo A. SOL 104897
    FIdPessoa: Integer;
    FConta: string;
    FPlaConta: string;
    ParamIdPlanoPrev : integer;              // Edilaine - SOL 191844 / KTN 1822119
    ParamIdPatro     : integer;              // Edilaine - SOL 191844 / KTN 1822119
    FCodPortForma     : Integer;  // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
    FIDForCli         : integer;  // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
    bMudandoTipoRateio : Boolean;
    CtrlListTerc       : TCtrlListTercContratos;
    cdsVerifRateio     : TCMClientDataSet;

    CtrlParamContrato  : TCtrlParamContrato; // Edilaine - SOL 191844 / KTN 1822119

    // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
    _oDocumento: TCtrlDocumento;
    FCodTipRecDes: String;
    // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

    function  TestaRateio: Double;
    function  DuplicidadeRateio: Boolean;
    procedure HabilitaBotao;

    // Ricardo A. SOL 104897
    procedure AtualizaDadosDoObjeto;
    procedure AtualizaPlanoPatro; // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
    function IFF(Condicao:boolean;Primeiro,Segundo:string):string; // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

  public
    { Public declarations }
    iIdContrato : Integer;
    iIdObjeto   : Integer;
    iIdItem     : Integer;
    iParcNum    : Integer; // Petri SOL 257896 PPM 1014759

    // Ricardo A. SOL 104897
    property IdPessoa: Integer read FIdPessoa write FIdPessoa;
    property Conta: String read FConta write FConta;
    property PlaConta: String read FPlaConta write FPlaConta;
    property CodPortForma : integer read FCodPortForma write FCodPortForma; // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
    property IDForCli : integer read FIDForCli write FIDForCli;// Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
    property CodTipRecDes : String read FCodTipRecDes write FCodTipRecDes;// Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
  end;

var
  frmRateioMT: TfrmRateioMT;

implementation

uses uMensErro, dBaseDados, uSistema, UCtrlOrcamento, uctrlpadroes,
  FMedicaoContratosMT;

{$R *.DFM}

procedure TfrmRateioMT.FormCreate(Sender: TObject);
begin
   inherited;
   // Cria Ctrl de lookups
   CtrlListTerc := TCtrlListTercContratos.Create;
   CtrlListTerc.Initialize(dtmBaseDados.dbBaseDados,True);


  _oDocumento := TCtrlDocumento.Create;
  _oDocumento.InitializeAs(Padroes);


   // Carrega cds de Lookups
   cdsPlanoPrev.Data      := CtrlListTerc.ListPlanoPrev;

   // Daniel Simões - P: 17592 - 23/05/2006
   cdsPlanoPrev.Filtered  := False;
   cdsPlanoPrev.Filter    := ' ATIVO = ''S'' ';
   cdsPlanoPrev.Filtered  := True;
   // Daniel Simões - P: 17592 - 23/05/2006

   cdsPatrocinador.Data   := CtrlListTerc.ListPatrocinador;
   cdsPrograma.Data       := CtrlListTerc.ListPrograma;
   cdsCentroCusto.Data    := CtrlListTerc.ListCentroCusto(Sistema.IdEmpresa,'A','S',ParamIntegra.PlanoCentroCusto); // Daniel Simões
   cdsAtividadeNeg.Data   := CtrlListTerc.ListUnidNegocio(Sistema.IdEmpresa,0,'A','');

   bMudandoTipoRateio := False;

   // Edilaine - SOL 191844 / KTN 1822119
   CtrlParamContrato := TCtrlParamContrato.Create;
   CtrlParamContrato.Initialize(dtmBaseDados.dbBaseDados,True);
   cdsAux.data :=  CtrlParamContrato.ListParamContrato(Sistema.IdEmpresa);

   ParamIdPlanoPrev := cdsAux.FieldByName('IDPLANOPREV').AsInteger;
   ParamIdPatro     := cdsAux.FieldByName('IDPATRO').AsInteger;
   // Edilaine - SOL 191844 / KTN 1822119 - fim

   // Cria o Cds para verificação do Rateio
   cdsVerifRateio := TCMClientDataSet.Create( nil );

   FIdPessoa := 0;
end;

procedure TfrmRateioMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlListTerc );
  FreeAndNil( cdsVerifRateio );
  FreeAndNil( CtrlParamContrato);   // Edilaine - SOL 191844 / KTN 1822119

  inherited;
end;

procedure TfrmRateioMT.FormShow(Sender: TObject);
begin
  inherited;
  cdsVerifRateio.Data := cdsRateioxCCDif.Data;
  cdsVerifRateio.EmptyDataSet;

  cdsVerifRateio.Filtered := False;
  cdsVerifRateio.Filter   := 'IDITEM   = ' +FloatToStr(iIdItem)+ ' AND '+
                             'IDOBJETO = ' +FloatToStr(iIdObjeto) + ' AND ' +
                             'PARCELANUM = ' + IntToStr(iParcNum);//Petri SOL 257896 PPM 1014759

  cdsVerifRateio.Filtered := True;

  if not cdsRateioxCCDif.FieldByName('DIVISOR').IsNull then begin
     case cdsRateioxCCDif.FieldByName('DIVISOR').AsString[1] of
       'P' : rgpTipoRateio.ItemIndex := 0;
       'Q' : rgpTipoRateio.ItemIndex := 1;
       'V' : rgpTipoRateio.ItemIndex := 2;
     end;
  end else begin
     rgpTipoRateio.ItemIndex    := 0;
  end;

  rgpTipoRateioClick(Sender); // Daniel

  dbgRateioDiferenciado.BringToFront;
end;

procedure TfrmRateioMT.rgpTipoRateioClick(Sender: TObject);
begin
   bMudandoTipoRateio:=True;
   try
      cdsRateioxCCDif.First;
      while not(cdsRateioxCCDif.Eof) do
      begin
         cdsRateioxCCDif.Edit;
         case rgpTipoRateio.ItemIndex of
           0 : cdsRateioxCCDif.FieldByName('DIVISOR').AsString := 'P';
           1 : cdsRateioxCCDif.FieldByName('DIVISOR').AsString := 'Q';
           2 : cdsRateioxCCDif.FieldByName('DIVISOR').AsString := 'V';
         end;

         cdsRateioxCCDif.Post;
         cdsRateioxCCDif.Next;
      end;

      //edilaine SIG115595 : inicio
      lblPerc.visible := rgpTipoRateio.ItemIndex = 0;
      case rgpTipoRateio.ItemIndex of
        0 : lblTipo.caption := 'Percentual';
        1 : lblTipo.caption := 'Quantidade';
        2 : lblTipo.caption := 'Valor';
      end;
      //edilaine SIG115595 : fim

   finally
      bMudandoTipoRateio := False;
      // Daniel Simões - 13/04/2006
      if ( rgpTipoRateio.ItemIndex = 0 ) then
        edPercNaoRateado.DecDigits := 4
      else
        edPercNaoRateado.DecDigits := 2;
      // Daniel Simões - 13/04/2006
      cdsRateioxCCDifAfterPost(nil);
   end;
   cdsRateioxCCDif.First;

end;

procedure TfrmRateioMT.bbtnConfirmarClick(Sender: TObject);
begin
   if cdsRateioxCCDif.State in [dsEdit, dsInsert] then cdsRateioxCCDif.Cancel;

   if TestaRateio = 0 then
      inherited
   else
    begin
       case rgpTipoRateio.ItemIndex of
         0 : MsgDlg('A soma dos Rateios não pode ser diferente de 100 %','Erro',mtError,[mbOk],0);
         1 : MsgDlg('A soma dos Rateios não pode ser diferente de ' + edQtdeTotal.Text,'Erro',mtError,[mbOk],0);
         2 : MsgDlg('A soma dos Rateios não pode ser diferente de ' + edValorTotal.Text,'Erro',mtError,[mbOk],0);
       end;
       ModalResult:=mrNone;
    end;
end;

function TfrmRateioMT.TestaRateio: Double;
begin
   case rgpTipoRateio.ItemIndex of
      0 : Result := 100;
      1 : Result := edQtdeTotal.Value;
      2 : Result := edValorTotal.Value;
   end;

   cdsRateioxCCDif.First;
   while not cdsRateioxCCDif.Eof do begin
      Result := Result - cdsRateioxCCDif.FieldByName('PERCRATEIOCONTR').AsFloat;
      cdsRateioxCCDif.Next;
   end;
   cdsRateioxCCDif.First;

   if (Abs(Result) < 0.0000001) then Result := 0;
end;

procedure TfrmRateioMT.cdsRateioxCCDifAfterPost(DataSet: TDataSet);
begin
   inherited;
   if bMudandoTipoRateio then Exit;
   if rgpTipoRateio.ItemIndex = 0 then begin
      edPercNaoRateado.Value  := TestaRateio;
      edQtdeNaoRateada.Value  := 0;
      edValorNaoRateado.Value := 0;
   end else if rgpTipoRateio.ItemIndex = 1 then begin
      edPercNaoRateado.Value  := 0;
      edValorNaoRateado.Value := 0;
      edQtdeNaoRateada.Value  := TestaRateio;
   end else begin
      edPercNaoRateado.Value  := 0;
      edQtdeNaoRateada.Value  := 0;
      edValorNaoRateado.Value := TestaRateio;
   end;
end;

procedure TfrmRateioMT.dbgRateioDiferenciadoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   if (Field.FieldName='CODCENTROCUSTO') or (Field.FieldName='DESCCC') then ABrush.Color:=clBtnFace;
end;

procedure TfrmRateioMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  // Iguala o Cds de verificação de duplicidade de rateio
  cdsVerifRateio.EmptyDataSet;
  cdsVerifRateio.Data := cdsRateioxCCDif.Data;

// inicio  andré tavares - pendencia 18749 - 02/03/2005
//  cdsAux.data := cdsRateioxCCdif.data;
//  cdsAux.First;
// fim  andré tavares - pendencia 18749 - 02/03/2005


  cdsRateioxCCDif.Insert;
  cdsRateioxCCDif.FieldByName('IDEMPRESA').AsInteger  := Sistema.IdEmpresa;
  cdsRateioxCCDif.FieldByName('IDCONTRATO').AsInteger := iIdContrato;
  cdsRateioxCCDif.FieldByName('IDOBJETO').AsInteger   := iIdObjeto;
  cdsRateioxCCDif.FieldByName('IDITEM').AsInteger     := iIdItem;
  cdsRateioxCCDif.FieldByName('PARCELANUM').AsInteger := iParcNum; // Petri SOL 257896 PPM 1014759
  case rgpTipoRateio.ItemIndex of
    0 : cdsRateioxCCDif.FieldByName('DIVISOR').AsString := 'P';
    1 : cdsRateioxCCDif.FieldByName('DIVISOR').AsString := 'Q';
    2 : cdsRateioxCCDif.FieldByName('DIVISOR').AsString := 'V';
  end;

  // Edilaine - SOL 191844 / KTN 1822119
  cdsRateioxCCDif.FieldByName('IDPLANOPREV').AsInteger := ParamIdPlanoPrev;
  cdsRateioxCCDif.FieldByName('IDPATRO').AsInteger     := ParamIdPatro;

  cdsPlanoPrev.Locate('IDPLANOPREV', IntToStr(ParamIdPlanoPrev), []);
  cdsPatrocinador.locate('IDPESSOA', IntToStr(ParamIdPatro), []);
  // Edilaine - SOL 191844 / KTN 1822119 - fim

  //início -  andré tavares - pendencia 18749 - 02/03/2005
//  cdsRateioxCCDif.fieldByName('IDPESSOA').asInteger := cdsAux.fieldByName('IDPESSOA').asInteger;
//  cdsRateioxCCDif.fieldByName('CONTA').asString := cdsAux.fieldByName('CONTA').asString;
//  cdsRateioxCCDif.fieldByName('PLACONTA').asString := cdsAux.fieldByName('PLACONTA').asString;
  //fim -  andré tavares - pendencia 18749 - 02/03/2005

  // Ricardo A. SOL 104897
  // os dados vieram armazenados da criação do form
  AtualizaDadosDoObjeto();

  HabilitaBotao;
  dblcCentroCusto.SetFocus;
end;


procedure TfrmRateioMT.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if not cdsRateioxCCDif.IsEmpty then
  begin
     // Iguala o Cds de verificação de duplicidade de rateio
     cdsVerifRateio.EmptyDataSet;
     cdsVerifRateio.Data := cdsRateioxCCDif.Data;

     cdsRateioxCCDif.Edit;

     // Ricardo A. SOL 104897
     AtualizaDadosDoObjeto();

     HabilitaBotao;
     dblcCentroCusto.SetFocus;
  end;
end;

procedure TfrmRateioMT.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  if not cdsRateioxCCDif.IsEmpty then
  begin
     cdsRateioxCCDif.Delete;
     // Iguala o Cds de verificação de duplicidade de rateio
     cdsVerifRateio.EmptyDataSet;
     cdsVerifRateio.Data := cdsRateioxCCDif.Data;
     Exit;
  end;
end;



procedure TfrmRateioMT.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   if (Trim(dblcCentroCusto.Text) = '') then begin
      MsgDlg('Obrigatório preencher o Centro de Custo','Atenção',mtWarning,[mbOk],0);
      dblcCentroCusto.SetFocus;
      Exit;
   end;

   if Sistema.UsaPlanoPatro then begin
      if Trim(dblcPrograma.Text) = '' then begin
         MsgDlg('Obrigatório preencher o Programa','Erro',mtError,[mbOk],0);
         dblcPrograma.SetFocus;
         Exit;
      end;

      if Trim(dblcPlanoPrevC.Text) = '' then begin
         MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
         dblcPlanoPrevC.SetFocus;
         Exit;
      end;

      if Trim(dblcPatroC.Text) = '' then begin
         MsgDlg('Obrigatório preencher a Patrocinadora','Erro',mtError,[mbOk],0);
         dblcPatroC.SetFocus;
         Exit;
      end;
   end;

   if not DuplicidadeRateio then begin

      cdsRateioxCCDif.FieldByName('NOMEPROG').AsString         := dblcPrograma.Text;
      cdsRateioxCCDif.FieldByName('DESCCC').AsString           := dblcCentroCusto.Text;
      cdsRateioxCCDif.FieldByName('NOME_PLANO').AsString       := dblcPlanoPrevC.Text;
      cdsRateioxCCDif.FieldByName('NOME_PATRO').AsString       := dblcPatroC.Text;
      cdsRateioxCCDif.FieldByName('NOME_UNIDNEGOCIO').AsString := DBcboUnidNegocio.Text;

      AtualizaPlanoPatro;// Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

      cdsRateioxCCDif.Post;



      HabilitaBotao;
   end else begin
      MsgDlg('Já existe rateio cadastrado para os parâmetros informado','Erro',mtError,[mbOk],0);
      dblcCentroCusto.SetFocus;
   end;
end;

procedure TfrmRateioMT.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  cdsRateioxCCDif.Cancel;
  HabilitaBotao;
end;


procedure TfrmRateioMT.HabilitaBotao;
begin
  if cdsRateioxCCDif.State in [dsEdit, dsInsert] then begin;
     dbgRateioDiferenciado.SendToBack;
     sbtnInsDet.Enabled      := False;
     sbtnAltDet.Enabled      := False;
     sbtnExcluiDet.Enabled   := False;
     bbtnOkDet.Enabled       := True;
     bbtnCancelarDet.Enabled := True;
     if cdsRateioxCCDif.State = dsInsert then sbtnInsDet.Down := True;
     if cdsRateioxCCDif.State = dsEdit   then sbtnAltDet.Down := True;
  end else begin
     dbgRateioDiferenciado.BringToFront;
     sbtnInsDet.Enabled      := True;
     sbtnAltDet.Enabled      := True;
     sbtnExcluiDet.Enabled   := True;
     sbtnInsDet.Down         := False;
     sbtnAltDet.Down         := False;
     sbtnExcluiDet.Down      := False;
     bbtnOkDet.Enabled       := False;
     bbtnCancelarDet.Enabled := False;
  end;
end;


function TfrmRateioMT.DuplicidadeRateio: Boolean;
begin
   Result := False;
   cdsVerifRateio.First;
   while not cdsVerifRateio.Eof do begin
      if (cdsVerifRateio.RecNo <> cdsRateioxCCDif.RecNo ) and
         (cdsVerifRateio.FieldbyName('CODCENTROCUSTO').AsString = cdsRateioxCCDif.FieldByName('CODCENTROCUSTO').AsString ) and
         (cdsVerifRateio.FieldbyName('IDPROGRAMA').AsInteger    = cdsRateioxCCDif.FieldByName('IDPROGRAMA').AsInteger    ) and
         (cdsVerifRateio.FieldbyName('IDPLANOPREV').AsInteger   = cdsRateioxCCDif.FieldByName('IDPLANOPREV').AsInteger   ) and
         (cdsVerifRateio.FieldbyName('IDPATRO').AsInteger       = cdsRateioxCCDif.FieldByName('IDPATRO').AsInteger       ) and
         (cdsVerifRateio.FieldbyName('UNIDNEGOC').AsInteger     = cdsRateioxCCDif.FieldByName('UNIDNEGOC').AsInteger     ) then begin
         Result := True;
         Exit;
      end;
      cdsVerifRateio.Next;
   end;
end;



procedure TfrmRateioMT.AtualizaDadosDoObjeto;
begin
   // Ricardo A. SOL 104897
  cdsRateioxCCDif.fieldByName('IDPESSOA').asInteger := FIdPessoa;
  cdsRateioxCCDif.fieldByName('CONTA').asString := FConta;
  cdsRateioxCCDif.fieldByName('PLACONTA').asString := FPlaConta;
end;


// Edilaine - SOL 191844 / KTN 1822119        PN
procedure TfrmRateioMT.dblcCentroCustoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
  iPrograma  : integer;
  sCodTipRecDes : string;
begin
  if cdsRateioxCCDif.State in [dsEdit, dsInsert] then
  begin

    iPrograma := -1;
    sCodTipRecDes := '';

    if trim(dblcCentroCusto.text) <> EmptyStr then
    Begin
       iPrograma := strtoint(CtrlListTerc.ProgramaxCCxDesembolso( iIdContrato, iIdItem, iIdObjeto, StrToInt(dblcCentroCusto.LookUpValue), 'P'));
       cdsRateioxCCDif.FieldByName('IDPROGRAMA').AsInteger := iPrograma;

       // Paulo Nobre - WO15797 - Inicio
       sCodTipRecDes := CtrlListTerc.ProgramaxCCxDesembolso( iIdContrato, iIdItem, iIdObjeto, StrToInt(dblcCentroCusto.LookUpValue), 'D'); // Desembolso
       cdsRateioxCCDif.FieldByName('CODTIPRECDES').AsString := sCodTipRecDes;
       // Paulo Nobre - WO15797 - Fim
    End;
    
    cdsPrograma.Locate('IDPROGRAMA', iPrograma, []);
  end;
end;

procedure TfrmRateioMT.dblcCentroCustoChange(Sender: TObject);
begin
  if cdsRateioxCCDif.State in [dsEdit, dsInsert] then
  begin
    if trim(dblcCentroCusto.text) = EmptyStr then
    begin
      cdsRateioxCCDif.FieldByName('IDPROGRAMA').AsInteger := -1;
      cdsPrograma.Locate('IDPROGRAMA', -1, []);
    end;
  end;
end;
// Edilaine - SOL 191844 / KTN 1822119 - fim

// Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
procedure TfrmRateioMT.AtualizaPlanoPatro;
var
  recPlanoPatro: TDadosFinanceiro;
  // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
  _descricaoPatrocinadora, _descricaoPlanoPrevidenciario : String; // Armazena a descricao de plano e patro de origem
begin

  if cdsRateioxCCDif.State in [ dsEdit, dsInsert ] then
  begin

      recPlanoPatro := _oDocumento.LocalizaPlanoPatroFinanceiro(
                        IdPessoa,
                        //         _oDocumento.Codportforma,
                        CODPORTFORMA,
                        IDForCli ,
                        cdsRateioxCCDif.FieldByName( 'IDPATRO' ).AsInteger,
                        cdsRateioxCCDif.FieldByName( 'IDPLANOPREV' ).AsInteger,
                        cdsRateioxCCDif.FieldByName( 'IDPROGRAMA' ).AsInteger,
                        'P', // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                        cdsRateioxCCDif.FieldByName( 'CODCENTROCUSTO' ).AsString,
                        IFF(cdsRateioxCCDif.FieldByName( 'CODTIPRECDES' ).AsString = '', CodTipRecDes,cdsRateioxCCDif.FieldByName( 'CODTIPRECDES' ).AsString) // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                        );

      // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
      if (cdsRateioxCCDif.FieldByName( 'IDPLANOPREV' ).AsInteger <> recPlanoPatro.IdPlanoFinanceiro) then begin
        cdsRateioxCCDif.FieldByName( 'PLANOORIGEM' ).AsInteger := cdsRateioxCCDif.FieldByName( 'IDPLANOPREV' ).AsInteger;
        cdsRateioxCCDif.FieldByName( 'PATROORIGEM' ).AsInteger := cdsRateioxCCDif.FieldByName( 'IDPATRO' ).AsInteger;
        _descricaoPatrocinadora       := cdsRateioxCCDif.FieldByName( 'NOME_PATRO' ).AsString;
        _descricaoPlanoPrevidenciario := cdsRateioxCCDif.FieldByName( 'NOME_PLANO' ).AsString;
      end;
      // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

      //cdsRateioxCCDif.FieldByName( 'IDPATRO' ).AsInteger := recPlanoPatro.IdPatroFinanceiro; // Peterson Victor SIG27691
      //cdsRateioxCCDif.FieldByName( 'NOME_PATRO' ).AsString := recPlanoPatro.NomePatroFinanceiro;
      //cdsRateioxCCDif.FieldByName( 'IDPLANOPREV' ).AsInteger := recPlanoPatro.IdPlanoFinanceiro; // Peterson Victor SIG27691
      //cdsRateioxCCDif.FieldByName( 'NOME_PLANO' ).AsString := recPlanoPatro.DescPlanoFinanceiro;

      dblcPlanoPrevC.text  := IFF(_descricaoPlanoPrevidenciario = '', recPlanoPatro.DescPlanoFinanceiro, _descricaoPlanoPrevidenciario);
      dblcPatroC.text      := IFF(_descricaoPatrocinadora = '', recPlanoPatro.NomePatroFinanceiro, _descricaoPatrocinadora);

     //edilaine SIG117244 : inicio
     if (cdsRateioxCCDif.FieldByName( 'CODTIPRECDES' ).AsString = '') then
        cdsRateioxCCDif.FieldByName( 'CODTIPRECDES' ).AsString := CodTipRecDes;
     //edilaine SIG117244 : fim


      With cdsRateioxCCDif.FieldByName( 'TipoDespesa' ) do
        if recPlanoPatro.ReceitaDespesaAdministrativa Then
           AsInteger := 1
        Else
           AsInteger := 2;
  end;
end;
// Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

// Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
function TfrmRateioMT.IFF(Condicao: boolean; Primeiro,
  Segundo: string): string;
begin
  if Condicao then begin
    IFF := Primeiro;
  end else  begin
    IFF := Segundo;
  end;
end;
// Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

end.
