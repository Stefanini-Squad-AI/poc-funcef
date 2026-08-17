unit FEncerraResultadosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, CMDBLookupCombo, wwdblook,
  uCtrlHistoContab,uCtrlPeriodo, Db, DBClient, uCMClientDataSet, uCtrlContaContabil,
  uCtrlContab,uCtrlProcessaContab, uCtrlLancamento,
  uCMTypes, DBTables, Wwquery, Mask, DBCtrls;


type
  TfrmEncerraResultadosMT = class(TfrmSairAjuda)
    edtExercicio: TEdit;
    Label3: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    dblcHistPadrao: TCMDBLookupCombo;
    lblHistPadrao: TLabel;
    mmStatus: TRichEdit;
    Label1: TLabel;
    btnEncerrar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsHistoPadrao: TCMClientDataSet;
    CdsPeriodo: TCMClientDataSet;
    prbImportar: TProgressBar;
    Anim: TAnimate;
    lblCentroCusto: TLabel;
    cdsCentroCusto: TCMClientDataSet;
    cbAtualiza: TCheckBox;
    dblcCentroCusto: TCMDBLookupCombo;
    Label2: TLabel;
    qryAux: TwwQuery;
    EdOper: TDBEdit;
    dsqryaux: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlHistoContab    : TCtrlHistoContab;
    CtrlPeriodo        : TCtrlPeriodo;
    CtrlContab         : TCtrlContab;
    CtrlProcessaContab : TCtrlProcessaContab;
    CtrlContaContabil  : TCtrlContaContabil;
    varTipo            : TTipoPeriodo;
    Procedure MensProcessaContab(msg : String);
    Procedure MensPeriodo(msg : String);

  public
    { Public declarations }
  end;

var
  frmEncerraResultadosMT: TfrmEncerraResultadosMT;

implementation

uses DBaseDados,uDataBase,uFuncaoGeral,uMensErro,  USistema,
     uModulo, uData,uString;

{$R *.DFM}

procedure TfrmEncerraResultadosMT.MensPeriodo(msg: String);
begin
   mmStatus.Lines.Add(msg);
   Application.ProcessMessages;
end;

procedure TfrmEncerraResultadosMT.FormCreate(Sender: TObject);
var
sSql: string;
begin

  inherited;
  // *** Instancia a classe Historico Contab ***
  CtrlHistoContab := TCtrlHistoContab.Create;
  CtrlHistoContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsHistoPadrao.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,'');

  // *** instancia a classe geral contab ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False,MensProcessaContab);

  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False,MensPeriodo);

  // *** Instancia a classe periodo ***
  CtrlContaContabil   := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

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
    qryaux.Close;
    sSql := ' SELECT T.TIPDESCRICAO FROM TIPOPER T, PARAMCONTAB P WHERE T.TIPCODIGO=PACTIPOPERRESULT';
    qryaux.Sql.Text := sSql;
    
    qryaux.Open;
    End;

  // *** preenche como periodo ***
  CdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,StrToInt(edtExercicio.text),0);

  if CtrlContaContabil.TestaContaContabil(CtrlContab.PlanoParam,0,0,0,CtrlContab.ContaEncer,True,True) then
  begin
     if CtrlContaContabil.ObrigaCentroCusto = 'S' then
        cdsCentroCusto.Data := CtrlContaContabil.ListContasxCC(CtrlContab.PlanoParam,Sistema.idEmpresa,CtrlContab.ContaEncer,'',tccAmbasCC,toNome)
     else
        cdsCentroCusto.Data := CtrlContaContabil.ListContasxCC(-1,0,'','',tccAmbasCC,toNome);
  end;

end;
procedure TfrmEncerraResultadosMT.MensProcessaContab(msg: String);
begin
   if msg <> '*' then
      mmStatus.Lines.Add(msg);
   prbImportar.Max      := CtrlProcessaContab.MaxProgresso;
   prbImportar.Position := CtrlProcessaContab._Progresso;
   Application.ProcessMessages;
end;


procedure TfrmEncerraResultadosMT.btnEncerrarClick(Sender: TObject);
var
    bError : Boolean;
    sDataLanc :string;
