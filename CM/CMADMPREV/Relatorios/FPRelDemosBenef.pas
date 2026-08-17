// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/01/2006
// Pendência   : 21195
// Rotina      : sbtnDemonsSRBClick
// Descricao   : Novo parametro para a função DisparaRelatorio. IDPESSOA.
//------------------------------------------------------------------------------
// Rotina      : DisparaRelatorio
// Autor(a)    : Augusto
// Data(a)     : 28/11/2005
// Pendencia   : 20262
// Alteração   : Nova query com historicos
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/11/2005
// Alteração   : Tbm pegar a DATAINICIO no Close do Benficio
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 13.05.2004
// Pendencia   : 16769
// Alteração   : Acerto no filtro do cálculo para processos que tem mais de um
//               calculo na relbenefpart.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 04.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 07/10/2002
//  Descrição  : Alteração da qryBeneficiário.
//
//------------------------------------------------------------------------------
//{leocbs - mudei a qrybeneficio mudando uma cláusula where
// pois estava ocorrendo um erro na execução de
// :AND   1 = BG.FLGPRINCIPAL OR BG.FLGPRINCIPAL IS NULL
// para: AND   (1 = BG.FLGPRINCIPAL OR BG.FLGPRINCIPAL IS NULL)}

unit FPRelDemosBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  MontaSelect,  FPreview, Pptypes;

