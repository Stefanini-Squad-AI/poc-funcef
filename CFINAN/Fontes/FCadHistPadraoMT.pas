unit FCadHistPadraoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, wwdbedit, Provider, DBTables, uCtrlHistPadrao,
  FCadastroMT {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
  TFrmCadHistPadraoMT = class(TFrmCadastroMT)
    Label1: TLabel;
    dbeHistorico: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    CtrlHistPadrao : TCtrlHistPadrao;
  public
    { Public declarations }
  end;

var
  FrmCadHistPadraoMT: TFrmCadHistPadraoMT;

implementation

uses dBaseDados, uSistema, uMensErro;

{$R *.DFM}

procedure TFrmCadHistPadraoMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlHistPadrao:=TCtrlHistPadrao.Create;

   CtrlHistPadrao.Initialize(dtmBaseDados.dbBaseDados,True);
   //Carrega cds
   Cds.Data:=CtrlHistPadrao.ListHsitoricoPadrao(-1); //vazio

   //Associa cds
   CtrlHistPadrao.CdsHistPadrao:=Cds;
end;

procedure TFrmCadHistPadraoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlHistPadrao.Free;
   inherited;
end;

procedure TFrmCadHistPadraoMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Cds.Data:=CtrlHistPadrao.ListHsitoricoPadrao(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadHistPadraoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   if (Trim(Cds.FieldByName('DESCRICAO').AsString) = '') and (cds.State in [dsInsert,dsEdit]) then
    begin
       MsgDlg('Obrigatório preencher o Historico','Erro',mtError,[mbOK],0);
       dbeHistorico.SetFocus;
    end
   else
    inherited;
end;

procedure TFrmCadHistPadraoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlHistPadrao.AplicaAtualHistPad(Sistema.IdEmpresa,
                                             Sistema.IdModulo,
                                             Sistema.IdUsuario);
end;

procedure TFrmCadHistPadraoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlHistPadrao.AplicaAtualHistPad(Sistema.IdEmpresa,
                                             Sistema.IdModulo,
                                             Sistema.IdUsuario);
end;

procedure TFrmCadHistPadraoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlHistPadrao.AplicaAtualHistPad(Sistema.IdEmpresa,
                                             Sistema.IdModulo,
                                             Sistema.IdUsuario);
end;

procedure TFrmCadHistPadraoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(CtrlHistPadrao.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmCadHistPadraoMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbeHistorico.SetFocus;
end;

end.
