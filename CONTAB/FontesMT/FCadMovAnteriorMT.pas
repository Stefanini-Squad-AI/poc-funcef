unit FCadMovAnteriorMT;

{==============================================================================
Analista  : Fernando Xavier
Data      : 18.06.2013
Pendência : SOL 209709 KTN 2022863  
Descrição : Alteração somente em DFM aumento do limite de caracteres
            do campo "Valor a Crédito" e "Valor a Débito"
==============================================================================
Analista  : Rodolpho da Silva
Data      : 23.03.2007
Pendência : 24851
Descrição : Impedir lançamentos de movimento para as contas de estatísticas
que estejam com o flg "Conta Estatística com Movimento" marcado
==============================================================================
Analista : Antonio Marcos
Data     : 23.12.2005
Pendência: 15331 - De/Para Centro de Custo
           dblkcCusto - selected (codexterno)
==============================================================================
//=======================================================================
//
//  Autor     : Rodolpho da Silva
//  Data      : 17/02/2005
//  Pendência : 17924
//  Descrição : - Bloquear lançamento de valores para contas sintéticas;
//              - Gravar o respectivo PLSTIPO na tabela PLANOSALDO;
//              - Obrigar o preenchimento das informações de Plano e Patro.
//=======================================================================   }


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBClient, uCMClientDataSet, Wwdatsrc, StdCtrls,
  CMProcuraMask, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, TREdit, Mask,
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  uCtrlSubConta, uCtrlListTerceiros, uCtrlContaContabil,TB97,
  uCtrlContab, MontaSelect,uCtrlPlanoSaldo,uCtrlPeriodo,
  uCtrlPlanPrevContabPatro,
  uCMTypes;


type
  TfrmCadMovAnteriorMT = class(TfrmSairAjuda)
    dblkExercicio: TwwDBLookupCombo;
    dblkCCusto: TwwDBLookupCombo;
    Label5: TLabel;
    mskSubConta: TMaskEdit;
    Label6: TLabel;
    btnSubConta: TBitBtn;
    mskAtivProj: TMaskEdit;
    mskUnidNegoc: TMaskEdit;
    Label7: TLabel;
    btnAtivProj: TBitBtn;
    btnSeleciona: TBitBtn;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    redValorDebito: TRealEdit;
    Label1: TLabel;
    redValorCredito: TRealEdit;
    Label3: TLabel;
    btnInclui: TBitBtn;
    Bevel1: TBevel;
    dbgrdSaldo: TwwDBGrid;
    Label2: TLabel;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    cmpConta: TCMProcuraMaskContabil;
    dsSaldo: TwwDataSource;
    CdsSaldo: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    MontaSelectSubConta: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    CdsPeriodo: TCMClientDataSet;
    CdsExercicio: TCMClientDataSet;
    procedure mskSubContaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmpContaExit(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnSubContaClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdSaldoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
    iPernumero, iSubConta,iUniNegoc :integer;
    iPlanoPrev,iPatro     :integer;
    sCCusto,  sTipoConta  :string;

    ListTerceiros     : TCtrlListTerceiros;
    CtrlSubConta      : TCtrlSubConta;
    CtrlContaContabil : TCtrlContaContabil;
    CtrlContab        : TCtrlContab;
    CtrlPlanoSaldo    : TCtrlPlanoSaldo;
    CtrlPeriodo       : TCtrlPeriodo;

    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    procedure MensErroMt(sMsg: string);


    procedure HabilitaDetalhe;
    procedure DesabilitaDetalhe;
    procedure LimpaControles;
    procedure CriticaCampos;
    procedure PreencheParametros;
    procedure MontaOrcamento;





  public
    { Public declarations }
  end;

var
  frmCadMovAnteriorMT: TfrmCadMovAnteriorMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uModulo,  uFuncaoGeral;

{$R *.DFM}


procedure TfrmCadMovAnteriorMT.MontaOrcamento;
begin
    screen.cursor := crHourglass;
    PreencheParametros;


   { Traz registros (periodos) para o grid }
   CdsSaldo.Data := CtrlPlanoSaldo.MontaOrcamento(Sistema.IdEmpresa,StrToInt(dblkExercicio.text),CtrlContab.PlanoParam,iUniNegoc,
                                                 iPatro,iPlanoPrev,0,iSubConta,cmpConta.Conta.Numero,sCCusto);

   TFloatField(CdsSaldo.FieldByName('PLSDEBITOCORRENTE')).DisplayFormat  := 'R$ #,##0.00';
   TFloatField(CdsSaldo.FieldByName('PLSCREDITOCOR')).DisplayFormat      := 'R$ #,##0.00';

   If CdsSaldo.IsEmpty Then
    Begin
       MsgDlg('Nenhum Movimento Anterior Encontrado para a Conta Contábil Selecionada.','Aviso',mtWarning,[mbOK],0);
       Exit;
   End;


   dblkPeriodo.SetFocus;
   screen.cursor := crDefault;

end;



procedure TfrmCadMovAnteriorMT.CriticaCampos;
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

   if dblcPlanoPrevC.LookupValue = '' then
   begin
      MsgDlg('Informe a Plano!',Sistema.NomeAplicativo,mtWarning,[mbOk],0);
      if dblcPlanoPrevC.CanFocus then dblcPlanoPrevC.SetFocus;
      Abort;
   end;


   if dblcPatroC.LookupValue = '' then
   begin
      MsgDlg('Informe a Patrocinadora!',Sistema.NomeAplicativo,mtWarning,[mbOk],0);
      if dblcPatroC.CanFocus then dblcPatroC.SetFocus;
      Abort;
   end;

   if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(StrToInt(dblcPatroC.LookupValue),StrToInt(dblcPlanoPrevC.LookupValue)) then
   begin
      MsgDlg('Não existe relacionamento entre este Plano e Patrocinadora',Sistema.NomeAplicativo,mtWarning,[mbOk],0);
      if dblcPlanoPrevC.CanFocus then dblcPlanoPrevC.SetFocus;
      Abort;
   end;

   with TCMClientDataSet.Create(nil) do
   try
      Data := CtrlContaContabil.ListContas(CtrlContab.PlanoParam,tcAmbasC,true,cmpConta.Conta.Numero);

      if FieldByName('FLGESTATCOMLANC').AsString = 'S' then
      begin
         MsgDlg('A conta estatística está com o parâmetro ativo: "Conta Estatística com Movimento". ' + #13 +
                'Este parâmetro não permite movimentações nesta tela.',Sistema.NomeAplicativo,mtWarning,[mbOk],0);
         if cmpConta.CanFocus then
            cmpConta.SetFocus;


         Abort;
      end;

   finally
      Free;
   end;




end;



procedure TfrmCadMovAnteriorMT.HabilitaDetalhe;
begin

   dblkPeriodo.enabled := true;
   dblkPeriodo.Color   := clWindow;

   redValorDebito.enabled := true;
   redValorDebito.Color   := clWindow;

   redValorCredito.enabled := true;
   redValorCredito.Color   := clWindow;

   btnInclui.enabled := true;

end;



procedure TfrmCadMovAnteriorMT.DesabilitaDetalhe;
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



procedure TfrmCadMovAnteriorMT.LimpaControles;
begin

   redValorDebito.value   := 0;
   redValorCredito.value  := 0;
   dblkCCusto.text        := '';
   mskSubConta.text       := '';
   mskAtivProj.text       := '';
   mskUnidNegoc.text      := '';
   dblcPatroC.Text        := '';
   dblcPlanoPrevC.Text    := '';   

   dblkCCusto.enabled     := false;
   dblkCCusto.color       := clBtnFace;

   mskSubConta.enabled    := false;
   mskSubConta.color      := clBtnFace;
   btnSubConta.enabled    := false;

end;



procedure TfrmCadMovAnteriorMT.mskSubContaExit(Sender: TObject);
begin
  inherited;
  If mskSubConta.text <> '' Then
  begin
    {*** Verifica se a subconta existe *** }
    CtrlSubConta.ListSubConta(Sistema.IdEmpresa,StrToFloat(mskSubConta.Text));
    If CtrlSubConta.AchouSubConta Then
    Begin
       mskSubConta.text  := FloatToStr(CtrlSubConta.CodSubConta);
    End Else
    Begin
       MsgDlg('O código da sub-conta informada não existe.','Aviso',mtWarning,[mbOk],0);
       mskSubConta.SetFocus;
    End;
  End;

end;



procedure TfrmCadMovAnteriorMT.FormCreate(Sender: TObject);
begin
  inherited;
   // *** Instancia a classe saldo ***
  CtrlPlanoSaldo := TCtrlPlanoSaldo.Create;
  CtrlPlanoSaldo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensErroMt);


  // *** Instancia a classe terceiros ***
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(CtrlPlanoSaldo);



  // *** Instancia a classe terceiros ***
  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensErroMt);

  CdsAtivProj.Data := ListTerceiros.ListAtivProj(-1,0,'',tapAmbos,toapCodigo);

  CdsPatro.Data     := ListTerceiros.ListPlanoPatro;
  CdsPlanoPrev.Data := ListTerceiros.ListPlanoPrev;

  // *** Instancia a classe subconta ***
  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensErroMt);

  // *** Instancia a classe geral ContaContab ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensErroMt);


  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensErroMt);

  CdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(-1,tbpTodos,-1,-1);
  CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.IdEmpresa,True);

  // *** Instancia a classe geral CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensErroMt);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   // *** Atribui mascaras para os campos ***
  cmpConta.Plano        := CtrlContab.PlanoParam;
  cmpConta.Mascara      := CtrlContab.MascaraContaParam;
  mskAtivProj.EditMask  := Modulo.sMascaraUnidNegoc + ';0; ';


  // *** Atribui a máscara e filtros aos  MontaSelect ***
  MontaSelectAtivProj.Mascaras[0] := modulo.sMascaraUnidNegoc + ';0; ';

  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

  pnlPlanoPatroC.Enabled := Sistema.UsaPlanoPatro;

