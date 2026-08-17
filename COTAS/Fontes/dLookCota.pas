unit dLookCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, Wwdatsrc;

type
  TdtmLookCotas = class(TDataModule)
    CdsDadosFundacao: TCMClientDataSet;
    CdsDadosFundacaoNOME: TStringField;
    CdsDadosFundacaoRAZAOSOCIAL: TStringField;
    CdsDadosFundacaoLOGRADOURO: TStringField;
    CdsDadosFundacaoNUMERO: TStringField;
    CdsDadosFundacaoCOMPLEMENTO: TStringField;
    CdsDadosFundacaoBAIRRO: TStringField;
    CdsDadosFundacaoCIDADE: TStringField;
    CdsDadosFundacaoCODESTADO: TStringField;
    CdsDadosFundacaoCEP: TStringField;
    CdsDadosFundacaoIMAGEM: TBlobField;
    CdsDadosFundacaoENDERECO: TStringField;
    CdsDadosFundacaoBARCIDUF: TStringField;
    dsDadosFundacao: TwwDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmLookCotas: TdtmLookCotas;

implementation

{$R *.DFM}

end.
