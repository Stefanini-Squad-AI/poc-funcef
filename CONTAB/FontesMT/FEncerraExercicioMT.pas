unit FEncerraExercicioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls,uCtrlPeriodo,uCtrlContab, Db, DBClient,
  uCtrlProcessaContab,uCtrlLancamento, uCMTypes;


type
  TfrmEncerraExercicioMT = class(TfrmSairAjuda)
    Label3: TLabel;
    edtExercicio: TEdit;
    prbImportar: TProgressBar;
    cbSimulacao: TCheckBox;
    mmStatus: TRichEdit;
    Label1: TLabel;
    btnEncerrar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Anim: TAnimate;
    procedure FormCreate(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
  private
     CtrlPeriodo : TCtrlPeriodo;
     CtrlContab  : TCtrlContab;
     CtrlProcessaContab : TCtrlProcessaContab;
     CtrlLancamento  : TCtrlLancamento;
     Procedure MensProcessaContab(msg : String);
     Procedure MensPeriodo(msg : String);


  public
    { Public declarations }
  end;

var
  frmEncerraExercicioMT: TfrmEncerraExercicioMT;

implementation

uses DBaseDados,uDataBase,uFuncaoGeral,uMensErro, USistema,
     uModulo, uData,uString;

{$R *.DFM}

procedure TfrmEncerraExercicioMT.MensProcessaContab(msg: String);
begin
   if msg <> '*' then
      mmStatus.Lines.Add(msg);
   prbImportar.Max      := CtrlProcessaContab.MaxProgresso;
   prbImportar.Position := CtrlProcessaContab._Progresso;
   Application.ProcessMessages;
end;

procedure TfrmEncerraExercicioMT.MensPeriodo(msg: String);
begin
   mmStatus.Lines.Add(msg);
   Application.ProcessMessages;
end;

procedure TfrmEncerraExercicioMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
  Begin
    MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);
    edtExercicio.text := IntToStr(Year(Date));
  End Else
  Begin
    edtExercicio.text := IntToStr(CtrlContab.ExercicioAtual);
  End;


  // *** Instancia a classe Lancamento ***
  CtrlLancamento   := TCtrlLancamento.Create;
  CtrlLancamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False,MensPeriodo);

  // *** instancia a classe geral contab ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False,MensProcessaContab);

end;

procedure TfrmEncerraExercicioMT.btnEncerrarClick(Sender: TObject);
var
  bError,bChecado :Boolean;
  iExercicio :Integer;
