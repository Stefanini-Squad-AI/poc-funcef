unit FCadTpPeriodicidadeMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlTpPeriodicidade, dBaseDados, uSistema, uMensErro, Mask, wwdbedit;

type
  TFrmCadTpPeriodicidadeMT = class(TFrmCadastroMT)
    dbedQtdeMeses: TwwDBEdit;
    Label2: TLabel;
    dbedDesc: TwwDBEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    CtrlTpPeriodicidade : TCtrlTpPeriodicidade;

    procedure MessageCtrlTpPeriodicidade( sMessageInfo : String);
  public
    { Public declarations }
  end;

var
  FrmCadTpPeriodicidadeMT: TFrmCadTpPeriodicidadeMT;

implementation

{$R *.DFM}

procedure TFrmCadTpPeriodicidadeMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTpPeriodicidade := TCtrlTpPeriodicidade.Create;
  CtrlTpPeriodicidade.Initialize(DtmBaseDados.DbBaseDados, True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, MessageCtrlTpPeriodicidade );
                                 
  Cds.Data := CtrlTpPeriodicidade.SelecionaTpPeriodicidade(-1);
end;

procedure TFrmCadTpPeriodicidadeMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  CtrlTpPeriodicidade.CdsTpPeriodicidade.Data := Cds.Data;
  CtrlTpPeriodicidade.GravaTpPeriodicidade;
end;

procedure TFrmCadTpPeriodicidadeMT.MessageCtrlTpPeriodicidade(sMessageInfo: String);
begin
  MsgDlg(sMessageInfo, 'Erro', mtError, [mbOk],0)
end;

procedure TFrmCadTpPeriodicidadeMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
    Cds.Data := CtrlTpPeriodicidade.SelecionaTpPeriodicidade( StrToInt( MontaSelect.ValoresChave[0] ) );
end;

procedure TFrmCadTpPeriodicidadeMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  If Trim(dbedDesc.Text) = '' Then
  Begin
    MsgDlg('Descrição da Periodicidade não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    dbedDesc.SetFocus;
    Exit;
  End;

  If Trim(dbedQtdeMeses.Text) = '' Then
  Begin
    MsgDlg('Quantidade de Meses não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    dbedQtdeMeses.SetFocus;
    Exit;
  End;

  inherited;
end;

end.


