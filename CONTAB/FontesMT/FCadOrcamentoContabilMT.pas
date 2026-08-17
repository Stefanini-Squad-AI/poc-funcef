unit FCadOrcamentoContabilMT;

(*==============================================================================
Analista : Antonio Marcos
Data     : 23.12.2005
Pendência: 15330 - De/Para Centro de Custo
==============================================================================*)


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ExtCtrls, Mask, wwdblook, TREdit, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, MontaSelect, Wwdatsrc, uCtrlPeriodo, DBClient,
  uCtrlContaContabil,uCtrlContab, uCMClientDataSet,
  uCtrlPlanoSaldo, uCtrlListTerceiros, CMProcuraMask,uCtrlSubConta,
  uCMTypes;


type
  TfrmCadOrcamentoContabilMT = class(TfrmSairAjuda)
    Label2: TLabel;
    Label5: TLabel;
    mskSubConta: TMaskEdit;
    Label6: TLabel;
    btnSubConta: TBitBtn;
    mskAtivProj: TMaskEdit;
    btnAtivProj: TBitBtn;
    Label7: TLabel;
    btnSeleciona: TBitBtn;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    redValorDebito: TRealEdit;
    Label1: TLabel;
    redValorCredito: TRealEdit;
    Label3: TLabel;
    btnInclui: TBitBtn;
    dbgrdSaldo: TwwDBGrid;
    Label8: TLabel;
    redValorTotalD: TRealEdit;
    redValorTotalC: TRealEdit;
    dblkExercicio: TwwDBLookupCombo;
    dblkCCusto: TwwDBLookupCombo;
    MontaSelectAtivProj: TMontaSelect;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    CdsExercicio: TCMClientDataSet;
    CdsPeriodo: TCMClientDataSet;
    dsGrid: TwwDataSource;
    CdsGrid: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    cmpConta: TCMProcuraMaskContabil;
    MontaSelectSubConta: TMontaSelect;
    mskUnidNegoc: TMaskEdit;
    Bevel1: TBevel;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    cdsAux: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    {Procedimentos Definidos}
    procedure HabilitaDetalhe;
    procedure DesabilitaDetalhe;
    procedure MontaOrcamento;
    procedure LimpaControles;
    procedure CalcTotais;
    procedure dblkPeriodoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnIncluiClick(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbgrdSaldoTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdSaldoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure btnSubContaClick(Sender: TObject);
    procedure mskSubContaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmpContaExit(Sender: TObject);

  private
    iPernumero, iSubConta,iUniNegoc :integer;
    iPlanoPrev,iPatro  :integer;
    sCCusto,  sTipoConta  :string;

    CtrlPeriodo       :TCtrlPeriodo;
    CtrlContaContabil :TCtrlContaContabil;
    CtrlContab        :TCtrlContab;
    CtrlSubConta      :TCtrlSubConta;
    CtrlPlanoSaldo    :TCtrlPlanoSaldo;
    ListTerceiros     :TCtrlListTerceiros;
    procedure PreencheParametros;
    procedure CriticaCamposObrigatorio;

  public
    { Public declarations }
  end;

var
  frmCadOrcamentoContabilMT: TfrmCadOrcamentoContabilMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uModulo, uFuncaoGeral;

{$R *.DFM}


procedure  TfrmCadOrcamentoContabilMT.PreencheParametros;
begin
    {pega unidade de negocio}
    If mskAtivProj.text <> '' Then
    Begin
       iUniNegoc := StrToInt(mskUnidNegoc.text);
    End Else
    Begin
       CtrlPlanoSaldo.RetornaUnidNegoc(Sistema.IdEmpresa);
       iUniNegoc := CtrlPlanoSaldo.UnidNegoc;
    End;

    {pega centro de custo}
    If dblkCCusto.text <> '' Then
    Begin
       sCCusto    := Trim(CdsCentroCusto.FieldByName('CODCENTROCUSTO').asString);
    End Else
    Begin
       sCCusto    := '';
    End;

    {pega subconta}
    If mskSubConta.text <> '' Then
      iSubConta := StrToInt(mskSubConta.text)
    Else
       iSubConta := 0;

    {pega planoprev}
    If dblcPlanoPrevC.text <> '' Then
       iPlanoPrev := StrToInt(dblcPlanoPrevC.LookupValue)
    Else
       iPlanoPrev := 0;

    {pega plano patro}
    If dblcPatroC.text <> '' Then
       iPatro := StrToInt(dblcPatroC.LookupValue)
    Else
        iPatro := 0;

   If dblkPeriodo.Text <> '' Then
      iPernumero := StrToInt(dblkPeriodo.LookupValue)
   Else
      iPernumero := 0;

   If CtrlContaContabil.TestaContaContabil(CtrlContab.PlanoParam,Sistema.idEmpresa,iPernumero,StrToIntDef(dblkExercicio.LookupValue,0),cmpConta.Conta.Numero,false,false) Then
      sTipoConta := CtrlContaContabil.TipoContaContabil;

end;

procedure  TfrmCadOrcamentoContabilMT.CriticaCamposObrigatorio;
begin
   If dblkExercicio.text = '' Then
   Begin
      MessageDlg('Exercício não selecionado.',mtWarning,[mbOK],0);
      dblkExercicio.SetFocus;
      Abort;
   End;

   If cmpConta.Conta.Numero = '' Then
   Begin
      MessageDlg('Conta Contábil não informada.',mtWarning,[mbOK],0);
      cmpConta.SetFocus;
      Abort;
   End;

   If (cmpConta.Conta.ObrigaCentrodeCusto) and (dblkCCusto.text = '') Then
   Begin
      MessageDlg('A Conta selecionada obrica Centro de Custo.',mtWarning,[mbOK],0);
      dblkCCusto.SetFocus;
      Abort;
   End;

end;


procedure TfrmCadOrcamentoContabilMT.FormCreate(Sender: TObject);
begin
  inherited;
   // *** Instancia a classe subconta ***
  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(-1,tbpTodos,-1,-1);
  CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.IdEmpresa,True);

  // *** instancia a classe geral conta contabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe terceiros ***
  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsAtivProj.Data  := ListTerceiros.ListAtivProj(-1,0,'',tapAmbos,toapCodigo);
  CdsPatro.Data     := ListTerceiros.ListPlanoPatro;
  CdsPlanoPrev.Data := ListTerceiros.ListPlanoPrev;


  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


   // *** Atribui mascaras para os campos ***
  cmpConta.Plano        := CtrlContab.PlanoParam;
  cmpConta.Mascara      := CtrlContab.MascaraContaParam;
  mskAtivProj.EditMask  := Modulo.sMascaraUnidNegoc + ';0; ';

  // *** Instancia a classe saldo ***
  CtrlPlanoSaldo := TCtrlPlanoSaldo.Create;
  CtrlPlanoSaldo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Atribui a máscara da conta contábil e da Ativ/Proj do monta Select ***
  MontaSelectAtivProj.Mascaras[0] := modulo.sMascaraUnidNegoc + ';0; ';
  mskAtivProj.EditMask            := modulo.sMascaraUnidNegoc + ';0; ';


  // *** Acrescenta filtro no monta select do ativ/proj
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

  pnlPlanoPatroC.Enabled := Sistema.UsaPlanoPatro;
