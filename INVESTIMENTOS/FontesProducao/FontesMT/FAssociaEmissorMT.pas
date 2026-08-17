//******************************************************************************
// Data      : 27/09/2007
// Pendencia : 25923
// Motivo    : Implementação do Cadastro de Associação de Indicadores (3 camadas)
//******************************************************************************

unit FAssociaEmissorMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInvFMD, uCmSqlParams, StdCtrls, wwdblook, Menus,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, fcLabel, faMensagem, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  uCtrlInvestimento,uCtrlPadroes,uMensErro,uCMTypes, Mask, wwdbedit;

type
  TFrmAssociaEmissorMT = class(TFrmCadastroGridMTInvFMD)
    DbLkcEmissor: TwwDBLookupCombo;
    Label5: TLabel;
    DtsAux: TwwDataSource;
    SqlAux: TCMSqlParams;
    Label2: TLabel;
    DBlkIndicador: TwwDBLookupCombo;
    CdsIndicador: TCMClientDataSet;
    DtsIndicador: TwwDataSource;
    SqlIndicador: TCMSqlParams;
    Sql: TCMSqlParams;
    Label1: TLabel;
    DbeIndicador: TwwDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DbLkcEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcEmissorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Investimento : TCtrlInvestimento;
    Cds_: TCMClientDataSet;
    procedure AtualizaGrid;
  public
    { Public declarations }
  end;

var
  FrmAssociaEmissorMT: TFrmAssociaEmissorMT;

implementation

{$R *.DFM}

procedure TFrmAssociaEmissorMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(Investimento);
  FreeAndNil(CdsIndicador);
  FreeAndNil(Cds_);
end;

procedure TFrmAssociaEmissorMT.FormCreate(Sender: TObject);
begin
  inherited;
  Investimento := TCtrlInvestimento.Create;
  Investimento.InitializeAs(padroes);
  Investimento.CdsParamXEmissor := cds;
  cdsaux.data := Investimento.cdslookemissor;
  Investimento.MDIDEmisssor := -1;
  CdsIndicador.Data := Investimento.cdslookIndicadorNEmissor;
  Cds_ := TCMClientDataSet.Create(nil);
end;

procedure TFrmAssociaEmissorMT.DbLkcEmissorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if DbLkcEmissor.text <> '' then
  begin
    Investimento.MDIDEmisssor := Strtoint(DbLkcEmissor.lookupvalue);
    cdsIndicador.data := Investimento.cdslookIndicadorNEmissor;
  end
  else
  begin
      Investimento.MDIDEmisssor := -1;
      sbtnInserir.enabled := false;
  end;
  AtualizaGrid;
end;

procedure TFrmAssociaEmissorMT.DbLkcEmissorExit(Sender: TObject);
begin
  inherited;
  if DbLkcEmissor.text <> '' then
  begin
    Investimento.MDIDEmisssor := Strtoint(DbLkcEmissor.lookupvalue);
    cdsIndicador.data := Investimento.cdslookIndicadorNEmissor;
  end
  else
  begin
    Investimento.MDIDEmisssor := -1;
    sbtnInserir.enabled := false;
  end;
  AtualizaGrid;
end;

procedure TFrmAssociaEmissorMT.AtualizaGrid;
begin
  cds.data := Investimento.cdslookIndicadorEmissor;

  if cds.IsEmpty then
     CmeCadastro.Operacao := opVazio
  else
     CmeCadastro.Operacao := opIdle;

  CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmAssociaEmissorMT.FormShow(Sender: TObject);
begin
  inherited;
  sbtnInserir.enabled := false;
end;

procedure TFrmAssociaEmissorMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  Accept := Investimento.AplicaParamXEmissor;

  if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
                'Motivo: ' + Investimento.MessageInfo,'Mensagem do Sistema',mtwarning,[mbOk],0);

  inherited;

  //Refazendo a lista de indicadores não associados
  cdsIndicador.data := Investimento.cdslookIndicadorNEmissor;

  AtualizaGrid;
end;

procedure TFrmAssociaEmissorMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  If CmeCadastro.Operacao in [OpInserir,OpAlterar] then;
  begin
    If DbLkcEmissor.Text = '' then
    begin
      MsgDlg('Informe o Emissor.','Mensagem do Sistema' ,MtWarning,[mbok],0);
      if DbLkcEmissor.CanFocus then
         DbLkcEmissor.SetFocus;
      Accept := False;
    end
    else If DBlkIndicador.Text = '' then
         begin
           MsgDlg('Informe o Tipo de Indicador.','Mensagem do Sistema' ,MtWarning,[mbok],0);
           if DBlkIndicador.CanFocus then
              DBlkIndicador.SetFocus;
           Accept := False;
         end;
  end;
end;

procedure TFrmAssociaEmissorMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  pnlDados.Enabled := True;
  If DbLkcEmissor.text <> '' then
     AtualizaGrid;
end;

procedure TFrmAssociaEmissorMT.sbtnInserirClick(Sender: TObject);
begin
  If DbLkcEmissor.Text = '' then
  begin
    MsgDlg('Informe o Emissor.','Mensagem do Sistema' ,MtWarning,[mbok],0);
    if DbLkcEmissor.CanFocus then
       DbLkcEmissor.SetFocus;
  end
  else If DBlkIndicador.Text = '' then
       begin
           MsgDlg('Informe o Tipo de Indicador.','Mensagem do Sistema' ,MtWarning,[mbok],0);
           if DBlkIndicador.CanFocus then
              DBlkIndicador.SetFocus;
        end
  else if CdsIndicador.recordcount <> 0 then
       begin
         pnlDados.Enabled := False;
         inherited;
         Cds.fieldbyname('IDEMISSOR').AsString := DbLkcEmissor.lookupvalue;
         Cds.fieldbyname('IDPARAMEMISSOR').AsString :=  DBlkIndicador.lookupvalue;
         Cds.FieldByName('DESCPARAMEMISSOR').AsString := DBlkIndicador.text;
       end
       else
         MsgDlg('Não existem indicadores a serem associados para este Emissor.','Mensagem do Sistema',mtwarning,[mbOk],0);

end;

procedure TFrmAssociaEmissorMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := False;
end;

procedure TFrmAssociaEmissorMT.sbtnApagarClick(Sender: TObject);
begin
  DBlkIndicador.clear;
  Investimento.MDIDEmisssor := Strtoint(DbLkcEmissor.lookupvalue);
  Investimento.MDIDParamEmisssor := Cds.Fieldbyname('IDPARAMEMISSOR').AsInteger ;
  Cds_.data := Investimento.ListaValParamEmissor;
  If Cds_.recordcount = 0 then
     inherited
  else
  begin
    MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
                'Motivo: Não é possível desassociar indicadores com valores.','Mensagem do Sistema',mtwarning,[mbOk],0);
    bbtnCancelarClick(Self);
  end;

end;

procedure TFrmAssociaEmissorMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  pnlDados.Enabled := True;
  DBlkIndicador.clear;
end;

end.
