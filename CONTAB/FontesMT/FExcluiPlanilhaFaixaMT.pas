(* ------------------  Histórico de Alterações  ------------------------------*)
{
---------------------------------------------------------------------------------------------------
Pendência: WO38204
Analista : Leandro
Data     : 18/05/2026
Solução  : Ajuste para tratar o modulo da planilha selecionada
==============================================================================*}

unit FExcluiPlanilhaFaixaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, Mask, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect,uCtrlContab, Db, DBClient,
  uCMClientDataSet,uCtrlPlanilha,uCtrlPeriodo, uCMTypes;

type
  TfrmExcluiPlanilhaFaixaMT = class(TfrmOkCancelar)
    edDataProc: TCMDateTimePicker;
    lblData: TLabel;
    mskPlanilhaIni: TMaskEdit;
    lblPlanilIni: TLabel;
    btnPlanilhaIni: TBitBtn;
    mskPlanilhaFim: TMaskEdit;
    lblPlanilFim: TLabel;
    btnPlanilhaFim: TBitBtn;
    pgrStatus: TProgressBar;
    Anim: TAnimate;
    MontaSelectPlanilha: TMontaSelect;
    Label1: TLabel;
    mskIdModulo: TMaskEdit;
    mskDescModulo: TMaskEdit;
    procedure btnPlanilhaIniClick(Sender: TObject);
    procedure btnPlanilhaFimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlContab   :TCtrlContab;
    CtrlPlanilha :TCtrlPlanilha;
    CtrlPeriodo  :TCtrlPeriodo;
    Procedure MensProcExcluiPla(msg : String);
  public
    { Public declarations }
  end;

var
  frmExcluiPlanilhaFaixaMT: TfrmExcluiPlanilhaFaixaMT;

implementation

{$R *.DFM}

uses uFuncaoGeral,uMensErro, USistema, uModulo, uDatabase, DBaseDados;

procedure TfrmExcluiPlanilhaFaixaMT.btnPlanilhaIniClick(Sender: TObject);
begin
  inherited;
   MontaSelectPlanilha.Executar;
   Repaint;
   If MontaSelectPlanilha.RetornouValor Then
   begin
      mskPlanilhaIni.text  := MontaSelectPlanilha.ValoresChave[1];
      mskIdModulo.text     := MontaSelectPlanilha.ValoresChave[2]; //WO38204 Leandro
      mskDescModulo.text   := MontaSelectPlanilha.ValoresChave[3]; //WO38204 Leandro
   end;

end;

procedure TfrmExcluiPlanilhaFaixaMT.btnPlanilhaFimClick(Sender: TObject);
begin
  inherited;
   MontaSelectPlanilha.Executar;
   Repaint;
   If MontaSelectPlanilha.RetornouValor Then
   begin
      mskPlanilhaFim.Text  := MontaSelectPlanilha.ValoresChave[1];
      mskIdModulo.text     := MontaSelectPlanilha.ValoresChave[2];  //WO38204 Leandro
      mskDescModulo.text   := MontaSelectPlanilha.ValoresChave[3];  //WO38204 Leandro
   end;
end;

procedure TfrmExcluiPlanilhaFaixaMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe planilha ***
  CtrlPlanilha   := TCtrlPlanilha.Create;
  CtrlPlanilha.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensProcExcluiPla);

  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
    MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  MontaSelectPlanilha.Filtro.Add('PLANILHA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmExcluiPlanilhaFaixaMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If  edDataProc.Text = '' Then
  begin
    MsgDlg('Data Não Fornecida.','Aviso',mtInformation,[mbOk],0);
    edDataProc.SetFocus;
    Exit;
  end;

  If mskPlanilhaIni.Text = '' Then
  begin
    MsgDlg('O Número da Planilha Inicial Não foi Fornecido.','Aviso',mtInformation,[mbOk],0);
    mskPlanilhaIni.SetFocus;
    Exit;
  end;

  If mskPlanilhaFim.Text = '' Then
  begin
    MsgDlg('O Número da Planilha Final Não foi Fornecido.','Aviso',mtInformation,[mbOk],0);
    mskPlanilhaFim.SetFocus;
    Exit;
  end;

  If Not CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa,edDataProc.Text) Then
  Begin
     MsgDlg(CtrlPeriodo.MessageInfo,'Erro',mtError,[mbOK],0);
     Exit;
  End;

   If CtrlPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa,tbBloqueado,CtrlPeriodo.Periodo,
                                        CtrlPeriodo.Exercicio,False) Then
   Begin
      MsgDlg(CtrlPeriodo.MessageInfo,'Erro',mtError,[mbOk],0);
      Exit;
   End;

   If Not CtrlPlanilha.ExistePlanilhasNaData(Sistema.IdEmpresa,StrToInt(mskPlanilhaIni.Text),
                                    StrToInt(mskPlanilhaFim.Text),edDataProc.Text, StrToInt(mskIdModulo.text)) Then    //WO38204 Leandro
   Begin
      MsgDlg('Não Existe Nenhuma Planilha Dentro Desta Faixa Nesta Data','Erro',mtError,[mbOK],0);
      edDataProc.SetFocus;
      Exit;
   End;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;

  If MsgDlg('Deseja REALMENTE Excluir Estas Planilhas?' + CHR(13) +
            'TODOS os seus Lançamentos serão excluídos!','Aviso',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
  Begin
     If Not CtrlPlanilha.ExcluiPlanilhasNaData(Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,Sistema.UsaPlanoPatro) Then
        MsgDlg('Foram Detectados Problemas na Exclusão da Planilha '+
               CtrlPlanilha.MessageInfo+'. Provavelmente Algumas delas tem Referencia com Outro Sistema. Verifique.','Erro',mtError,[mbOk],0)
     Else
        MsgDlg('Planilhas Excluídas com Sucesso.','Aviso',mtInformation,[mbOk],0);
  End;

  If Anim.Active Then
  Begin
    Anim.Active  := False;
    Anim.Visible := False;
  End;

end;

procedure TfrmExcluiPlanilhaFaixaMT.MensProcExcluiPla(msg: String);
begin
   pgrStatus.Max      := CtrlPlanilha.MaxProgresso;
   pgrStatus.Position := CtrlPlanilha.Progresso;
   Application.ProcessMessages;
end;

procedure TfrmExcluiPlanilhaFaixaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free;
  CtrlPlanilha.Free;
  CtrlPeriodo.Free;
end;

end.
