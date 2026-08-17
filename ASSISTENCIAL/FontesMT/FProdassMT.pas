unit FProdassMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbedit, Wwdotdot, Wwdbcomb, DBCtrls, Mask, uCtrlProdass, DBTables,
  Wwquery, Provider, MConnect, SConnect, UCmCustomCdbObject;

type
  TFrmProdass = class(TFrmCadastroMT)
    pnlControles: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    DBNome: TDBEdit;
    DBDescricao: TDBMemo;
    DBIdProdass: TDBEdit;
    GroupBoxPerc: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    wwDBCBIof: TwwDBComboBox;
    wwDBCBProLabore: TwwDBComboBox;
    Skt: TSocketConnection;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsBeforeOpen(DataSet: TDataSet);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
     CtrlProdass: TCtrlProdass;
     MessageInfo: TOnMessageInfo;

  public
    { Public declarations }
  end;

var
  FrmProdass: TFrmProdass;

implementation

uses DBaseDados, USistema;

{$R *.DFM}

procedure TFrmProdass.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProdass := TCtrlProdass.Create;

  CtrlProdass.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           MessageInfo);
  CtrlProdass.CdsProdass := Cds;

  Cds.Open;
 end;

procedure TFrmProdass.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CtrlProdass.Free;
end;

procedure TFrmProdass.CdsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  Cds.SetProvider(CtrlProdass.DbProdass.Dsp);
end;

procedure TFrmProdass.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor Then
  Begin
    CtrlProdass.DbProdass.IdProdass.AsInteger := StrToIntDef(MontaSelect.ValoresChave[0],0);
    Cds.Close;
    Cds.Open;
  End;
end;

procedure TFrmProdass.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then Cds.Post;
  Accept := CtrlProdass.Excluir;
end;

procedure TFrmProdass.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlProdass.Alterar;
end;

procedure TFrmProdass.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlProdass.Inserir;
end;

procedure TFrmProdass.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  Case OrigemAbortConfirma Of
    OaApplyInsert: ShowMessage('Erro na inserção: ' + CtrlProdass.MessageInfo);
    OaApplyDelete: ShowMessage('Erro na exclusão: ' + CtrlProdass.MessageInfo);
    OaApplyEdit: ShowMessage('Erro na Alteração: ' + CtrlProdass.MessageInfo);
  End;
end;

end.
