 //******************************************************************************
// Data      : 27/09/2007
// Pendencia : 25922
// Motivo    : Implementação do Cadastro de Setores do Emissor (3 camadas)
//******************************************************************************

unit FCadSetorEmissorMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, uCmSqlParams,
  uCtrlInvestimento,uCtrlPadroes,uMensErro,uCMTypes,uBibliotecaInvest,uCtrlParaminvest,
  Wwdotdot, Wwdbcomb;

type
  TFrmCadSetorEmissorMT = class(TFrmCadastroGridMTInv)
    Sql: TCMSqlParams;
    dbeSetor: TwwDBEdit;
    Label1: TLabel;
    DbeCodigo: TwwDBEdit;
    Label2: TLabel;
    DtsAux: TDataSource;
    dbeTipo: TwwDBComboBox;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    Investimento: TCtrlInvestimento;
    iIdSetorEmissor: String;
    Cds_ : TCMClientDataSet;
    Procedure AtualizaGrid;

  public
    { Public declarations }
  end;

var
  FrmCadSetorEmissorMT: TFrmCadSetorEmissorMT;

implementation

{$R *.DFM}

{ TFrmCadSetorEmissorMT }

procedure TFrmCadSetorEmissorMT.AtualizaGrid;
begin
  Cds.Data := Investimento.ListaSetorEmissor;

  If iIdSetorEmissor <> '' then
     Cds.Locate('CODSETOREMISSOR',iIDSetorEmissor,[]);
end;

procedure TFrmCadSetorEmissorMT.FormCreate(Sender: TObject);
begin
  inherited;
  Investimento := TCtrlInvestimento.create;
  Investimento.InitializeAs(Padroes);
  Investimento.CdsSetorEmissor := cds;
  cds_ := TCMClientDataSet.Create(nil);
  AtualizaGrid;
end;

procedure TFrmCadSetorEmissorMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(Investimento);
end;

procedure TFrmCadSetorEmissorMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);

begin
  Accept := Investimento.AplicaSetorEmissor;

  If CmeCadastro.Operacao in [OpInserir] then
  begin
     iIDSetorEmissor := Investimento.IDSetorEmissor;
  end;

  if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + Investimento.MessageInfo,'Mensagem do Sistema',mtwarning,[mbOk],0);
  inherited;

  AtualizaGrid;
end;

procedure TFrmCadSetorEmissorMT.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
end;

procedure TFrmCadSetorEmissorMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  DbeCodigo.enabled := false;
  AtualizaGrid;
end;

procedure TFrmCadSetorEmissorMT.sbtnAlterarClick(Sender: TObject);
begin
  Cds_.Data := Cds.Data;
  // Pegando o Id antes da alteração para posicionar no grid
  if Not Cds.IsEmpty then
     iIDSetorEmissor := cds.FieldByName('CODSETOREMISSOR').AsString;
  inherited;

end;

procedure TFrmCadSetorEmissorMT.dbGrdDblClick(Sender: TObject);
begin
  // Pegando o Id antes da alteração para posicionar no grid
  if Not Cds.IsEmpty then
     iIDSetorEmissor := cds.FieldByName('CODSETOREMISSOR').AsString;

  inherited;
end;

procedure TFrmCadSetorEmissorMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TStringField(DataSet.FindField('CODSETOREMISSOR')).EditMask := CtrlPinv.MascSetorEmissor+';0';
end;


procedure TFrmCadSetorEmissorMT.sbtnInserirClick(Sender: TObject);
begin
  Cds_.Data := Cds.Data;
  DbeCodigo.enabled := true;
  inherited;

end;

procedure TFrmCadSetorEmissorMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  if CmeCadastro.Operacao in [OpInserir,OpAlterar] then
  begin
      if Trim(dbeCodigo.Text) = '' then
      begin
         MsgDlg('Informe o Código do Setor.','Atenção' ,MtWarning,[mbok],0);
         if dbeCodigo.CanFocus then
            dbeCodigo.SetFocus;
         Accept := False;
      end
      else if Trim(dbeSetor.Text) = '' then
      begin
         MsgDlg('Informe a descrição Setor.','Atenção' ,MtWarning,[mbok],0);
         if dbeSetor.CanFocus then
            dbeSetor.SetFocus;
         Accept := False;
      end
      else if Trim(dbeTipo.Text) = '' then
      begin
         MsgDlg('Informe o tipo do Setor.','Atenção' ,MtWarning,[mbok],0);
         if dbeTipo.CanFocus then
            dbeTipo.SetFocus;
         Accept := False;
      end
      else If CmeCadastro.Operacao = OpInserir then
      begin
        //Vou verificar se o registro existe no Cds
        If cds_.Locate('CODSETOREMISSOR',Cds.FieldByName('CODSETOREMISSOR').AsString,[]) then
        begin
          MsgDlg('Setor já cadastrado.','Mensagem do Sistema',mtwarning,[mbok],0);
          if dbeCodigo.CanFocus then
            dbeCodigo.SetFocus;
          Accept := False;
        end;
      end;
  end;
end;

end.


