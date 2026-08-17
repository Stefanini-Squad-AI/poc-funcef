unit FAtuIntegraDiasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, DBClient,
  uCtrlPeriodo, uCtrlLancamento;

type
  TfrmAtuSaldoAnaMT = class(TfrmSairAjuda)
    btnAtualizar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    prbImportar: TProgressBar;
    mmStatus: TRichEdit;
    Label1: TLabel;
    cdsExercicio: TClientDataSet;
    cdsPeriodo: TClientDataSet;
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsExercicioBeforeOpen(DataSet: TDataSet);
    procedure cdsPeriodoBeforeOpen(DataSet: TDataSet);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Periodo    : TCtrlPeriodo;
    Lancamento : TCtrlLancamento;
    Procedure MensLancamento(msg : String);
    Procedure MensPeriodo(msg : String);
  public
    { Public declarations }
  end;

var
  frmAtuSaldoAnaMT: TfrmAtuSaldoAnaMT;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, dBaseDados;

procedure TfrmAtuSaldoAnaMT.btnAtualizarClick(Sender: TObject);
var bError : Boolean;
begin
   inherited;
   Periodo.Exercicio := StrToIntDef(dblkExercicio.LookUpValue,0);
   Periodo.Periodo   := StrToIntDef(dblkPeriodo.LookUpValue,0);
   mmStatus.Lines.Clear;
   if not Periodo.ValidaExercicio then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkExercicio.SetFocus;
      Exit;
   end;
   if not Periodo.ValidaPeriodo then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkPeriodo.SetFocus;
      Exit;
   end;
   btnAtualizar.Enabled := False;
   bError := False;

   mmStatus.Lines.Clear;
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   if not Lancamento.ProcessaSaldoAnalitica(Sistema.idEmpresa,Sistema.idUsuario,Periodo.Exercicio,Periodo.Periodo,Sistema.UsaPlanoPatro) then bError := true;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;
   if bError then begin
      MsgDlg('Atualização NÃO efetuada. '+Lancamento.MessageInfo,'Erro',mtError,[mbOk],0);
   end else begin
      MsgDlg('Atualização efetuada com sucesso!','Aviso',mtWarning,[mbOk],0);
   end;
   btnAtualizar.Enabled := True;
end;

procedure TfrmAtuSaldoAnaMT.FormActivate(Sender: TObject);
begin
  inherited;
  Periodo.SelecionaExercicios(Sistema.idEmpresa,False);
  cdsExercicio.Open;
  Periodo.SelecionaPeriodos(Sistema.idEmpresa,tbpSoNaoBloq,0);
  cdsPeriodo.Open;
end;

procedure TfrmAtuSaldoAnaMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Criação da Classe de Negócio
  Periodo    := TCtrlPeriodo.Create;
  Lancamento := TCtrlLancamento.Create;
  //DataBase para conexão
  Periodo.DataBase    := dtmBaseDados.dbBaseDados;
  Lancamento.DataBase := dtmBaseDados.dbBaseDados;

  //Indica se o controle de trasação é feito pela classe de negócio
  Periodo.OpenTransaction := True;
  Lancamento.OpenTransaction := True;
  //Tipo de conexão
  Periodo.DbConnectionType := cntBDE;
  Lancamento.DbConnectionType := cntBDE;
  //Forma de trabalho da classe de negócios
  Sistema.ConnectionSide := cnsServer;

  Periodo.ConnectionSide := Sistema.ConnectionSide;
  Lancamento.ConnectionSide := Sistema.ConnectionSide;

  Case Sistema.ConnectionSide Of
      //Persistir dados com a aplicação servidora
      cnsClient: Begin
                    //Conecção com a aplicação servidora
                    //Abre a Conexão com a aplicação servidora
                    If Not Periodo.Connection.Connected Then
                       Periodo.Connection.Open;
                    If Not Lancamento.Connection.Connected Then
                       Lancamento.Connection.Open;
                    //Abre conexão do DataBaseRemoto com o Banco de acordo com a conexão do sistema local
                    If Not Periodo.ConectaDb(Sistema.UsuarioDB,Sistema.SenhaUsuarioDB,Sistema.AliasDB) Then
                       MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
                    If Not Lancamento.ConectaDb(Sistema.UsuarioDB,Sistema.SenhaUsuarioDB,Sistema.AliasDB) Then
                       MsgDlg(Lancamento.MessageInfo,'Erro',mtError,[mbOk],0);
                 End;
      //Para Trabalhar local
      CnsServer: Begin
                    Periodo.ConnectionSide := cnsServer;
                    Lancamento.ConnectionSide := cnsServer;
                 End;
  End;

  Lancamento.OnMessageInfo := MensLancamento;
  Periodo.OnMessageInfo := MensPeriodo;

end;

procedure TfrmAtuSaldoAnaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Periodo.Free;
  Lancamento.Free;
end;

procedure TfrmAtuSaldoAnaMT.cdsExercicioBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  cdsExercicio.SetProvider(Periodo.dspExercicio);
end;

procedure TfrmAtuSaldoAnaMT.cdsPeriodoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  cdsPeriodo.SetProvider(Periodo.dspPeriodo);
end;

procedure TfrmAtuSaldoAnaMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (dblkExercicio.Text <> '') then begin
     cdsPeriodo.Filtered := False;
     cdsPeriodo.Filter   := 'PEREXERCICIO = '+dblkExercicio.LookupValue;
     cdsPeriodo.Filtered := True;
  end;
end;

procedure TfrmAtuSaldoAnaMT.MensLancamento(msg: String);
begin
   if msg <> '*' then
      mmStatus.Lines.Add(msg);
   prbImportar.Max      := Lancamento.MaxProgresso;
   prbImportar.Position := Lancamento.Progresso;
   Application.ProcessMessages;
end;

procedure TfrmAtuSaldoAnaMT.MensPeriodo(msg: String);
begin
   mmStatus.Lines.Add(msg);
   Application.ProcessMessages;
end;

end.