end;



procedure TfrmCadMovAnteriorMT.cmpContaExit(Sender: TObject);
begin
  inherited;
    If (ActiveControl.Tag <> 999) and (cmpConta.Valida <> VcOK) Then
    Begin
       cmpConta.SetFocus;
       LimpaControles;
       Exit;
    End;

    // *** Pega o tipo da conta ***
    If CtrlContaContabil.TestaContaContabil(CtrlContab.PlanoParam,Sistema.idEmpresa,1,StrToIntDef(dblkExercicio.LookupValue,0),cmpConta.Conta.Numero,false,false) Then
       sTipoConta := CtrlContaContabil.TipoContaContabil;

    // *** Verifica se a conta obriga Sub-Conta ***
    If cmpConta.Conta.ObrigaSubConta Then
    Begin
       mskSubConta.enabled := true;
       mskSubConta.color   := clWindow;
       btnSubConta.enabled := true;
    End Else
    Begin
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
       dblkCCusto.color   := clBtnFace;
       dblkCCusto.enabled := false;
    End;
end;



procedure  TfrmCadMovAnteriorMT.PreencheParametros;
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


end;



procedure TfrmCadMovAnteriorMT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
   CdsSaldo.Close;
   DesabilitaDetalhe;

end;



procedure TfrmCadMovAnteriorMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   CdsSaldo.Close;
   DesabilitaDetalhe;

