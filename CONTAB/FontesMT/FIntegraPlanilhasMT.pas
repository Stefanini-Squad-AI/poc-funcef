unit FIntegraPlanilhasMT;
{---------------------------------------------------------------------------------------------------
 Data      : 01/12/2005
 Pendência : 17987
 Autor     : Rodolpho da Silva
 Descrição : Acrescentar colunas Plano x Patro 
--------------------------------------------------------------------------------------------------- }
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MontaSelect, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd,
  wwdblook, TREdit, Db, DBTables, Wwquery, Wwdatsrc, ComCtrls, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, Provider, uCtrlListTerceiros,
  uCtrlContab, uCtrlPeriodo, uCtrlLancamento, uCtrlProcessaContab,
  uCMClientDataSet, uCmSqlParams;

type
  TfrmIntegraPlanilhasMT = class(TfrmSairAjuda)
    btnIntegra: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Panel4: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    dblkModulo: TwwDBLookupCombo;
    btnFiltra: TBitBtn;
    dblkTipoOper: TwwDBLookupCombo;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    dteDataIni: TCMDateTimePicker;
    dteDataFim: TCMDateTimePicker;
    Panel5: TPanel;
    dbgrdLancamentos: TwwDBGrid;
    Splitter1: TSplitter;
    dbgrdPlanilhas: TwwDBGrid;
    Label6: TLabel;
    redPlanilhaIni: TRealEdit;
    Label5: TLabel;
    redPlanilhaFim: TRealEdit;
    Label7: TLabel;
    btnInverte: TBitBtn;
    btnTodas: TBitBtn;
    Bevel1: TBevel;
    pgrStatus: TProgressBar;
    cdsModulo: TClientDataSet;
    cdsTipoOper: TClientDataSet;
    cdsPlanilha: TClientDataSet;
    cdsLancamento: TClientDataSet;
    dsPlanilhas: TwwDataSource;
    dsLancamentos: TwwDataSource;
    cdsPlanilhaNOMEMODULO: TStringField;
    cdsPlanilhaPLNPLANIL: TFloatField;
    cdsPlanilhaPLNDATDIA: TDateTimeField;
    cdsPlanilhaPLNCODIGO: TFloatField;
    cdsPlanilhaIDMODULO: TFloatField;
    cdsPlanilhaPERNUMERO: TFloatField;
    cdsPlanilhaPEREXERCICIO: TFloatField;
    cdsPlanilhaIDPESSOA: TFloatField;
    cdsPlanilhaPLNNUMLAN: TFloatField;
    cdsPlanilhaPLNTOTDEB: TFloatField;
    cdsPlanilhaPLNTOTCRE: TFloatField;
    cdsPlanilhaTIPDESCRICAO: TStringField;
    cdsPlanilhaPLNTOTDEBOFICIAL: TFloatField;
    cdsPlanilhaPLNTOTCREOFICIAL: TFloatField;
    cdsPlanilhaPLNTOTDEBGER: TFloatField;
    cdsPlanilhaPLNTOTCREGER: TFloatField;
    cdsPlanilhaPLNTOTDEBGEREN1: TFloatField;
    cdsPlanilhaPLNTOTCREGEREN1: TFloatField;
    cdsPlanilhaPLNTOTDEBGEREN2: TFloatField;
    cdsPlanilhaPLNTOTCREGEREN2: TFloatField;
    cdsPlanilhaPLNEFETIVADO: TStringField;
    cdsPlanilhaPLNTOTDEBHIST: TFloatField;
    cdsPlanilhaPLNTOTCREHIST: TFloatField;
    cdsPlanilhaPLNPLANESTORNO: TFloatField;
    cdsPlanilhaPLNREFERENCIA: TFloatField;
    cdsPlanilhaPANCODIGO: TFloatField;
    cdsLancamentoPERNUMERO: TFloatField;
    cdsLancamentoPEREXERCICIO: TFloatField;
    cdsLancamentoPLANO: TFloatField;
    cdsLancamentoPLACONTA: TStringField;
    cdsLancamentoTIPCODIGO: TStringField;
    cdsLancamentoCODSUBCONTA: TFloatField;
    cdsLancamentoIDEMPRESA: TFloatField;
    cdsLancamentoUNIDNEGOC: TFloatField;
    cdsLancamentoCODCENTROCUSTO: TStringField;
    cdsLancamentoIDPLANOPREV: TFloatField;
    cdsLancamentoIDPATRO: TFloatField;
    cdsLancamentoLACDEBCRE: TStringField;
    cdsLancamentoPLANOME: TStringField;
    cdsLancamentoPLATIPO: TStringField;
    cdsLancamentoPLAGRUPO: TStringField;
    cdsLancamentoPLANOMEOUTLING: TStringField;
    cdsLancamentoLACNUMLAN: TFloatField;
    cdsLancamentoPLNPLANIL: TFloatField;
    cdsLancamentoPLNCODIGO: TFloatField;
    cdsLancamentoPLNDATDIA: TDateTimeField;
    cdsLancamentoLACVALOR: TFloatField;
    cdsLancamentoLACVALOFICIAL: TFloatField;
    cdsLancamentoLACVALGERENCIAL: TFloatField;
    cdsLancamentoLACVALGEREN1: TFloatField;
    cdsLancamentoLACVALGEREN2: TFloatField;
    cdsLancamentoLACVALHIST: TFloatField;
    Anim: TAnimate;
    cdsLancamentoPLANOPREV: TStringField;
    cdsLancamentoPATRO: TStringField;
    cdsLancamentoPLACCUST: TStringField;

    {Procedimentos Delphi}
    procedure dbgrdPlanilhasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdPlanilhasTopRowChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltraClick(Sender: TObject);
    procedure dbgrdLancamentosCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure dsPlanilhasDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure btnIntegraClick(Sender: TObject);
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverteClick(Sender: TObject);
    procedure dbgrdLancamentosTopRowChanged(Sender: TObject);

  private
    { Private declarations }
    Periodo    : TCtrlPeriodo;
    ListTerceiros :TCtrlListTerceiros;
    Lancamento : TCtrlLancamento;
    ProcessaContab : TCtrlProcessaContab;
    Procedure MensProcessaContab(msg : String);
    Procedure AbreLancamentos;
    Procedure AbrePlanilhas;

  public
    { Public declarations }
  end;

