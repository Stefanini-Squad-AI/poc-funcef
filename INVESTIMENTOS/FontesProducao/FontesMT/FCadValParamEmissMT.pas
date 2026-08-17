//******************************************************************************
// Data      : 27/09/2007
// Pendencia : 25925
// Motivo    : Implementação do Cadastro de Valores de Indicadores (3 camadas)
//******************************************************************************
unit FCadValParamEmissMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlInvestimento,uCtrlPadroes,uMensErro,uCMTypes, FCadastroGridMTInvFMD,
  uCmSqlParams, StdCtrls, wwdblook, Menus, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, fcLabel, faMensagem, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmCadValParamEmissMT = class(TFrmCadastroGridMTInvFMD)
    DbLkcEmissor: TwwDBLookupCombo;
    Label5: TLabel;
    Sql: TCMSqlParams;
    SqlAux: TCMSqlParams;
    DtsAux: TwwDataSource;
    DBData: TCMDateTimePicker;
    dbreValor: TDBRealEdit;
    LbLValor: TLabel;
    Label3: TLabel;
    CdsIndicador: TCMClientDataSet;
    DtsIndicador: TwwDataSource;
    DBlkIndicador: TwwDBLookupCombo;
    Label2: TLabel;
    SqlIndicador: TCMSqlParams;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DbLkcEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure DbLkcEmissorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure DBlkIndicadorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBlkIndicadorExit(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Investimento : TCtrlInvestimento;
    Cds_ : TCMClientDataSet;
    Procedure AtualizaGrid;
  public
    { Public declarations }
  end;

var
  FrmCadValParamEmissMT: TFrmCadValParamEmissMT;

implementation

{$R *.DFM}

procedure TFrmCadValParamEmissMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(Investimento);
  FreeAndNil(Cds_);
  FreeAndNil(CdsIndicador);
end;

procedure TFrmCadValParamEmissMT.FormCreate(Sender: TObject);
begin
  inherited;
  Investimento := TCtrlInvestimento.Create;
  Investimento.InitializeAs(padroes);
  Investimento.CdsValParamXEmissor := cds;
  Cds_ := TCMClientDataSet.Create(nil);
  cdsaux.data := Investimento.cdslookemissor;
  cdsIndicador.data := Investimento.ListaParamEmissor;
end;

procedure TFrmCadValParamEmissMT.DbLkcEmissorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if DbLkcEmissor.text <> '' then
  begin
    Investimento.MDIDEmisssor := Strtoint(DbLkcEmissor.lookupvalue);
    cdsIndicador.data := Investimento.cdslookIndicadorEmissor;
  end
  else
  begin
    Investimento.MDIDEmisssor := -1;
    sbtnInserir.enabled := false;
  end;
  AtualizaGrid;
end;

procedure TFrmCadValParamEmissMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  pnlDados.Enabled := True;
  DBData.enabled := True;
  If DbLkcEmissor.text <> '' then
     AtualizaGrid;
end;

procedure TFrmCadValParamEmissMT.sbtnInserirClick(Sender: TObject);
begin
  if (DbLkcEmissor.text <> '') and (DBlkIndicador.Text <> '') then
  begin
    Cds_.data := cds.data;
    if CdsIndicador.recordcount <> 0 then
    begin
      pnlDados.Enabled := False;
      inherited;
      Cds.FieldByName('IDEMISSOR').AsString := DbLkcEmissor.lookupvalue;
      Cds.FieldByName('IDPARAMEMISSOR').AsString := DBlkIndicador.lookupvalue;
    end
    else
      MsgDlg('Não existem indicadores associados a este Emissor.','Mensagem do Sistema',mtwarning,[mbOk],0);
  end
  else
  If DBlkIndicador.Text = '' then
  begin
    MsgDlg('Informe o Tipo de Indicador.','Mensagem do Sistema' ,MtWarning,[mbok],0);
    if DBlkIndicador.CanFocus then
       DBlkIndicador.SetFocus;
  end
end;

procedure TFrmCadValParamEmissMT.AtualizaGrid;
begin
  cds.data := Investimento.ListaValParamEmissor;
  if cds.IsEmpty then
     CmeCadastro.Operacao := opVazio
  else
     CmeCadastro.Operacao := opIdle;

  CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadValParamEmissMT.CmeCadastroInsert(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;

end;

procedure TFrmCadValParamEmissMT.sbtnAlterarClick(Sender: TObject);
begin
  DBData.enabled := False;
  pnlDados.Enabled := False;
  inherited;
end;

procedure TFrmCadValParamEmissMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := Investimento.AplicaValParamEmissor;

  if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
                'Motivo: ' + Investimento.MessageInfo,'Mensagem do Sistema',mtwarning,[mbOk],0);
  AtualizaGrid;
end;

procedure TFrmCadValParamEmissMT.CdsAfterOpen(DataSet: TDataSet);
Var i: integer;
begin
  inherited;

   For i:= 0 to (DataSet.Fields.Count-1) do
   begin
      if DataSet.Fields[i] is TFloatField then
         TFloatField(DataSet.Fields[i]).DisplayFormat := '#,##0.00';
   end;
end;

procedure TFrmCadValParamEmissMT.DbLkcEmissorExit(Sender: TObject);
begin
  inherited;
  if DbLkcEmissor.text <> '' then
  begin
    Investimento.MDIDEmisssor := Strtoint(DbLkcEmissor.lookupvalue);
    cdsIndicador.data := Investimento.cdslookIndicadorEmissor;
    // Verificando se existem indicadores associados
    if CdsIndicador.recordcount = 0 then
    begin
       MsgDlg('Não existem indicadores associados a este Emissor.','Mensagem do Sistema',mtwarning,[mbOk],0);
       If DbLkcEmissor.CanFocus then
          DbLkcEmissor.SetFocus;
    end;
  end
  else
  begin
    Investimento.MDIDEmisssor := -1;
    sbtnInserir.enabled := false;
  end;
  AtualizaGrid;
end;

procedure TFrmCadValParamEmissMT.FormShow(Sender: TObject);
begin
  inherited;
  sbtnInserir.enabled := false;
end;

procedure TFrmCadValParamEmissMT.sbtnApagarClick(Sender: TObject);
begin
  pnlDados.Enabled := True;
  inherited;

end;

procedure TFrmCadValParamEmissMT.CmeCadastroBeforeConfirma(sender: TObject;
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
         end
    else If DBData.Text = '' then
         begin
           MsgDlg('Informe a Data de Referência.','Mensagem do Sistema' ,MtWarning,[mbok],0);
           if DBData.CanFocus then
              DBData.SetFocus;
           Accept := False;
         end
    else If dbreValor.value = 0 then
         begin
           MsgDlg('Informe o Valor do Indicador.','Mensagem do Sistema' ,MtWarning,[mbok],0);
           if dbreValor.CanFocus then
              dbreValor.SetFocus;                              ;
           Accept := False;
         end
    else
       If CmeCadastro.Operacao = OpInserir then
       begin
         // Vou verificar se o registro do Cds
         If Cds_.Locate('IDEMISSOR;IDPARAMEMISSOR;DATAREFPREMISSOR', VarArrayOf([DbLkcEmissor.lookupvalue,DBlkIndicador.lookupvalue, DBData.text]), []) then
         begin
           MsgDlg('Indicador já cadastrado.','Mensagem do Sistema' ,MtWarning,[mbok],0);
           if DBlkIndicador.CanFocus then
              DBlkIndicador.SetFocus;
           Accept := False;
         end;
       end;
    end;
end;

procedure TFrmCadValParamEmissMT.DBlkIndicadorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AtualizaGrid;
end;

procedure TFrmCadValParamEmissMT.DBlkIndicadorExit(Sender: TObject);
begin
  inherited;
  if DBlkIndicador.text <> '' then
     Investimento.MDIDParamEmisssor := Strtoint(DBlkIndicador.lookupvalue)
  else
  begin
     Investimento.MDIDParamEmisssor := -1;
     sbtnInserir.enabled := false;
  end;

  AtualizaGrid;
end;

procedure TFrmCadValParamEmissMT.dbGrdDblClick(Sender: TObject);
begin
  DBData.enabled := False;
  pnlDados.Enabled := False;
  inherited;

end;

procedure TFrmCadValParamEmissMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  pnlDados.Enabled := True;
  DBData.enabled := True;
  AtualizaGrid;
end;

end.