end;



procedure TfrmCadMovAnteriorMT.btnSubContaClick(Sender: TObject);
begin
  inherited;
  MontaSelectSubConta.Executar;
  Repaint;
  If MontaSelectSubConta.RetornouValor Then
  Begin
    CdsSubConta.Data := CtrlSubConta.ListSubConta(Sistema.IdEmpresa,StrToFloat(MontaSelectsubConta.ValoresChave[0]));
    mskSubConta.text := CdsSubConta.FieldByName('CODSUBCONTA').asString;
  End;

end;



procedure TfrmCadMovAnteriorMT.mskAtivProjExit(Sender: TObject);
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



procedure TfrmCadMovAnteriorMT.btnAtivProjClick(Sender: TObject);
begin
  inherited;
  MontaSelectAtivProj.Executar;
  Repaint;
  If MontaSelectAtivProj.RetornouValor Then
  Begin
    CdsAtivProj.Data    := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,StrToFloat(MontaSelectAtivProj.ValoresChave[2]),Trim(MontaSelectAtivProj.ValoresChave[1]),tapAmbos,toapCodigo);
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



procedure TfrmCadMovAnteriorMT.btnSelecionaClick(Sender: TObject);
begin
  inherited;
   // *** critica campos de tela ***
   CriticaCampos;

   // *** preenche combo periodo ***
   CdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,StrToInt(dblkExercicio.text),0);


   HabilitaDetalhe;
   MontaOrcamento;

