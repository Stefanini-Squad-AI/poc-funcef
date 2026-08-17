{------------------------------------------------------------------------------
  Desenvolvedor: Bruno Bastos
  Data         : 02/02/2010
  SOL_Kintana  : 130386_731569
  Método       : bbtnConfirmarClick
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 23/02/2005
  Pendência    : 18727 - Complementar com zeros o campo conta contábil
                 18537 - Corrigindo o processo para montar o arquivo texto
  Método       : A query de plano previdenciário estava errada
------------------------------------------------------------------------------}
//==============================================================================
//
//  Data     : 18/01/2005
//  Autor    : Rodolpho da Silva
//  Pendência: 18394
//  Descrição: Corrigir o número do plano de contas no arquivo, pois segundo a especificação da SPC,
//             precisa ser 4. Estava saindo o número do plano de contas cadastrado na fundação.
//
//==============================================================================

(*==============================================================================
Analista : André Tavares - pendência 16351 - 05/05/2004
Descrição: Este form foi criado para implementar o novo layout de arquivo SIPC-CAP.
  ==============================================================================
*)
unit FGeraSalCont2004MT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlContab,uCtrlProcessaContab,uCtrlPeriodo,uCtrlListTerceiros,
  FOkCancelar, Db, DBClient,  uCMClientDataSet, ComCtrls, StdCtrls, wwdblook, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, BfDialogs, BrowseFolder,
   uProcuraDir, uCMTypes, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, uCmSqlParams, TREdit;


type
  TfrmGeraSALCONT2004MT = class(TfrmOkCancelar)
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    Label1: TLabel;
    pgbStatus: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    btnSelecionar: TBitBtn;
    edtPath: TEdit;
    Label6: TLabel;
    ProcuraDir: TProcuraDirDlg;
    cdsPlanoPrev: TClientDataSet;
    lblPlanoPrev: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    cdsEntidade: TCMClientDataSet;
    edtEntidade: TEdit;
    rgTotalizacao: TRadioGroup;
    edtPlanoContas: TDBRealEdit;
    Label2: TLabel;
    sqlPlanoPrev: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ProcuraDirSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgTotalizacaoClick(Sender: TObject);
  private
    CtrlContab         :TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    CtrlListTerceiros  :TCtrlListTerceiros;
    procedure ProcMensArq(msg: String);

  public
    { Public declarations }
  end;

var
  frmGeraSALCONT2004MT: TfrmGeraSALCONT2004MT;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uData;

{$R *.DFM}

procedure TfrmGeraSALCONT2004MT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  // *** Instancia a classe processa contab ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensArq);

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlListTerceiros  := TCtrlListTerceiros.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,false);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);
  sqlPlanoPrev.Open;
  cdsEntidade.Data  := CtrlProcessaContab.BuscaCodFundSpc;
  edtEntidade.text  := cdsEntidade.fieldbyName('CODFUNDSPC').asstring;
  dblcPlanoPrev.Enabled := false;

  edtPlanoContas.Alignment := taLeftJustify;
  edtPlanoContas.Lines.Clear;


end;

