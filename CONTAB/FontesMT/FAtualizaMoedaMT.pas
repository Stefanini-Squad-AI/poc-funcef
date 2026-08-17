unit FAtualizaMoedaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlProcessaContab, uCtrlContab, uCtrlHistoContab, FSairAjuda, Db,
  DBClient, uCMClientDataSet, ComCtrls, ExtCtrls, StdCtrls,
  CMDBLookupCombo, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  uCtrlPeriodo, uCMTypes;

type
  TfrmAtualizaMoedaMT = class(TfrmSairAjuda)
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    edDataGera: TCMDateTimePicker;
    Label5: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    dblcHistPadrao: TCMDBLookupCombo;
    lblHistPadrao: TLabel;
    pgbStatus: TProgressBar;
    lblConta: TLabel;
    mmLog: TRichEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    Anim: TAnimate;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    cdsHisto: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    CtrlContab         :TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    CtrlHistorico      :TCtrlHistoContab;
    procedure ProcMensAtu(msg: String);

  public
    { Public declarations }
  end;

var
  frmAtualizaMoedaMT: TfrmAtualizaMoedaMT;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uData;

{$R *.DFM}

procedure TfrmAtualizaMoedaMT.FormCreate(Sender: TObject);
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
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensAtu);

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,True);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);

  //Criação da Classe de terceiros
  CtrlHistorico        := TCtrlHistoContab.Create;
  CtrlHistorico.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsHisto.Data  := CtrlHistorico.ListHistoContab(Sistema.IdEmpresa,tohCodigo,'');


end;

procedure TfrmAtualizaMoedaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlPeriodo.free;
  CtrlHistorico.free;

end;

procedure TfrmAtualizaMoedaMT.ProcMensAtu(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
    begin
       lblConta.Caption  := CtrlProcessaContab.NomeCampo;
       if msg <> 'a' then
          mmLog.Lines.Add(Msg);
    end;
    pgbStatus.Position := CtrlProcessaContab._Progresso;
    pgbStatus.Max      := CtrlProcessaContab.MaxProgresso;

    Application.ProcessMessages;
  End;

end;

procedure TfrmAtualizaMoedaMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblcHistPadrao.text = '' then begin
      MsgDlg('Histórico Padrão não selecionado.','Aviso',mtWarning,[mbOk],0);
      dblcHistPadrao.SetFocus;
      Exit;
   end;

   if CtrlContab.TipoFechamento = 'D' then begin
      if trim(edDataGera.Text) = '' then begin
         MsgDlg('Obrigatório preencher a data de geração','Aviso',mtWarning,[mbOk],0);
         edDataGera.SetFocus;
         Exit;
      end;
   end else begin
      if dblkExercicio.text = '' then begin
         MsgDlg('Exercício não selecionado.','Aviso',mtWarning,[mbOk],0);
         dblkExercicio.SetFocus;
         Exit;
      end;
      if dblkPeriodo.text = '' then begin
         MsgDlg('Período não selecionado.','Aviso',mtWarning,[mbOk],0);
         dblkPeriodo.SetFocus;
         Exit;
      end;
      edDataGera.Text := cdsPeriodo.FieldByName('PERDATFIM').AsString;
      edDataGera.Date := cdsPeriodo.FieldByName('PERDATFIM').AsDateTime;
   end;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active  := True;
   End;

   mmLog.Lines.Clear;
   mmLog.Lines.Add(' ');
   mmLog.Lines.Add('****** Atualização de Moeda ******');
   mmLog.Lines.Add(' ');

   If CtrlProcessaContab.ProcessaAtuMoeda(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.idUsuario,
                                  CtrlContab.PlanoParam,
                                  StrToInt(dblkExercicio.LookupValue),
                                  StrToInt(dblkPeriodo.LookupValue),
                                  cdsHisto.FieldByName('HITDESCR1').asString,
                                  cdsHisto.FieldByName('HITCODHIST').asString,
                                  CtrlContab.TipoOperMoeda,CtrlContab.TipoFechamento,
                                  edDataGera.Text,CtrlContab.PerdaGanho,
                                  cdsPeriodo.FieldByName('PERDATINI').asDateTime,
                                  cdsPeriodo.FieldByName('PERDATFIM').asDateTime,
                                  Sistema.UsaPlanoPatro) then
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
     MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmLog.Lines.Add(CtrlProcessaContab.sMensAPS_Log);
   End;

   If Anim.Active Then Anim.Active := False;

end;

procedure TfrmAtualizaMoedaMT.FormActivate(Sender: TObject);
begin
  inherited;
    if CtrlContab.TipoFechamento = 'D' then
    begin
      edDataGera.Enabled    := True;
      dblkExercicio.Enabled := False;
      dblkPeriodo.Enabled   := False;
      edDataGera.Text       := DateToStr((CtrlContab.DataUltFecha + 1));
      edDataGera.Date       := (CtrlContab.DataUltFecha + 1);
      edDataGera.SetFocus;
   end else begin
      edDataGera.Enabled    := False;
      dblkExercicio.Enabled := True;
      dblkPeriodo.Enabled   := True;
      dblkExercicio.SetFocus;
   end;

end;

procedure TfrmAtualizaMoedaMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.LookupValue),0);

end;

end.
