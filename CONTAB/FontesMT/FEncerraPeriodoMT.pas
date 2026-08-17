{ Alterações:
-------------------------------------------------------------------------------------------------
Nº SIG......: 119442
Data........: 25/10/2021
Responsável.: Ewerton Beltramini
Descrição...: Remover as contas inativas.
-------------------------------------------------------------------------------------------------
Fim Alterações} 

unit FEncerraPeriodoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, DBClient,
  uCtrlPeriodo, uCtrlLancamento, uCtrlProcessaContab, DBTables, Wwquery;

type
  TfrmEncerraPeriodoMT = class(TfrmSairAjuda)
    btnEncerrar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    prbImportar: TProgressBar;
    mmStatus: TRichEdit;
    Label1: TLabel;
    cdsExercicio: TClientDataSet;
    cdsPeriodo: TClientDataSet;
    Anim: TAnimate;
    qryContasInativas: TwwQuery;
    qryDeleteContasInativas: TwwQuery;
    procedure btnEncerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Periodo    : TCtrlPeriodo;
    Lancamento : TCtrlLancamento;
    ProcessaContab : TCtrlProcessaContab;
    Procedure MensProcessaContab(msg : String);
    Procedure MensPeriodo(msg : String);
  public
    { Public declarations }
  end;

var
  frmEncerraPeriodoMT: TfrmEncerraPeriodoMT;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, dBaseDados, uCMTypes;

procedure TfrmEncerraPeriodoMT.btnEncerrarClick(Sender: TObject);
var bError : Boolean;
begin
   inherited;
   Periodo.Exercicio := StrToIntDef(dblkExercicio.LookUpValue,0);
   Periodo.Periodo   := StrToIntDef(dblkPeriodo.LookUpValue,0);
   mmStatus.Lines.Clear;
   if not Periodo.ValidaExercicio then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkExercicio.SetFocus;
      Exit;
   end;
   if not Periodo.ValidaPeriodo then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkPeriodo.SetFocus;
      Exit;
   end;
   if not Periodo.TestaPeriodoBloqueado(Sistema.idEmpresa,tbBloqEInt,(Periodo.Periodo-1),Periodo.Exercicio,true) then begin
      MsgDlg('Existem Períodos Anteriores Não encerrados.','Erro',mtError,[mbOk],0);
      dblkPeriodo.SetFocus;
      Exit;
   end;
   //
   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;
   btnEncerrar.Enabled := False;
   mmStatus.Lines.Clear;
   bError := false;
   //

   //Ewerton Beltramini - 25/10/2021 - SIG119442 (Remover as contas inativas) - Inicio..............................................
   //Vefificando se existe....
   qryContasInativas.Close;
   qryContasInativas.SQL.Clear;
   qryContasInativas.SQL.Add(' SELECT p.* ');
   qryContasInativas.SQL.Add('   FROM PLANOSALDO P INNER JOIN PLANOCONTA PL on (P.PLANO = PL.PLANO) AND (P.PLACONTA = PL.PLACONTA) ');
   qryContasInativas.SQL.Add('  WHERE ( (PL.PLAGRUPO <> ''E'') OR ( (PL.PLAGRUPO = ''E'') AND (PL.FLGESTATCOMLANC = ''S'') ) ) ');
   qryContasInativas.SQL.Add('    AND (PLAINATIVA     = ''I'') ');
   qryContasInativas.SQL.Add('    AND (P.PERNUMERO    = ' + IntToStr(Periodo.Periodo) + ') ');
   qryContasInativas.SQL.Add('    AND (P.PEREXERCICIO = ' + IntToStr(Periodo.Exercicio) + ') ');
   qryContasInativas.SQL.Add('    AND (P.IDPESSOA     = ' + IntToStr(Sistema.idEmpresa) + ') ');
   qryContasInativas.Open;

   //Apagando....
   if qryContasInativas.RecordCount > 0 then
   begin
         qryDeleteContasInativas.Close;
         qryDeleteContasInativas.SQL.Clear;
         qryDeleteContasInativas.SQL.Add(' DELETE FROM PLANOSALDO ');
         qryDeleteContasInativas.SQL.Add('  WHERE PLANO          = ' + qryContasInativas.FieldByName('PLANO').AsString);
         qryDeleteContasInativas.SQL.Add('    AND PLACONTA       = ' + qryContasInativas.FieldByName('PLACONTA').AsString);
         qryDeleteContasInativas.SQL.Add('    AND PERNUMERO      = ' + qryContasInativas.FieldByName('PERNUMERO').AsString);
         qryDeleteContasInativas.SQL.Add('    AND PEREXERCICIO   = ' + qryContasInativas.FieldByName('PEREXERCICIO').AsString);
         qryDeleteContasInativas.SQL.Add('    AND IDPESSOA       = ' + qryContasInativas.FieldByName('IDPESSOA').AsString);
         qryDeleteContasInativas.ExecSQL;
   end;
   //Ewerton Beltramini - 25/10/2021 - SIG119442 (Remover as contas inativas) - Fim.................................................


   mmStatus.Lines.Add('Testa se existe alguma conta com saldo contra a sua natureza');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   if not ProcessaContab.TestaSaldoContraNatureza(Sistema.idEmpresa,Periodo.Exercicio,Periodo.Periodo) then begin
      mmStatus.Lines.Add(ProcessaContab.MessageInfo);
      bError := true;
   end;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;
   //
   mmStatus.Lines.Add('Testa se todas as Contas Sintéticas estão atualizadas corretamente');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   if not ProcessaContab.TestaSaldoSintetica(Sistema.idEmpresa,Periodo.Exercicio,Periodo.Periodo) then begin
      bError := true;
      mmStatus.Lines.Add(ProcessaContab.MessageInfo);
   end;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;
   //
   mmStatus.Lines.Add('Testa se todas as Planilhas tiveram suas moedas atualizadas');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   if not ProcessaContab.TestaOutraMoeda(Sistema.idEmpresa,Periodo.Exercicio,Periodo.Periodo,tpSoPeriodo) then begin
      bError := true;
      mmStatus.Lines.Add(ProcessaContab.MessageInfo);
   end;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;
   //
   mmStatus.Lines.Add('Testa os Totais Devedores e Credores das Planilhas');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   if not ProcessaContab.TestaDebCrePlanilha(Sistema.idEmpresa,Periodo.Exercicio,Periodo.Periodo) then begin
      bError := true;
      mmStatus.Lines.Add(ProcessaContab.MessageInfo);
   end;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;
   //
   mmStatus.Lines.Add('Testa Consistência entre os Saldos e os Lançamentos');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   if not ProcessaContab.TestaSaldoAnalitica(Sistema.idEmpresa,Periodo.Exercicio,Periodo.Periodo) then begin
      bError := true;
      mmStatus.Lines.Add(ProcessaContab.MessageInfo);
   end;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;
   //
   mmStatus.Lines.Add('Testa a Integração das Planilhas');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   if not ProcessaContab.TestaIntegraPlanilha(Sistema.idEmpresa,Periodo.Exercicio,Periodo.Periodo) then begin
      bError := true;
      mmStatus.Lines.Add(ProcessaContab.MessageInfo);
   end;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;
   //
   if bError then begin
      mmStatus.Lines.Add('Fim :'+TimeToStr(Time));
      mmStatus.Lines.Add('Encerramento do período não pode ser realizado. Verifique as mensagens.');
      Application.ProcessMessages;
      MsgDlg('Encerramento do período NÃO realizado.','Erro',mtError,[mbOk], 0);
   end else begin
      if not Periodo.EncerraPeriodo(Sistema.idEmpresa,Sistema.IdModulo,Sistema.idUsuario,Periodo.Exercicio,Periodo.Periodo,tbgTodos) then begin
         MsgDlg('Encerramento do período NÃO realizado.','Erro',mtError,[mbOk], 0);
      end else begin
         MsgDlg('Encerramento Efetuado com Sucesso!','Aviso',mtWarning,[mbOk], 0);
      end;
   end;
   btnEncerrar.Enabled := True;
   If Anim.Active Then Anim.Active := False;
