unit FSaldosPesqMT;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, Mask, wwdbedit, Db, Wwdatsrc, DBTables,
  Wwquery, MontaSelect, FTelaAut, IvDictio, IvMulti,uCtrlPeriodo,uCtrlListTerceiros,
  wwdbdatetimepicker, CMDateTimePicker, IvEMulti, DBClient,uCtrlProcessaContab,
  uCMClientDataSet, CMProcuraMask, uCmSqlParams,uCtrlContab,
  uCMTypes;

type
  TfrmSaldosPesquisaMT = class(TfrmSairAjuda)
    dbgrdSaldos: TwwDBGrid;
    dsSaldos: TwwDataSource;
    btnFiltrar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label2: TLabel;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    Label14: TLabel;
    edDataProc: TCMDateTimePicker;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    btnLancamentos: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    CdsPeriodo: TCMClientDataSet;
    CdsExercicio: TCMClientDataSet;
    cdsSaldos: TCMClientDataSet;
    Panel1: TPanel;
    Bevel1: TBevel;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure dblkExercicioChange(Sender: TObject);
    procedure dbgrdSaldosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdSaldosTopRowChanged(Sender: TObject);
    procedure btnLancamentosClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDataProcExit(Sender: TObject);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
  private
    { Private declarations }
    CtrlPeriodo   :TCtrlPeriodo;
    ListTerceiros :TCtrlListTerceiros;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlContab  :TCtrlContab;
    procedure FazOnCalcField;
  public
    { Public declarations }
  end;

var
  frmSaldosPesquisaMT: TfrmSaldosPesquisaMT;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uModulo,
     uFuncaoGeral, uString, FLancSaldosMT;

{$R *.DFM}


procedure TfrmSaldosPesquisaMT.FormCreate(Sender: TObject);
begin
   inherited;

  // *** Instancia a classe CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  cmpContaIni.Plano     := CtrlContab.PlanoParam;
  cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
  cmpContaFim.Plano     := CtrlContab.PlanoParam;
  cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;


  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);


  CdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(-1,tbpTodos,-1,-1);
  CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.IdEmpresa,True);

  // *** Instancia a classe terceiros ***
  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  // *** Instancia a classe terceiros ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  if Sistema.UsaPlanoPatro then
  begin
    pnlPlanoPatroC.Enabled := True;
    CdsPatro.Data     := ListTerceiros.ListPlanoPatro;
    CdsPlanoPrev.Data := ListTerceiros.ListPlanoPrev;
  end;

   cdsSaldos.Data := CtrlProcessaContab.ListaSaldoContas(-1,-1,
                     StrToIntDef(dblkExercicio.LookupValue,0),StrToIntDef(dblkPeriodo.LookupValue,0),
                     StrToIntDef(dblcPlanoPrevC.LookupValue,0),StrToIntDef(dblcPatroC.LookupValue,0),
                     edDataProc.Text,cmpContaIni.Conta.Numero,cmpContaFim.Conta.Numero);

   TStringField(cdsSaldos.FieldByName('DEBCREANT')).Alignment   :=  taCenter;
   TStringField(cdsSaldos.FieldByName('DEBCRESALDO')).Alignment :=  taCenter;
   TStringField(cdsSaldos.FieldByName('PLACONTA')).EditMask := modulo.sMascaraContas + ';0; ';
   TFloatField(cdsSaldos.FieldByName('SALDOANTABS')).DisplayFormat := '#,##0.00';
   TFloatField(cdsSaldos.FieldByName('SALDOABS')).DisplayFormat    := '#,##0.00';
   TFloatField(cdsSaldos.FieldByName('DEB')).DisplayFormat         := '#,##0.00';
   TFloatField(cdsSaldos.FieldByName('CRED')).DisplayFormat        := '#,##0.00';
   TFloatField(cdsSaldos.FieldByName('MOV')).DisplayFormat         := '#,##0.00';
 

end;


procedure TfrmSaldosPesquisaMT.dblkExercicioChange(Sender: TObject);
begin
   inherited;

   if dblkExercicio.text <> '' then
   begin
      cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.text),0);
   end;

end;



procedure TfrmSaldosPesquisaMT.dbgrdSaldosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
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



procedure TfrmSaldosPesquisaMT.dbgrdSaldosTopRowChanged(Sender: TObject);
begin
   inherited;
   //Acerta as cores quando muda a linha da grid
   dbgrdSaldos.invalidate;

end;



procedure TfrmSaldosPesquisaMT.btnLancamentosClick(Sender: TObject);
begin
  inherited;
  frmLancSaldosMT := TfrmLancSaldosMT.Create(Self);
  frmLancSaldosMT.ShowModal;
  frmLancSaldosMT.Free;
end;

