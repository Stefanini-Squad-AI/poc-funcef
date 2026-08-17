unit FCadUnidCusteio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, DBCtrls, Mask,uCtrlUnCusteio, FCadastroMT;

type
  TFrmCadUnidCusteio = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedDesc: TDBEdit;
    chkContabil: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    UnCusteio  : TCtrlUnCusteio;
    Procedure Sel( n : Double );
  public
    { Public declarations }
  end;

var
  FrmCadUnidCusteio: TFrmCadUnidCusteio;

implementation

{$R *.DFM}

Uses uSistema, dBaseDados, uMensErro;

procedure TFrmCadUnidCusteio.FormCreate(Sender: TObject);
begin
  inherited;
  //Criação da Classe de Negócio
  UnCusteio := TCtrlUnCusteio.Create;
  UnCusteio.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  UnCusteio.cds := cds;
  Sel(1);
end;

procedure TFrmCadUnidCusteio.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName('UCCONTABIL').AsString := 'F';
  cds.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
end;

procedure TFrmCadUnidCusteio.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadUnidCusteio.Sel( n : Double );
begin
  cds.Data := UnCusteio.Procurar( n );
end;

procedure TFrmCadUnidCusteio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UnCusteio.Free;
end;

procedure TFrmCadUnidCusteio.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(unCusteio.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmCadUnidCusteio.CmeCadastroAfterConfirma(Sender: TObject);
begin
 // inherited;
 Sel(cds.FieldByName('CODCUSTEIO').asFloat);


end;

procedure TFrmCadUnidCusteio.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := UnCusteio.Excluir;
end;

procedure TFrmCadUnidCusteio.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := UnCusteio.Gravar;
end;

procedure TFrmCadUnidCusteio.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := UnCusteio.Gravar;
end;

end.