end;



procedure TfrmCadMovAnteriorMT.btnIncluiClick(Sender: TObject);
begin
  inherited;
   CriticaCampos;

   PreencheParametros;

   CdsSaldo.Data := CtrlPlanoSaldo.MontaOrcamento(Sistema.IdEmpresa,StrToInt(dblkExercicio.text),CtrlContab.PlanoParam,iUniNegoc,
                                                 iPatro,iPlanoPrev,iPerNumero,iSubConta,cmpConta.Conta.Numero,sCCusto);

   TFloatField(CdsSaldo.FieldByName('PLSDEBITOCORRENTE')).DisplayFormat  := 'R$ #,##0.00';
   TFloatField(CdsSaldo.FieldByName('PLSCREDITOCOR')).DisplayFormat      := 'R$ #,##0.00';

   If CdsSaldo.IsEmpty Then
   Begin

     // *** Se a conta não tiver saldo, inclui ***
     If Not CtrlPlanoSaldo.InserePlanoSaldo(CtrlContab.PlanoParam,iUniNegoc,Sistema.IdUsuario,
                                     Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdEmpresa,
                                     StrToInt(dblkExercicio.text),iPernumero,
                                     iPatro,iPlanoPrev,iSubConta, cmpConta.Conta.Numero,sCcusto, sTipoConta,
                                     redValorDebito.value,redValorCredito.value,0,0,0,0,0,0,0,0,0,0,0,0) Then
     Begin
       MsgDlg(CtrlPlanoSaldo.MessageInfo,'Erro',MtError,[mbOk],0);
       Exit;
     End
   End Else
   Begin
       If Not CtrlPlanoSaldo.AlteraMovimAnterior(CdsSaldo.FieldByName('IDPLANOSALDO').asInteger,
                                     redValorDebito.value,redValorCredito.value) Then
       Begin
         MsgDlg(CtrlPlanoSaldo.MessageInfo,'Erro',MtError,[mbOk],0);
         Exit;
       End
   End;

   // *** recarrega o grid ***
   CdsSaldo.Data := CtrlPlanoSaldo.MontaOrcamento(Sistema.IdEmpresa,StrToInt(dblkExercicio.text),CtrlContab.PlanoParam,iUniNegoc,
                                                 iPatro,iPlanoPrev,0,iSubConta,cmpConta.Conta.Numero,sCCusto);

   TFloatField(CdsSaldo.FieldByName('PLSDEBITOCORRENTE')).DisplayFormat  := 'R$ #,##0.00';
   TFloatField(CdsSaldo.FieldByName('PLSCREDITOCOR')).DisplayFormat      := 'R$ #,##0.00';

   CdsSaldo.First;

end;



procedure TfrmCadMovAnteriorMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListTerceiros.Free;
  CtrlSubConta.Free;
  CtrlContaContabil.Free;
  CtrlContab.Free;

end;



procedure TfrmCadMovAnteriorMT.dbgrdSaldoCalcCellColors(Sender: TObject;
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



procedure TfrmCadMovAnteriorMT.MensErroMt(sMsg: string);
begin
  MsgDlg(sMsg,Sistema.NomeAplicativo,mtError,[mbOk],0);
end;

end.
