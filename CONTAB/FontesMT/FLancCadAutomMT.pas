unit FLancCadAutomMT;

(*==============================================================================
Analista : Alex Pereira
Data     : 14/09/04
Pendência: 17679
Descrição: As descrições de planilhas com brancos ao final não estava funcionando o locate
==============================================================================*)
(*==============================================================================
Analista : Alex Pereira
Data     : 09/01/04
Pendência: 14451 Nova estrutura para segregação
           FLGSEGREGACRITER
==============================================================================*)
{ 25/07/03 - Alex - Pendência 14503 - corrigir filtro começa com }
{ 22/10/03 - Alex - Pendência 15148 - o botão 'OK' estava sendo pressionado duas
                    vezes na execução, pela demora no retorno da execução }


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlPeriodo,uCtrlPrePlanilhaLA,uCtrlContab, FOkCancelar, Db, DBClient, uCMClientDataSet,
  ComCtrls,
  StdCtrls, Buttons, CheckLst, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97,
  ExtCtrls, Wwdatsrc, uCMTypes;

type
  TfrmLancCadAutomMT = class(TfrmOkCancelar)
    edDataProc: TCMDateTimePicker;
    Label14: TLabel;
    dblkExerc: TwwDBLookupCombo;
    Label3: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    cbRateiaUnidx: TCheckBox;
    clbModulo: TCheckListBox;
    spdTodos: TSpeedButton;
    spdInverter: TSpeedButton;
    edComecaCom: TEdit;
    lblComecaCom: TLabel;
    mmTxt: TRichEdit;
    Label1: TLabel;
    pgrAutomatico: TProgressBar;
    cdsExercicio: TCMClientDataSet;
    CdsPeriodo: TCMClientDataSet;
    cdsPlaAutomaticas: TCMClientDataSet;
    Anim: TAnimate;
    ds: TwwDataSource;
    cbRateiaPlanoPatrox: TCheckBox;
    edtFase: TEdit;
    btnMarcarFiltro: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spdTodosClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataProcExit(Sender: TObject);
    procedure dblkExercCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnMarcarFiltroClick(Sender: TObject);
  private
   CtrlPlanilhaLA :TCtrlPrePlanilhaLA;
   CtrlContab     :TCtrlContab;
   CtrlPeriodo    :TCtrlPeriodo;
   Procedure MensProcAutomatica(msg : String);
   Procedure DecodePlanilha(const sLinha: string; var iFase: integer; var sPlanilha: String);

  public
    { Public declarations }
  end;

var
  frmLancCadAutomMT: TfrmLancCadAutomMT;

implementation

{$R *.DFM}

uses uSistema, uMensErro,  dBaseDados, uDataBase,
     uModulo, uFuncaoGeral;

procedure TfrmLancCadAutomMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPlanilhaLA.Free;
  CtrlContab.Free;
  CtrlPeriodo.Free;
end;

procedure TfrmLancCadAutomMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe planilha ***
  CtrlPlanilhaLA   := TCtrlPrePlanilhaLA.Create(Sistema.IdEmpresa);
  CtrlPlanilhaLA.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensProcAutomatica);

  cdsPlaAutomaticas.Data := CtrlPlanilhaLA.CarregaPlanilhasComp(Sistema.IdEmpresa);
  CtrlPlanilhaLA.cdsPlaSelecionadas := cdsPlaAutomaticas;

  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.IdEmpresa,True);

  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
    MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


   cdsPlaAutomaticas.First;
   While Not cdsPlaAutomaticas.EOF do
   Begin
      // inserida a informação de fase.
      clbModulo.Items.Add ( IntToStr(cdsPlaAutomaticas.Fieldbyname('PANFASE').AsInteger) + ' '+
                            cdsPlaAutomaticas.Fieldbyname('PANDESCRICAO').AsString);
      cdsPlaAutomaticas.next;
   End;
   pgrAutomatico.Max := clbModulo.Items.Count;

end;

procedure TfrmLancCadAutomMT.spdTodosClick(Sender: TObject);
var
   imaxlist : integer;
begin
  inherited;
  For iMaxList := 0 to clbModulo.Items.count -1 Do Begin
     clbModulo.Checked[imaxList] := True;
  End;

end;

