//******************************************************************************
// Autor    : Mônica Silva
// Data     : 11/01/2007
// Código   :
// Pendencia:
// SOL      :
// Desc     : Implementação do cadastramento de Rúbricas de Sistema (Negativas)
//            em 3 camadas
//            Aqui não será utilizado os campos IDForcli(Razão Social),
//            TipoCredor=CO, pois estes dados serao gravados em tipos de
//            operação, ou seja em um nivel mais alto e não foi tratado
//            EmpresaProp,PercDivVlrAut(de acordo com orientação do Marcelo)
//******************************************************************************

unit FCadTipoDespInvestMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams,uctrlinvestimento,
  uCtrlPadroes,DBCtrls, Wwdotdot, Wwdbcomb, wwdblook, Mask, wwdbedit,uMensErro,
  uCMTypes;


type
  TfrmCadTipoDespInvestMT = class(TFrmCadastroGridMTInv)
    DBEDescricao: TwwDBEdit;
    LbLDescParamEmissor: TLabel;
    LblIdRegra: TLabel;
    DBLkMoeda: TwwDBLookupCombo;
    dbeCodigo: TwwDBEdit;
    DBRNaturezaOp: TDBRadioGroup;
    CdsMoeda: TCMClientDataSet;
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
    
  private
    { Private declarations }
    CtrlInvestimento  : TCtrlInvestimento;
    procedure Seleciona(iIdTipoDespInvest : Integer = -1);

  public
    { Public declarations }
  end;

var
  frmCadTipoDespInvestMT: TfrmCadTipoDespInvestMT;

implementation

uses uCtrlParamInvest, uInvestimento;

{$R *.DFM}

procedure TfrmCadTipoDespInvestMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlInvestimento := TCtrlInvestimento.Create;
  CtrlInvestimento.InitializeAs(Padroes);
  CtrlInvestimento.CdsTipoDespInvest := cds;
  CdsMoeda.Data          := CtrlInvestimento.ListMoeda;
  Seleciona;
end;

procedure TfrmCadTipoDespInvestMT.Seleciona(iIdTipoDespInvest: Integer);
begin
  Cds.Data := CtrlInvestimento.ListTipoDespInvest;
end;

procedure TfrmCadTipoDespInvestMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   FreeAndNil(CtrlInvestimento);
end;

procedure TfrmCadTipoDespInvestMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
var iTipoDespAnt: Integer;
begin
  inherited;
  iTipoDespAnt := Cds.FieldByName('IDTIPODESPINVEST').AsInteger;
  Accept := CtrlInvestimento.AplicaTipoDespInvest;
  if not Accept then
     MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
           'Motivo: ' + CtrlInvestimento.MessageInfo,'Erro',mtError,[mbOk],0);
  inherited;
  //==========================================================
  // Está aqui pois o grid não está sendo atualizado
  // automaticamente depois das operações: alteração/inclusao/Exclui
  Seleciona;
  //==========================================================
  Cds.Locate('IDTIPODESPINVEST',iTipoDespAnt,[loPartialKey]);
end;

procedure TfrmCadTipoDespInvestMT.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;

end;

procedure TfrmCadTipoDespInvestMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  //============================================================================
  // Investimentos.Params.MOECODIGO será temporario até acertar uCtrlParamInvest
  //============================================================================
  //=======================================
  // Sugerindo a moeda padrão no grid
  //=======================================
  Cds.FieldByName('MOECODIGO').AsInteger := Investimentos.Params.MOECODIGO;
  if dbeDescricao.CanFocus then
     dbeDescricao.SetFocus;
end;

procedure TfrmCadTipoDespInvestMT.sbtnAlterarClick(Sender: TObject);
begin
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
  Seleciona;
end;

end.



