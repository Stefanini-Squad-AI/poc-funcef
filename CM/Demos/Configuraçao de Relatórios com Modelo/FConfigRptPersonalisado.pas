unit FConfigRptPersonalisado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorioMT, ppDB, ppDBPipe, ppDBBDE, ppCache, ppClass, ppBands,
  ppRelatv, ppProd, ppReport, ppComm, ppEndUsr, Menus, uCmSqlParams,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls,
  TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  ExtCtrls, uCtrlModelopersonalisado, ppPrnabl, ppCtrls;

type
  TFrmConfigRptPersonalisado = class(TFrmConfigRelatorioMT)
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    _Modelopersonalisado: TCtrlModelopersonalisado;

  protected
    procedure AbreCdsPrincipal(iId: Integer); Override;
    procedure InsereCdsPrincipal; Override;
  public
    { Public declarations }
  end;

var
  FrmConfigRptPersonalisado: TFrmConfigRptPersonalisado;

implementation

Uses uCtrlPadroes, uCMTypes;

{$R *.DFM}

procedure TFrmConfigRptPersonalisado.FormCreate(Sender: TObject);
begin
  inherited;
  _Modelopersonalisado := TCtrlModelopersonalisado.Create;
  _Modelopersonalisado.InitializeAs(Padroes);
  _Modelopersonalisado.OnMessageInfo := Mensagem;

  MontaSelect.Filtro.Clear;
end;

procedure TFrmConfigRptPersonalisado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _Modelopersonalisado.Free;
end;

procedure TFrmConfigRptPersonalisado.AbreCdsPrincipal(iId: Integer);
begin
  Sql.Prepare;
  Sql.ParamByname('IDMODELOPERSONALISADO').AsFloat := iId;
  Sql.Open;
end;

procedure TFrmConfigRptPersonalisado.InsereCdsPrincipal;
begin
  {
    Este método deve ser sobrescrito com os campos nescessários para a inserção
    no CDS principal do formulário
    Exemplo para a carta de cobrança
  }
  
  Cds.FieldByName('IDMODELOPERSONALISADO').AsFloat := -1;
  Cds.FieldByName('IDREPORTS').AsInteger     := -1;
  Cds.FieldByName('ORIGEMCM').AsInteger      := 0;
end;

procedure TFrmConfigRptPersonalisado.CmeCadastroApplyInsert(
  sender: TObject; var Accept: Boolean);
begin
  Accept := _Modelopersonalisado.ProcessaConfig(Cds.Data, CdsReports.Data, OpInserir);
end;

procedure TFrmConfigRptPersonalisado.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  Accept := _Modelopersonalisado.ProcessaConfig(Cds.Data, CdsReports.Data, OpAlterar);
end;

procedure TFrmConfigRptPersonalisado.CmeCadastroApplyDelete(
  sender: TObject; var Accept: Boolean);
begin
  Accept := _Modelopersonalisado.ProcessaConfig(Cds.Data, CdsReports.Data, OpApagar);
end;

end.
