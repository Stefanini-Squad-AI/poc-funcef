//******************************************************************************
// Data      : 28/02/2007
// Código    : AL_2
// Pendencia : 24551
// SOL       : 47397
// Desc      : Implementação para que o saldo anterior e posterior,
//             quando existirem mais de uma conta, apareça a quantidade real.
//******************************************************************************
// Data     : 02/10/2006
// Código   : AL_1
// Pendencia: 22957
// Desc     : Implementação
//            Ajustes na chamada do método para preencher o CDS de plano origem
//******************************************************************************
// Data     : 30/08/2006
// Pendencia: 22957
// Desc     : Implementação da Consulta
//******************************************************************************

unit FConsTransPlanosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCtrlRendaVariavel,
  uMensErro, uCtrlInvestimento, RConsTransPlanosRV, uInvestimento, FPreview;

type
  TFrmConsTransPlanosMT = class(TfrmOkCancelarRelInv)
    pnlGrid: TPanel;
    grdConsulta: TwwDBGrid;
    pnlFiltros: TPanel;
    //AL_2
    Label8: TLabel;
    //AL_2
    edDataFim: TCMDateTimePicker;
    lblPlanoPatroOrigem: TLabel;
    dblkPlanPatroO: TwwDBLookupCombo;
    lblCarteira: TLabel;
    dblkCarteira: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    dblkInvestimento: TwwDBLookupCombo;
    cdsCarteira: TCMClientDataSet;
    cdsInvestimento: TCMClientDataSet;
    cdsPlanoPatroO: TCMClientDataSet;
    sprConsTransPlanosMT: TCMSqlParams;
    CdsConsTransPlanosMT: TCMClientDataSet;
    dsConsTransPlanosMT: TDataSource;
    //AL_2
    CdsConsTransPlanosMTPERCENTUAL: TFloatField;
    CdsConsTransPlanosMTSALDOANTORIG: TFloatField;
    CdsConsTransPlanosMTSALDOATUORIG: TFloatField;
    CdsConsTransPlanosMTSALDOANTDEST: TFloatField;
    CdsConsTransPlanosMTSALDOATUDEST: TFloatField;
    //AL_2
    CdsConsTransPlanosMTIDINVESTIMENTO: TFloatField;
    //AL_2
    CdsConsTransPlanosMTIDPLANPREVCTBPATR: TFloatField;
    //AL_2
    CdsConsTransPlanosMTPLANOORIG: TStringField;
    CdsConsTransPlanosMTPLANODEST: TStringField;
    CdsConsTransPlanosMTDESCCARTINVEST: TStringField;
    CdsConsTransPlanosMTQTDTRANSFORIG: TFloatField;
    CdsConsTransPlanosMTQTDTRANSFDEST: TFloatField;
    CdsConsTransPlanosMTDESCINVESTIMENTO: TStringField;
    CdsConsTransPlanosMTTIPOSALDO: TStringField;
    //AL_2
    CdsConsTransPlanosMTDATAOPERACAO: TDateTimeField;
    CdsConsTransPlanosMTNUMDOCUMENTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdConsultaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdConsultaTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento  : TCtrlInvestimento;
    CtrlRendaVariavel : TCtrlRendaVariavel;
    RelConsTransPlanosRV   : TRelConsTransPlanosRV;
  public
    { Public declarations }
  end;

var
  FrmConsTransPlanosMT: TFrmConsTransPlanosMT;
  iCarteira, iPlanPrevOrig, iPlanPrevDest, iInvestimento : Integer;

implementation

//AL_2
uses UDiasUteisInv;

{$R *.DFM}

procedure TFrmConsTransPlanosMT.FormCreate(Sender: TObject);
begin
  inherited;
   RelConsTransPlanosRV := TRelConsTransPlanosRV.Create(Self);
   CtrlInvestimento     := TCtrlInvestimento.Create;
   CtrlRendaVariavel    := TCtrlRendaVariavel.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaVariavel.InitializeAs(Padroes);

   cdsCarteira.Data     := CtrlInvestimento.ListCarteira(2, -1, 0);
   cdsInvestimento.Data := CtrlInvestimento.ListInvestimento(-1, 2);
   //AL_1
   cdsPlanoPatroO.Data  := CtrlInvestimento.ListPlanoPatro;
end;

procedure TFrmConsTransPlanosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(RelConsTransPlanosRV);
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaVariavel);
end;

procedure TFrmConsTransPlanosMT.grdConsultaCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
            ABrush.Color := $00C0FFFF // amarelo bebê
         else
            ABrush.Color := clWhite;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TFrmConsTransPlanosMT.grdConsultaTopRowChanged(Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

procedure TFrmConsTransPlanosMT.FormShow(Sender: TObject);
begin
  inherited;
//AL_2
   if edDataFim.CanFocus then
      edDataFim.SetFocus;
end;

procedure TFrmConsTransPlanosMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   CdsConsTransPlanosMT.Data := CtrlRendaVariavel.ListOperTrcPlanos(0, 0, -1, -1, -1);
   bt_Imprime.Enabled := False
end;

procedure TFrmConsTransPlanosMT.bbtnConfirmarClick(Sender: TObject);
//AL_2
var dDataAnt : TDateTime;
begin
  inherited;
  //AL_2
  if Trim(edDataFim.Text) = '' then
  begin
      MsgDlg('Informe a Data.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if edDataFim.CanFocus then
         edDataFim.SetFocus;
      Exit;
  end;

  if Trim(dblkCarteira.Text) = '' then
     iCarteira := -1
  else
     iCarteira := cdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

  if Trim(dblkPlanPatroO.Text) = '' then
     iPlanPrevOrig := -1
  else
     iPlanPrevOrig := cdsPlanoPatroO.FieldByName('IDPLANPREVCTBPATR').AsInteger;

  if Trim(dblkInvestimento.Text) = '' then
     iInvestimento := -1
  else
     iInvestimento := cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

  //AL_2
  dDataAnt := DiasUteisInv.UltDiaUtilAnterior(edDataFim.Date,-1,1,'',True,False,False);

  CdsConsTransPlanosMT.Data := CtrlRendaVariavel.ListOperTrcPlanos(dDataAnt, edDataFim.Date,
                                                                   iInvestimento, iCarteira, iPlanPrevOrig);

  if CdsConsTransPlanosMT.IsEmpty then
     bt_Imprime.Enabled := False
  else
     bt_Imprime.Enabled := True;
end;

procedure TFrmConsTransPlanosMT.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   if not CdsConsTransPlanosMT.IsEmpty then
   begin
      RelConsTransPlanosRV.CdsConsTransPlanosMT.Data := CdsConsTransPlanosMT.Data;

      RelConsTransPlanosRV.lblEmpresa.Caption := Investimentos.NomeEmpresa;
      RelConsTransPlanosRV.lblSistema.Caption := Investimentos.NomeModulo;
      RelConsTransPlanosRV.lblPeriodo.Caption := edDataFim.Text;

      TFrmPreview.CreateModalPreview(Application,
                                     RelConsTransPlanosRV.rptConsTransPlanosMT,
                                     RelConsTransPlanosRV.rptConsTransPlanosMT.PrinterSetup.DocumentName);
   end;
   RelConsTransPlanosRV.CdsConsTransPlanosMT.EmptyDataSet;
end;

end.
