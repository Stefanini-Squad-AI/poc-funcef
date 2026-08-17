unit FCadCarteiraInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask, wwdbedit,
  uCtrlPadroes, uMensErro, uCtrlInvestCotas, uCtrlCarteiraInvest, ComCtrls;

type
  TFrmCadCarteiraInvest = class(TFrmCadastroGridMTInv)
    Label2: TLabel;
    DbENomeCarteira: TwwDBEdit;
    Label7: TLabel;
    DbLkTipoInvestimento: TwwDBLookupCombo;
    Label9: TLabel;
    DbLkTipoMercado: TwwDBLookupCombo;
    lblConselheiro: TLabel;
    DbLkConselheiro: TwwDBLookupCombo;
    DbLkPatro: TwwDBLookupCombo;
    DbLkPlano: TwwDBLookupCombo;
    Label6: TLabel;
    DBLkGestor: TwwDBLookupCombo;
    Label1: TLabel;
    Label3: TLabel;
    DbDtDataInicio: TCMDateTimePicker;
    DbCkBCartProp: TDBCheckBox;
    DbCkBCartTerc: TDBCheckBox;
    DbCkBCartLastro: TDBCheckBox;
    DbCkBOrdemMov: TDBCheckBox;
    DbRdAtualiza: TDBRadioGroup;
    Label5: TLabel;
    CMSqlParams1: TCMSqlParams;
    DbCkBContabiliza: TDBCheckBox;
    CdsTipoInvest: TCMClientDataSet;
    CdsPlano: TCMClientDataSet;
    CdsConselheiro: TCMClientDataSet;
    CdsGestor: TCMClientDataSet;
    CdsTipoMercado: TCMClientDataSet;
    CdsPatrocinadora: TCMClientDataSet;
    HeaderControl1: THeaderControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure DbLkTipoInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkTipoInvestimentoEnter(Sender: TObject);
    procedure DbLkTipoInvestimentoExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestCotas : TCtrlInvestCotas;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;

    bModif : Boolean;
    sRegAnt : string;    

    procedure AtualizaCheckBox;

  public
    { Public declarations }
  end;

var
  FrmCadCarteiraInvest: TFrmCadCarteiraInvest;

implementation

{$R *.DFM}

procedure TFrmCadCarteiraInvest.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);
   CtrlCarteiraInvest.CdsCarteiraInvest := cds;

   CtrlInvestCotas := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);
   CtrlInvestCotas.CdsTipoInvest := CdsTipoInvest;
   CtrlInvestCotas.CdsMercado := CdsTipoMercado;
   CtrlInvestCotas.CdsConselheiro := CdsConselheiro;
   CtrlInvestCotas.CdsGestor := CdsGestor;
   CtrlInvestCotas.CdsPlano := CdsPlano;
   CtrlInvestCotas.CdsPatrocinadora := CdsPatrocinadora;   

end;

procedure TFrmCadCarteiraInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlInvestCotas);
   FreeAndNil(CtrlCarteiraInvest);
end;

procedure TFrmCadCarteiraInvest.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlCarteiraInvest.AplicaAtualCarteiraInvest;

   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlCarteiraInvest.MessageInfo,'Atenção',mtWarning,[mbOk],0);

   Cds.Data := CtrlCarteiraInvest.ListCarteiraInvest;             
end;

procedure TFrmCadCarteiraInvest.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDCARTEIRAINVEST',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadCarteiraInvest.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if DbENomeCarteira.CanFocus then
      DbENomeCarteira.SetFocus;
   cds.FieldByName('FLGCARTPROP').AsInteger   := 0;
   cds.FieldByName('FLGCALCDIARIO').AsInteger := 0;
   cds.FieldByName('FLGTRATALOTE').AsString   := 'N';
   cds.FieldByName('FLGORDMOVINV').AsString   := 'N';
   cds.FieldByName('FLGCARTLASTRO').AsString  := 'N';
   cds.FieldByName('FLGCARTTERC').AsString    := 'N';
   AtualizaCheckBox;
end;

