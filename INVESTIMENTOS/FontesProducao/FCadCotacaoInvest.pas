//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_2
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//********************************************************************************************************
//Data	 :  23/05/2005
//Codigo :  AL_1
//Função :  Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
unit FCadCotacaoInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBCtrls, TREdit,
  wwdblook, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList,
  uCtrlInvContab;

type
  TfrmCadCotacaoInvest = class(TfrmCadastroCS)
    GroupBox2: TGroupBox;
    Label14: TLabel;
    LBInvest: TLabel;
    DBDDataAutoriza: TCMDateTimePicker;
    DBlkInvestimento: TwwDBLookupCombo;
    QryInvestimento: TwwQuery;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    DBRealEdit2: TDBRealEdit;
    Label2: TLabel;
    DBRealEdit3: TDBRealEdit;
    QryAux: TwwQuery;
    qryDATACOTACAO: TDateTimeField;
    qryIDINVESTIMENTO: TFloatField;
    qryVLRCONTABIL: TFloatField;
    qryVLRGERENCIAL: TFloatField;
    qryQTDTITLOTE: TFloatField;
    procedure DBlkInvestimentoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBlkInvestimentoChange(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wEmOperacao    :Boolean;
    wIdInvestimento:Integer;
    wDataCotacao   :TDateTime;
    wVlrCotacaoInvestimento : Double;
  end;

var
  frmCadCotacaoInvest: TfrmCadCotacaoInvest;
  Emissor : real ;

implementation

{$R *.DFM}

Uses UBibliotecaInvest, USistema, ULancContab, UMensErro;

procedure TfrmCadCotacaoInvest.CmeCadastroInsert(Sender: TObject);
Var
  sSql : string ;
begin
  qry.Close;
  qry.Sql.Clear;
  sSql := 'SELECT CTI.DATACOTACAO,CTI.IDINVESTIMENTO,CTI.VLRCONTABIL,CTI.VLRGERENCIAL,CTI.QTDTITLOTE FROM  COTACAOINVEST CTI ';
  sSql := sSql + ' WHERE 1 = 2 ';
  qry.SQL.Add(sSQL);
  qry.Open;
  inherited;
end;

procedure TfrmCadCotacaoInvest.CmeCadastroFind(Sender: TObject);
var
  sSql : string ;
begin
 if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
   Qry.Close;
   Qry.Sql.Clear;
   sSql := 'SELECT CTI.DATACOTACAO,CTI.IDINVESTIMENTO,CTI.VLRCONTABIL,CTI.VLRGERENCIAL,CTI.QTDTITLOTE FROM COTACAOINVEST CTI ';
   sSql := sSql + ' WHERE CTI.DATACOTACAO  = TO_DATE ( '''+ MontaSelect.ValoresChave[0] + ''',''dd/mm/yyyy'')';
   sSql := sSql + ' AND  CTI.IDINVESTIMENTO  = '''+ MontaSelect.ValoresChave[1] + '''';
   qry.SQL.Add(sSQL);
   qry.Open;
  end;
 inherited;
end;


procedure TfrmCadCotacaoInvest.DBlkInvestimentoEnter(Sender: TObject);
begin
 inherited;
 if not qryInvestimento.active then
  qryInvestimento.active := true;
end;


procedure TfrmCadCotacaoInvest.FormShow(Sender: TObject);
begin
  inherited;
  QryInvestimento.Open;
// Caso em Operacao Insere Registro
  If (wEmOperacao = True) Then Begin
// Insere Registro
    sbtnInserirClick(Sender);
  End;
end;

procedure TfrmCadCotacaoInvest.bbtnConfirmarClick(Sender: TObject);
Var
  wExercicio, wPeriodo, wIdEmpresa :Integer;
  wMensContab:String;
begin
  If Trim(DBlkInvestimento.Text) = '' Then Begin
    ShowMessage('Investimento deve ser Preenchido . ');
    DBlkInvestimento.SetFocus;
    Exit;
  End Else If Trim(DBDdataAutoriza.Text) = '' Then begin
    ShowMessage('Data da Cotação deve ser Preenchida . ');
    DBDdataAutoriza.SetFocus;
    Exit;
  End;

   // AL_1 - Testa o Periodo Contabil
   if not CtrlInvContab.TestaPeriodo(DBDDataAutoriza.Text,
                                     //AL_2
                                     2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

  // Não Volta mais a data do Fechamento com a alteração da cota.
  // Verifica se a Data da operacao é menor ou Igual que a do Ultimo Fechamento
  //AL_2
  if DBDdataAutoriza.DateTime < pRPI.DATAULTFECH then
  begin
     if (MsgDlg('A data desta Operação é anterior a do ultimo Fechamento Diário, '+#13+
                'confirma esta Operação ?','Mensagem do Sistema',MtConfirmation,[MbYes, MbNo],0) = MrNo) then
        Exit;
  end;
  //AL_1 - Fim

// Guarda o Valor da Cotacao
  wVlrCotacaoInvestimento := DBRealEdit2.Value;
// Caso Não esteja em operacao Executa a heranca do Padrão
  If wEmOperacao = False Then Begin
    inherited;
  End Else Begin
// Caso Esteja em Operaco confirma mas não Commita as Operacoes .
    Try
      Qry.Post;
      Qry.ApplyUpdates;
      Qry.CommitUpdates;
      Close;
    Except
      Raise;
    End;
  End;
end;

procedure TfrmCadCotacaoInvest.DBlkInvestimentoChange(Sender: TObject);
begin
  inherited;
// Busca QtdLote do Investimento se renda Variavel caso Atualizando
  If Qry.State In [DsEdit, DsInsert] Then Begin
    If FazQuery(QryAux,
      'SELECT QTDELOTE FROM ACOESXBOLSA WHERE 	(IDACAO = '''+
      DBlkInvestimento.LookupValue+''')') Then Begin
// Transfere dado
        Qry.FieldByName('QTDTITLOTE').AsInteger:= QryAux.FieldByName('QTDELOTE').AsInteger
    End Else Begin
        Qry.FieldByName('QTDTITLOTE').AsInteger:= 1;

    End;
  End;

end;

// AL_1 - Inicio
procedure TfrmCadCotacaoInvest.sbtnApagarClick(Sender: TObject);
begin
   // Testa o Periodo Contabil 
   if not CtrlInvContab.TestaPeriodo(DBDDataAutoriza.Text,
                                     //AL_2
                                     2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      sbtnApagar.Down:=False;
      Exit;
   end;

   inherited;
end;
// AL_1 - Fim

procedure TfrmCadCotacaoInvest.sbtnInserirClick(Sender: TObject);
begin
  inherited;
// Caso em Operacao Preenche os Valores Automaticos
  If (wEmOperacao = True) Then Begin
// Preenche Valores
    Qry.FieldByName('IDINVESTIMENTO').AsInteger :=wIdInvestimento;
    Qry.FieldByName('DATACOTACAO').AsDateTime   :=wDataCotacao;
  End;
end;

end.
