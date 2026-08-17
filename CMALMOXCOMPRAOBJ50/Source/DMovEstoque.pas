unit DMovEstoque;

interface              

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, Db, DBClient, uCMClientDataSet;

type
  TDtmMovEstoque = class(TDataModule)
    spVerifDataRepresa: TCMSqlParams;
    spVerifIntegraContab: TCMSqlParams;
    spVerifDataInvent: TCMSqlParams;
    spLoteValidade: TCMSqlParams;
    spDataTrava: TCMSqlParams;
    cds: TCMClientDataSet;
    spGetDataImplantacao: TCMSqlParams;
    spValidade: TCMSqlParams;
    spSaldoRepresado: TCMSqlParams;
    spAtualizaSaldo: TCMSqlParams;
    spUpdSaldoMov: TCMSqlParams;
    spCustoMed: TCMSqlParams;
    spSaldoUC: TCMSqlParams;
    spMoviment: TCMSqlParams;
    spUpdMoviment: TCMSqlParams;
    spUpdCustoMed: TCMSqlParams;
    spUltDataMovRepresado: TCMSqlParams;
    spGetCCAlmoxarifado: TCMSqlParams;
    spInfoSaldoMov: TCMSqlParams;
    spTestaValidade: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

end.

