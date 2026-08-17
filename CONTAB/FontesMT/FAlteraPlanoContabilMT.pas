unit FAlteraPlanoContabilMT;
{------------------------------------------------------------------------------
  Analista.....: André Imakawa
  SIG..........: 111721
  Data.........: 09/12/2020
  Rotina.......: bbtnConfirmarClick
  Descrição....: Ajuste para execução da rotina de Alteração do Plano Contabil
------------------------------------------------------------------------------
  Desenvolvedor:  Alex Pereira
  Data         : 27/10/2004
  Pendência    : 14358 - De Para do Plano de contas
  Solução      : Fazer o De Para apenas a partir de um período selecionado.
------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlPeriodo,uCtrlContab, uCtrlProcessaContab, FOkCancelar, Db,
  DBClient, uCMClientDataSet, ComCtrls, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls,{$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmAlteraPlanoContabilMT = class(TfrmOkCancelar)
    dblkExercicio: TwwDBLookupCombo;
    Label6: TLabel;
    dteDataAtualizacao: TCMDateTimePicker;
    Label3: TLabel;
    pgr: TProgressBar;
    Label7: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblConta: TLabel;
    lblTabela: TLabel;
    cbMesmosCCSC: TCheckBox;
    cbMesmoPlano: TCheckBox;
    Anim: TAnimate;
    cdsExercicio: TCMClientDataSet;
    cbGeraLancSaldoAnt: TCheckBox;
    cbConverteSoAnterior: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    NREG: TLabel;
    TOTREG: TLabel;
    TABELA: TLabel;
    Label9: TLabel;
    lparte: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label10: TLabel;
    cdsPeriodo: TCMClientDataSet;
    chkDivideEtapa: TCheckBox; // Andre Imakawa - SIG 111721
    cbbEtapas: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure chkDivideEtapaClick(Sender: TObject);  // Andre Imakawa - SIG 111721
  private
    CtrlPeriodo          :TCtrlPeriodo;
    CtrlContab           :TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    procedure ProcMens(msg: String);

  public
    { Public declarations }
  end;

var
  frmAlteraPlanoContabilMT: TfrmAlteraPlanoContabilMT;

implementation

uses uMensErro,uDataBase, DBaseDados,uSistema,uString,uModulo;

{$R *.DFM}

procedure TfrmAlteraPlanoContabilMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  // *** Instancia a classe processa Contabil ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMens);

  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.Idempresa,True);

  cbbEtapas.Visible := False;
  cbbEtapas.ItemIndex := 0;
  
end;

procedure TfrmAlteraPlanoContabilMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.free;
  CtrlContab.free;
  CtrlProcessaContab.free;

end;

procedure TfrmAlteraPlanoContabilMT.ProcMens(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
    begin
       lblTabela.Caption := CtrlProcessaContab.NomeTabela;
       lblConta.Caption  := CtrlProcessaContab.NomeConta;
       tabela.Caption    := CtrlProcessaContab.NomeTabela;
       Totreg.Caption    := FloatToStr(CtrlProcessaContab.TotReg);
       Nreg.Caption      := FloatToStr(CtrlProcessaContab.NReg);
       LParte.Caption    := CtrlProcessaContab.ParteProc;
    end;
    pgr.Position := CtrlProcessaContab._Progresso;
    pgr.Max      := CtrlProcessaContab.MaxProgresso;

    Application.ProcessMessages;
  End;

end;

procedure TfrmAlteraPlanoContabilMT.bbtnConfirmarClick(Sender: TObject);
var
  iPlanoVigente,iPlano, iExercicio, iPeriodo :Integer;
  ano, mes, dia: Word;
  iEtapa: Integer;
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('Exercicio não preenchido.','Aviso',mtWarning,[mbOk],0);
      dblkExercicio.SetFocus;
      Exit;
   end else iExercicio := StrToInt(dblkExercicio.LookupValue);

   // Alex 28/10/2004 14538
   if dblkPeriodo.text = '' then begin
      MsgDlg('Período não preenchido.','Aviso',mtWarning,[mbOk],0);
      dblkPeriodo.SetFocus;
      Exit;
   end else iPeriodo := StrToInt(dblkPeriodo.LookupValue);

   if dteDataAtualizacao.text = '' then begin
      MsgDlg('Data da atualização não preenchida.','Aviso',mtWarning,[mbOk],0);
      dteDataAtualizacao.SetFocus;
      Exit;
   end;

   // Alex 28/10/2004 14538 - verificar se é um de-para para meses posteriores a janeiro
   // SOL 129666 KTN 713177 Ricardo A.
   if not cbConverteSoAnterior.Checked then
   begin
     DecodeDate(dteDataAtualizacao.Date, ano, mes, dia);
     if (ano <> iExercicio) or (mes <> iPeriodo) then
     begin
       MsgDlg('A data deve ser dento do período selecionado!','Aviso',mtWarning,[mbOk],0);
       dteDataAtualizacao.SetFocus;
       Exit;
     end;
   end;
   // FIM SOL 129666 KTN 713177 Ricardo A.

   iPlanoVigente := 0;
   If CtrlContab.SelecionaPlanoData(Sistema.idEmpresa, DateToStr(dteDataAtualizacao.date)) Then
      iPlanoVigente := CtrlContab.PlanoData;

   iPLano := CtrlContab.PlanoParam;

   if MsgDlg('Deseja REALMENTE alterar o Plano Contábil?','Aviso',mtConfirmation,[mbYes, mbNo],0) = mrNo then begin
      Exit;
   end;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active  := True;
     Label4.Visible := False;
     Label5.Visible := False;
     lblTabela.Visible := False;
     lblConta.Visible  := False;
   End Else
   Begin
     Label4.Visible := True;
     Label5.Visible := True;
     lblTabela.Visible := True;
     lblConta.Visible  := True;
   End;

   // Andre Imakawa - SIG 111721 - Inicio
   If not(chkDivideEtapa.Checked) then
     iEtapa := 0
   else
     iEtapa := cbbEtapas.ItemIndex +1;

   if iEtapa > 0 then
     if MsgDlg('Rotina será iniciada na etapa '+ IntToStr(iEtapa) + '.'+#13+
     'Deseja REALMENTE continuar?'
     ,'Aviso',mtConfirmation,[mbYes, mbNo],0) = mrNo then begin
       Exit;
     end;
   // Andre Imakawa - SIG 111721 - Fim
   
   If CtrlProcessaContab.AlteraPlanoConta(Sistema.idEmpresa,Sistema.idUsuario, modulo.sMascaraContas,dteDataAtualizacao.Text,
                                          iPlano,iPlanoVigente, iExercicio, iPeriodo,
                                          cbMesmoPlano.Checked,cbMesmosCCSC.Checked,
                                          cbGeraLancSaldoAnt.Checked,cbConverteSoAnterior.Checked,
                                          '','',False,'frmAlteraPlanoContabilMT', iEtapa) Then // Andre Imakawa - SIG 111721

   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   End Else
   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   End;

   If Anim.Active Then Anim.Active := False;

end;

procedure TfrmAlteraPlanoContabilMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(sistema.IdEmpresa, tbpTodos, StrToInt(dblkExercicio.LookupValue), 0);  
end;

// Andre Imakawa - SIG 111721 - Inicio
procedure TfrmAlteraPlanoContabilMT.chkDivideEtapaClick(Sender: TObject);
begin
  inherited;
  if chkDivideEtapa.Checked then
  begin
    cbbEtapas.Visible := True;
  end
  else
  begin
    cbbEtapas.Visible := False;
  end;

end;
// Andre Imakawa - SIG 111721 - Fim
end.
