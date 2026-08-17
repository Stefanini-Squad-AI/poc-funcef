{===============================================================================
Analista.....: Cássio Florencio Rovaroto
SIG..........: 115126
Data.........: 25/02/2022
Descrição....: Geração de declaração Extracontábil.
================================================================================}
unit FGeraSalCont2010MT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, TREdit, wwdblook, BfDialogs,
  BrowseFolder, uProcuraDir,
  uMensErro, uCtrlPeriodo, uCtrlContab, uCtrlProcessaContab, uSistema, DBaseDados,
  Db, DBClient, uCMClientDataSet, uCMTypes;

type
  TFrmGeraSalCont2010MT = class(TfrmOkCancelar)
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label1: TLabel;
    edtEntidade: TEdit;
    Label2: TLabel;
    edtPlanoContas: TDBRealEdit;
    Label6: TLabel;
    edtPath: TEdit;
    pgbStatus: TProgressBar;
    btnSelecionar: TBitBtn;
    ProcuraDir: TProcuraDirDlg;
    cdsExercicio: TCMClientDataSet;
    cdsEntidade: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    mmoEmails: TMemo;
    LblEmail: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProcuraDirSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
  private
    { Private declarations }
    CtrlContab         :TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    procedure ProcMensArq(msg: String);
    procedure AdicionarTrimestres(const oSql: TCMClientDataSet);
    function ValidaTrimestre(iTrimestre, iExercicio: Integer): Boolean;

  public
    { Public declarations }
  end;

var
  FrmGeraSalCont2010MT: TFrmGeraSalCont2010MT;

implementation

{$R *.DFM}

procedure TFrmGeraSalCont2010MT.bbtnConfirmarClick(Sender: TObject);
var
  vEmail : array of String;
  i : integer;
  bResultado : Boolean;
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

   if mmoEmails.Lines.Count = 0 then
   begin
     MsgDlg('O e-mail de quem receberá o arquivo de retorno deve ser informado.','Erro',mtError,[mbOk],0);
     mmoEmails.SetFocus;
     Exit;
   end;

   if edtPath.text = '' then
   begin
     MsgDlg('O Caminho usado para a Gravação do Balancete deve ser Selecionado.','Erro',mtError,[mbOk],0);
     btnSelecionar.SetFocus;
     Exit;
   end;

   If StrToInt(dblkPeriodo.LookupValue) > 12 then
     bResultado := ValidaTrimestre(StrToInt(dblkPeriodo.LookupValue),
                                   StrToInt(dblkExercicio.LookupValue))
   else
     bResultado := CtrlPeriodo.VerificaPeriodoBloqueado(Sistema.idEmpresa,
                                                        tbBloqueado,
                                                        StrToInt(dblkPeriodo.LookupValue),
                                                        StrToInt(dblkExercicio.LookupValue),
                                                        True);

   //=== vewrifica se o periodo esta encerrado neste exercicio ====
   If Not bResultado Then
   Begin
     If MsgDlg('Existem meses não encerrados no período selecionado. Deseja continuar a geração do arquivo?','Aviso', mtWarning,[mbYes,mbNo],0) = IdNo then
       Exit;
   End;

   bResultado := CtrlProcessaContab.VerificaDadosExtracontabil(StrToInt(dblkPeriodo.LookupValue),
                                                        StrToInt(dblkExercicio.LookupValue));

   if not bResultado then
   begin
     if MsgDlg('Não existem dados para a declaração Extracontábil. Deseja continuar a geração do arquivo?','Aviso', mtWarning,[mbYes,mbNo],0) = IdNo then
      Exit;
   end;

   SetLength(vEmail, mmoEmails.Lines.Count);

   for i:= 0 to mmoEmails.Lines.Count - 1 do
     vEmail[i] := mmoEmails.Lines[i];

   If CtrlProcessaContab.GeraArquivo_SIPC_2010(Sistema.IdEmpresa,
                                               trunc(edtPlanoContas.Value),
                                               CtrlContab.PlanoParam,
                                               StrToInt(dblkExercicio.LookupValue),
                                               StrToInt(dblkPeriodo.LookupValue),
                                               edtEntidade.Text,
                                               edtPath.Text,
                                               vEmail) then

     MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0)
   else
     MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);

   pgbStatus.Position := 0;
end;

Function TFrmGeraSalCont2010MT.ValidaTrimestre(iTrimestre,iExercicio : Integer) : Boolean;
var iPerIni, iPerFim, i : Integer;
begin
  Result := True;
  If iTrimestre = 010203 then
  begin
    iPerIni := 1;
    iPerFim := 3;
  end
  else if iTrimestre = 040506 then
  begin
    iPerIni := 4;
    iPerFim := 6;
  end
  else if iTrimestre = 070809 then
  begin
    iPerIni := 7;
    iPerFim := 9;
  end
  else
  begin
    iPerIni := 10;
    iPerFim := 12;
  end;
  For i := iPerIni to iPerFim do
  begin
    Result := CtrlPeriodo.VerificaPeriodoBloqueado(Sistema.idEmpresa,
                                                   tbBloqueado,
                                                   i,
                                                   iExercicio,
                                                   True);
    If Not Result then
      Break;
  end;
end;

procedure TFrmGeraSalCont2010MT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  ProcuraDir.Execute;
end;

procedure TFrmGeraSalCont2010MT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,
                        True,
                        Sistema.ConnectionType,
                        Sistema.ConnectionSide,
                        Sistema.AppRemoteServer,
                        True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
    MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  // *** Instancia a classe processa contab ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                False,
                                ProcMensArq);

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,
                         True,
                         Sistema.ConnectionType,
                         Sistema.ConnectionSide,
                         Sistema.AppRemoteServer,
                         False);

  cdsExercicio.Data        := CtrlPeriodo.ListExercicios(Sistema.idEmpresa, false);
  cdsPeriodo.Data          := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa, tbpTodos, 0, 0);

  // Alterado por Arnaldo V. Scarin em 04/07/2011 - SOL 159880 KTN: 1326338
  // Adiciona os trimestres no CDSPeriodo
  AdicionarTrimestres(cdsPeriodo);

  cdsEntidade.Data         := CtrlProcessaContab.BuscaCodFundSpc;
  edtEntidade.text         := cdsEntidade.fieldbyName('CODFUNDSPC').asstring;

  edtPlanoContas.Alignment := taLeftJustify;
  edtPlanoContas.Lines.Clear;
end;

procedure TFrmGeraSalCont2010MT.AdicionarTrimestres(const oSql : TCMClientDataSet);
var i : Integer;
    iPernumero : Integer;
begin
  cdsPeriodo.First;
  For i:= 1 to 4 do
  begin
    cdsPeriodo.Insert;
    Case i Of
     1 : iPernumero := 010203;
     2 : iPernumero := 040506;
     3 : iPernumero := 070809;
     4 : iPernumero := 101112;
    end;
    cdsPeriodo.FieldByName('PerNumero').asInteger := iPernumero;
    cdsPeriodo.FieldByName('PerNome').asString := Format('%dº Trimestre',[i]);
    cdsPeriodo.Post;
  end;
  cdsPeriodo.First;
end;

procedure TFrmGeraSalCont2010MT.ProcMensArq(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    pgbStatus.Max      := CtrlProcessaContab.MaxProgresso;
    pgbStatus.Position := CtrlProcessaContab._Progresso;
    Application.ProcessMessages;
  End;
end;

procedure TFrmGeraSalCont2010MT.ProcuraDirSelectionChanged(Sender: TObject;
  Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
  edtPath.Text := Path;
end;

end.
