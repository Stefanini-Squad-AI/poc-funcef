unit FGeraCotaPlanPatroMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, DBClient,
  uCtrlPeriodo,uCtrlProcessaTotalPrev, FOkCancelar, DBTables, Wwquery;

type
  TfrmGeraCotaPlanPatroMT = class(TfrmOkCancelar)
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    pgbStatus: TProgressBar;
    rdgSinal: TRadioGroup;
    memLog: TRichEdit;
    cdsExercicio: TClientDataSet;
    cdsPeriodo: TClientDataSet;
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
    Procedure Progresso(vParams : Array of Variant);
  public
    { Public declarations }
  end;

var
  frmGeraCotaPlanPatroMT: TfrmGeraCotaPlanPatroMT;

implementation

uses UMensErro, uDatabase, DBaseDados,
     uAutorizacao, uSistema, uModulo, uFuncaoGeral, uData;

{$R *.DFM}



procedure TfrmGeraCotaPlanPatroMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   Periodo.Free;
   ProcessaTotalPrev.Free;
end;



procedure TfrmGeraCotaPlanPatroMT.FormShow(Sender: TObject);
begin
   inherited;

   //Preenche as combo-boxes
  cdsExercicio.Data := Periodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.idEmpresa,tbpSoNaoBloq,0,0);
end;



procedure TfrmGeraCotaPlanPatroMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   memLog.Lines.Clear;
   memLog.Lines.Add('Verificando se existem Rateios Lançados');
   Application.ProcessMessages;
   if ProcessaTotalPrev.TestaExisteRateioPlanPatro(Sistema.idEmpresa, StrToIntDef(dblkExercicio.LookUpValue,0),
                        StrToIntDef(dblkPeriodo.LookUpValue,0)) then begin
      if MsgDlg('Já existem valores de rateio para o Exercício e Período escolhidos. Deseja sobrescrevê-los?', 'Aviso',mtConfirmation,[mbYes, mbNo],0) = mrNo then begin
         Exit;
      end else begin
         memLog.Lines.Add('Excluindo os Rateios Lançados');
         Application.ProcessMessages;
         if not ProcessaTotalPrev.ProcessaDeletaRateioPlanPatro(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario, StrToIntDef(dblkExercicio.LookUpValue,0),
                        StrToIntDef(dblkPeriodo.LookUpValue,0)) then begin
            MsgDlg('Exclusão dos Rateios Existentes não Efetuado. '+ProcessaTotalPrev.MessageInfo, 'Aviso',mtConfirmation,[mbYes, mbNo],0);
            exit;
         end;
      end;
   end;
   memLog.Lines.Add('Gerando os Valores de Rateio para Calculo da Cota');
   Application.ProcessMessages;
   //GeraFatura.CreateThreadProgresso;
   if not ProcessaTotalPrev.ProcessaGeraRateioPlanPatro(ProcessaTotalPrev.ProgressFileName,Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario, StrToIntDef(dblkExercicio.LookUpValue,0),
                        StrToIntDef(dblkPeriodo.LookUpValue,0),rdgSinal.itemIndex) then begin
      //GeraFatura.FreeThreadProgresso;
      MsgDlg('Geração não efetuada. '+ProcessaTotalPrev.MessageInfo,'Erro',mtError,[mbOk],0);
   end else begin
      //GeraFatura.FreeThreadProgresso;
      MsgDlg('Geração das Cotas Efetuada com sucesso','Aviso',mtWarning,[mbOk],0);
      memLog.Lines.Add(' ');
      memLog.Lines.Add('***********************');
      Application.ProcessMessages;
   end;
end;



procedure TfrmGeraCotaPlanPatroMT.FormCreate(Sender: TObject);
begin
  inherited;
  Periodo        := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  ProcessaTotalPrev   := TCtrlProcessaTotalPrev.Create;
  ProcessaTotalPrev.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  ProcessaTotalPrev.Progresso := Progresso;
end;

procedure TfrmGeraCotaPlanPatroMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (dblkExercicio.Text <> '') then begin
     cdsPeriodo.Filtered := False;
     cdsPeriodo.Filter   := 'PEREXERCICIO = '+dblkExercicio.LookupValue;
     cdsPeriodo.Filtered := True;
  end;
end;

procedure TfrmGeraCotaPlanPatroMT.Progresso(vParams: array of Variant);
begin
   Try
     pgbStatus.Max      := vParams[1];
     pgbStatus.Position := vParams[2];
     if vParams[3] <> '' then
        memLog.Lines.Add(vParams[3]);
   finally
     Repaint;
   End;
end;

end.
