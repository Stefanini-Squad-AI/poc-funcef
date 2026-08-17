unit FAtualizaSinMT;
{------------------------------------------------------------------------------
Desenvolvedor : Helen V. Bianchi
Data          : 23/07/2012
SOL           : 185643
Kintana       : 1741772
Descrição     : flag: "Atualizar somente o periodo indicado" marcado por padrao.
                Alteração apenas no dfm
--------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, DBClient,
  uCtrlPeriodo, uCtrlProcessaContab, uCtrlLancamento, uCtrlContab, Mask,
  uCmControlObject, MConnect, SConnect, FIntegraDiasMT, uCMTypes;

type
 
  TfrmAtualizaSinMT = class(TfrmSairAjuda)
    btnAtualizar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    mmStatus: TRichEdit;
    Label1: TLabel;
    cdsExercicio: TClientDataSet;
    cdsPeriodo: TClientDataSet;
    gbTempo: TGroupBox;
    lblHoraFim: TLabel;
    lblMostraHoraIni: TLabel;
    lblMostraHoraFim: TLabel;
    GroupBox1: TGroupBox;
    mskConta: TMaskEdit;
    Anim: TAnimate;
    cbAtualiza: TCheckBox;
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Periodo        : TCtrlPeriodo;
    ProcessaContab : TCtrlProcessaContab;
    Lancamento     : TCtrlLancamento;
    Contab         : TCtrlContab;
    varTipo        : TTipoPeriodo;
    Procedure MensProcessaContab(msg : String);
    Procedure MensPeriodo(msg : String);
  public
    { Public declarations }
  end;

var
  frmAtualizaSinMT: TfrmAtualizaSinMT;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, dBaseDados;


procedure TfrmAtualizaSinMT.btnAtualizarClick(Sender: TObject);
var bError : Boolean;
begin
   inherited;
     If cbAtualiza.Checked Then
        varTipo := tpSoPeriodo
     Else
        varTipo := tpMenorIgual;

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
     mskConta.editMask := Contab.MascaraContaParam + ';0; ';
     //
     If Sistema.ConnectionSide = CnsClient Then
     Begin
       Anim.Visible := True;
       Anim.Active := True;
     End;
     bError := false;
     mmStatus.Lines.Clear;
     btnAtualizar.Enabled    :=False;
     lblMostraHoraIni.Visible:=True;
     lblMostraHoraIni.Caption:=TimeToStr(Time);
     Application.ProcessMessages;

     mmStatus.Lines.Add('Testa se o Débito está batendo com o Crédito');
     mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
     Application.ProcessMessages;
     if not ProcessaContab.TestaDebCreSaldo(Sistema.idEmpresa, Periodo.Exercicio,Periodo.Periodo,tpMenorIgual ) then bError := true;
     mmStatus.Lines.Add('Final :'+TimeToStr(Time));
     Application.ProcessMessages;

     if bError then begin
       if MsgDlg('Problemas nas conferências. Deseja continuar a atualização mesmo assim?','Confirmação',mtConfirmation,[mbYes,mbNo], 0) = mrNo then begin
          btnAtualizar.Enabled    :=True;
          lblMostraHoraFim.Visible:=True;
          lblMostraHoraFim.Caption:=TimeToStr(Time);
          Application.ProcessMessages;
          Exit;
       end;
     end;
     mmStatus.Lines.Add('Atualizando o Saldo das Sintéticas');
     mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
     mskConta.Visible := True;
     if not ProcessaContab.ProcessaSaldoSintetica(Sistema.idEmpresa,Sistema.IdModulo,Sistema.idUsuario,
                           Periodo.Exercicio,Periodo.Periodo,Sistema.UsaPlanoPatro,varTipo) then begin
        mmStatus.Lines.Add('Fim :'+TimeToStr(Time));
        lblMostraHoraFim.Visible:=True;
        lblMostraHoraFim.Caption:=TimeToStr(Time);
        mmStatus.Lines.Add('Atualização do Saldo das Sintéticas não pode ser realizado. Verifique as mensagens.');
        Application.ProcessMessages;
        MsgDlg('Atualização do Saldo das Sintéticas NÃO realizado.','Erro',mtError,[mbOk], 0);
     end else begin
        mmStatus.Lines.Add('Fim :'+TimeToStr(Time));
        lblMostraHoraFim.Visible:=True;
        lblMostraHoraFim.Caption:=TimeToStr(Time);
        if bError then begin
           mmStatus.Lines.Add('Atualização Efetuada com Sucesso com mensagens de inconsistencia');
           MsgDlg('Atualização Efetuada com Sucesso com mensagens de inconsistencia!','Aviso',mtWarning,[mbOk], 0);
        end else begin
           mmStatus.Lines.Add('Atualização Efetuada com Sucesso.');
           MsgDlg('Atualização Efetuada com Sucesso!','Aviso',mtWarning,[mbOk], 0);
        end;
        Application.ProcessMessages;
     end;
     btnAtualizar.Enabled    :=True;
     Application.ProcessMessages;

   If Anim.Active Then Anim.Active := False;
end;

procedure TfrmAtualizaSinMT.FormCreate(Sender: TObject);
begin
  inherited;

  Periodo := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensPeriodo);

  cdsExercicio.Data := Periodo.ListExercicios(Sistema.Idempresa,False);
  cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.Idempresa ,tbpTodos,0,0);

  ProcessaContab := TCtrlProcessaContab.Create;
  ProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,MensProcessaContab);

  Lancamento := TCtrlLancamento.Create;
  Lancamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                        Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  Contab := TCtrlContab.Create;
  Contab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not Contab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(Contab.MessageInfo,'Erro',MtError,[mbOk],0);

  lblMostraHoraIni.Visible := False;
  lblMostraHoraFim.Visible := False;
  mskConta.Visible         := False;
end;

procedure TfrmAtualizaSinMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Periodo.Free;
  ProcessaContab.Free;
  Lancamento.Free;
  Contab.Free;
end;


procedure TfrmAtualizaSinMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (dblkExercicio.Text <> '') then begin
     cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.Idempresa ,tbpTodos,StrToInt(dblkExercicio.LookupValue),0);
  end;

end;

procedure TfrmAtualizaSinMT.MensProcessaContab(msg: String);
begin
   if msg <> '*' then
      mmStatus.Lines.Add(msg);
   mskConta.Text := ProcessaContab.ContaMostra;
   Application.ProcessMessages;
end;

procedure TfrmAtualizaSinMT.MensPeriodo(msg: String);
begin
   mmStatus.Lines.Add(msg);
   Application.ProcessMessages;
end;

end.