begin
     inherited;

     If cbAtualiza.Checked Then
        varTipo := tpSoPeriodo
     Else
        varTipo := tpMenorIgual;

     CtrlPeriodo.Periodo   := StrToIntDef(dblkPeriodo.LookUpValue,0);
     mmStatus.Lines.Clear;
     If not CtrlPeriodo.ValidaPeriodo Then
     Begin
        MsgDlg(CtrlPeriodo.MessageInfo,'Erro',mtError,[mbOk],0);
        dblkPeriodo.SetFocus;
        Exit;
     End;
     if edOper.text='' then
     begin
     MsgDlg('Não Existem Contas Resultado no Parâmetro do Sistema','Erro',mtError,[mbOk],0);
     dblkPeriodo.SetFocus;
     Exit;
     end;

     sDataLanc := DateToStr(cdsPeriodo.FieldByName('PERDATFIM').AsDateTime);

    CtrlHistoContab.Historico := Trim(dblcHistPadrao.Text);
    If not CtrlHistoContab.ValidaHistorico Then
    Begin
      MsgDlg(CtrlHistoContab.MessageInfo,'Erro',mtError,[mbOk],0);
      dblcHistPadrao.SetFocus;
      Exit;
    End;

    If Not CtrlPeriodo.VerificaPeriodoBloqueado(Sistema.idEmpresa,tbBloqOuInt,StrToInt(dblkPeriodo.LookupValue),
                                                StrToInt(edtExercicio.Text),True) Then
    Begin
      MsgDlg('Existem Períodos Anteriores Não encerrados.','Erro',mtError,[mbOk],0);
      dblkPeriodo.SetFocus;
      Exit;
    End;

   // *** verifica se existem planilhas efetivadas ou não ***
   bError := False;
   mmStatus.Lines.Clear;
   btnEncerrar.Enabled:=False;
   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;
   mmStatus.Lines.Add('Testa a Integração das Planilhas');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   screen.cursor := crSQLWait;
   if not CtrlProcessaContab.TestaIntegraPlanilha(Sistema.idEmpresa,StrToInt(edtExercicio.Text),CtrlPeriodo.Periodo) then
      bError := true;

   screen.cursor := crDefault;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   If Anim.Active Then Anim.Active := False;
   Application.ProcessMessages;
   //
   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;
   mmStatus.Lines.Add('Testa se todas as Planilhas tiveram suas moedas atualizadas');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   screen.cursor := crSQLWait;
   if not CtrlProcessaContab.TestaOutraMoeda(Sistema.idEmpresa,CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,varTipo) then
      bError := true;
   screen.cursor := crDefault;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   If Anim.Active Then Anim.Active := False;
   Application.ProcessMessages;
   //
   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;
   mmStatus.Lines.Add('Testa se o débito está batendo com o crédito');
   mmStatus.Lines.Add('Inicio:'+TimeToStr(Time));
   Application.ProcessMessages;
   screen.cursor := crSQLWait;
   If Not CtrlProcessaContab.TestaDebCreSaldo(Sistema.idEmpresa,StrToInt(edtExercicio.Text),CtrlPeriodo.Periodo,varTipo) then
      bError := true;
   screen.cursor := crDefault;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   If Anim.Active Then Anim.Active := False;
   Application.ProcessMessages;
   //
   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;
   mmStatus.Lines.Add('Testa os parâmetros da Contabilidade');
   mmStatus.Lines.Add('Inicio:'+TimeToStr(Time));
   Application.ProcessMessages;
   screen.cursor := crSQLWait;
   If Not CtrlProcessaContab.TestaParamContab(Sistema.IdEmpresa) Then
      bError := True;
   Application.ProcessMessages;
   //
   Application.ProcessMessages;
   screen.cursor := crSQLWait;
   If Not CtrlHistoContab.ArrumaHistorico(dblcHistPadrao.Text) Then
      bError := True;

   If CtrlHistoContab.Hist1 = '' Then
      CtrlHistoContab.Hist1 := 'Encerramento das contas de resultado';
   screen.cursor := crDefault;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   If Anim.Active Then Anim.Active := False;
   Application.ProcessMessages;
   //
   If bError Then
   Begin
     mmStatus.Lines.Add('Houve problemas no Encerramento de Resultados');
     MsgDlg('Encerramento de Resultados NÃO foi realizado.','Erro',mtError,[mbOk], 0);
     btnEncerrar.Enabled := true;
     Exit;
   End;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;
   prbImportar.Position := 0;
   Application.ProcessMessages;
   screen.cursor := crSQLWait;
   If not CtrlProcessaContab.EncerraContasDeResultado(Sistema.idEmpresa,StrToFloat(edtExercicio.Text),
                            StrToFloat(dblkPeriodo.LookupValue),Sistema.IdModulo,CtrlContab.PlanoParam,
                            Sistema.idUsuario,CtrlHistoContab.Hist1,CtrlHistoContab.Hist2,
                            CtrlHistoContab.Hist3,CtrlHistoContab.Hist4,CtrlHistoContab.Hist5,
                            CtrlProcessaContab.ContaDeb,dblcCentroCusto.LookupValue,sDataLanc, CtrlProcessaContab.TipoOper,
                            False,Sistema.UsaPlanoPatro) Then bError := True;

   If Not bError Then
   Begin
      mmStatus.Lines.Add('Encerramento de resultado realizado com sucesso.');
      MsgDlg('Encerramento das contas de resultado realizado com sucesso. '+
             'Integre a planilha de encerramento gerada e Encerre o Período '+dblkPeriodo.Text,'Aviso',mtWarning,[mbOk], 0);
   End Else
   Begin
      mmStatus.Lines.Add('Houve problemas no Encerramento de Resultados');
      MsgDlg('Encerramento de Resultados NÃO foi realizado.','Erro',mtError,[mbOk], 0);
   End;
   screen.cursor := crDefault;
   Application.ProcessMessages;
   If Anim.Active Then Anim.Active := False;
   btnEncerrar.enabled := true;
   screen.cursor := crDefault;

end;

procedure TfrmEncerraResultadosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlHistoContab.Free;
  CtrlPeriodo.Free;
  CtrlContab.Free;
  CtrlProcessaContab.Free;
  CtrlContaContabil.free;

end;

end.