procedure TfrmLancCadAutomMT.spdInverterClick(Sender: TObject);
var
   imaxlist : integer;
begin
  inherited;

  For iMaxList := 0 to clbModulo.Items.count -1 Do
  Begin
     clbModulo.Checked[imaxList] := Not clbModulo.Checked[imaxList];
  End;

end;

procedure TfrmLancCadAutomMT.FormShow(Sender: TObject);
begin
  inherited;
  If cdsPlaAutomaticas.IsEmpty Then
  Begin
    MsgDlg('Não Existem Planilhas Automáticas Cadastradas','Erro',mtError,[mbOk, mbHelp], 0);
    bbtnSairClick(self);
    Exit;
  End;

  If CtrlContab.TipoFechamento = 'D' Then
  Begin
     edDataProc.Enabled    := True;
     dblkExerc.Enabled     := False;
     dblkPeriodo.Enabled   := False;
     edDataProc.Text       := DateToStr(CtrlContab.DataUltFecha + 1);
     edDataProc.Date       := (CtrlContab.DataUltFecha + 1);
     edDataProc.SetFocus;
  End Else
  Begin
     edDataProc.Enabled    := False;
     dblkExerc.Enabled     := True;
     dblkPeriodo.Enabled   := True;
     dblkExerc.SetFocus;
  End;

end;

procedure TfrmLancCadAutomMT.bbtnConfirmarClick(Sender: TObject);
var
  i, iNumPla, iFase :Integer;
  sLinha, sPlanilha: string;
begin
   inherited;

   try
      Anim.Visible := True;
      Anim.Active := True;
      bbtnConfirmar.Enabled := false;
      bbtnCancelar.Enabled := false;
      bbtnSair.Enabled := false;
      bbtnAjuda.Enabled := false;

      If CtrlContab.TipoFechamento = 'D' Then
      Begin
         If Trim(edDataProc.Text) = '' Then
         Begin
            MsgDlg('Obrigatório preencher a data de geração','Aviso',mtWarning,[mbOk],0);
            edDataProc.SetFocus;
            Exit;
         End;
      End Else
      Begin
         If dblkExerc.text = '' Then
         Begin
           MsgDlg('Exercício não selecionado.','Aviso',mtWarning,[mbOk],0);
           dblkExerc.SetFocus;
           Exit;
         End;

         If dblkPeriodo.text = '' Then
         Begin
            MsgDlg('Período não selecionado.','Aviso',mtWarning,[mbOk],0);
            dblkPeriodo.SetFocus;
            Exit;
         End;
         edDataProc.Text := cdsPeriodo.FieldByName('PERDATFIM').AsString;
         edDataProc.Date := cdsPeriodo.FieldByName('PERDATFIM').AsDateTime;
         Application.ProcessMessages;
      End;

      // *** grava as as planilhas marcadas
      iNumPla := 0;
      For i := 0 to clbModulo.Items.Count -1  do
      Begin
         sLinha := clbModulo.Items.Strings[i];
         DecodePlanilha (sLinha, iFase, sPlanilha);

         if not cdsPlaAutomaticas.Locate('PANDESCRICAO', sPlanilha,[]) then begin
           MsgDlg ('Erro ao se localizar a planilha: ' + #13 +
                   sPlanilha, Sistema.NomeAplicativo, mtError, [mbok], 0);
           exit;
         end;
         cdsPlaAutomaticas.Edit;

         if clbModulo.Checked[i] then begin
           cdsPlaAutomaticas.FieldByName('SEL').asString := 'S';
           inc (iNumPla);
         end else
           cdsPlaAutomaticas.FieldByName('SEL').asString := 'N';

         cdsPlaAutomaticas.Post;
      End;

      If iNumPla = 0 then begin
        MsgDlg('Nenhuma planilha foi selecionada.','Aviso',mtWarning,[mbOk],0);
        Exit;
      end;


      mmTxt.Lines.Clear;
      mmTxt.Lines.Add('Verificando planilhas a excluir');
      Application.ProcessMessages;

     // *** começa o processamento
      If Not CtrlPlanilhaLA.ProcessaPlaLancAuto(Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                             CtrlContab.PlanoParam,StrToInt(dblkPeriodo.LookUpValue),StrToInt(dblkExerc.Text),
                             cdsPeriodo.FieldByName('PERDATFIM').AsString,edDataProc.Text,
                             CtrlContab.TipoFechamento,Sistema.UsaPlanoPatro) then
      Begin
         MsgDlg(CtrlPlanilhaLA.MessageInfo,'Erro',mtError,[mbOk], 0);
         mmTxt.Lines.Add(' ');
         mmTxt.Lines.Add('***  Os Lançamentos Automáticos não puderam ser realizados ***');
         Application.ProcessMessages;
      End Else
      Begin
        MsgDlg(CtrlPlanilhaLA.MessageInfo,'Aviso',mtInformation,[mbOk], 0);
        mmTxt.Lines.Add(' ');
        Application.ProcessMessages;
      End;

      If Sistema.ConnectionSide = CnsClient Then
      Begin
         mmTxt.Lines.Add(CtrlPlanilhaLA.sMensAPS_Log);
      End;

   finally
      Anim.Active  := False;
      Anim.Visible := False;
      bbtnConfirmar.Enabled := true;
      bbtnCancelar.Enabled := true;
      bbtnSair.Enabled := true;
      bbtnAjuda.Enabled := true;
   end;