var
  frmIntegraPlanilhasMT: TfrmIntegraPlanilhasMT;
  bIntegra :Boolean;

implementation

Uses uSistema, uMensErro, dBaseDados, uCMTypes;


{$R *.DFM}




procedure TfrmIntegraPlanilhasMT.dbgrdPlanilhasCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin

   inherited;

   //Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.color := clwhite
         end else begin
            ABrush.Color := $00C0FFFF; //Amarelo Bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;

end;



procedure TfrmIntegraPlanilhasMT.dbgrdPlanilhasTopRowChanged(Sender: TObject);
begin
   inherited;

   dbgrdPlanilhas.invalidate;

end;



procedure TfrmIntegraPlanilhasMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   Periodo.Free;
   ProcessaContab.Free;
   Lancamento.Free;
   ListTerceiros.Free;
end;


procedure TfrmIntegraPlanilhasMT.btnFiltraClick(Sender: TObject);
begin
   inherited;
   AbrePlanilhas;
   bIntegra := false;
end;


procedure TfrmIntegraPlanilhasMT.dbgrdLancamentosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

   //Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.color := clwhite
         end else begin
            ABrush.Color := $00C0FFFF; //Amarelo Bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;


end;



procedure TfrmIntegraPlanilhasMT.dsPlanilhasDataChange(Sender: TObject;
  Field: TField);
begin

  inherited;
  AbreLancamentos;
end;



procedure TfrmIntegraPlanilhasMT.FormCreate(Sender: TObject);
begin
   inherited;
  //Criação da Classe de Negócio
  Periodo        := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  ProcessaContab := TCtrlProcessaContab.Create;
  ProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False,MensProcessaContab);

  Lancamento     := TCtrlLancamento.Create;
  Lancamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsModulo.Data := Lancamento.ListModulos(False);

  ProcessaContab.cdsPlanilha := cdsPlanilha;

  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsTipoOper.Data := ListTerceiros.ListTipoOper(False);