procedure TfrmGeraSALCONT2004MT.ProcMensArq(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    pgbStatus.Max      := CtrlProcessaContab.MaxProgresso;
    pgbStatus.Position := CtrlProcessaContab._Progresso;
    Application.ProcessMessages;
  End;

end;

procedure TfrmGeraSALCONT2004MT.bbtnConfirmarClick(Sender: TObject);
var
  iIdPlanoPrev, iIdPlanoPrevContabil: integer;
  iPlano         : integer; //Bruno Bastos - Sol: 130386 - Kintana: 731569
  
begin
  inherited;

   if dblkExercicio.text = '' then
   begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   if dblkPeriodo.text = '' then
   begin
      MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   if edtEntidade.text = '' then
   begin
      MsgDlg('O Código da Entidade deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;


   if edtPlanoContas.Value <= 0 then
   begin
      MsgDlg('O Código do Plano de Contas deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;


   if edtPath.text = '' then
   begin
      MsgDlg('O Caminho usado para a Gravação do Balancete deve ser Selecionado.','Erro',mtError,[mbOk],0);
      btnSelecionar.SetFocus;
      Exit;
   end;

   //=== vewrifica se o periodo esta encerrado neste exercicio ====
   If Not CtrlPeriodo.VerificaPeriodoBloqueado(Sistema.idEmpresa,tbBloqueado,StrToInt(dblkPeriodo.LookupValue),StrToInt(dblkExercicio.LookupValue),True) Then
   Begin
     MsgDlg('Existem Períodos  Não encerrados Neste Exercicio.','Aviso', mtWarning,[mbOk],0);
   End;

   // Determinar o plano previdenciário
   iIdPlanoPrevContabil := -1;
   case rgTotalizacao.ItemIndex of
     0: iIdPlanoPrev := -1;   // balancete consolidado
     1: begin                 // balancete por plano
          iIdPlanoPrev := StrToIntDef (dblcPlanoPrev.LookupValue, 0);
          if dblcPlanoPrev.Text <> '' then
            iIdPlanoPrevContabil := cdsPlanoPrev.FieldByName('IDPLANOPREVCONTABIL').AsInteger;
        end;
     2: iIdPlanoPrev := -2;   // Todos
   end;

   //Bruno Bastos - Sol: 130386 - Kintana: 731569 - Início
   if not CtrlContab.SelecionaPlanoDataProc(Sistema.IdEmpresa, '01/'+dblkPeriodo.LookupValue+'/'+dblkExercicio.LookupValue) then
   Begin
     MsgDlg('Não foi encontrado plano de contas para o período e exercício selecionado. Dessa forma será utilizado o plano atual.','Erro',mtError,[mbOk],0);
     iPlano := CtrlContab.PlanoParam;
   End
   else
   begin
     iPlano := CtrlContab.PlanoData;
   end;
   //Bruno Bastos - Sol: 130386 - Kintana: 731569 - Fim

   If CtrlProcessaContab.GeraArquivo_SIPC_2004(Sistema.IdEmpresa,
                                               trunc(edtPlanoContas.Value),
                                               //Bruno Bastos - Sol: 130386 - Kintana: 731569 - CtrlContab.PlanoParam,
                                               iPlano, //Bruno Bastos - Sol: 130386 - Kintana: 731569
                                               StrToInt(dblkExercicio.LookupValue),
                                               StrToInt(dblkPeriodo.LookupValue),
                                               iIdPlanoPrev, iIdPlanoPrevContabil,
                                               edtEntidade.Text,
                                               edtPath.Text) then
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;
   pgbStatus.Position := 0;
end;

procedure TfrmGeraSALCONT2004MT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  ProcuraDir.Execute;
end;

procedure TfrmGeraSALCONT2004MT.ProcuraDirSelectionChanged(Sender: TObject;
  Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
  edtPath.Text := Path;
end;

procedure TfrmGeraSALCONT2004MT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkExercicio.Text <> '' then
    cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.LookupValue),0)
  else
    cdsPeriodo.Close;

end;

procedure TfrmGeraSALCONT2004MT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free;
  CtrlProcessaContab.Free;
  CtrlPeriodo.Free;
  CtrlListTerceiros.Free;
end;

procedure TfrmGeraSALCONT2004MT.rgTotalizacaoClick(Sender: TObject);
begin
  inherited;
  case rgTotalizacao.itemIndex of
    0:
    begin
      dblcPlanoPrev.Enabled := false;
    end;

    1:
    begin
      dblcPlanoPrev.Enabled := true;
    end

    else
    begin
      dblcPlanoPrev.Enabled := false;
    end;
  end; 

  dblcPlanoPrev.text := '';
  dblcPlanoPrev.LookupValue := '';
end;

end.