end;

procedure TfrmLancCadAutomMT.edDataProcExit(Sender: TObject);
begin
  inherited;

   If Not CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa,edDataProc.Text) Then
      Exit;

   dblkExerc.LookupValue := IntToStr(CtrlPeriodo.Exercicio);

   CdsPeriodo.Data  := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,CtrlPeriodo.Exercicio,0);

   dblkPeriodo.LookupValue   := IntToStr(CtrlPeriodo.Periodo);

end;

procedure TfrmLancCadAutomMT.dblkExercCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   CdsPeriodo.Data  := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,StrToInt(dblkExerc.LookUpValue),0);
end;

procedure TfrmLancCadAutomMT.MensProcAutomatica(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
       mmTxt.Lines.Add(msg);
     pgrAutomatico.Max      := CtrlPlanilhaLA.MaxProgresso;
     pgrAutomatico.Position := CtrlPlanilhaLA.ProgressoPos;
     Application.ProcessMessages;
  End;
end;

procedure TfrmLancCadAutomMT.btnMarcarFiltroClick(Sender: TObject);
var
  iNum, iPos, i, iFase, iFaseSel : Integer;
  sLinha, sPlanilha: string;
begin
  inherited;

  iNum := length(trim(edComecaCom.Text));
  iFaseSel := StrToIntDef(trim(edtFase.Text),-1);

  for i:=0 to clbModulo.Items.count -1 do begin
    sLinha := clbModulo.Items[i];
    DecodePlanilha (sLinha, iFase, sPlanilha);
    sPlanilha := AnsiUpperCase (copy ( sPlanilha, 1, iNum ));

    // fase selecionada
    if (trim(edtFase.Text) <> '') then begin
      // fase passou do selecionado sair do procedimento
      if (iFaseSel < iFase) then exit;
      // fase encontrada igual a procurada
      if (iFaseSel = iFase) then begin
        // nenhum nome de planilha foi selecionado marcar item
        if (trim(edComecaCom.Text) = '') then begin
          clbModulo.Checked[i] := true;
        end else begin
          // nome de planilha selecionado
          if sPlanilha = Trim(edComecaCom.Text) then
            clbModulo.Checked[i] := true;
        end;
      // verificar se fase maior que selecionada sair do processo
      end else if (iFaseSel < iFase) then begin
        exit;
      end;
    // fase não selecionada
    end else begin
      if sPlanilha = Trim(edComecaCom.Text) then
        clbModulo.Checked[i] := true;
    end;
  end;
end;

// recebe uma string concatenada com a fase e o nome da planilha e resulta os dois campos separadamente
procedure TfrmLancCadAutomMT.DecodePlanilha(const sLinha: string;
  var iFase: integer; var sPlanilha: String);
var
  iPos, iTam: integer;
begin
  iTam := length(sLinha);
  iPos := pos (' ', sLinha);
  iFase := StrToIntDef ( trim(copy(sLinha,1,iPos)), 0);
  sPlanilha := copy(sLinha, iPos + 1, iTam - iPos);
end;

end.
