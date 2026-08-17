unit FVerificaBloqueadosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBClient, uCMClientDataSet, Wwdatsrc, Grids, Wwdbigrd,
  Wwdbgrid, Buttons, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, ExtCtrls,
  uCtrlContab,uCtrlProcessaContab,uCtrlPeriodo,
  uCMTypes;

type
  TfrmVerificaBloqueadosMT = class(TfrmSairAjuda)
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    btnFiltra: TBitBtn;
    spdTodos: TSpeedButton;
    spdInverter: TSpeedButton;
    wwDBGrid1: TwwDBGrid;
    bbtnExcluir: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    dsVerificaBloqueados: TwwDataSource;
    cdsVerificaBloqueados: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltraClick(Sender: TObject);
    procedure spdTodosClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlContab         :TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    bExcluiuBloqueados :Boolean;
  public
    { Public declarations }
  end;

var
  frmVerificaBloqueadosMT: TfrmVerificaBloqueadosMT;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uModulo,FEncerraPeriodoMT,
      fTelaAut;

{$R *.DFM}

procedure TfrmVerificaBloqueadosMT.FormCreate(Sender: TObject);
begin
  inherited;
  bExcluiuBloqueados := False;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  // *** Instancia a classe processa contab ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlProcessaContab.cdsVerificaBloqueados := cdsVerificaBloqueados;
  cdsVerificaBloqueados.Data :=  CtrlProcessaContab.ListaBloqueados(Sistema.idEmpresa, modulo.iExercicioAtual);

  //Criação da Classe de periodo
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,True);


end;

procedure TfrmVerificaBloqueadosMT.btnFiltraClick(Sender: TObject);
begin
  inherited;
  cdsVerificaBloqueados.Data :=  CtrlProcessaContab.ListaBloqueados(Sistema.idEmpresa, StrToInt(dblkExercicio.lookupValue));

end;

procedure TfrmVerificaBloqueadosMT.spdTodosClick(Sender: TObject);
begin
  inherited;
  cdsVerificaBloqueados.DisableControls;
  cdsVerificaBloqueados.First;
  while not cdsVerificaBloqueados.Eof do
  begin
     cdsVerificaBloqueados.Edit;
     cdsVerificaBloqueados.FieldByName('FLGEXCLUI').AsString := 'S';
     cdsVerificaBloqueados.Post;
     cdsVerificaBloqueados.Next;
  end;
  cdsVerificaBloqueados.First;
  cdsVerificaBloqueados.EnableControls;

end;

procedure TfrmVerificaBloqueadosMT.spdInverterClick(Sender: TObject);
begin
  inherited;
  cdsVerificaBloqueados.DisableControls;
  cdsVerificaBloqueados.First;
  while not cdsVerificaBloqueados.Eof do begin
     cdsVerificaBloqueados.Edit;
     if cdsVerificaBloqueados.FieldByName('FLGEXCLUI').AsString = 'S' then
        cdsVerificaBloqueados.FieldByName('FLGEXCLUI').AsString := 'N'
     else
        cdsVerificaBloqueados.FieldByName('FLGEXCLUI').AsString := 'S';
     cdsVerificaBloqueados.Post;
     cdsVerificaBloqueados.Next;
  end;
  cdsVerificaBloqueados.First;
  cdsVerificaBloqueados.EnableControls;

end;

procedure TfrmVerificaBloqueadosMT.bbtnSairClick(Sender: TObject);
begin
  inherited;
  if bExcluiuBloqueados then
  begin
     AbrirForm(frmEncerraPeriodoMT, TfrmEncerraPeriodoMT, false);
  end;

end;

procedure TfrmVerificaBloqueadosMT.FormShow(Sender: TObject);
begin
  inherited;
   dblkExercicio.Lookupvalue := IntToStr(modulo.iExercicioAtual);
   dblkExercicio.PerformSearch;

end;

procedure TfrmVerificaBloqueadosMT.bbtnExcluirClick(Sender: TObject);
begin
  inherited;
   cdsVerificaBloqueados.Filtered := False;
   cdsVerificaBloqueados.Filter   := 'FLGEXCLUI = ''S''';
   cdsVerificaBloqueados.Filtered := True;

   If cdsVerificaBloqueados.IsEmpty then
   Begin
     MsgDlg('Não existia nenhuma planilha selecionada para exclusão.','Aviso',mtWarning,[mbOk], 0);
     Exit;
   End;


  if MsgDlg('Confirma a Exclusão das Planilhas Selecionadas?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin

      If CtrlProcessaContab.VerificaBloqueados(Sistema.IdEmpresa,Sistema.idUsuario,
                                                  Sistema.UsaPlanoPatro) then
      begin
         MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
         bExcluiuBloqueados := True;
      end else
      begin
        MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
      end;
  end;

end;

procedure TfrmVerificaBloqueadosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlPeriodo.free;

end;

end.
