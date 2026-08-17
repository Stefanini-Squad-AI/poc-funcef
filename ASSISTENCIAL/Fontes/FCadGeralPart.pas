// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 14.10.2003
// Alteração   : Melhoria nas captions para esclarecer melhor cada item da tela
//------------------------------------------------------------------------------
unit FCadGeralPart;

interface
                   
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, DBCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls, Grids, DBGrids, DBCGrids, ComCtrls, Menus,  ImgList,
  CmEventosCadastro, fcButton, fcImgBtn, fcShapeBtn, URegra, Wwdbigrd,
  Wwdbgrid ;

type
  TfrmCadGeralPart = class(TfrmCadastroCS)
    dsPlano: TwwDataSource;
    qryBenef: TwwQuery;
    dsBenef: TwwDataSource;
    qryBenefIDPESSOA: TFloatField;
    qryBenefNOME: TStringField;
    qryBenefDATAENTRADA: TDateTimeField;
    qryBenefDTCANCELAMENTO: TDateTimeField;
    qryBenefDATANASC: TDateTimeField;
    qryBenefIDADE: TFloatField;
    qryBenefSEXO: TStringField;
    qryBenefESTCIVIL: TStringField;
    qryBenefDEPENDENTE: TStringField;
    qryBenefDEPENDENCIA: TStringField;
    qryBenefLEGAL: TStringField;
    pcBenef: TPageControl;
    tsBenef: TTabSheet;
    tsCancel: TTabSheet;
    DBGrid1: TDBGrid;
    gbDetalhes: TGroupBox;
    Label15: TLabel;
    DBText14: TDBText;
    Label16: TLabel;
    DBText15: TDBText;
    DBText16: TDBText;
    Label17: TLabel;
    Label18: TLabel;
    DBText17: TDBText;
    Label19: TLabel;
    DBText18: TDBText;
    Label20: TLabel;
    DBText19: TDBText;
    Label21: TLabel;
    DBText20: TDBText;
    Label34: TLabel;
    DBText33: TDBText;
    qryBenefCAMPODATA: TStringField;
    DBGrid2: TDBGrid;
    gbDetalhes1: TGroupBox;
    Label8: TLabel;
    DBText9: TDBText;
    Label13: TLabel;
    DBText12: TDBText;
    DBText13: TDBText;
    Label14: TLabel;
    Label24: TLabel;
    DBText23: TDBText;
    Label25: TLabel;
    DBText24: TDBText;
    Label26: TLabel;
    DBText25: TDBText;
    Label28: TLabel;
    DBText26: TDBText;
    Label29: TLabel;
    DBText27: TDBText;
    Label30: TLabel;
    DBText28: TDBText;
    pcPart: TPageControl;
    tsPrincipal: TTabSheet;
    tsGeral: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    LblTitular: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label5: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    Label1: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    DBText8: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    DBText10: TDBText;
    lblData: TLabel;
    Label23: TLabel;
    DBText22: TDBText;
    Label12: TLabel;
    DBText11: TDBText;
    Label27: TLabel;
    lblConta: TLabel;
    Label22: TLabel;
    DBText21: TDBText;
    lblTitular2: TLabel;
    DBText29: TDBText;
    pmAtalho: TPopupMenu;
    Toolbar972: TToolbar97;
    tbInserir: TToolbarButton97;
    tbAlterar: TToolbarButton97;
    tbCancelar: TToolbarButton97;
    tbExcluir: TToolbarButton97;
    Participante1: TMenuItem;
    Planos1: TMenuItem;
    Beneficirios1: TMenuItem;
    pmAtalhoAlt: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PlanoInscrito1: TMenuItem;
    DatadeEntrada1: TMenuItem;
    FormadePagamento1: TMenuItem;
    DatadeCancelamento1: TMenuItem;
    DataEntrada1: TMenuItem;
    DBText30: TDBText;
    Label31: TLabel;
    Label32: TLabel;
    DBText31: TDBText;
    qryBenefOBSCANCEL: TStringField;
    qryCHAVE: TFloatField;
    qryMATRICULA: TStringField;
    qryINSCRICAONUMERO: TFloatField;
    qrySITUACAO: TStringField;
    qryNOME: TStringField;
    qryDATANASC: TDateTimeField;
    qryIDADE: TFloatField;
    qrySEXO: TStringField;
    qryESTCIVIL: TStringField;
    qryPATROCINADORA: TStringField;
    qryDEPENDENTE: TStringField;
    qryDEPENDENCIA: TStringField;
    qryLEGAL: TStringField;
    qryIDPLANOPREV: TFloatField;
    qryPREVIDENCIARIO: TStringField;
    qryINSCRICAODATA: TDateTimeField;
    qryNOME_FALECIDO: TStringField;
    qryENDERECO: TStringField;
    qryCONTA: TStringField;
    qryPlano: TwwQuery;
    qryPlanoIDPESSOA: TFloatField;
    qryPlanoINSCRICAONUMERO: TStringField;
    qryPlanoIDPLANASS: TFloatField;
    qryPlanoBENEFICIARIO: TStringField;
    qryPlanoPLANO: TStringField;
    qryPlanoDATAENTRADA: TDateTimeField;
    qryPlanoDATACANCELAMENTO: TDateTimeField;
    qryPlanoFORMA_PAGAMENTO: TStringField;
    DataCancelamento1: TMenuItem;
    qryInfPlano: TwwQuery;
    DsInfPlano: TwwDataSource;
    qryRegraIn: TwwQuery;
    qryIdRegra: TwwQuery;
    qryIdRegraIDREGRA: TFloatField;
    qryIdRegraIDDEPENDENTE: TFloatField;
    qryIdRegraIDTITULAR: TFloatField;
    qryIdRegraIDPESSJUR: TFloatField;
    qryIdRegraIDPLANOPREV: TFloatField;
    qryIdRegraIDPLANASS: TFloatField;
    qryInfPlanoIDCAPSEGASS: TFloatField;
    qryInfPlanoIDPLANASS: TFloatField;
    qryInfPlanoTIPOSEG: TStringField;
    qryInfPlanoCAPITALMN: TFloatField;
    qryInfPlanoCAPITALIP: TFloatField;
    qryInfPlanoCAPITALMA: TFloatField;
    qryInfPlanoPREMIOFXA: TFloatField;
    qryInfPlanoPREMIOFXB: TFloatField;
    qryInfPlanoPREMIOFXC: TFloatField;
    qryInfPlanoPREMIOFXD: TFloatField;
    qryInfPlanoDESCPLANO: TStringField;
    qryInfPlanoDTVIGENCIA: TDateTimeField;
    qryInfPlanoFLGVIGENCIA: TStringField;
    Contribuio1: TMenuItem;
    qryPlanoIDCONTASS: TFloatField;
    qryPlanoIDPLANOPREV: TFloatField;
    Cobranadiferenciada1: TMenuItem;
    qryCOBDIF: TStringField;
    qryPlanoCONTRIBUICAO: TStringField;
    qryPlanoCOBDIF: TStringField;
    pcPlano: TPageControl;
    tsPlano: TTabSheet;
    dbgPlano: TDBGrid;
    tsInfPlano: TTabSheet;
    DbgInfPlano: TDBGrid;
    GroupBox1: TGroupBox;
    LbValor: TLabel;
    pnlDescPlano: TPanel;
    TabSheet1: TTabSheet;
    gbHistPlano: TGroupBox;
    qryHistPlano: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    dsHistPlano: TwwDataSource;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure qryPlanoAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qryBenefAfterScroll(DataSet: TDataSet);
    procedure pcBenefChange(Sender: TObject);
    procedure Participante1Click(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure CmeCadastroFind(Sender: TObject);
    procedure Planos1Click(Sender: TObject);
    procedure Beneficirios1Click(Sender: TObject);
    procedure PlanoInscrito1Click(Sender: TObject);
    procedure DatadeEntrada1Click(Sender: TObject);
    procedure FormadePagamento1Click(Sender: TObject);
    procedure DatadeCancelamento1Click(Sender: TObject);
    procedure DataEntrada1Click(Sender: TObject);
    procedure DataCancelamento1Click(Sender: TObject);
    procedure tbInserirClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure FcShapeInfPlanoClick(Sender: TObject);
    procedure Contribuio1Click(Sender: TObject);
    procedure Cobranadiferenciada1Click(Sender: TObject);
    procedure tsInfPlanoShow(Sender: TObject);
  private
    { Private declarations }
    ValorCalculado: Double;
    bCancelPlano: Boolean;
   Function VerificaFaixa(V1,V2,V3,V4,Pr:Double): Byte;
    Procedure CalculaContribuicao;
  public
    { Public declarations }
    vIdPessoa, iIdTitular, iIdPlanAss, iIdPlanoPrev,
    iIdPessJur, iIdFilial, iMenu                     : Integer;
    sMatricula, sInscricao, sOpcao                   : String;
    sValorAtual, sLblAtual, sLblNovo                 : String;
  end;

var
  frmCadGeralPart: TfrmCadGeralPart;

implementation

uses fInserePart, FTelaAut, fCadDepTitPlanAss, fAlteraDados, fCancelar, UAdmAss,
     uSistema;

{$R *.DFM}

Function TFrmCadGeralPart.VerificaFaixa(V1,V2,V3,V4,Pr:Double): Byte;
Var Rt: Double;
    Fx: Byte;
begin
  Fx:=0; 
  If Pr>V1 then
    Rt:=Pr-V1
  else Rt:=V1-Pr;
  If Rt < 0.05 then
    Fx:=4; {Fx = Número da coluna do dbGrid}

  If Fx=0 then
  begin
    If Pr>V2 then Rt:=Pr-V2
    else Rt:=V2-Pr;
    If Rt<0.05 then Fx:=5;
  end;
  If Fx=0 then
  begin
    If Pr>V3 then Rt:=Pr-V3
    else Rt:=V3-Pr;
    If Rt<0.05 then Fx:=6;
  end;
  If Fx=0 then
  begin
    If Pr>V4 then Rt:=Pr-V4
    else Rt:=V4-Pr;
    If Rt<0.05 then Fx:=7
  end;
  Result:=Fx;
end;

Procedure TfrmCadGeralPart.CalculaContribuicao;
Var Regra: TRegra;
    ErroRegra: Boolean;
    Vl1, Vl2, Vl3, Vl4: Real;
    iInd: Byte;
begin
  ErroRegra:=False;
  ValorCalculado:=0;

  DbgInfPlano.Columns[4].Color:=ClWindow;
  DbgInfPlano.Columns[5].Color:=ClWindow;
  DbgInfPlano.Columns[6].Color:=ClWindow;
  DbgInfPlano.Columns[7].Color:=ClWindow;
  (* Identificação da Regra *)
  qryIdRegra.Close;

  (* Query de plano ==> Acha os planos em que o titular se inscreveu *)
  qryPlano.Close;
  qryPlano.ParamByName('IDPESSOA').asInteger := StrToIntDef(qry.FieldByName('CHAVE').AsString,0);
  qryPlano.ParamByName('IDPLANOPREV').asInteger := StrToIntDef(qry.FieldByName('IDPLANOPREV').AsString,0);
  qryPlano.Open;

  (* Consulta específica do Plano *)
  (* ========= TABELA DE CAPITAIS DE SEGURO ========= *)
  qryInfPlano.Close;
  qryInfPlano.ParamByName('IDPLANASS').asInteger := StrToIntDef(QryPlano.FieldByName('IDPLANASS').AsString,0);
  qryInfPlano.Open;
  (* First p/ pegar a faixa do Titular na tabela capsegass *)
  qryInfPlano.First;
  DbgInfPlano.Visible:= Not qryInfPlano.IsEmpty;
  (* ================================================ *)

  qryIdRegra.ParamByName('IDTITULAR').asInteger := StrToIntDef(qry.FieldByName('CHAVE').AsString,0);
  qryIdRegra.ParamByName('IDPLANASS').asInteger := StrToIntDef(qryInfPlano.FieldByName('IDPLANASS').AsString,0);
  qryIdRegra.Open;
  If (qryIdRegra.IsEmpty)Or
      (Trim(qryIdRegra.FieldByName('IDREGRA').AsString) = '') then
  begin
    ErroRegra:=True;
    qryIdRegra.Close;
  end;
  Regra:=TRegra.Create(Nil);
  Regra.Activated:=False;
  Regra.DataBaseName:='BaseDados';
  Regra.queryIn:= qryRegraIn;

  qryRegraIn.Close;
  qryRegraIn.ParamByName('IDTITULAR').Value    := StrToIntDef(qryIdRegra.FieldByName('IDTITULAR').AsString,0);
  qryRegraIn.ParamByName('IDDEPENDENTE').Value := StrToIntDef(qryIdRegra.FieldByName('IDDEPENDENTE').AsString,0);
  qryRegraIn.ParamByName('IDPESSJUR').Value    := StrToIntDef(qryIdRegra.FieldByName('IDPESSJUR').AsString,0);
  qryRegraIn.ParamByName('IDPLANOPREV').Value  := StrToIntDef(qryIdRegra.FieldByName('IDPLANOPREV').AsString,0);
  qryRegraIn.ParamByName('IDPLANASS').Value    := StrToIntDef(qryIdRegra.FieldByName('IDPLANASS').AsString,0);
  qryRegraIn.ParamByName('MESREF').Value       := Copy(DateToStr(Date),7,4)+'/'+Copy(DateToStr(Date),4,2);
  try
    qryRegraIn.Open;
  except
    on E:Exception do ErroRegra:=True;
  end; {try..except}
  Regra.iDeMPRESA := sISTEMA.iDeMPRESA;
  Regra.RuleName := qryIdRegra.FieldByName('IDREGRA').AsString;
  try
    Regra.Execute;
//    regra.passoapasso;
  except
    on E:Exception do ErroRegra:=True;
  end; {try..except}

  (* Verifica o valor de Resultado da Regra *)
  If regra.Result = 'N' then ErroRegra:=True
  else ValorCalculado := StrFloat(ClienteNumero(regra.Result),0);

  Regra.Activated:=False;
  Regra.Free;

  If ErroRegra then
  begin
    ValorCalculado:=0;
    LbValor.Caption:= FormatFloat('###,###,##0.00',ValorCalculado);
  end
  else
  (* TABELA DE CAPITAIS DE SEGURO *)
  If Not qryInfPlano.IsEmpty then
  begin
    // tavares 22/04/2003
    qryInfPlano.Locate('TIPOSEG', 'TITULAR', []);

    Vl1:=StrFloat(qryInfPlanoPREMIOFXA.AsString,0);
    Vl2:=StrFloat(qryInfPlanoPREMIOFXB.AsString,0);
    Vl3:=StrFloat(qryInfPlanoPREMIOFXC.AsString,0);
    Vl4:=StrFloat(qryInfPlanoPREMIOFXD.AsString,0);
    iInd:= VerificaFaixa(Vl1,Vl2,Vl3,Vl4,ValorCalculado);
    If iInd=0 then
    begin
      (* P/ somar o valor do conjuge na tabela capsegass *)
    // tavares 22/04/2003
    qryInfPlano.Locate('TIPOSEG', 'CONJUGE', []);
   //      qryInfPlano.Next;
      Vl1:=Vl1+StrFloat(qryInfPlanoPREMIOFXA.AsString,0);
      Vl2:=Vl2+StrFloat(qryInfPlanoPREMIOFXB.AsString,0);
      Vl3:=Vl3+StrFloat(qryInfPlanoPREMIOFXC.AsString,0);
      Vl4:=Vl4+StrFloat(qryInfPlanoPREMIOFXD.AsString,0);
      iInd:= VerificaFaixa(Vl1,Vl2,Vl3,Vl4,ValorCalculado);
    end;
    If iInd In [0,4..7] then DbgInfPlano.Columns[VerificaFaixa(Vl1,Vl2,Vl3,Vl4,ValorCalculado)].Color:= clYellow;//$00CEFFFF;
    LbValor.Caption:= FormatFloat('###,###,##0.00',ValorCalculado);
  end {Tabela de Capitais de Seguro}
  else
   begin
     {Ainda não implementado para outro tipo de plano}
   end;
end;

procedure TfrmCadGeralPart.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  DbgInfPlano.Visible:=False;
  PcPlano.ActivePage:=tsPlano;
  LbValor.Caption:='';
  bCancelPlano:=False;
  if MontaSelect.RetornouValor Then
  begin
     (* Query de busca ==> Acha o participante (vivo ou falecido)       *)
     qry.close;
     qry.ParamByName('IDPESSOA').asInteger := StrToIntDef(MontaSelect.ValoresChave[1],0) ;
     qry.Open;

     (* Query de plano ==> Acha os planos em que o titular se inscreveu *)
     qryPlano.Close;
     qryPlano.ParamByName('IDPESSOA').asInteger := StrToIntDef(qry.FieldByName('CHAVE').AsString,0);
     qryPlano.ParamByName('IDPLANOPREV').asInteger := StrToIntDef(qry.FieldByName('IDPLANOPREV').AsString,0);

     qryPlano.Open;

     (* Consulta específica do Plano *)
     (* ========= TABELA DE CAPITAIS DE SEGURO ========= *)
     qryInfPlano.Close;
     qryInfPlano.ParamByName('IDPLANASS').asInteger := StrToIntDef(QryPlano.FieldByName('IDPLANASS').AsString,0);
     qryInfPlano.Open;
     (* ================================================ *)

     (* Query Histórico de planos *)
     qryHistPlano.Close;
     qryHistPlano.ParamByName('IDPESSOA').asInteger := StrToIntDef(qry.FieldByName('CHAVE').AsString,0);
     qryHistPlano.Open;

     (* Query de beneficiário ==> acha os beneficiários de cada plano   *)
     qryBenef.Close;
     qryBenef.ParamByName('IDTITULAR').AsInteger:=StrToIntDef(qryPlanoIDPESSOA.AsString,0);
     qryBenef.ParamByName('IDPLANASS').AsInteger:=StrToIntDef(qryPlanoIDPLANASS.AsString,0);
     qryBenef.Open;
     (* Verifica se o grupo familiar possui um responsável *)
     (* Tabela para Referencia : GrupoFamAss *)
     pcPart.ActivePage:=tsPrincipal;
     pcBenef.ActivePage:=tsBenef;
     qryBenef.Filter:='CAMPODATA='+chr(39)+'S'+chr(39);
     qryBenef.Filtered:=True;
     if qryNOME_FALECIDO.asString <> '' then
     begin
       lbltitular.Visible:=True;
       lbltitular2.Visible:=True;
     end
     Else
     begin
       lbltitular.Visible:=False;;
       lbltitular2.Visible:=False;;
     end;
     If qryCONTA.AsString = 'BANCO Nº Ag. - C/C ' then
      lblConta.Caption:='NÃO POSSUI CONTA CADASTRADA'
     else lblConta.Caption:=qryCONTA.AsString;
     lblData.Caption:=DateTimeToStr(qryDATANASC.AsDateTime)+ ' ('+qryIDADE.AsString+' ANOS)';
  end;
end ;

procedure TfrmCadGeralPart.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  pnlfundo.Enabled:=True;
end;

procedure TfrmCadGeralPart.qryPlanoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryBenef.Close;
  qryBenef.ParamByName('IDTITULAR').AsInteger:=StrToIntDef(qryPlanoIDPESSOA.AsString,0);
  qryBenef.ParamByName('IDPLANASS').AsInteger:=StrToIntDef(qryPlanoIDPLANASS.AsString,0);
  qryBenef.Open;
  If pcBenef.ActivePage=tsBenef Then
  Begin
    qryBenef.Filter:='CAMPODATA='+chr(39)+'S'+chr(39);
    qryBenef.Filtered:=True;
  End
   Else
    Begin
      qryBenef.Filter:='CAMPODATA='+chr(39)+'N'+chr(39);
      qryBenef.Filtered:=True;
    End;
end;

procedure TfrmCadGeralPart.FormShow(Sender: TObject);
begin
  inherited;
  vIdPessoa:=0;
  pcPart.ActivePage:=tsPrincipal;
  pcBenef.ActivePage:=tsBenef;
  LbValor.Caption:='';
end;

procedure TfrmCadGeralPart.qryBenefAfterScroll(DataSet: TDataSet);
begin
  inherited;
  gbDetalhes.Caption:=' Detalhes de '+qryBenefNOME.AsString+' ';
  gbDetalhes1.Caption:=' Detalhes de '+qryBenefNOME.AsString+' ';
end;

procedure TfrmCadGeralPart.pcBenefChange(Sender: TObject);
begin
  inherited;
  If pcBenef.ActivePage=tsBenef Then
  Begin
    qryBenef.Filter:='CAMPODATA='+chr(39)+'S'+chr(39);
    qryBenef.Filtered:=True;
  End
  Else
  Begin
    qryBenef.Filter:='CAMPODATA='+chr(39)+'N'+chr(39);
    qryBenef.Filtered:=True;
  End;
end;

procedure TfrmCadGeralPart.Participante1Click(Sender: TObject);
begin
  inherited;
  sOpcao:='PART';    (* Variavel de escolha => PARTICIPANTE *)
  If tbInserir.Down Then
  Begin
    tbInserir.Down:=False;
    FrmCadGeralPart.WindowState:=wsMinimized;
    AbrirForm(frmInserePart, TfrmInserePart, false);
  End;
  If tbCancelar.Down Then
  Begin
    tbCancelar.Down:=False;
    iMenu:=1;
    FrmCadGeralPart.WindowState:=wsMinimized;
    AbrirForm(frmCancelar, TfrmCancelar, false);
  End;
end;

procedure TfrmCadGeralPart.Planos1Click(Sender: TObject);
begin
  inherited;
  sOpcao:='PLAN';      (* Variavel de escolha => PLANO *)
  If tbInserir.Down Then
  Begin
    vIdPessoa:=StrToIntDef(qryChave.AsString,0);
    tbInserir.Down:=False;
    WindowState:=wsMinimized;
    bbtnSair.Enabled:=False;
    AbrirForm(frmInserePart, TfrmInserePart, false);
  End;
  If tbCancelar.Down Then
  Begin
    tbCancelar.Down:=False;
    iMenu:=2;
    FrmCadGeralPart.WindowState:=wsMinimized;
    AbrirForm(frmCancelar, TfrmCancelar, false);
  End;
end;

procedure TfrmCadGeralPart.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  tbAlterar.Enabled:=True;
  tbExcluir.Enabled:=True;
  tbCancelar.Enabled:=True;
  Planos1.Enabled:=True;
  Beneficirios1.Enabled:=True;
end;

procedure TfrmCadGeralPart.Beneficirios1Click(Sender: TObject);
var qryPart : TQuery;
    sSql    : String;
begin
  If tbCancelar.Down Then
  Begin
    tbCancelar.Down:=False;
    iMenu:=3;
    FrmCadGeralPart.WindowState:=wsMinimized;
    AbrirForm(frmCancelar, TfrmCancelar, false);
    Exit;
  End;
  tbInserir.Down:=False;
  iIdTitular   := 0;
  iIdPlanAss   := 0;
  iIdPlanoPrev := 0;
  iIdPessJur   := 0;
  iIdFilial    := 0;
  sMatricula   := '';
  sInscricao   := '';
  inherited;
  qryPart:=TQuery.Create(Application);
  With qryPart do
  Begin
    SQL.Clear;
    sSQL := 'SELECT '+
            '  PA.IDPESSOA,       '+
            '  PA.IDPLANASS,      '+
            '  PA.IDPLANOPREV,    '+
            '  PA.IDPESSJUR,      '+
            '  EL.IDESTAB,        '+
            '  EL.MATRICULA,      '+
            '  PV.INSCRICAONUMERO '+
            'FROM'+
            '   PESSOA          PE,'+
            '   PESSOA          PJ,'+
            '   PLANASS         PN,'+
            '   PARTASS         PA,'+
            '   PLANPREV        PN,'+
            '   PARTPREVPLAN    PV,'+
            '   ELEGPATRO       EL,'+
            '   PESSOA          FI '+
            'WHERE '+
            '   (PV.INSCRICAONUMERO = '''+qryINSCRICAONUMERO.asString+''') AND'+
            '   (PN.FLGATIVO        = 1)               AND'+
            '   (EL.IDPESSOA        = PE.IDPESSOA)     AND'+
            '   (EL.IDPESSJUR       = PJ.IDPESSOA)     AND'+
            '   (PA.IDPESSOA        = EL.IDPESSOA)     AND'+
            '   (PA.IDPESSJUR       = EL.IDPESSJUR)    AND'+
            '   (PA.IDPLANASS       = PN.IDPLANASS)    AND'+
            '   (PA.IDPLANOPREV     = PN.IDPLANOPREV)  AND'+
            '   (PV.IDPESSOA        = PA.IDPESSOA)     AND'+
            '   (PV.IDPESSJUR       = PA.IDPESSJUR)    AND'+
            '   (PV.IDPLANOPREV     = PA.IDPLANOPREV)  AND'+
//            '   (PV.FLGDESATIVADO   = 0) AND'+   // FERNANDO P. 16261 - 06/04/2004
            '   (FI.IDPESSOA(+)     = EL.IDESTAB)';
    SQL.Add(sSQL);
    DataBaseName:='BaseDados';
    Open;
  End;
//
  iIdTitular      := StrToIntDef(qryPart.FieldByName('IDPESSOA').AsString,0);
  iIdPlanAss      := StrToIntDef(qryPart.FieldByName('IDPLANASS').AsString,0);
  iIdPlanoPrev    := StrToIntDef(qryPart.FieldByName('IDPLANOPREV').AsString,0);
  iIdPessJur      := StrToIntDef(qryPart.FieldByName('IDPESSJUR').AsString,0);
  if qryPart.FieldByName('IDESTAB').AsString <> ''  then
   iIdFilial := StrToIntDef(qryPart.FieldByName('IDESTAB').AsString,0);
  sMatricula      := qryPart.FieldByName('MATRICULA').AsString;
  sInscricao      := qryPart.FieldByName('INSCRICAONUMERO').AsString;
//
  AbrirForm(frmCadDepTitPlanAss, TfrmCadDepTitPlanAss, false);
end;

procedure TfrmCadGeralPart.PlanoInscrito1Click(Sender: TObject);
begin
  inherited;
  (* Solicitação de alteração do plano inscrito *)
  sLblAtual:='Plano atualmente inscrito';
  sValorAtual:=qryPlanoPLANO.AsString;
  sLblNovo:='Alterar plano para';
  iMenu:=1;
  WindowState:=wsMinimized;
  AbrirFormModal(FrmAlteraDados, TFrmAlteraDados);
end;

procedure TfrmCadGeralPart.DatadeEntrada1Click(Sender: TObject);
begin
  inherited;
  (* Solicitação de alteração do data de entrada *)
  sLblAtual:='Data de entrada atual';
  sValorAtual:=qryPlanoDATAENTRADA.AsString;
  sLblNovo:='Alterar data de entrada para ';
  iMenu:=2;
  WindowState:=wsMinimized;
  AbrirFormModal(FrmAlteraDados, TFrmAlteraDados);
end;

procedure TfrmCadGeralPart.FormadePagamento1Click(Sender: TObject);
begin
  inherited;
  sLblAtual:='Forma de pagamento atual';
  sValorAtual:='';
  sLblNovo:='Alterar Forma de pagamento para ';
  iMenu:=3;
  WindowState:=wsMinimized;
  AbrirFormModal(FrmAlteraDados, TFrmAlteraDados);
end;

procedure TfrmCadGeralPart.Contribuio1Click(Sender: TObject);
begin
  inherited;
  sLblAtual:='Tipo de Cobrança atual';
  sValorAtual:='';
  sLblNovo:='Alterar Tipo de Cobrança para ';
  iMenu:=4;
  WindowState:=wsMinimized;
  AbrirFormModal(FrmAlteraDados, TFrmAlteraDados);
end;

procedure TfrmCadGeralPart.DatadeCancelamento1Click(Sender: TObject);
begin
  inherited;
  sLblAtual:='Data de Cancelamento atual';
  sValorAtual:=qryPlanoDATAENTRADA.AsString;
  sLblNovo:='Alterar Data de Cancelamento para ';
  iMenu:=5;
  WindowState:=wsMinimized;
  AbrirFormModal(FrmAlteraDados, TFrmAlteraDados);
end;

procedure TfrmCadGeralPart.DataEntrada1Click(Sender: TObject);
begin
  inherited;
  (* Solicitação de alteração do data de entrada do beneficiário *)
  sLblAtual:='Data de entrada do beneficiário atual';
  sValorAtual:=qryPlanoDATAENTRADA.AsString;
  sLblNovo:='Alterar data de entrada do beneficiário para ';
  iMenu:=6;
  WindowState:=wsMinimized;
  AbrirFormModal(FrmAlteraDados, TFrmAlteraDados);
end;

procedure TfrmCadGeralPart.DataCancelamento1Click(Sender: TObject);
begin
  inherited;
  (* Solicitação de alteração do data de entrada do beneficiário *)
  sLblAtual:='Data de entrada do beneficiário atual';
  sValorAtual:=qryPlanoDATAENTRADA.AsString;
  sLblNovo:='Alterar data de entrada do beneficiário para ';
  iMenu:=7;
  WindowState:=wsMinimized;
  AbrirFormModal(FrmAlteraDados, TFrmAlteraDados);
end;

procedure TfrmCadGeralPart.tbInserirClick(Sender: TObject);
begin
  inherited;
  tbInserir.Down:=True;
end;

procedure TfrmCadGeralPart.tbCancelarClick(Sender: TObject);
begin
  inherited;
  tbCancelar.Down:=True;
  If qry.IsEmpty then pmAtalho.Items[2].Enabled:=False
  else pmAtalho.Items[2].Enabled:=True;
  If qryBenef.IsEmpty then pmAtalho.Items[2].Enabled:=False
  else pmAtalho.Items[2].Enabled:=True;
end;

procedure TfrmCadGeralPart.FcShapeInfPlanoClick(Sender: TObject);
begin
  inherited;
  LbValor.Caption:='';
 // LbPlano.Caption:='PLANOS INSCRITOS:';

//  If (qryPlano.FieldByName('DATACANCELAMENTO').IsNull)And
//      (Not qryPlano.IsEmpty) then
//  begin
    CalculaContribuicao;
//  end;

end;

procedure TfrmCadGeralPart.Cobranadiferenciada1Click(Sender: TObject);
begin
  inherited;
  sLblAtual:='Cobrança diferenciada atual';
  sValorAtual:=qryCOBDIF.AsString;
  sLblNovo:='Alterar cobrança diferenciada para ';
  iMenu:=8;
  WindowState:=wsMinimized;
  AbrirFormModal(FrmAlteraDados, TFrmAlteraDados);
end;

procedure TfrmCadGeralPart.tsInfPlanoShow(Sender: TObject);
begin
  inherited;
  LbValor.Caption:='';
  pnlDescPlano.Caption:=qryPlano.FieldByName('PLANO').AsString;
//  If (qryPlano.FieldByName('DATACANCELAMENTO').IsNull)And
//      (Not qryPlano.IsEmpty) then
//  begin
    CalculaContribuicao;
//  end;

end;

// FERNANDO - P.15472 - ALTEREI O SQL DA QUERY QRYBENEF

end.