procedure TfrmSaldosPesquisaMT.btnFiltrarClick(Sender: TObject);
begin
   inherited;

   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Aviso',mtWarning,[mbOk],0);
      dblkExercicio.SetFocus;
      Exit;
   end;

   if dblkPeriodo.text = '' then begin
      MsgDlg('O Periodo deve ser preenchido.','Aviso',mtWarning,[mbOk],0);
      dblkPeriodo.SetFocus;
      Exit;
   end;

   screen.cursor := crSQLWait;

   cdsSaldos.Data := CtrlProcessaContab.ListaSaldoContas(Sistema.idEmpresa,Modulo.iPlano,
                     StrToInt(dblkExercicio.LookupValue),StrToInt(dblkPeriodo.LookupValue),
                     StrToIntDef(dblcPatroC.LookupValue,0),StrToIntDef(dblcPlanoPrevC.LookupValue,0),
                     edDataProc.Text,cmpContaIni.Conta.Numero,cmpContaFim.Conta.Numero);

   TStringField(cdsSaldos.FieldByName('DEBCREANT')).Alignment   :=  taCenter;
   TStringField(cdsSaldos.FieldByName('DEBCRESALDO')).Alignment :=  taCenter;
   TStringField(cdsSaldos.FieldByName('PLACONTA')).EditMask := modulo.sMascaraContas + ';0; ';
   TFloatField(cdsSaldos.FieldByName('SALDOANTABS')).DisplayFormat := '#,##0.00';
   TFloatField(cdsSaldos.FieldByName('SALDOABS')).DisplayFormat    := '#,##0.00';
   TFloatField(cdsSaldos.FieldByName('DEB')).DisplayFormat         := '#,##0.00';
   TFloatField(cdsSaldos.FieldByName('CRED')).DisplayFormat        := '#,##0.00';
   TFloatField(cdsSaldos.FieldByName('MOV')).DisplayFormat         := '#,##0.00';


   if cdsSaldos.IsEmpty Then
   begin
     MsgDlg('Não há Saldos para os Dados Selecionados','Aviso',mtWarning,[mbOk],0);
     Exit;
   end;
   cdsSaldos.DisableControls;
   FazOnCalcField;
   cdsSaldos.EnableControls;

   screen.cursor := crDefault;
   btnLancamentos.Enabled := true;

end;


procedure TfrmSaldosPesquisaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   ListTerceiros.free;
   CtrlPeriodo.free;
   CtrlContab.free;
   CtrlProcessaContab.free;
end;

procedure TfrmSaldosPesquisaMT.edDataProcExit(Sender: TObject);
begin
   inherited;
   if trim(edDataProc.Text) <> '' then
   begin

      if not CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.idEmpresa,edDataProc.Text) then
      begin
         edDataProc.SetFocus;
         exit;
      end;

      dblkExercicio.LookupValue := IntToStr(CtrlPeriodo.Exercicio);
      cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.text),0);
      dblkPeriodo.LookupValue   := IntToStr(CtrlPeriodo.Periodo);
      //
      dblkPeriodo.Enabled     := False;
      dblkExercicio.Enabled   := False;
      cmpContaFim.Enabled     := False;
   end else
   begin
      dblkPeriodo.Enabled     := True;
      dblkExercicio.Enabled   := True;
      cmpContaFim.Enabled     := True;
   end;
end;


procedure TfrmSaldosPesquisaMT.FazOnCalcField;
begin
   cdsSaldos.First;
   while not cdsSaldos.eof do
   begin
      cdsSaldos.Edit;
      cdsSaldos.FieldByName('SALDOANTABS').asFloat := ABS(cdsSaldos.FieldByName('SALDOANT').asFloat);
      if cdsSaldos.FieldByName('SALDOANT').asFloat < 0 then begin
         cdsSaldos.FieldByName('DEBCREANT').asString := 'C';
      end else begin
         cdsSaldos.FieldByName('DEBCREANT').asString := 'D';
      end;

      cdsSaldos.FieldByName('SALDOABS').asFloat := ABS(cdsSaldos.FieldByName('SALDO').asFloat);
      if cdsSaldos.FieldByName('SALDO').asFloat < 0 then begin
         cdsSaldos.FieldByName('DEBCRESALDO').asString := 'C';
      end else begin
         cdsSaldos.FieldByName('DEBCRESALDO').asString := 'D';
      end;

      cdsSaldos.Post;
      cdsSaldos.Next;
   end;
   cdsSaldos.First;

end;

procedure TfrmSaldosPesquisaMT.cmpContaIniExit(Sender: TObject);
begin
  inherited;
  If (cmpContaIni.Valida <> VcOK) Then
  Begin
    cmpContaini.SetFocus;
    Exit;
  End;

end;

procedure TfrmSaldosPesquisaMT.cmpContaFimExit(Sender: TObject);
begin
  inherited;
  If (cmpContaFim.Valida <> VcOK) Then
  Begin
    cmpContaFim.SetFocus;
    Exit;
  End;

end;

end.

