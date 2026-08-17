unit FGeraConsolidadoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlPeriodo,uCtrlProcessaContab, uCtrlContab,uCtrlListTerceiros,
  FOkCancelar, Db, DBClient, uCMClientDataSet, ComCtrls, Buttons, StdCtrls, CheckLst,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls,Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc,
  DBTables, Wwquery, wwclient,
  {$IFNDEF VERSAO0505} uCMTypes  {$ENDIF};

type
  TfrmGeraConsolidadoMT = class(TfrmOkCancelar)
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    edtData: TCMDateTimePicker;
    dblkTipoOper: TwwDBLookupCombo;
    Label5: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    chkOrcamen: TCheckBox;
    cbConsoUnidNegoc: TCheckBox;
    cbConsoSubConta: TCheckBox;
    spdTodos: TSpeedButton;
    spdInverter: TSpeedButton;
    pgr: TProgressBar;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    cdsTipoOper: TCMClientDataSet;
    Anim: TAnimate;
    lblMensagem: TLabel;
    lblCodigo: TLabel;
    wwDBGrid1: TwwDBGrid;
    dsEmpresasSel: TwwDataSource;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cdsEmpresas: TwwClientDataSet;
    Label1: TLabel;
    cdsEmpresasSel: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spdTodosClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    CtrlContab : TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    CtrlListTerceiros  :TCtrlListTerceiros;
    procedure ProcMensC(msg: String);
  public
    { Public declarations }
  end;

var
  frmGeraConsolidadoMT: TfrmGeraConsolidadoMT;

implementation

uses uSistema, uMensErro,  dBaseDados, uDataBase,
     uModulo, uFuncaoGeral;

{$R *.DFM}

procedure TfrmGeraConsolidadoMT.FormCreate(Sender: TObject);
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
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensC);

  CtrlProcessaContab.cdsEmpresasSel := cdsEmpresasSel;

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);

  //Criação da Classe de terceiros
  CtrlListTerceiros        := TCtrlListTerceiros.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsTipoOPer.Data    := CtrlListTerceiros.ListTipoOper(False);

  // configurações do cds para o grid de empresas
  cdsEmpresasSel.Data := CtrlProcessaContab.ListaEmpConsolidado(Sistema.idEmpresa);

  cdsEmpresas.Data := CtrlProcessaContab.ListaEmpConsolidado(Sistema.idEmpresa);
  TwwClientDataSet(cdsEmpresas).ControlType.Add('SEL;CheckBox;S;N');
  cdsEmpresas.FieldByName('TIPOEMPRESA').Visible := False;
  cdsEmpresas.FieldByName('IDPESSOA').Visible := False;

end;

procedure TfrmGeraConsolidadoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlPeriodo.free;
  CtrlListTerceiros.free;

end;

procedure TfrmGeraConsolidadoMT.ProcMensC(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
    begin
       lblMensagem.Caption := CtrlProcessaContab.NomeRateio;
       lblCodigo.Caption   := CtrlProcessaContab.NomeCampo;
    end;

    pgr.Max      := CtrlProcessaContab.MaxProgresso;
    pgr.Position := CtrlProcessaContab.Progresso;
    Application.ProcessMessages;
  End;

end;

procedure TfrmGeraConsolidadoMT.spdTodosClick(Sender: TObject);
begin
  inherited;
   cdsEmpresas.DisableControls;
   with cdsEmpresas do begin
      First;
      while not eof do begin
         Edit;
         FieldByName('SEL').asString := 'S';
         Post;
         Next;
      end;
      First;
   end;
   cdsEmpresas.EnableControls;

end;

procedure TfrmGeraConsolidadoMT.spdInverterClick(Sender: TObject);
begin
  inherited;
   cdsEmpresas.DisableControls;
   with cdsEmpresas do begin
      First;
      while not eof do begin
         Edit;
         FieldByName('SEL').asString := 'N';
         Post;
         Next;
      end;
      First;
   end;
   cdsEmpresas.EnableControls;

end;

procedure TfrmGeraConsolidadoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.Text = '' then begin
      MsgDlg('Exercício não selecionado','Aviso',mtWarning,[mbOk], 0);
      exit;
   end;
   if dblkPeriodo.text = '' then begin
      if MsgDlg('Período não selecionado. Deseja gerar a movimentação para o Saldo Anterior?','Aviso',mtConfirmation,[mbYes, mbNo], 0) = mrNo then begin
         Exit;
      end;
   end;

   if dblkTipoOper.text = '' then begin
      MsgDlg('Tipo de Operação não selecionada.','Aviso',mtWarning,[mbOk], 0);
      Exit;
   end;
   if edtData.text = '' then begin
      MsgDlg('Data não preenchida.','Aviso',mtWarning,[mbOk], 0);
      exit;
   end;


   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active  := True;
   End;

   cdsEmpresasSel.Data := cdsEmpresas.Data;

   If CtrlProcessaContab.GeraLancaConsolidado(Sistema.IdEmpresa,Sistema.idUsuario,
                                  CtrlContab.PlanoParam,StrToInt(dblkExercicio.LookupValue),
                                  StrToIntDef(dblkPeriodo.LookupValue,0),dblkTipoOper.LookupValue,
                                  edtData.text,Modulo.sMascaraContas,
                                  Sistema.UsaPlanoPatro,chkOrcamen.Checked,
                                  cbConsoUnidNegoc.Checked,cbConsoSubConta.Checked) then
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
     MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;


   If Anim.Active Then Anim.Active := False;


end;

procedure TfrmGeraConsolidadoMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToIntDef(dblkExercicio.LookupValue,0),0);

end;

end.