end;

procedure TfrmEncerraPeriodoMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Criação da Classe de Negócio
  Periodo        := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensPeriodo);

  cdsExercicio.Data := Periodo.ListExercicios(Sistema.Idempresa,False);
  cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.Idempresa ,tbpSoNaoBloq,0,0);

  ProcessaContab := TCtrlProcessaContab.Create;
  ProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False,MensProcessaContab);

  Lancamento     := TCtrlLancamento.Create;
  Lancamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
end;

procedure TfrmEncerraPeriodoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Periodo.Free;
  Lancamento.Free;
  ProcessaContab.Free;
end;


procedure TfrmEncerraPeriodoMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (dblkExercicio.Text <> '') then begin
     cdsPeriodo.Data := Periodo.ListPeriodo(Sistema.Idempresa ,tbpSoNaoBloq,StrToInt(dblkExercicio.LookupValue),0);
  end; 

end;

procedure TfrmEncerraPeriodoMT.MensProcessaContab(msg: String);
begin
   if msg <> '*' then
      mmStatus.Lines.Add(msg);
   prbImportar.Max      := ProcessaContab.MaxProgresso;
   prbImportar.Position := ProcessaContab._Progresso;
   Application.ProcessMessages;
end;

procedure TfrmEncerraPeriodoMT.MensPeriodo(msg: String);
begin
   mmStatus.Lines.Add(msg);
   Application.ProcessMessages;
end;

end.