type
  TfrmPRelDemosBenef = class(TfrmOkCancelar)
    qryBeneficio: TwwQuery;
    qryCalculoProcesso: TwwQuery;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edPlano: TEdit;
    edNumInsc: TEdit;
    edMatricula: TEdit;
    bbtnProcurar: TBitBtn;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label5: TLabel;
    dblkpcmbBeneficio: TwwDBLookupCombo;
    dblkpcmbIdCalculo: TwwDBLookupCombo;
    MontaSelectPart: TMontaSelect;
    procedure FormActivate(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkpcmbBeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbIdCalculoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    function VerificaCampos: boolean;
  public
    { Public declarations }
    sIdTitular, sIdPessoa, sIdPessJur,
    sIdPlanoPrev, sNUmeroProcesso, sDataInicio : string;

    Function DisparaRelatorio(pOrigem           :Char; // F - FormFiltro / M - Menu
                              psIdTitular,
                              psIdPessoa,
                              psIdPessJur,
                              psIdPlanoPrev,
                              psNUmeroProcesso,
                              psDataInicio,
                              psBeneficio      : String ) :Boolean;

  end;

var
  frmPRelDemosBenef: TfrmPRelDemosBenef;

implementation

uses DRelatAdmPrev, UMensErro, UAdmPrev;

{$R *.DFM}

function TfrmPRelDemosBenef.VerificaCampos: boolean;
begin
  Result := False;

  if Trim(sIdTitular) = '' then
  begin
      MsgDlg('O Nome do Participante deve ser Informado.','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
  end;

  if Trim(dblkpcmbBeneficio.Text) = '' then
  begin
      MsgDlg('O Benefício deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbBeneficio.SetFocus;
      Exit;
  end;

  if (not qryCalculoProcesso.IsEmpty) and (Trim(dblkpcmbIdCalculo.Text) = '')
  then begin
     MsgDlg('O campo "Data do Cálculo(Regra)" deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbIdCalculo.SetFocus;
     Exit;
  end;

  Result := True;
end;

procedure TfrmPRelDemosBenef.FormActivate(Sender: TObject);
begin
  inherited;
  qryBeneficio.Close; qryBeneficio.Open;
end;

procedure TfrmPRelDemosBenef.bbtnProcurarClick(Sender: TObject);
begin
  MontaSelectPart.Executar;               

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     sIdTitular       := MontaSelectPart.ValoresChave[0];
     sIdPessJur       := MontaSelectPart.ValoresChave[1];
     sIdPlanoPrev     := MontaSelectPart.ValoresChave[2];
     edNome.Text      := MontaSelectPart.ValoresChave[3];
     edMatricula.Text := MontaSelectPart.ValoresChave[4];
     edPatro.Text     := MontaSelectPart.ValoresChave[5];
     edPlano.Text     := MontaSelectPart.ValoresChave[6];
     edNumInsc.Text   := MontaSelectPart.ValoresChave[7];

     qryBeneficio.Close;
     qryBeneficio.ParamByName('pIdTitular').AsString   := sIdTitular;
     qryBeneficio.ParamByName('pIdPessJur').AsString   := sIdPessJur;
     qryBeneficio.ParamByName('pIdPlanoPrev').AsString := sIdPlanoPrev;
     qryBeneficio.Open;

     dblkpcmbBeneficio.SetFocus;


  end;
end;

procedure TfrmPRelDemosBenef.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  DisparaRelatorio('F',sIdTitular,      qryBeneficio.FieldByName('IDPESSOA').AsString,
                       sIdPessJur,      sIdPlanoPrev,
                       sNumeroProcesso, sDataInicio,
                       qryBeneficio.FieldByName('IDBENEFICIO').AsString);
end;

procedure TfrmPRelDemosBenef.dblkpcmbBeneficioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryCalculoProcesso do
  begin
      Close;
      ParamByName('pIdPessJur').AsString     := sIdPessJur; 
      ParamByName('pIdPlanoPrev').AsString   := sIdPlanoPrev; 
      ParamByName('pIdTitular').AsString     := sIdTitular; 
      ParamByName('pnumproc').AsInteger      := qryBeneficio.FieldByName('NUMEROPROCESSO').AsInteger;
      Open;
  end;
  dblkpcmbIdCalculo.Enabled := True;

  sNumeroProcesso := qryBeneficio.FieldByName('NUMEROPROCESSO').AsString; 
  sDataInicio     := qryBeneficio.FieldByName('DATAINICIO').AsString;     
end;

procedure TfrmPRelDemosBenef.FormShow(Sender: TObject);
begin
  inherited;
  dblkpcmbIdCalculo.Enabled := False;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

end;

function TfrmPRelDemosBenef.DisparaRelatorio(pOrigem: Char;
                                             psIdTitular, psIdPessoa, psIdPessJur,
                                             psIdPlanoPrev, psNumeroProcesso, psDataInicio,
                                             psBeneficio: String): Boolean;
var iIdCalculo : longint;
begin
   Result          := False;
   sIdTitular      := psIdTitular;
   sIdPessJur      := psIdPessJur;
   sIdPlanoPrev    := psIdPlanoPrev;
   sNumeroProcesso := psNumeroProcesso;
   sDataInicio     := psDataInicio;

  with dtmRelatAdmPrev do
  Begin
    //  OBTER DADOS DA FUNDAÇÃO
    qryFundacao.Close;
    qryFundacao.ParamByName('pFundacao').asinteger;
    qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    qryFundacao.Prepare;
    qryFundacao.Open;

    If pOrigem = 'F' Then    // Vindo da Própria tela de Filtro
      if not VerificaCampos then Exit;

    with qryDemonsCalcBenef do
    begin
      Close;
      ParamByName('IdPessJur').AsInteger      := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger    := StrToInt(sIdPlanoPrev);
      ParamByName('IdTitular').AsInteger      := StrToInt(sIdTitular);
      ParamByName('NumeroProcesso').AsInteger := StrToInt(sNumeroProcesso);
      Open;
    end;

    with qryBeneficioAnterior do
    begin
      Close;
      ParamByName('DataInicio').AsDateTime    := StrToDateTime(sDataInicio);
      ParamByName('IdPessJur').AsInteger      := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger    := StrToInt(sIdPlanoPrev);
      ParamByName('IdTitular').AsInteger      := StrToInt(sIdTitular);
      ParamByName('NumeroProcesso').AsInteger := StrToInt(sNumeroProcesso);

      if qryDemonsCalcBenef.FieldByName('DataInicioFund').AsString <> '' then
        ParamByName('DATAINICIO').AsString    := qryDemonsCalcBenef.FieldByName('DataInicioFund').AsString
      else
        ParamByName('DATAINICIO').AsString    := FormatDateTime('dd/mm/yyyy', Date); 

      Open;
    end;

    with qryDependentes do
    begin
      Close;
      ParamByName('IdTitular').AsInteger      := StrToInt(sIdTitular);
      Open;
    end;   

    with qryDetCalculo do
    begin
      Close;
      ParamByName('NumeroProcesso').AsInteger    := StrToInt(sNumeroProcesso);
      if Trim(dblkpcmbIdCalculo.Text) <> ''
      then ParamByName('IdCalculo').AsInteger := qryCalculoProcesso.FieldByName('IdCalculo').AsInteger
      else ParamByName('IdCalculo').AsInteger := iIdCalculoGeral;
      ParamByName('IdPessJur').AsInteger      := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger    := StrToInt(sIdPlanoPrev);
      ParamByName('IdTitular').AsInteger      := StrToInt(sIdTitular);
      Open;
    end;

    with qryReservaPart do
    begin
      Close;
      ParamByName('IdPessJur').AsInteger      := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger    := StrToInt(sIdPlanoPrev);
      ParamByName('IdPessoa').AsInteger       := StrToInt(sIdTitular);
      ParamByName('SeqProposta').AsInteger    := 1;

      if qryDemonsCalcBenef.FieldByName('DataInicioFund').AsString <> '' then
        ParamByName('DIB').AsString      := qryDemonsCalcBenef.FieldByName('DataInicioFund').AsString
      else
        ParamByName('DIB').AsString      := FormatDateTime('dd/mm/yyyy', Date); 

      if qryDemonsCalcBenef.FieldByName('DataInicioFund').AsString <> '' then
        ParamByName('MESREF').AsString   := Copy(qryDemonsCalcBenef.FieldByName('DataInicioFund').AsString,7,4)+'/'+Copy(qryDemonsCalcBenef.FieldByName('DataInicioFund').AsString,4,2)
      else
        ParamByName('MESREF').AsString   := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +    
                                            Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);           

      Open;
    end;

    with qryCalculo do
    begin
      Close;
      if Trim(dblkpcmbIdCalculo.Text) <> ''
      then ParamByName('IdCalculo').AsInteger := qryCalculoProcesso.FieldByName('IdCalculo').AsInteger
      else ParamByName('IdCalculo').AsInteger := iIdCalculoGeral;
      ParamByName('IdPessJur').AsInteger      := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger    := StrToInt(sIdPlanoPrev);
      ParamByName('IdTitular').AsInteger      := StrToInt(sIdTitular);
      Open;
    End;

    With QryHistorico Do Begin
      Close;

      ParamByName('IDPESSJUR').AsInteger      := StrToInt(sIdPessJur);
      ParamByName('IDPLANOORIGEM').AsInteger  := StrToInt(sIdPlanoPrev);
      ParamByName('IDPLANOPREV').AsInteger    := StrToInt(sIdPlanoPrev);
      ParamByName('IDTITULAR').AsInteger      := StrToInt(sIdTitular);
      ParamByName('IDPESSOA').AsInteger       := StrToInt(psIdPessoa); 
      ParamByName('NUMEROPROCESSO').AsInteger := StrToInt(sNumeroProcesso);
      ParamByName('SEQPROPOSTA').AsInteger    := 1;

      Open;
    End;



    If pOrigem =  'M' Then
    Begin // Chama a partir de outra tela.
      DsgnCM.Report.Template.SaveTo   := stFile;
      DsgnCM.Report.Template.Format   := ftASCII;
      DsgnCM.Report.Device            := dvScreen;
      TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, 'AdmPREV - Demonstrativo de Cálculo');
    End Else
      ModalResult := mrOk;
  End;

  Result := True;
end;

procedure TfrmPRelDemosBenef.dblkpcmbIdCalculoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  sDataInicio := qryBeneficio.FieldByName('DATAINICIO').AsString;
end;

end.
