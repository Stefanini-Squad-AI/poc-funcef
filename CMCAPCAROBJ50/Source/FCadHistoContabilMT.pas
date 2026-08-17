unit FCadHistoContabilMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadModeloHistoricoMT, uCmSqlParams, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  DBCtrls, Mask, ExtCtrls;

type
  TFrmCadHistoContabilMT = class(TFrmCadModeloHistoricoMT)
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure RgTipoHistoricoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadHistoContabilMT: TFrmCadHistoContabilMT;

implementation

{$R *.DFM}

Uses uListaCamposHistCapCar, uSistema;

procedure TFrmCadHistoContabilMT.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  Cds.FieldByName('TIPO').AsInteger := 0;
end;

procedure TFrmCadHistoContabilMT.RgTipoHistoricoChange(Sender: TObject);
begin
  inherited;
  SetListaCamposHistCapCar(StrToIntDef(RgTipoHistorico.Value, -1), LbCampoBanco.Items, sistema.IdModulo );
end;

end.
