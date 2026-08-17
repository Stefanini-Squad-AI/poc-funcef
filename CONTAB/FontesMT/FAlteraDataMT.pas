unit FAlteraDataMT;
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 21/09/04
  Pendência    : 16858 -
  Metodo       : MontaSelect.Filtro
  Solução      : Trocar de: PLANILHA.IDMODULO IN (1,2,96)
                      para: PLANILHA.IDMODULO = 1
------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlPlanilha,uCtrlPeriodo, FOkCancelar, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  StdCtrls, TREdit, wwdblook, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect,uCtrlContab, ComCtrls, uCMTypes;

type
  TfrmAlteraDataMT = class(TfrmOkCancelar)
    dbeNumPlanil: TwwDBEdit;
    Label1: TLabel;
    btnPlanilha: TBitBtn;
    Label6: TLabel;
    dbeNumLanc: TwwDBEdit;
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    dbrCredito: TDBRealEdit;
    Label7: TLabel;
    dbrDebito: TDBRealEdit;
    Label5: TLabel;
    dbeDataPlanil: TCMDateTimePicker;
    dteDataNova: TCMDateTimePicker;
    Label2: TLabel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    CdsPeriodo: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    Label14: TLabel;
    cdsPlanilha: TCMClientDataSet;
    ds: TwwDataSource;
    MontaSelect: TMontaSelect;
    lblStatus: TLabel;
    Anim: TAnimate;
    procedure FormCreate(Sender: TObject);
    procedure btnPlanilhaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlPlanilha :TCtrlPlanilha;
    CtrlPeriodo  :TCtrlPeriodo;
    CtrlContab   :TCtrlContab;
    procedure LimpaValores;
    procedure ProcMensAltera(sMens :string);


  public
    { Public declarations }
  end;

var
  frmAlteraDataMT: TfrmAlteraDataMT;

implementation

{$R *.DFM}

uses UMensErro, uDatabase, DBaseDados, uSistema, uFuncaoGeral,
     uModulo, uData, fTelaAut;

procedure TfrmAlteraDataMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe planilha ***
  CtrlPlanilha   := TCtrlPlanilha.Create;
  CtrlPlanilha.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensAltera);

  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.IdEmpresa,True);
  CdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,Year(Date),0);

  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
    MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

end;

procedure TfrmAlteraDataMT.btnPlanilhaClick(Sender: TObject);
begin
  inherited;
   MontaSelect.Executar;
   If MontaSelect.RetornouValor Then
      cdsPlanilha.Data := CtrlPlanilha.ListPlaAlteraDadta(StrToFloat(MontaSelect.ValoresChave[0]));

end;

procedure TfrmAlteraDataMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  lblStatus.Caption := '';

  If dbeNumPlanil.text = '' Then
  Begin
     MsgDlg ('Número da Planilha deve ser preenchida!', 'Aviso', mtWarning, [mbOk], 0);
     Exit;
  End;

   If dteDataNova.text = '' Then
   Begin
     MsgDlg ('A Nova Data deve ser preenchida!', 'Aviso', mtWarning, [mbOk], 0);
     Exit;
   End;

   If CtrlPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa,tbBloqueado,StrToInt(dblkPeriodo.LookUpValue),
                                        StrToInt(dblkExercicio.LookUpValue),False) Then
   Begin
      MsgDlg('Período da Data Antiga Bloqueado. Alteração de Data Proibida.','Erro',mtError,[mbOk],0);
      Exit;
   End;

   If Not CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa,dteDataNova.text) Then
   Begin
      MsgDlg(CtrlPeriodo.MessageInfo,'Erro',mtError,[mbOK],0);
      Exit;
   End;

   If CtrlPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa,tbBloqueado,CtrlPeriodo.Periodo,
                                        CtrlPeriodo.Exercicio,False) Then
   Begin
      MsgDlg('Período da Data Nova Bloqueado. Alteração de Data Proibida.','Erro',mtError,[mbOk],0);
      Exit;
   End;

   If Not (CtrlPeriodo.Exercicio = StrToInt(dblkExercicio.LookUpValue)) Then
   Begin
      MsgDlg('A Data informada pertence a outro Exercício. Alteração cancelada.', 'Aviso', mtWarning, [mbOk], 0);
      dteDataNova.SetFocus;
   End;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible      := True;
     Anim.Active       := True;
     lblStatus.Visible := False;
   End Else
     lblStatus.Visible := True;


   If CtrlPeriodo.Periodo = StrToInt(dblkPeriodo.LookUpValue) Then
   Begin
      If Not CtrlPlanilha.ProcAlteraDataPlanilha(Sistema.idEmpresa,Sistema.IdModulo,Sistema.idUsuario,
                        cdsPlanilha.FieldByName('PLNCODIGO').asFloat,
                        CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,dteDataNova.Text,
                        CtrlContab.NumeracaoPlanilha) Then
         MsgDlg('Problemas detectados durante a alteração de datas.', 'Erro', mtError, [mbOk], 0)
      Else Begin
         MsgDlg('Data alterada com sucesso.', 'Aviso', mtInformation, [mbOk], 0);
         LimpaValores;
         cdsPlanilha.Close;
      End;
   End Else
   Begin
     If MsgDlg('A Data informada Pertence a outro Período. Deseja prosseguir?', 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
     Begin
       If Not CtrlPlanilha.ProcAlteraDataPlanilha2(Sistema.IdEmpresa,Sistema.IdModulo,cdsPlanilha.FieldByName('PLNCODIGO').asFloat,
                   StrToInt(dblkExercicio.LookUpValue),StrToInt(dblkPeriodo.LookUpValue),
                   CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,Sistema.IdUsuario,
                   dteDataNova.Text,cdsPlanilha.FieldByName('PLNEFETIVADO').AsString,
                   CtrlContab.MascaraContaParam,CtrlContab.NumeracaoPlanilha,
                   Sistema.UsaPlanoPatro) Then
         MsgDlg('Problemas detectados durante a alteração de datas.', 'Erro', mtError, [mbOk], 0)
       Else Begin
         MsgDlg('Data Alterada com Sucesso.', 'Aviso', mtInformation, [mbOk], 0);
         LimpaValores;
         cdsPlanilha.Close;
       End;
     End;
   End;
   If Anim.Active Then Anim.Active := False;


end;

procedure TfrmAlteraDataMT.LimpaValores;
Begin
   dbrDebito.Value := 0;
   dbrCredito.Value:= 0;
   dteDataNova.Text:='';
end;

procedure TfrmAlteraDataMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPlanilha.Free;
  CtrlPeriodo.Free;
  CtrlContab.Free;

end;

procedure TfrmAlteraDataMT.ProcMensAltera(sMens: string);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If sMens <> '*' then
       lblStatus.Caption := sMens;
    Application.ProcessMessages;
  End;
end;

end.