procedure TFrmCadCarteiraInvest.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if DbENomeCarteira.CanFocus then
      DbENomeCarteira.SetFocus;
   AtualizaCheckBox;
end;

procedure TFrmCadCarteiraInvest.AtualizaCheckBox;
begin
   DbCkBCartProp.Checked    := (cds.FieldByName('FLGCARTPROP').AsString = '1');
   DbCkBCartTerc.Checked    := (cds.FieldByName('FLGCARTTERC').AsString = 'S');
   DbCkBCartLastro.Checked  := (cds.FieldByName('FLGCARTLASTRO').AsString = 'S');
   DbCkBOrdemMov.Checked    := (cds.FieldByName('FLGORDMOVINV').AsString = 'S');
   DbCkBContabiliza.Checked := (cds.FieldByName('FLGCONTABILIZA').AsString = 'S');
end;

procedure TFrmCadCarteiraInvest.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if Trim(DBENomeCarteira.Text) = '' then
  begin
     MsgDlg('Nome da Carteira de Investimento não Informado','Atenção' ,MtWarning,[mbok],0);
     if DBENomeCarteira.CanFocus then
        DBENomeCarteira.SetFocus;
     Exit;
  end
  else if Trim(dbdtDataInicio.Text) = '' then
  begin
     MsgDlg('Data de Inicio não pode estar vazia.','Atenção',mtWarning,[mbOK],0);
     if dbdtDataInicio.CanFocus then
        dbdtDataInicio.SetFocus;
     Exit;
  end
  else
     Accept := True;
end;

procedure TFrmCadCarteiraInvest.bbtnConfirmarClick(Sender: TObject);
begin
    CmeCadastro.RepetirInsert := False;
  inherited;
end;

procedure TFrmCadCarteiraInvest.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   AtualizaCheckBox;
end;

procedure TFrmCadCarteiraInvest.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlCarteiraInvest.AplicaAtualCarteiraInvest;

   if not Accept then
      MsgDlg('Ocorreu um erro na exclusão do Registro.' + #13 +
             'Motivo: ' + CtrlCarteiraInvest.MessageInfo,'Atenção',mtWarning,[mbOk],0);
end;

procedure TFrmCadCarteiraInvest.FormShow(Sender: TObject);
begin
  inherited;
   Cds.Data            := CtrlCarteiraInvest.ListCarteiraInvest;
   CdsTipoInvest.Data  := CtrlInvestCotas.ListTipoInvest;
   CdsTipoMercado.Data := CtrlInvestCotas.ListMercado;
   CdsConselheiro.Data := CtrlInvestCotas.ListConselheiro;
   CdsGestor.Data      := CtrlInvestCotas.ListGestor;
   CdsPlano.Data       := CtrlInvestCotas.ListPlano;
   CdsPatrocinadora.Data := CtrlInvestCotas.ListPatrocinadora;
end;

procedure TFrmCadCarteiraInvest.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   Cds.Data := CtrlCarteiraInvest.ListCarteiraInvest;
end;

procedure TFrmCadCarteiraInvest.DbLkTipoInvestimentoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;
   if ((modified) and ((Trim(DbLkTipoInvestimento.Text) <> '') and (Trim(DbLkTipoInvestimento.Text) <> ''))) then
      CdsTipoMercado.Data := CtrlInvestCotas.ListMercado(0,StrToInt(DbLkTipoInvestimento.LookupValue));
end;

procedure TFrmCadCarteiraInvest.DbLkTipoInvestimentoEnter(Sender: TObject);
begin
  inherited;
   sRegAnt := DbLkTipoInvestimento.LookupValue;
end;

procedure TFrmCadCarteiraInvest.DbLkTipoInvestimentoExit(Sender: TObject);
begin
  inherited;
   if ((Not bModif) and ((Trim(DbLkTipoInvestimento.Text) <> '') and (sRegAnt <> DbLkTipoInvestimento.LookupValue))) then
      CdsTipoMercado.Data := CtrlInvestCotas.ListMercado(0,StrToInt(DbLkTipoInvestimento.LookupValue));
end;

procedure TFrmCadCarteiraInvest.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlInvestCotas);
end;

end.
