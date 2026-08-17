unit fFormaatendMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, MConnect, uCtrlTipoAtend, DBaseDados, Usistema, uMidasUtil,
  SConnect;

type
  TfrmformaAtendMT = class(TFrmCadastroMT)
    DbeDescricao: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    DCOMConnection1: TDCOMConnection;
    SocketConnection1: TSocketConnection;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsBeforeOpen(DataSet: TDataSet);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    sOrigemErroConfirma : string;
    CtrlTipoAtend : TCtrlTipoAtend;
    iTipoAtend : integer;

    procedure MessageTipoAtend(sMessageInfo : string);
  public
    { Public declarations }
  end;

var
  frmformaatendMT: TfrmformaatendMT;

implementation

{$R *.DFM}

procedure TfrmformaatendMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoAtend := TctrlTipoAtend.Create;
  CtrlTipoAtend.Initialize(DtmBaseDados.DbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,MessageTipoAtend);
  
  CtrlTipoAtend.CdsTipoAtend := Cds;

  Cds.Open;  
end;

procedure TfrmformaatendMT.MessageTipoAtend(sMessageInfo: string);
begin
  showMessage(CtrlTipoAtend.MessageInfo);
end;

procedure TfrmformaatendMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ctrlTipoAtend.Free;
end;

procedure TfrmformaatendMT.CdsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  ctrlTipoAtend.SetProvider(Cds, CtrlTipoAtend.DbTipoAtend.dsp, 'DspTipoAtend');
end;

procedure TfrmformaatendMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoAtend.Inserir;
end;

procedure TfrmformaatendMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoAtend.Alterar;
end;

procedure TfrmformaatendMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoAtend.Excluir(iTipoAtend);
end;

procedure TfrmformaatendMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  {**
    Esse evento pode ser implementado quando queremos dar um tratamento diferenciado
    ao erro ocorrido na confirmação do cadastro.
    A origem do erro pode ser identificada através do OrigemAbortConfirma com os valores abaixo:

    Case OrigemAbortConfirma of
     OaNone: sOrigem := 'OK! ';
     OaApplyInsert: sOrigem := 'Erro ao Inserir ';
     OaApplyDelete: sOrigem := 'Erro ao Excluir ';
     OaApplyEdit: sOrigem := 'Erro ao Alterar ';
     OaBeforeConfirma: sOrigem := 'Erro antes de Confirmar ';,
    End;

    ShowMessage(sOrigem + CtrlMoeda.MessageInfo);
  **}
end;

procedure TfrmformaatendMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  {**
    Após a verificação da confirmação do MontaSelect os médotos
    SelecionaMoeda e SelecionaMoedaReferencia são executados e de acordo
    com o retorno da sua execução os ClientDatasets vinculados a classe de
    controle são abertos e o registro e disponibilizado para Alteração ou Exclusão.

    A função RefreshCDS faz um "Close/Open" nos clientdatasets passados como
    parâmetro. Esta implementada na uMidasUtil.
  **}
  If MontaSelect.RetornouValor Then
   iTipoAtend := StrToIntDef(MontaSelect.ValoresChave[0],0);
   
  if CtrlTipoAtend.SelecionaTipoAtend(iTipoAtend) then
    RefreshCDS([Cds]);
end;


end.
