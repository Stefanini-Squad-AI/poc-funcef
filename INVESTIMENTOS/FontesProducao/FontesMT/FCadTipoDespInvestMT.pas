//******************************************************************************
// Data     : 11/01/2007
// Código   :
// Pendencia: 
// SOL      :
// Desc     : Implementação do cadastramento de Rúbricas de Sistema (Negativas)
//            em 3 camadas
//            Aqui não será utilizado os campos IDForcli(Razão Social),
//            TipoCredor=CO, pois estes dados serao gravados em tipos de
//            operação, ou seja em um nivel mais alto e não foi tratado
//            EmpresaProp,PercDivVlrAut
//******************************************************************************

unit FCadTipoDespInvestMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams,uctrlinvestimento,
  uCtrlPadroes, uCtrlParamInvest, DBCtrls, Wwdotdot, Wwdbcomb, wwdblook, Mask,
  wwdbedit,uMensErro, uCMTypes;


type
  TfrmCadTipoDespInvestMT = class(TFrmCadastroGridMTInv)
    DBEDescricao: TwwDBEdit;
    LbLDescParamEmissor: TLabel;
    LblIdRegra: TLabel;
    DBLkMoeda: TwwDBLookupCombo;
    dbeCodigo: TwwDBEdit;
    DBRNaturezaOp: TDBRadioGroup;
    CdsMoeda: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);

  private
    { Private declarations }
    CtrlInvestimento  : TCtrlInvestimento;
    procedure Seleciona(iIdTipoDespInvest : Integer = 0);

  public
    { Public declarations }
    iTipoDespInvestAnt : Integer;

  end;

var
  frmCadTipoDespInvestMT: TfrmCadTipoDespInvestMT;

implementation


{$R *.DFM}

procedure TfrmCadTipoDespInvestMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlInvestimento := TCtrlInvestimento.Create;
  CtrlInvestimento.InitializeAs(Padroes);
  CtrlInvestimento.CdsTipoDespInvest := cds;
  CdsMoeda.Data    := CtrlInvestimento.ListMoeda;
  Seleciona;
end;

procedure TfrmCadTipoDespInvestMT.Seleciona(iIdTipoDespInvest: Integer = 0);
begin
  //Passei zero pq tem negativo no id
  Cds.Data := CtrlInvestimento.ListTipoDespInvest;
  If iIdTipoDespInvest <> 0 then
    Cds.Locate('IDTIPODESPINVEST',iIdTipoDespInvest,[lopartialkey]);
end;

procedure TfrmCadTipoDespInvestMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   FreeAndNil(CtrlInvestimento);
end;

procedure TfrmCadTipoDespInvestMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin

  Accept := CtrlInvestimento.AplicaTipoDespInvest;

  If CmeCadastro.Operacao in [OpInserir] then
    iTipoDespInvestAnt := CtrlInvestimento.IdTipoDespInvest;

  if not Accept then
  begin
     MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
           'Motivo: ' + CtrlInvestimento.MessageInfo,'Mensagem do Sistema',mtWarning,[mbOk],0);
     exit;
  end;
  inherited;
end;

procedure TfrmCadTipoDespInvestMT.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
  Seleciona(iTipoDespInvestAnt);
end;

procedure TfrmCadTipoDespInvestMT.sbtnInserirClick(Sender: TObject);
begin
  if not Cds.IsEmpty then
     iTipoDespInvestAnt := cds.FieldByName('IDTIPODESPINVEST').AsInteger;
  inherited;
  // Sugerindo a moeda padrão no grid
  Cds.FieldByName('MOECODIGO').AsInteger := CtrlPInv.MoeCodigo;
  if dbeDescricao.CanFocus then
     dbeDescricao.SetFocus;
end;

procedure TfrmCadTipoDespInvestMT.sbtnAlterarClick(Sender: TObject);
begin
  if not Cds.IsEmpty then
     iTipoDespInvestAnt := cds.FieldByName('IDTIPODESPINVEST').AsInteger;
  inherited;
  if dbeDescricao.CanFocus then
      dbeDescricao.SetFocus;
end;

procedure TfrmCadTipoDespInvestMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
   Accept := True;
   if CmeCadastro.Operacao in [OpInserir,OpAlterar] then;
   begin
      if Trim(dbeDescricao.Text) = '' then
      begin
         MsgDlg('Descrição não Informada.','Atenção' ,MtWarning,[mbok],0);
         if dbeDescricao.CanFocus then
            dbeDescricao.SetFocus;
         Accept := False;
      end
      else if Trim(DBLkMoeda.Text) = '' then
      begin
         MsgDlg('Moeda não Informada.','Atenção' ,MtWarning,[mbok],0);
         if DBLkMoeda.CanFocus then
            DBLkMoeda.SetFocus;
         Accept := False;
      end
      else if DBRNaturezaOp.ItemIndex = -1 then
      begin
         MsgDlg('Atualização na Carteira não Informada.','Atenção' ,MtWarning,[mbok],0);
         if DBRNaturezaOp.CanFocus then
            DBRNaturezaOp.SetFocus;
         Accept := False;
      end;
  end;
end;

procedure TfrmCadTipoDespInvestMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDTIPODESPINVEST',MontaSelect.ValoresChave[0],[]);
end;

procedure TfrmCadTipoDespInvestMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  //==========================================================
  // Está aqui pois o grid não está sendo atualizado
  // automaticamente ao cancelar as operações
  // ==========================================================
  Seleciona(iTipoDespInvestAnt);
end;

procedure TfrmCadTipoDespInvestMT.sbtnApagarClick(Sender: TObject);
begin
  If Not Cds.IsEmpty then
    iTipoDespInvestAnt:= Cds.fieldbyname('IDTIPODESPINVEST').asinteger;
  inherited;
  Seleciona(iTipoDespInvestAnt);
end;

procedure TfrmCadTipoDespInvestMT.dbGrdDblClick(Sender: TObject);
begin
  if not Cds.IsEmpty then
     iTipoDespInvestAnt := cds.FieldByName('IDTIPODESPINVEST').AsInteger;
  inherited;
  if dbeDescricao.CanFocus then
      dbeDescricao.SetFocus;
end;

end.