end;


procedure TfrmCadOrcamentoContabilMT.LimpaControles;
begin

   redValorDebito.value   := 0;
   redValorCredito.value  := 0;
   dblkCCusto.text        := '';
   mskSubConta.text       := '';
   mskAtivProj.text       := '';
   mskUnidNegoc.text      := '';
   dblcPlanoPrevC.Text    := '';
   dblcPatroC.Text        := '';

   dblkCCusto.enabled     := false;
   dblkCCusto.color       := clBtnFace;

   mskSubConta.enabled    := false;
   mskSubConta.color      := clBtnFace;
   btnSubConta.enabled    := false;

end;



procedure TfrmCadOrcamentoContabilMT.btnAtivProjClick(Sender: TObject);
begin
   inherited;
  MontaSelectAtivProj.Executar;
  Repaint;
  If MontaSelectAtivProj.RetornouValor Then
  Begin
    CdsAtivProj.Data    := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,StrToFloat(MontaSelectAtivProj.ValoresChave[3]),Trim(MontaSelectAtivProj.ValoresChave[1]),tapAmbos,toapCodigo);
    If CdsAtivProj.FieldByName('UNETIPO').AsString = 'S' Then
    Begin
      MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
      mskAtivProj.SetFocus;
      Exit;
    End Else
    Begin
      mskAtivProj.text    := CdsAtivProj.FieldByName('UNECODIGO').asString;
      mskUnidNegoc.text   := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
    End;
  End;

