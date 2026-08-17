unit FGeraRatAdmPlanPatroMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, DBClient,
  uCtrlListTerceiros,uCtrlPeriodo,uCtrlProcessaTotalPrev, FOkCancelar, DBTables, Wwquery;

type
  TfrmGeraRatAdmPlanPatroMT = class(TfrmOkCancelar)
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    pgbStatus: TProgressBar;
    memLog: TRichEdit;
    cdsExercicio: TClientDataSet;
    cdsPeriodo: TClientDataSet;
    Label5: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    lblRateio: TLabel;
    lblConta: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    cdsTipoOper: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Periodo           : TCtrlPeriodo;
    ProcessaTotalPrev : TCtrlProcessaTotalPrev;
    ListTerceiros     : TCtrlListTerceiros;
    Procedure Progresso(vParams : Array of Variant);
  public
    { Public declarations }
  end;

var
  frmGeraRatAdmPlanPatroMT: TfrmGeraRatAdmPlanPatroMT;

implementation

uses  UMensErro, uDatabase, DBaseDados,
     uAutorizacao, uSistema, uModulo, uFuncaoGeral, uData;

{$R *.DFM}



procedure TfrmGeraRatAdmPlanPatroMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ListTerceiros.Free;
   Periodo.Free;
   ProcessaTotalPrev.Free;
end;



procedure TfrmGeraRatAdmPlanPatroMT.FormShow(Sender: TObject);
begin
   inherited;
   //Preenche as combo-boxes
  cdsTipoOper.Data  := ListTerceiros.ListTipoOper(False);
  cdsExercicio.Data := Periodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.idEmpresa,tbpSoNaoBloq,0,0);
end;



procedure TfrmGeraRatAdmPlanPatroMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   memLog.Lines.Clear;
   memLog.Lines.Add('Gerando os Lançamentos de Rateio');
   Application.ProcessMessages;
   //GeraFatura.CreateThreadProgresso;
   if not ProcessaTotalPrev.ProcessaGeraLancamentoRatAdmPlanPatro(ProcessaTotalPrev.ProgressFileName,dblkTipoOper.LookUpValue,Sistema.idEmpresa, Sistema.IdModulo,Sistema.idUsuario,
                        StrToIntDef(dblkExercicio.LookUpValue,0),StrToIntDef(dblkPeriodo.LookUpValue,0)) then begin
      //GeraFatura.FreeThreadProgresso;
      MsgDlg('Geração dos lançamentos não efetuada. '+ProcessaTotalPrev.MessageInfo,'Erro',mtError,[mbOk],0);
   end else begin
      //GeraFatura.FreeThreadProgresso;
      MsgDlg('Geração dos lançamentos Efetuada com sucesso','Aviso',mtWarning,[mbOk],0);
      memLog.Lines.Add(' ');
      memLog.Lines.Add('***********************');
      Application.ProcessMessages;
   end;
end;



procedure TfrmGeraRatAdmPlanPatroMT.FormCreate(Sender: TObject);
begin
  inherited;
  Periodo        := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  ListTerceiros   := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  //
  ProcessaTotalPrev   := TCtrlProcessaTotalPrev.Create;
  ProcessaTotalPrev.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  ProcessaTotalPrev.Progresso := Progresso;
end;

procedure TfrmGeraRatAdmPlanPatroMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (dblkExercicio.Text <> '') then begin
     cdsPeriodo.Filtered := False;
     cdsPeriodo.Filter   := 'PEREXERCICIO = '+dblkExercicio.LookupValue;
     cdsPeriodo.Filtered := True;
  end;
end;

procedure TfrmGeraRatAdmPlanPatroMT.Progresso(vParams: array of Variant);
begin
   Try
     pgbStatus.Max      := vParams[1];
     pgbStatus.Position := vParams[2];
     if vParams[3] <> '' then
        memLog.Lines.Add(vParams[3]);
     lblRateio.Caption := 'Gerando Plano / Patrocinadora: '+vParams[4];
     lblConta.Caption  := 'Gerando Conta : '+vParams[5];
   finally
     Repaint;
   End;
end;

end.
