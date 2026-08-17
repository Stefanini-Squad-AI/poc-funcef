unit FCadUnidMedida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCtrlUnMedida, Mask, DBCtrls, FCadastroMT;

type
  TFrmCadUnidMedida = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodMed: TDBEdit;
    Label2: TLabel;
    dbedDescMed: TDBEdit;
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    UnMedida : TCtrlUnMedida;
  public
    { Public declarations }
    Procedure Sel( s : String );
  end;

var
  FrmCadUnidMedida: TFrmCadUnidMedida;

implementation

{$R *.DFM}

Uses uSistema,uMensErro,dBaseDados;

procedure TFrmCadUnidMedida.Sel( s : String );
begin
  cds.Data := UnMedida.Procurar( s );
end;

procedure TFrmCadUnidMedida.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedCodMed.Enabled := False;
end;

procedure TFrmCadUnidMedida.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedCodMed.Enabled := True;
end;

procedure TFrmCadUnidMedida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UnMedida.Free;
end;

procedure TFrmCadUnidMedida.FormCreate(Sender: TObject);
begin
  inherited;
  UnMedida :=  TCtrlUnMedida.Create;
  UnMedida.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  UnMedida.cds := cds;
  Sel('');
end;

procedure TFrmCadUnidMedida.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
     Sel(MontaSelect.ValoresChave[0]);
end;

procedure TFrmCadUnidMedida.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
    Sel(cds.FieldByName('CODMEDIDA').AsString);
end;

procedure TFrmCadUnidMedida.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := UnMedida.Excluir;
end;

procedure TFrmCadUnidMedida.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := UnMedida.Gravar;
end;

procedure TFrmCadUnidMedida.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := UnMedida.Gravar;
end;

procedure TFrmCadUnidMedida.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(UnMedida.MessageInfo,'Erro',MtError,[mbOk],0);
end;

end.