end;


procedure TfrmCadOrcamentoContabilMT.mskAtivProjExit(Sender: TObject);
begin
  inherited;
  If mskAtivProj.text <> '' Then
  Begin

    CdsAtivProj.Data := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,Trim(mskAtivProj.Text),tapAmbos,toapCodigo);

    If Not CdsAtivProj.IsEmpty Then
    Begin
       If CdsAtivProj.FieldByName('UNETIPO').asString = 'S' Then
       Begin
         MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
         mskAtivProj.SetFocus;
         Exit;
       End Else
       Begin
         mskAtivProj.text  := CdsAtivProj.FieldByName('UNECODIGO').asString;
         mskUnidNegoc.text := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
       End
    End Else
    Begin
       MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
       mskAtivProj.SetFocus;
    End;

  End;

end;

procedure TfrmCadOrcamentoContabilMT.DesabilitaDetalhe;
begin

   CdsPeriodo.Data := CtrlPeriodo.ListPeriodo(-1,tbpTodos,-1,-1);

   dblkPeriodo.enabled    := false;
   dblkPeriodo.Color      := clBtnFace;

   redValorDebito.value   := 0;
   redValorDebito.enabled := false;
   redValorDebito.Color   := clBtnFace;

   redValorCredito.value   := 0;
   redValorCredito.enabled := false;
   redValorCredito.Color   := clBtnFace;

   btnInclui.enabled      := false;

end;


procedure TfrmCadOrcamentoContabilMT.btnSelecionaClick(Sender: TObject);
begin
   inherited;
   CriticaCamposObrigatorio;

   // *** preenche combo periodo ***
   CdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,StrToInt(dblkExercicio.text),0);

   HabilitaDetalhe;
   MontaOrcamento;
end;

procedure TfrmCadOrcamentoContabilMT.MontaOrcamento;
begin
    screen.cursor := crHourglass;
    PreencheParametros;


   { Traz registros (periodos) para o grid }
   CdsGrid.Data := CtrlPlanoSaldo.MontaOrcamento(Sistema.IdEmpresa,StrToInt(dblkExercicio.text),CtrlContab.PlanoParam,iUniNegoc,
                                                 iPatro,iPlanoPrev,0,iSubConta,Trim(cmpConta.Conta.Numero),sCCusto);

   TFloatField(CdsGrid.FieldByName('PLSORCADODEBITO')).DisplayFormat  := '#,##0.00';
   TFloatField(CdsGrid.FieldByName('PLSORCADOCREDITO')).DisplayFormat := '#,##0.00';

   If not CdsGrid.IsEmpty Then
      CalcTotais;

   dblkPeriodo.SetFocus;
   screen.cursor := crDefault;

end;

procedure TfrmCadOrcamentoContabilMT.HabilitaDetalhe;
begin

   dblkPeriodo.enabled := true;
   dblkPeriodo.Color   := clWindow;

   redValorDebito.enabled := true;
   redValorDebito.Color   := clWindow;

   redValorCredito.enabled := true;
   redValorCredito.Color   := clWindow;

   btnInclui.enabled := true;

end;