end;



procedure TfrmIntegraPlanilhasMT.btnIntegraClick(Sender: TObject);
begin
   inherited;
   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;
   pgrStatus.position := 0;
   if not ProcessaContab.ProcessaIntegraPlanilha(Sistema.IdModulo,Sistema.IdUsuario, Sistema.IdEmpresa,Sistema.UsaPlanoPatro) then begin
      MsgDlg('Integração NÃO efetuada. '+ProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end else begin
      MsgDlg('Integração efetuada com sucesso!','Aviso',mtWarning,[mbOk],0);
      cdsPlanilha.CancelUpdates;
      bIntegra := True;
      AbrePlanilhas;
   end;
   If Anim.Active Then Anim.Active := False;
end;



procedure TfrmIntegraPlanilhasMT.btnTodasClick(Sender: TObject);
begin
   inherited;
   cdsPlanilha.DisableControls;

   pgrStatus.position := 0;
   pgrStatus.max := cdsPlanilha.RecordCount;

   with cdsPlanilha do begin
      First;
      while not eof do begin
         Edit;
         FieldByName('PLNEFETIVADO').asString := 'S';
         Post;
         Next;
         pgrStatus.position := pgrStatus.position + 1;
         Repaint;
      end;
      First;
   end;
   cdsPlanilha.EnableControls;
end;



procedure TfrmIntegraPlanilhasMT.btnInverteClick(Sender: TObject);
begin
   inherited;
   cdsPlanilha.DisableControls;

   pgrStatus.position := 0;
   pgrStatus.max := cdsPlanilha.RecordCount;

   with cdsPlanilha do begin
      First;
      while not eof do begin
         Edit;
         if FieldByName('PLNEFETIVADO').asString = 'S' then begin
            FieldByName('PLNEFETIVADO').asString := 'N';
         end else begin
            FieldByName('PLNEFETIVADO').asString := 'S';
         end;
         Post;
         Next;
         pgrStatus.position := pgrStatus.position + 1;
         Repaint;
      end;
      First;
   end;
   cdsPlanilha.EnableControls;
end;



procedure TfrmIntegraPlanilhasMT.dbgrdLancamentosTopRowChanged(Sender: TObject);
begin
   inherited;
   dbgrdLancamentos.invalidate;
end;



procedure TfrmIntegraPlanilhasMT.MensProcessaContab(msg: String);
begin
   pgrStatus.Max      := ProcessaContab.MaxProgresso;
   pgrStatus.Position := ProcessaContab._Progresso;
   Application.ProcessMessages;
end;

procedure TfrmIntegraPlanilhasMT.AbreLancamentos;
begin
   cdsLancamento.Close;
   if cdsPlanilha.FieldByName('PLNCODIGO').AsFloat <> 0 then begin
      cdsLancamento.Data := Lancamento.SelecionaLancamentos(cdsPlanilha.FieldByName('PLNCODIGO').AsFloat,Sistema.IdEmpresa,
                                      0,0,tpSoPeriodo,'','','','',teNaoEfetivado,tomAmbos,tolData,tsSemSoma,True,True);
   end;
 //=========================
end;


procedure TfrmIntegraPlanilhasMT.AbrePlanilhas;
begin
   cdsPlanilha.Data := Lancamento.SelecionaPlanilhas(0,redPlanilhaIni.Value,redPlanilhaFim.Value,Sistema.idEmpresa,
                                           0,0,tpSoPeriodo,dteDataIni.Text,dteDataFim.Text,dblkModulo.LookupValue,
                                           dblkTipoOper.LookupValue,teNaoEfetivado,tolData);
   If cdsPlanilha.IsEmpty Then begin
      if not bIntegra then
         MsgDlg('Planilhas NÃO selecionadas. ','Erro',mtError,[mbOk],0);
   end else begin
      cdsPlanilha.First;
      AbreLancamentos;
   end;
end;

end.