begin
  inherited;
    bChecado   :=  cbSimulacao.Checked;
    iExercicio := StrToInt(edtExercicio.Text) + 1;
    bError     := False;

    If Sistema.ConnectionSide = CnsClient Then
    Begin
      Anim.Visible := True;
      Anim.Active := True;
    End;

    If Not cbSimulacao.Checked Then
    Begin
        If Not CtrlPeriodo.VerificaPeriodoBloqueado(Sistema.idEmpresa,tbBloqOuInt,-1,StrToInt(edtExercicio.Text),True) Then
        Begin
          MsgDlg('Existem Períodos Ainda Não encerrados.','Erro',mtError,[mbOk],0);
          Exit;
        End;

        bError := False;
        btnEncerrar.Enabled:=False;

        mmStatus.Lines.Clear;
        mmStatus.Lines.Add('Testa se todas as planilhas estão efetivadas');
        mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
        Application.ProcessMessages;
       // screen.cursor := crSQLWait;
        If not CtrlProcessaContab.TestaIntegraPlanilha(Sistema.idEmpresa,StrToInt(edtExercicio.Text),-1) then
        begin
          bError := true;
          mmStatus.Lines.Add(CtrlProcessaContab.MessageInfo);
        end;
       // screen.cursor := crDefault;
        mmStatus.Lines.Add('Final :'+TimeToStr(Time));
        Application.ProcessMessages;

        mmStatus.Lines.Add('Testa se foram feitas todas as atualizações para outra moeda');
        mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
        Application.ProcessMessages;
        //screen.cursor := crSQLWait;
        If Not CtrlProcessaContab.TestaOutraMoeda(Sistema.idEmpresa,StrToInt(edtExercicio.Text),-1,tpMenorIgual) then
        begin
           bError := true;
           mmStatus.Lines.Add(CtrlProcessaContab.MessageInfo);
        end;
        //screen.cursor := crDefault;
        mmStatus.Lines.Add('Final :'+TimeToStr(Time));
        Application.ProcessMessages;
    End;

    mmStatus.Lines.Add('Testa se o débito está batendo com o crédito');
    mmStatus.Lines.Add('Inicio:'+TimeToStr(Time));
    Application.ProcessMessages;
    If Not CtrlProcessaContab.TestaDebCreSaldo(Sistema.idEmpresa,StrToInt(edtExercicio.Text),-1,tpMenorIgual ) then
    begin
      bError := true;
      mmStatus.Lines.Add(CtrlProcessaContab.MessageInfo);
    end;
    mmStatus.Lines.Add('Final :'+TimeToStr(Time));
    Application.ProcessMessages;
    If Anim.Active Then Anim.Active := False;

    If not cbSimulacao.Checked Then  // *** Testa sem considerar os saldos
    Begin
      mmStatus.Lines.Add('Testa se foi feito o Encerramento dos Resultados');
      mmStatus.Lines.Add('Inicio:'+TimeToStr(Time));
      Application.ProcessMessages;
     // screen.cursor := crSQLWait;
      If CtrlProcessaContab.TemContasComSaldo(Sistema.idEmpresa,StrToInt(edtExercicio.Text)) then
      Begin
        mmStatus.Lines.Add('Existem contas de Resultado com Saldo');
        bError := True;
      End;
      Application.ProcessMessages;
      //screen.cursor := crDefault;
      mmStatus.Lines.Add('Final :'+TimeToStr(Time));
      Application.ProcessMessages;
    End;

    If bError Then
    Begin
       mmStatus.Lines.Add('Houve problemas que impedem o Encerramento do Exercicio');
       MsgDlg('Encerramento de Exercício NÃO foi realizado.','Erro',mtError,[mbOk], 0);
       btnEncerrar.enabled := true;
     //  screen.cursor := crDefault;
       Exit;
    End;

    mmStatus.Lines.Add('Testa se já existem registros de saldo anterior no próximo Exercício');
    mmStatus.Lines.Add('Inicio:'+TimeToStr(Time));
    Application.ProcessMessages;
    //screen.cursor := crSQLWait;
    If CtrlProcessaContab.TestaSaldoAnteriorNoProxExerc(Sistema.idEmpresa,iExercicio) then
    Begin
       If MsgDlg('Já existem registros de saldo anterior no próximo Exercício. Deseja recriá-los?','Aviso',mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
       Begin
         If CtrlProcessaContab.DeletaSaldoAnterior(Sistema.idEmpresa,iExercicio) then
         Begin
            mmStatus.Lines.Add('Foram apagados os registros de saldo anterior no próximo Exercício');
            Application.ProcessMessages;
          //  screen.cursor := crDefault;
            mmStatus.Lines.Add('Final :'+TimeToStr(Time));
            If Anim.Active Then Anim.Active := False;
         End Else
         Begin
            mmStatus.Lines.Add('Houve problemas que impedem o Encerramento do Exercicio');
            Application.ProcessMessages;
           // screen.cursor := crDefault;
            mmStatus.Lines.Add('Final :'+TimeToStr(Time));
            If Anim.Active Then Anim.Active := False;
            MsgDlg('Encerramento de Exercício NÃO foi realizado.','Erro',mtError,[mbOk], 0);
            btnEncerrar.enabled := true;
           // screen.cursor := crDefault;
            Exit;
         End;
       End;
    End;

   Application.ProcessMessages;
   screen.cursor := crSQLWait;
   If CtrlProcessaContab.EncerraExercicio(Sistema.IdEmpresa,iExercicio,Sistema.IdUsuario,bChecado,Sistema.UsaPlanoPatro) Then
   Begin
      mmStatus.Lines.Add('Encerramento do Exercício realizado com sucesso.');
      MsgDlg('Encerramento do Exercício realizado com sucesso.','Aviso',mtWarning,[mbOk], 0);
   End Else
   Begin
      mmStatus.Lines.Add('Houve problemas no Encerramento do Exercício' + chr(13) + CtrlProcessaContab.MessageInfo);
      MsgDlg('Encerramento do Exercício NÃO foi realizado.' + chr(13) + CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk], 0);
   End;
  // screen.cursor := crDefault;
   Application.ProcessMessages;
   btnEncerrar.enabled := true;
 // screen.cursor := crDefault;


end;

end.