procedure TfrmCadOrcamentoContabilMT.dblkPeriodoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   screen.cursor := crHourglass;
   cdsAux.Data := CtrlPlanoSaldo.MontaOrcamento(Sistema.IdEmpresa,StrToInt(dblkExercicio.text),CtrlContab.PlanoParam,iUniNegoc,
                                                 iPatro,iPlanoPrev,StrToIntDef(dblkPeriodo.LookUpValue,100),iSubConta,trim(cmpConta.Conta.Numero),sCCusto);

   TFloatField(cdsAux.FieldByName('PLSORCADODEBITO')).DisplayFormat  := '#,##0.00';
   TFloatField(cdsAux.FieldByName('PLSORCADOCREDITO')).DisplayFormat := '#,##0.00';

   If Not cdsAux.IsEmpty Then
   Begin
      redValorDebito.value  := cdsAux.FieldByName('PLSORCADODEBITO').asFloat;
      redValorCredito.value := cdsAux.FieldByName('PLSORCADOCREDITO').asFloat;
   End;

   screen.cursor := crDefault;

end;

procedure TfrmCadOrcamentoContabilMT.btnIncluiClick(Sender: TObject);
begin
   inherited;

   CriticaCamposObrigatorio;

   PreencheParametros;

   CdsGrid.Data := CtrlPlanoSaldo.MontaOrcamento(Sistema.IdEmpresa,StrToInt(dblkExercicio.text),CtrlContab.PlanoParam,iUniNegoc,
                                                 iPatro,iPlanoPrev,iPerNumero,iSubConta,trim(cmpConta.Conta.Numero),sCCusto);
   TFloatField(CdsGrid.FieldByName('PLSORCADODEBITO')).DisplayFormat  := '#,##0.00';
   TFloatField(CdsGrid.FieldByName('PLSORCADOCREDITO')).DisplayFormat := '#,##0.00';

   If CdsGrid.IsEmpty Then
   Begin
     {Se a conta não tiver saldo, inclui}

     If Not CtrlPlanoSaldo.InserePlanoSaldo(CtrlContab.PlanoParam,iUniNegoc,Sistema.IdUsuario,
                                     Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdEmpresa,
                                     StrToInt(dblkExercicio.text),iPernumero,
                                     iPatro,iPlanoPrev,iSubConta, Trim(cmpConta.Conta.Numero),sCcusto, sTipoConta,
                                     0,0,0,0,0,0,0,0,0,0,0,0, redValorDebito.value,redValorCredito.value) Then
     Begin
       MsgDlg(CtrlPlanoSaldo.MessageInfo,'Erro',MtError,[mbOk],0);
       Exit;
     End
   End Else
   Begin
     If not CtrlPlanoSaldo.AlteraOrcamento(CdsGrid.FieldByName('IDPLANOSALDO').asInteger,
                                       redValorDebito.value,redValorCredito.value) then
     Begin
       MsgDlg(CtrlPlanoSaldo.MessageInfo,'Erro',MtError,[mbOk],0);
       Exit;
     End

   End;

   // recarrega o grid
   CdsGrid.Data := CtrlPlanoSaldo.MontaOrcamento(Sistema.IdEmpresa,StrToInt(dblkExercicio.text),CtrlContab.PlanoParam,iUniNegoc,
                                                 iPatro,iPlanoPrev,0,iSubConta,trim(cmpConta.Conta.Numero),sCCusto);

   TFloatField(CdsGrid.FieldByName('PLSORCADODEBITO')).DisplayFormat  := '#,##0.00';
   TFloatField(CdsGrid.FieldByName('PLSORCADOCREDITO')).DisplayFormat := '#,##0.00';

   CalcTotais;
   CdsGrid.First;

end;
procedure TfrmCadOrcamentoContabilMT.CalcTotais;
var rTotDeb, rTotCre : Double;
begin
    rTotDeb := 0;
    rTotCre := 0;

    If CdsGrid.IsEmpty Then Exit;

    CdsGrid.DisableControls;

    CdsGrid.First;
    While not CdsGrid.EOF Do
    Begin
      rTotDeb := rTotDeb + CdsGrid.FieldByName('PLSORCADODEBITO').AsFloat;
      rTotCre := rTotCre + CdsGrid.FieldByName('PLSORCADOCREDITO').AsFloat;
      CdsGrid.Next;
    End;

    CdsGrid.EnableControls;

   redValorTotalD.Value := rTotDeb;
   redValorTotalC.Value := rTotCre;
end;


procedure TfrmCadOrcamentoContabilMT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
   CdsGrid.Close;
   DesabilitaDetalhe;

