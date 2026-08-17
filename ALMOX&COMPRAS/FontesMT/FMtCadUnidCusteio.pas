unit FMtCadUnidCusteio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, DBCtrls, Mask,uCtrlUnCusteio, FCadastroMT, uCMTypes;

type
  TFrmMTCadUnidCusteio = class(TFrmCadastroMT)
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
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    UnCusteio  : TCtrlUnCusteio;
    Procedure Sel( n : Double );
  public
    { Public declarations }
  end;

var
  FrmMTCadUnidCusteio: TFrmMTCadUnidCusteio;

implementation

{$R *.DFM}

Uses uSistema, dBaseDados, uMensErro;

procedure TFrmMTCadUnidCusteio.FormCreate(Sender: TObject);
begin
  inherited;
  //Criação da Classe de Negócio
  UnCusteio := TCtrlUnCusteio.Create;
  UnCusteio.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  UnCusteio.cds := cds;

  MontaSelect.Filtro.Add('UNCUSTEI.IDPESSOA = '+IntToStr( Sistema.IdEmpresa ));

  Sel(-1);
end;

procedure TFrmMTCadUnidCusteio.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName('UCCONTABIL').AsString := 'F';
  cds.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
  dbedDesc.SetFocus;
end;

procedure TFrmMTCadUnidCusteio.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmMTCadUnidCusteio.Sel( n : Double );
begin
  cds.Data := UnCusteio.Procurar( n );
end;

procedure TFrmMTCadUnidCusteio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UnCusteio.Free;
end;

procedure TFrmMTCadUnidCusteio.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(unCusteio.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmMTCadUnidCusteio.CmeCadastroAfterConfirma(Sender: TObject);
begin
 // inherited;
 Sel(cds.FieldByName('CODCUSTEIO').asFloat);


end;

procedure TFrmMTCadUnidCusteio.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := UnCusteio.Excluir;
end;

procedure TFrmMTCadUnidCusteio.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := UnCusteio.Gravar;
end;

procedure TFrmMTCadUnidCusteio.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := UnCusteio.Gravar;
end;

procedure TFrmMTCadUnidCusteio.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedDesc.SetFocus;
end;

end.
