unit uFCadTpPagtoBeneficioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlTpPagtoBeneficio, dBaseDados, uSistema, wwdblook, DBCtrls, Mask;

type
  TfrmCadTpPagtoBeneficioMT = class(TFrmCadastroMT)
    Label2: TLabel;
    dbedNome: TDBEdit;
    dbrgrpTpPagto: TDBRadioGroup;
    lbPeriodicidade: TLabel;
    dblkcmbPeriodicidade: TwwDBLookupCombo;
    lblQtdeMeses: TLabel;
    dbedQtdeMeses: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    CtrlTpPagtoBeneficio : TCtrlTpPagtoBeneficio;
    procedure MessageCtrlTpPagtoBeneficio(sMessageInfo: String);
  public
    { Public declarations }
  end;

var
  frmCadTpPagtoBeneficioMT: TfrmCadTpPagtoBeneficioMT;

implementation

{$R *.DFM}

procedure TfrmCadTpPagtoBeneficioMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlTpPagtoBeneficio := TCtrlTpPagtoBeneficio.Create;
  CtrlTpPagtoBeneficio.Initialize(DtmBaseDados.DbBaseDados, True,
                                  Sistema.ConnectionType,
                                  Sistema.ConnectionSide,
                                  Sistema.AppRemoteServer,
                                  True, MessageCtrlTpPagtoBeneficio );
                                 
  Cds.Data := CtrlTpPagtoBeneficio.Seleciona (-1);
end;

procedure TfrmCadTpPagtoBeneficioMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  CtrlTpPagtoBeneficio.CdsTpPagtoBeneficio.Data := Cds.Data;
  CtrlTpPagtoBeneficio.GravaTpPagtoBeneficio;
end;

procedure TfrmCadTpPagtoBeneficioMT.MessageCtrlTpPagtoBeneficio(sMessageInfo: String);
begin
  MsgDlg(sMessageInfo, 'Erro', mtError, [mbOk],0)
end;

procedure TfrmCadTpPagtoBeneficioMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
    Cds.Data := CtrlTpPagtoBeneficio.SelecionaTpPagtoBeneficio( StrToInt( MontaSelect.ValoresChave[0] ) );
end;

end.