end;

procedure TfrmCadOrcamentoContabilMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   CdsGrid.Close;
   DesabilitaDetalhe;

end;

procedure TfrmCadOrcamentoContabilMT.dbgrdSaldoTopRowChanged(
  Sender: TObject);
begin
  inherited;
  dbgrdSaldo.invalidate;

end;

procedure TfrmCadOrcamentoContabilMT.FormShow(Sender: TObject);
begin
  inherited;
   dblkExercicio.SetFocus;
end;

procedure TfrmCadOrcamentoContabilMT.dbgrdSaldoCalcCellColors(
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

procedure TfrmCadOrcamentoContabilMT.btnSubContaClick(Sender: TObject);
begin
   inherited;
  MontaSelectSubConta.Executar;
  Repaint;
  If MontaSelectSubConta.RetornouValor Then
  Begin
    CdsSubConta.Data := CtrlSubConta.ListSubConta (Sistema.IdEmpresa,StrToFloat(MontaSelectsubConta.ValoresChave[0]));
    mskSubConta.text := CdsSubConta.FieldByName('CODSUBCONTA').asString;
  End;

end;

procedure TfrmCadOrcamentoContabilMT.mskSubContaExit(Sender: TObject);
begin
  inherited;
  If (trim(mskSubConta.Text) <> '')  And (trim(mskSubConta.Text) <> '0') Then
  Begin

    CdsSubConta.Data := CtrlContaContabil.ListContasxSC(CtrlContab.PlanoParam,Sistema.IdEmpresa,StrToInt(Trim(mskSubConta.Text)),Trim(cmpConta.Conta.Numero),toCodigo);

    If CdsSubConta.IsEmpty Then
    Begin
      MsgDlg('Subconta não existe ou não é permitida para esta conta contábil','Aviso',mtWarning,[mbOk],0);
      mskSubConta.SetFocus;
      Exit;
    End;
    mskSubConta.Text := IntToStr(CdsSubConta.FieldByName('CODSUBCONTA').asInteger);
  End;

end;

procedure TfrmCadOrcamentoContabilMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.Free;
  CtrlContaContabil.Free;
  CtrlContab.Free;
  CtrlPlanoSaldo.Free;
  ListTerceiros.Free;
  CtrlSubConta.Free;

end;

procedure TfrmCadOrcamentoContabilMT.cmpContaExit(Sender: TObject);
begin
  inherited;
    If (ActiveControl.Tag <> 999) and (cmpConta.Valida <> VcOK) Then
    Begin
       cmpConta.SetFocus;
       LimpaControles;
       Exit;
    End;
    // *** Pega o tipo da conta ***
    If CtrlContaContabil.TestaContaContabil(CtrlContab.PlanoParam,Sistema.idEmpresa,1,StrToIntDef(dblkExercicio.LookupValue,0),cmpConta.Conta.Numero,True,True) Then
       sTipoConta := CtrlContaContabil.TipoContaContabil;

    // *** Verifica se a conta obriga Sub-Conta ***
    If cmpConta.Conta.ObrigaSubConta Then
    Begin
        mskSubConta.enabled := true;
        mskSubConta.color   := clWindow;
        btnSubConta.enabled := true;
     End Else
     Begin
        mskSubConta.Text    := '' ;
        mskSubConta.color   := clBtnFace;
        mskSubConta.Text    := '';
        mskSubConta.enabled := false;
        btnSubConta.enabled := false;
     End;

    // *** verifica se obriga o centro de custo ***
    If cmpConta.Conta.ObrigaCentrodeCusto Then
    Begin
        dblkCCusto.enabled := true;
        dblkCCusto.color   := clWindow;

        CdsCentroCusto.Data :=  CtrlContaContabil.ListContasxCC(CtrlContab.PlanoParam,Sistema.idEmpresa,Trim(cmpConta.Conta.Numero),'',tccAmbasCC,toCodigo);

     End Else
     Begin
        dblkCCusto.Text    := '';
        dblkCCusto.color   := clBtnFace;
        dblkCCusto.enabled := false;
     End;

end;

end.
